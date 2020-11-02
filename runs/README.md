# Summary

## Tasks and todo list 2020
    [ ] Add in SD biomass     
    [ ] For RE model on wts-at-age, there's a near perfect match except pm.tpl estimating an extra year effect that doesn't occur in 
the wt-RE model...unsure why...maybe need to sub in current year estimates from RE model?...
    [ ] Use vast nocp runs for last year's 1st table
    [ ] For Tier 1 v 3 comparison, run the estimation such that F35==Fmsy, compare SRR curves, say something smart?
    [x] Add in 2019 fishery age compositions      
    [ ] Add in 2019 fishery age compositions      


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


