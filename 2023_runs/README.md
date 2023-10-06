# Summary

## Final 2023 model runs

Based on runs presented in Sept the new runs directory is "2023_runs" where "base22" is the 2022 model,
sep23 is the base selected change model from september which has:
  - spawning biomass weight-at-age set to the RE model estimates from fishery data for the A-season
  - the new AVO time series
  - modest process error in ATS selectivity variability

  
 
## September 2023 model runs

 - Update error terms from the 2022 model, results in directory "base22", 2022 model w/ incorrect error terms for ats is in "base"
 - Diagonal matrix instead of covariance terms for BTS data
 - Alternative SSB runs (3 of them, constant, A-season empirical, A-season predictions from random-effects wt-age model
 - New AVO data treatment:
    - New data only
    - Full series (rescaled with new and old)
    - Alternative CVs (more reflective of RMSE)
  - Generalized Gamma distribution: based off of the density-dependent simulations
  - Age-error
  - Estimate Sigma R in MCMC

## Tasks and todo list 2023
    [ ] Get recommendations from Plan Team and SSC in September
    [ ] 


## Tasks and todo list 2021

Added in fishery length and age compositions for 2021...new. results for legnth alone in "l21" length and catch age
in c21.
    
    [x] Update Paul's temperature series
    [x] Run 2020 model with and without "ce" climate effects (in directories withce and withoutce)
    [x] Run 2020 model with M-matrix no CE
    [x] Run 2020 model with M-matrix with CE
    [x] Add in copepod index for age 3   
    [x] Wt-age from coh and yr effect model
    [x] Catch age from sampler
    [x] Cov matrix from survey
    [x] Srv biomass NBS+EBS vast runs
    [ ] Srv wt-age vast runs
    [x] AVO index
    [ ] AVO index alternative CVs
    [ ] Code for Tier 2             

## Models 
   1. 2020 base
   2. 2021 update
   3. CABA runs
   4. As 2. but with CPE
   5. As 4 but alternative CVs for AVO



## Tasks and todo list 2020
    [ ] Add in SD biomass     
    [ ] For RE model on wts-at-age, there's a near perfect match except pm.tpl estimating an extra year effect that doesn't occur in 
the wt-RE model...unsure why...maybe need to sub in current year estimates from RE model?...
    [ ] Use vast nocp runs for last year's 1st table
    [ ] For Tier 1 v 3 comparison, run the estimation such that F35==Fmsy, compare SRR curves, say something smart?
    [x] Add in 2019 fishery age compositions      
    [ ] Add in 2019 fishery age compositions      

### SRR runs
  sr0:	saildrone include 1978 YC
  sr1:	as sr0 but exclude 78 (20.0a)
  sr2:	as sr1 but diffuse prior
  sr3:	as sr1 but conditioned so Fmsy=F35


## 2019 notes
2019 runs are in base, lastyr (2018 version of base) then the C-CABA runs, vastage, constsel, vast_cp, vastall.

initial runs indicated that the small avg wts in 2018 need to be filled in...

also, ssb_wts run using A-season fishery smoothers...if possible. Go to sampler/cases/ebspollock and find strata wt bootstraps 
but it turns out the A-season means are very similar to overall mean, and since spawning occurs to some extent year-round, stick
with status quo

vast run hierarchy
1) vast_cp
2) vast_nocp
3) vastall includes ATS smoothed


make.bat runs model within subdirectories
   - 2018 contains sub-directories for different model configurations     
   - sub-directories are for different model configurations (base is 2018)     
   - Test1
## Tasks and todo list
    [ ] Add in survey biomass     
    [ ] Update catches     
    [ ] Add in 2015 fishery age compositions      
    [ ] Add in 2016 survey age compositions     
    [ ] Modify code to accommodate time-varying M
    [ ] Figure out which models to use going forward     
## Data sensitivities
	Followed C, CA, CAB, CABE method      
    16.1 final model, 16.1a and 16.1b have different SRR assumptions (moderate and diffuse conditioning of data)
    16.1m has M profiles (done w/ arcit.sh changed to mprof.sh)

kkkk
