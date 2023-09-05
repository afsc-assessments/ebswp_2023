# EBSpollock

An attempt to make assessments more transparent!

## The SSC continues to support:
  * Ongoing genetic studies to determine the relationship between pollock in the NBS and EBS, and nearby GOA and AI regions.

  * The 2019 BSAI GPT recommendation to revisit and evaluate the treatment of variance parameters 
	   within the assessment, with particular attention to those that are fixed.

  * Efforts to quantify pollock movement and abundance along the US-Russia EEZ boundary.

  * Geostatistical analyses of combined trawl and acoustic data to provide a single time-series,
    statistically accounting for the overlap between these data, for informing stock trends.

## The SSC provides the following additional recommendations:
  * Exploration of young-of-year pollock density and quality estimates from NMFS BASIS surveys to inform pollock recruitment.

  * Consideration of whether the observed sensitivity in the SRR to prior specification should
constitute an increased risk level specification within the assessment or population dynamicsrelated considerations. This could provide a clearer justification for the use of the Tier 3 calculation
as the basis for harvest specification.

  * Given the time-varying specification of fishery selectivity within the assessment model and the
large change in the estimated 2021 FOFL between the 2019 and 2020 assessments, the authors should
provide a retrospective comparison of the selectivity assumed in projections to that estimated with
the addition of new data.

  * Consideration of whether risk table specifications should account for the importance of pollock as
a key forage species in the EBS ecosystem to better justify the use of a Tier 3 ABC determination
as a precautionary measure for this Tier 1 stock.

  * Given the apparent disappearance of the second and large mode in fishery length compositions as
the 2020 B-season progressed, exploration of within-season spatial variation in fishery length
composition would be useful in evaluating whether these larger pollock simply moved out of the
area of fishing effort, or died as a result of natural or fishing mortality.

# EBS pollock 2016
## Tasks and todo list
    [x] Add in survey biomass     
    [x] Update catches     
    [x] Add in 2015 fishery age compositions      
    [x] Add in 2016 survey age compositions     
    [x] Modify code to accommodate time-varying M
    [ ] Modify code to accommodate biomass in density-dependent covariance
    [ ] Modify code to use new wt-age estimation
    [ ] Figure out which models to use going forward     

| Models | 3m | 0.5m | Standard survey | Dens. Dep. Correction | Numbers | Biomass | Numbers | Biomass | 15.1 Input sample sizes | Revised input sample sizes | wt 15.1 | wt 16.0 | Description                             |
|--------|----|------|-----------------|-----------------------|---------|---------|---------|---------|-------------------------|----------------------------|---------|---------|-----------------------------------------|
| 14.1   | x  |      | x               |                       | x       |         | x       |         | x                       |                            | x       |         | 2014 model                              |
| 15.1   | x  |      |                 | x                     | x       |         | x       |         | x                       |                            | x       |         | 2015 model                              |
| 16.01  | x  |      | x               |                       |         | x       |         | x       | x                       |                            | x       |         | Transition to biomass                   |
| 16.02  |    | x    | x               |                       |         | x       |         | x       | x                       |                            | x       |         | Transition to ATS 0.5m                  |
| 16.03  |    | x    |                 | x                     |         | x       |         | x       |                         |                            | x       |         | Transition to BTS dens. dep. Correction |
| 16.04  |    | x    |                 | x                     |         | x       |         | x       |                         | x                          | x       |         | Input sample size adjustment            |
| 16.1   |    | x    |                 | x                     |         | x       |         | x       |                         | x                          |         | x       | Proposed model                          |

