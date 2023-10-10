# Notes

## 2023 November assessment

[x] Create fixed-effects fishery wt-age datafile "wtage2023.dat" (also done in script "wt.R" in WtAgeRE, but calls on specimen data from survey and sampler data from fishery) 
[x] Generated random-effect SSB wt-at-age (done in script "wt.R" in WtAgeRE)
[x] Expand Paul Spencer's input files to work for 2023 (but placeholders only)
[ ] Put SSB wt-at-age into appropriate input datafile
[ ] Update fishery catch
[ ] Update fishery catch-at-age 
[ ] Update survey cpue so that design-based estimator can be used from scratch
[ ] Update BTS design based estimates
[x] Update BTS Covariance matrix ("cov_2023.dat")
[ ] Add in Hulson's BTS sample size
[ ] Update AVO time series
[ ] Update ATS age composition for the 2022 data (previously used BTS ALK)


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




