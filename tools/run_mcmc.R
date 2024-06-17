### This file demonstrates how to run Bayesian inference on the pollock
### assessment using the adnuts R package.

### 2/2019 Cole Monnahan

radian
library(adnuts)                         # needs to be 1.0.9000
library(snowfall)
library(rstan)
library(shinystan)
reps <- parallel::detectCores()-2 # chains to run in parallel
reps
## Reproducible seeds are passed to ADMB
set.seed(352)
seeds <- sample(1:1e4, size=reps)
seeds
## Function to return starting values from a fit given the number of
## chains. It randomly samples from the posterior.
get.inits <- function(fit, chains){
  post <- extract_samples(fit)
  ind <- sample(1:nrow(post), size=chains)
  lapply(ind, function(i) as.numeric(post[i,]))
}

## Here we assume the pm.exe model is in a folder called 'pm'
## as well. This folder gets copied during parallel runs.
d<- 'mcmc'
m <- 'pm' # the model name, folder is also assumed to be called this runs/base/mcmc
## First optimize the model to make sure the Hessian is good.
setwd(d);
setwd(d);
system('pm -nox -mcmc 15 -hbf 1 -binp pm.bar -phase 50');
setwd('..')


## Run--
iter <- 1000 # maybe too many...depends are number cores...I used 8...
chains=8
#iter <- 4000*thin; warmup <- iter/#8

inits <- NULL ## start chains from MLE
fit.mle <- sample_nuts(model=m, path=d, iter=iter, warmup=iter/4,
                   chains=chains, cores=chains, control=list(control=list(max_treedepth=14,
                    metric='mle')))

summary(fit.mle)
plot_uncertainties(fit.mle)
pairs_admb(fit.mle, pars=1:6, order='slow')
pairs_admb(fit.mle, pars=1:6, order='fast')

pdf("pairs_rdev.pdf")
pairs_admb(fit.mle, pars=68:78)
pairs_admb(fit.mle2, pars=68:78)
dev.off()
pdf("marginals.pdf")
plot_marginals(fit.mle)
dev.off()
print(fit.mle)
plot_sampler_params(fit.mle)
launch_shinyadmb(fit.mle)

## It doesn't really need any fixes so rerun with NUTS. Reoptimize to get
## the correct mass matrix for NUTS. Note the -hbf 1 argument. This is a
## technical requirement b/c NUTS uses a different set of bounding
## functions and thus the mass matrix will be different.
## Use default MLE covariance (mass matrix) and short parallel NUTS chains
## started from the MLE.

## If good, run again for inference using updated mass matrix. Increase
## adapt_delta toward 1 if you have divergences (runs will take longer).
mass <- fit.mle$covar.est # note this is in unbounded parameter space
inits <- get.inits(fit.mle, reps) ## use inits from pilot run
reps
fit.mle2 <- sample_nuts(model=m, path=d, iter=2000, warmup=iter/4,
                   chains=chains, cores=chains, control=list(control=list(max_treedepth=14,
                    metric=mass,adapt_delta=0.95)))
plot_sampler_params(fit.mle2)
launch_shinyadmb(fit.mle)
launch_shinyadmb(fit.mle2)
pairs_admb(fit.mle2, pars=1:6, order='slow')
summary(fit.mle)
summary(fit.mle2)
saveRDS(fit.mle, file='fit.mle.RDS')
saveRDS(fit.mle2, file='fit.mle2.RDS')

## Again check for issues of nonconvergence and other standard checks. Then
## use for inference.
ess <- monitor(fit.mle2$samples, warmup=nuts.updated$warmup, print=FALSE)[,'n_eff']
nuts.updated$ess <- ess
saveRDS(nuts.updated, file='nuts.updated.RDS')
launch_shinyadmb(nuts.updated)
slow <- names(sort(ess))[1:8]
png('pairs_slow_nuts2.png', width=7, height=5, units='in', res=500)
pairs_admb(fit=nuts.updated, pars=slow)
dev.off()

save.image() # save to file for later

## NOTE: the mceval=TRUE argument tells ADMB to run -mceval on ALL chains
## combined AFTER discarding warmup period and thinning. Thus whatever your
## model outputs during mceval is ready for use in
## management. Alternatively you can run -mceval from the command
## line. sample_admb will merge samples into the .psv file in the main
## folder so either way works.

#Try Jim's profiling stuff and or the PPDs
#ppl <- read_csv(paste0(.MODELDIR[thismod],"mcmc/mceval_ppl.csv"),col_names=FALSE)
mcppl <- read_csv(paste0("mcmc/mceval_ppl.csv"),col_names=FALSE)
  head(mcppl)
  names(mcppl) <- c("Index","Pd","draw","Year","Obs","Exp","Sim","VarObs")
  idx="BTS"
  idx="ATS"
  idx="AVO"
  idx=c("ATS","AVO")
  obs <- mcppl %>% filter(Index==idx,draw==1) %>% transmute(Year,Obs,type="Obs")
  tmpdf <- mcppl %>% filter(Index==idx) %>% select(Year,Exp,Sim) %>% sample_frac(.3) #%>% pivot_longer(cols=2:3,names_to="type",values_to="Biomass")
  ggplot(data=tmpdf) + geom_point(aes(x=jitter(Year),y=Sim),color="grey",alpha=.2) +
  geom_point(aes(x=jitter(Year,.3),y=Exp),color="yellow",alpha=.2,size=.8) + ggthemes::theme_few() + ylab("Index") +xlab("Year") +
  geom_line(data=obs,aes(x=Year,y=Obs)) + facet_grid(.~Index)

  dd.g <- pivot_longer(dd,cols=2:20,names_to="Assessment",values_to="Biomass")


