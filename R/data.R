## Preprocess data, write TAF data tables

## Before: pm_2018_ddc.dat (bootstrap/data), control.dat (bootstrap/data/config)
## After:  catage.csv, catch.csv, maturity.csv, natmort.csv, survey_at.csv,
##         survey_avo.csv, wcatch.csv, wstock.csv (data)

library(icesTAF)
source("utilities_data.R")

mkdir("data")

data <- extractData("bootstrap/data/pm_2018_ddc.dat")
data <- read_dat("bootstrap/data/pm_2018_ddc.dat")
natmort <- extractM("bootstrap/config/control.dat")

setwd("data")
write.taf(data$catage)      # 10
write.taf(data$catch)       # 2
write.taf(data$maturity)    # p17
write.taf(data$survey.at)   # 22
write.taf(data$survey.avo)  # 23
## write.taf(data$survey.bts)  # different from table 17 in report
write.taf(data$wcatch)      # 25
write.taf(data$wstock)      # 18
write.taf(natmort)          # p17
setwd("..")
