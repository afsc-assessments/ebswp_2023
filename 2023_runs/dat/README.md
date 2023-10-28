# Notes

## 2023 November assessment
  [x] Create fixed-effects fishery wt-age datafile "wtage2023.dat" (also done in script "wt.R" in WtAgeRE, but calls on specimen data from survey and sampler data from fishery)      
  [x] Generated random-effect SSB wt-at-age (done in script "wt.R" in WtAgeRE)     
  [x] Expand Paul Spencer's input files to work for 2023 (but placeholders only)     
  [x] Put SSB wt-at-age into appropriate input datafile     
  [x] Update fishery catch     
  [x] Update fishery weight-at-age      
  [x] Update fishery catch-at-age      
  [x] Update fishery sample size
  [x] Update survey cpue so that design-based estimator can be used from scratch     
  [x] Update BTS VAST estimates     
  [x] Update BTS VAST age-composition estimates     
  [x] Update BTS design based estimates     
  [x] Update BTS design based age-composition estimates     
  [x] Update BTS Covariance matrix ("cov_2023.dat")     
  [x] Add in Hulson's BTS sample size     
  [x] Update AVO time series     
  [x] Update ATS age composition for the 2022 data (previously used BTS ALK)     

### Directory layout
Nine models, datafile format follows naming convention: pm_23.4.dat for model m4 (aliased to more descriptive actual directory name)
Directory structure sequence is:
    m0	last year’s model    
    m1	Sept version through 2022    
    m2	As m1 but with 2023 AVO data point included    
    m3	As m2 but with 2022 age composition data updated (very minor change)    
    m4	As m3 but addition of fishery catch-age to 2022    
    m5	As m4 but addition of BTS index through 2023    
    m6	As m5 but with BTS age compositions included through 2023    
    m7	As m5 but with VAST age compositions included through 2023    
    m8	As m6 but with Hulsons BTS input sample sizes    


pm_22.dat: Full final dataset with

## September work
Changed "std_tune.dat" to "obs_err_init.dat" to accommodate adding in datafiles that have tuned stdevs (in directory "tune")

Covariance matrix is derived from Stan's DD algorthm before VAST

# Defaults

pm_22.dat: Full final dataset with
[ ] fishery catch-age
[ ] wt-age for fishery (variance terms from random effects estimates)
[ ] wt-age for bottom trawl survey
[ ] abundance-at-age for bottom trawl survey
[ ] biomass index from bottom trawl survey
[ ] cov of biomass index from bottom trawl survey
[ ] biomass index from bottom trawl survey
[ ] ATS Biomass
[ ] ATS Age
[ ] AVO
[ ] recompute fishery effN values
[ ] AVO


# Document check





pm_2017.dat is with AT down to 0.5 m, tuned to biomass, uses dens dependent catchability correct and covariance matrix.

List of things to update:

[ ] fishery catch-age
[ ] recompute fishery effN values
[ ] wt-age for fishery (variance terms from random effects estimates)
[ ] wt-age for bottom trawl survey
[ ] abundance-at-age for bottom trawl survey
[ ] biomass index from bottom trawl survey
[ ] cov of biomass index from bottom trawl survey
[ ] biomass index from bottom trawl survey

# Document check




