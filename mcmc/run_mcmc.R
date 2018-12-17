### This file demonstrates how to run Bayesian inference on ADMB stock
### assessments using the adnuts R package. We demonstrate a Stock
### Synthesis (SS) model called 'pm' (see paper).

### The use of SS necessitates slightly different workflow for technical
### reasons. First, when optimizing before MCMC initiate -mcmc 50 to tell
### SS to turn off bias adjustment for recdevs. Otherwise the estimated
### mass matrix will be mismatched when executing the real MCMC chains. Be
### careful not to use MLE estimates from these runs for inference. To save
### time we recommend setting SS to read from the .par file to speed up the
### optimizations below.

### 8/2018 Cole Monnahan

library(adnuts)
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
m <- 'pm'
## First optimize the model to make sure the Hessian is good.
setwd(m); system('pm -nox -mcmc 15'); setwd('..')

## Then run parallel RWM chains as a first test
thin <- 100
iter <- 2000*thin; warmup <- iter/4
inits <- NULL ## start chains from MLE
pilot <- sample_admb(m, iter=iter, thin=thin, seeds=seeds, init=inits,
                     parallel=TRUE, chains=reps, warmup=warmup,
                     path=m, cores=reps, algorithm='RWM')

## Plot slowest mixing pars compared to MLE estimates to check for issues.
ess <- monitor(pilot$samples, warmup=pilot$warmup, print=FALSE)[,'n_eff']
slow <- names(sort(ess))[1:5]
pairs_admb(fit=pilot, pars=slow)
## Regularize as needed and repeat above code until model is satisfactory

## After regularizing (call it pm2 and put it in pm2 folder) we
## can run NUTS chains.
m <- 'pm'
## Reoptimize to get the correct mass matrix for NUTS. Note the -hbf 1
## argument. This is a technical requirement b/c NUTS uses a different set
## of bounding functions and thus the mass matrix will be different.
setwd(m); system(paste(m, '-hbf 1 -nox -mcmc 15')); setwd('..')
## Use default MLE covariance (mass matrix) and short parallel NUTS chains
## started from the MLE.
nuts.mle <-
  sample_admb(model=m, iter=500, init=NULL, algorithm='NUTS',  seeds=seeds,
               parallel=TRUE, chains=reps, warmup=100, path=m, cores=reps,
              control=list(metric="mle", adapt_delta=0.8))
## Check for issues like slow mixing, divergences, max treedepths with
## ShinyStan and pairs_admb as above. Fix and rerun this part as needed.
launch_shinyadmb(nuts.mle)
ess <- monitor(nuts.mle$samples, warmup=nuts.mle$warmup, print=FALSE)[,'n_eff']
slow <- names(sort(ess))[1:8]
pairs_admb(fit=nuts.mle, pars=slow)


## If good, run again for inference using updated mass matrix. Increase
## adapt_delta toward 1 if you have divergences (runs will take longer).
mass <- nuts.mle$covar.est # note this is in unbounded parameter space
inits <- get.inits(nuts.mle, reps) ## use inits from pilot run
nuts.updated <-
  sample_admb(model=m, iter=500, init=inits, algorithm='NUTS',  seeds=seeds,
               parallel=TRUE, chains=reps, warmup=100, path=m, cores=reps,
              mceval=TRUE, control=list(metric=mass, adapt_delta=0.8))
## Again check for issues of nonconvergence and other standard checks. Then
## use for inference.
launch_shinyadmb(nuts.updated)
ess <- monitor(nuts.updated$samples, warmup=nuts.updated$warmup, print=FALSE)[,'n_eff']
slow <- names(sort(ess))[1:8]
pairs_admb(fit=nuts.updated, pars=slow)



## NOTE: the mceval=TRUE argument tells ADMB to run -mceval on ALL chains
## combined AFTER discarding warmup period and thinning. Thus whatever your
## model outputs during mceval is ready for use in
## management. Alternatively you can run -mceval from the command
## line. sample_admb will merge samples into the .psv file in the main
## folder so either way works.
