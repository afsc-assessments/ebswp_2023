### This file demonstrates how to run Bayesian inference on the pollock
### assessment using the adnuts R package.

### 2/2019 Cole Monnahan

library(adnuts)                         # needs to be 1.0.9000
library(snowfall)
library(rstan)
library(shinystan)
reps <- parallel::detectCores()-1 # chains to run in parallel
## Reproducible seeds are passed to ADMB
set.seed(352)
seeds <- sample(1:1e4, size=reps)
## Function to return starting values from a fit given the number of
## chains. It randomly samples from the posterior.
get.inits <- function(fit, chains){
  post <- extract_samples(fit)
  ind <- sample(1:nrow(post), size=chains)
  lapply(ind, function(i) as.numeric(post[i,]))
}

## Here we assume the pm.exe model is in a folder called 'pm'
## as well. This folder gets copied during parallel runs.
m <- d <- 'pm' # the model name, folder is also assumed to be called this
## First optimize the model to make sure the Hessian is good.
setwd(m); system('pm -nox -mcmc 15 -ainp pm.par -phase 50'); setwd('..')

## Run parallel RWM chains as a first test
thin <- 50
iter <- 2000*thin; warmup <- iter/4
inits <- NULL ## start chains from MLE
pilot <- sample_admb(m, iter=iter, thin=thin, seeds=seeds, init=inits,
                     parallel=TRUE, chains=reps, warmup=warmup,
                     path=m, cores=reps, algorithm='RWM')
launch_shinyadmb(pilot)
## Plot slowest mixing pars compared to MLE estimates to check for issues.
ess <- monitor(pilot$samples, warmup=pilot$warmup, print=FALSE)[,'n_eff']
slow <- names(sort(ess))[1:8]
png('pairs_slow_rwm.png', width=7, height=5, units='in', res=500)
pairs_admb(fit=pilot, pars=slow)
dev.off()

## It doesn't really need any fixes so rerun with NUTS. Reoptimize to get
## the correct mass matrix for NUTS. Note the -hbf 1 argument. This is a
## technical requirement b/c NUTS uses a different set of bounding
## functions and thus the mass matrix will be different.
setwd(m); system(paste(m, '-hbf 1 -nox -mcmc 15')); setwd('..')
## Use default MLE covariance (mass matrix) and short parallel NUTS chains
## started from the MLE.
nuts.mle <-
  sample_admb(model=m, iter=4000, init=NULL, algorithm='NUTS', thin=2,  seeds=seeds,
              parallel=TRUE, chains=reps, warmup=400, path=d, cores=reps,
              control=list(metric="mle", adapt_delta=0.9))
## Check for issues like slow mixing, divergences, max treedepths with
## ShinyStan and pairs_admb as above. Fix and rerun this part as needed.
ess <- monitor(nuts.mle$samples, warmup=nuts.mle$warmup, print=FALSE)[,'n_eff']
slow <- names(sort(ess))[1:8]
png('pairs_slow_nuts.png', width=7, height=5, units='in', res=500)
pairs_admb(fit=nuts.mle, pars=slow)
dev.off()

## If good, run again for inference using updated mass matrix. Increase
## adapt_delta toward 1 if you have divergences (runs will take longer).
mass <- nuts.mle$covar.est # note this is in unbounded parameter space
inits <- get.inits(nuts.mle, reps) ## use inits from pilot run
nuts.updated <-
  sample_admb(model=m, iter=2000, init=inits, algorithm='NUTS',  seeds=seeds,
               parallel=TRUE, chains=reps, warmup=200, path=d, cores=reps,
              mceval=TRUE, control=list(metric=mass, adapt_delta=0.95))
## Again check for issues of nonconvergence and other standard checks. Then
## use for inference.
ess <- monitor(nuts.updated$samples, warmup=nuts.updated$warmup, print=FALSE)[,'n_eff']
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
