radian
## Demonstrate adnuts on Hake model
library(adnuts)
library(tidyverse)
library(ggplot2)
library(ggthemes)
packageVersion('adnuts')                # needs to be 1.0.1
library(snowfall)
library(rstan)
library(shinystan)
chains <- parallel::detectCores()-6 # chains to run in parallel
## Reproducible seeds are passed to ADMB
set.seed(352)
seeds <- sample(1:1e4, size=chains)
chains

m <- './pm_mcmc'
d <- 'mc'
setwd(d)
system(paste(m, '-nox -iprint 200 -mcmc 10'))
setwd('..')

## Run single RWM chain to make sure it works in serial
test <- sample_admb(model=m, path=d, iter=500, algorithm='RWM', warmup=250,
                    seeds=seeds, chains=1)
test$cmd[1]
## Now with parallel
test <- sample_admb(model=m, path=d, iter=1000, algorithm='RWM', warmup=500,
                    seeds=seeds, chains=chains,
                    parallel=TRUE, cores=chains)
launch_shinyadmb(test)


## Now with more thinning
thin <- 20
iter <- 5000*thin
fit <- sample_admb(model=m, path=d, iter=iter, algorithm='RWM', warmup=iter/4,
                    seeds=seeds, chains=chains, thin=thin,
                    parallel=TRUE, cores=chains)
launch_shinyadmb(fit)

## Diagnose pilot analsyis
mon <- monitor(fit$samples, warmup=fit$warmup, print=FALSE)
ess <- mon[,'n_eff']
(slow <- names(sort(ess))[1:6]) # slowest mixing parameters
pairs_admb(fit=fit, pars=slow)
(fast <- names(sort(ess, decr=TRUE))[1:6]) # fastest
pairs_admb(fit=fit, pars=fast)

## Another trick is you can run for a certain duration if you
## have a time limit. Specify the warmup period and then a really
## large value for iter and set a duration


### End of pilot exploration.


### Explore using NUTS
setwd(d)
m
system(paste(m, '-nox -binp amak.bar -phase 22 -mcmc 10 -hbf 1'))
setwd('..')

## Never thin NUTS and use 500-1000 iterations per chain w/
## approximately 1/4 warmup
iter <- 100
chains
## Two different ways to gets NUTS working. First is to use the
## Hessian (metric) just like with the RMW above. Note that
## control argument.
fit.mle <- sample_admb(model=m, path=d, iter=iter, algorithm='NUTS', warmup=iter/4,
                   seeds=seeds, parallel=TRUE, chains=chains,
                   cores=chains, control=list(metric='mle'))
pairs_admb(fit.mle, pars=1:6, order='slow')
launch_shinyadmb(fit.mle)
mon <- monitor(fit.mle$samples, warmup=fit.mle$warmup, print=FALSE)
ess <- mon[,'n_eff']
(slow <- names(sort(ess))[1:6]) # slowest mixing parameters
pairs_admb(fit.mle, pars=slow)

## Look at high correlations
library(corrplot)
x <- fit.mle$mle$cor
dimnames(x) <- list('par'=fit.mle$mle$par.names, 'par2'=fit.mle$mle$par.names)
ind <- sort(unique(which(abs(x)>.0 & x!= 1, arr.ind=TRUE)[,1]))
y <- x[ind, ind]
ind
corrplot(y, method='color', type='upper')


## Alternatively if no Hessian is available (e.g., b/c of
## hierarchical model), then adapt a diagonal one during
## warmup. This is much slower b/c it doesn't know the shape of
## the posterior
iter <- 100
fit.diag <- sample_admb(model=m, path=d, iter=iter, algorithm='NUTS', warmup=iter/4,
                   seeds=seeds, parallel=TRUE, chains=chains, cores=chains)

## Now the samples from fit.diag can be used to estimate the
## covariance and that can be used directly.
fit.updated <- sample_admb(model=m, path=d, iter=iter, algorithm='NUTS', warmup=iter/4,
                   seeds=seeds, parallel=TRUE, chains=chains,
                   cores=chains, control=list(metric=fit$covar.est))


save.image()
setwd(d)
system("./amak -mceval")
sdf <- read.table("mceval_srv.dat")
names(sdf)<- c("Year","obs","predicted","draw")
sdf2 <- sdf %>% filter(draw==1)
ggplot(sdf2,aes(x=Year,y=obs)) + 
   geom_point(data=sdf,aes(x=jitter(Year),y=predicted), size=.5,alpha=.2,color="grey") + 
   scale_y_continuous(breaks=seq(0,12e6,by=4e5))  +
   scale_x_continuous(breaks=seq(1990,2020,by=2))  +
   theme_few() + ylab("Survey estimates") +
    geom_line(size=2,color="salmon") + geom_point(size=4,color="red",shape=3)
head(sdf)

sdf <- read.table("mceval_M.dat") 
names(sdf)<- c("Year","M","x")
tail(sdf)
sdf <- sdf %>%filter(Year==2020)
dim(sdf)
ggplot(sdf,aes(x=M)) + geom_density(fill="gold") + theme_few() + geom_vline(xintercept=mean(sdf$M)) +
       geom_vline(xintercept=0.3, color = "grey",size=1,linetype=2)


sdf <- read.table("mceval_sr.dat")
head(sdf)
names(sdf)<- c("Source","Stock","Recruits")
dim(sdf)
sdf2<-sdf %>% sample_n(100000)
ggplot(sdf2,aes(x=Stock,y=Recruits,color=Source)) + 
   theme_few() + geom_point(size=4,alpha=.1) 
   head(sdf)
   ylab("Survey estimates") +
   scale_y_continuous(breaks=seq(0,12e6,by=4e5))  +
   scale_x_continuous(breaks=seq(1990,2020,by=2))  +














qggplot
