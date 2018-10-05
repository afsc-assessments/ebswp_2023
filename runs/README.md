# EBS pollock 2018
## Tasks and todo list
    [ ] Make new branch, call it 2018
    [ ] Get updated AT age and index data (down to 0.5 m)
    [x] Get haul-based sample sizes
    [ ] Add in survey biomass     
    [ ] Rescale survey biomass covariance matrix
    [ ] Update catches     
    [ ] Add in 2017 fishery age compositions      
    [ ] Add in 2018 survey age compositions     
    [ ] re-run wt.tpl with updated survey and fishery data to get new variance params for REs, in 2017 this was done in fishBodyMassAtAge repo
    [ ] Modify code to accommodate time-varying M
    [ ] Figure out which models to use going forward     

## Data sensitivities
	Follow C, CA, CAB, CABE method      
    [ ] Catch only
    [ ] Catch and Acoustics 
    [ ] Catch, Acoustics and AVO 
    [ ] Catch, Acoustics, AVO, and EBS bottom trawl survey
    [ ] Catch, Acoustics, AVO, EBS bottom trawl survey, + NBS
    [ ] Catch, Acoustics+, AVO, EBS bottom trawl survey, + NBS

    16.1 final model, 16.1a and 16.1b have different SRR assumptions (moderate and diffuse conditioning of data)
    16.1m has M profiles (done w/ arcit.sh changed to mprof.sh)
