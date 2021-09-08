library(VAST)

## Read in prepared data which comes from a simulated example
## loosely conditioned on EBS pollock.

### !! THIS IS NOT REAL DATA !! ###
data(acoustic_and_trawl, package = "FishStatsUtils" )
dat <- subset(acoustic_and_trawl, Year<2012)
str(dat)       # note Gear reflects different data sets
## Make default settings for index standardization
settings <- make_settings(
         n_x = 100,
         Region = "eastern_bering_sea",
         purpose = "index2",
         bias.correct = FALSE,
         fine_scale = TRUE)
## settings$Options$treat_nonencounter_as_zero <- FALSE
settings$FieldConfig[2,2] <- 0 # turn off spatiotemporal LP2

### Setup the "combined" part of the model
## Associate depth strata (0 = <0.5m, 1 = 0.5-16m, 2 = >16m) with each
## observation (row). This is two columns b/c there are
## observations from at most 2 strata.
c_iz <- matrix( c(1,2, 2,NA, 3,NA),
     byrow = TRUE,
     nrow = 3,
     ncol = 2)[as.numeric(dat$Gear)] - 1
unique(c_iz)
## [1,]    0    1  # bottom trawl
## [2,]    1   NA  # acoustic 0.5-16m
## [3,]    2   NA  # acoustic >16m
### Note that NA means to not sum across it. So the bottom trawl
### is the summation over the first two strata, and the two
### acoustic data sets are only from one stratum.

## Run model, with getReportCovariance = TRUE so the Delta method
## can be used below
fit <- fit_model(
    settings = settings,
    Lat_i = dat$Lat,
    Lon_i = dat$Lon,
    t_i = dat$Year,
    c_i = c_iz,
    b_i = dat$Catch_KG,
    a_i = dat$AreaSwept_km2,
    getReportCovariance = TRUE)

## Default plots
plot(fit,
    category_names = c("Acoustic dead zone","ADZ to Effective fishing height","EFH to surface") )

## Can grab index SEs directly from VAST output in the case of
## the depth strata (VAST categories)
years <- sort(unique(dat$Year))
nyr <- length(years)
SD <- fit$parameter_estimates$SD
tmp <- which(names(SD$value) %in% 'Index_ctl')
est <- fit$Report$Index_ctl[,,1]
index.strata <- data.frame(
             year = rep(years, each = 3)+c(-.05, 0, .05),
             stratum = c('<0.5 m', '0.5-16 m', '>16 m'),
             index = SD$value[tmp],
             se = SD$sd[tmp])


## But need to manually calculate SE for the total biomass index
## and two gear indices. Since it's a sum of the three the
## derivatives are all 1 and so the SE is the sqrt of the sum of
## all of the variances and covariances. This feature is not
## coded into VAST yet so have to do it manually. also note that
## the order of the Index_cyl matrix in vector form is Index_11,
## Index_21, Index_31, Index_12,.. etc. This effects the
## subsetting below
cov.index <- SD$cov[tmp,tmp]
## combined is all three strata summed
index1 <- data.frame( year = years-.05,
          gear = 'total',
          index = apply(est[1:3,], 2, sum),
          se = sqrt(sapply(1:nyr, function(i) {j = 1:3+3*(i-1); sum(cov.index[j,j])})))
## sum the top two to get what the ATS sees
index2 <- data.frame( year = years,
          gear = 'AT',
          index = apply(est[2:3,], 2, sum),
          se = sqrt(sapply(1:nyr, function(i) {j = (1:3+3*(i-1))[-1]; sum(cov.index[j,j])})))
## likewise the BTS is just the first strata
index3 <- data.frame( year = years+.05,
          gear = 'BT',
          index = apply(est[1:2,], 2, sum),
          se = sqrt(sapply(1:nyr, function(i) {j = (1:3+3*(i-1))[-3]; sum(cov.index[j,j])})))
index.gear <- rbind(index1,index2, index3)

if(require(ggplot2)){
  ggplot(index.strata,
    aes(year, index, color = stratum, ymin = index-1.96*se,
                           ymax = index+1.96*se)) + geom_linerange(lwd = 1) +
    geom_line(lwd = 2)
  ggplot(index.gear,
    aes(year, index, color = gear, ymin = pmax(0,index-1.96*se), ymax = index+1.96*se)) +
    geom_linerange(lwd = 1) + geom_line(lwd = 2)
}

## Further applications of the Delta method could be used to get
## other derived quantities in a similar manner.
