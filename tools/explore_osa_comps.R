## see
## https://github.com/fishfollower/compResidual#composition-residuals
## for installation instructions

# TMB:::install.contrib("https://github.com/vtrijoulet/OSA_multivariate_dists/archive/main.zip")
## devtools::install_github("fishfollower/compResidual/compResidual")

library(compResidual)
library(ggplot2)
library(cowplot)
library(reshape2)
library(dplyr)
library(tidyr)
theme_set(theme_bw())
library(here)
source(here::here("R", "plot_osa_comps.R"))

## example of how it works on simulated data (help file)
o <- rmultinom(100, 25, c(.2,.2,.1,.1,.1,.3))
p <- matrix(rep(25*c(.2,.2,.1,.1,.1,.3), 100), nrow=6)
res <- compResidual::resMulti(o,p)
plot(res)
colSums(o)
colSums(p)

## GOA pollock info
repfile <- readRDS(here::here('data', 'repfile.RDS'))
datfile <- readRDS(here::here('data', 'datfile.RDS'))

ages <- 3:10
o <- repfile$Survey_1_observed_and_expected_age_comp[,ages]
p <- repfile$Survey_1_observed_and_expected_age_comp[,10+ages]
pearson <- repfile$Survey_1_Pearson_residuals_age_comp[,ages]
years <- datfile$srv_acyrs1
Neff <- datfile$multN_srv1 # this gets rounded
plot_osa_comps(o,p, pearson, index=ages, years=years, index_label='age', Neff=Neff,
               stock='GOApollock', survey='shelikof', outpath='figs')

## obs and expected (p), rows=years, columns=ages
ages <- 1:10
o <- repfile$Survey_2_observed_and_expected_age_comp[,ages]
p <- repfile$Survey_2_observed_and_expected_age_comp[,10+ages]
pearson <- repfile$Survey_2_Pearson_residuals_age_comp[,ages]
years <- datfile$srv_acyrs2
Neff <- datfile$multN_srv2 # this gets rounded
plot_osa_comps(o,p, pearson, index=ages, years=years, index_label='age', Neff=Neff,
               stock='GOApollock', survey='nmfs_bt', outpath='figs')

ages <- 1:10
o <- repfile$Survey_3_observed_and_expected_age_comp[,ages]
p <- repfile$Survey_3_observed_and_expected_age_comp[,10+ages]
pearson <- repfile$Survey_3_Pearson_residuals_age_comp[,ages]
years <- datfile$srv_acyrs3
Neff <- datfile$multN_srv3 # this gets rounded
plot_osa_comps(o,p, pearson, index=ages, years=years, index_label='age', Neff=Neff,
               stock='GOApollock', survey='adfg', outpath='figs')

ages <- 1:10
o <- repfile$Survey_6_observed_and_expected_age_comp[,ages]
p <- repfile$Survey_6_observed_and_expected_age_comp[,10+ages]
pearson <- repfile$Survey_6_Pearson_residuals_age_comp[,ages]
years <- datfile$srv_acyrs6
Neff <- datfile$multN_srv6 # this gets rounded
plot_osa_comps(o,p, pearson, index=ages, years=years, index_label='age', Neff=Neff,
               stock='GOApollock', survey='summer_at', outpath='figs')

ages <- 1:10
o <- repfile$Fishery_observed_and_expected_age_comp[,ages]
p <- repfile$Fishery_observed_and_expected_age_comp[,10+ages]
pearson <- repfile$Fishery_Pearson_residuals_age_comp[,ages]
years <- datfile$fshyrs
Neff <- datfile$multN_fsh
plot_osa_comps(o,p, pearson, index=ages, years=years, index_label='age', Neff=Neff,
               stock='GOApollock', survey='fishery', outpath='figs')

# GOA RE/BS ----

#lengths
rebslens <- readRDS(here::here('data', 'goa_rebs_lencomps.RDS'))
for(i in 1:length(unique(rebslens$index))) {
  lens <- unique(rebslens$length)
  tmp <- rebslens %>% dplyr::filter(index == unique(rebslens$index)[i])
  o <- tmp %>% pivot_wider(id_cols = year, names_from = length, values_from = obs) %>% select(-year) %>% as.matrix()
  p <- tmp %>% pivot_wider(id_cols = year, names_from = length, values_from = pred) %>% select(-year) %>% as.matrix()
  pearson <-  tmp %>% pivot_wider(id_cols = year, names_from = length, values_from = pearson) %>% select(-year) %>% as.matrix()
  years <- tmp %>% distinct(year, n) %>% pull(year)
  Neff <- tmp %>% distinct(year, n) %>% pull(n)
  plot_osa_comps(o, p, pearson, index=lens, years=years, index_label='length', Neff=Neff,
                 stock='GOArougheye', survey=unique(rebslens$index)[i], outpath='figs')
}

# ages
rebsage <- readRDS(here::here('data', 'goa_rebs_agecomps.RDS'))
for(i in 1:length(unique(rebsage$index))) {
  ages <- unique(rebsage$age)
  tmp <- rebsage %>% dplyr::filter(index == unique(rebsage$index)[i])
  o <- tmp %>% pivot_wider(id_cols = year, names_from = age, values_from = obs) %>% select(-year) %>% as.matrix()
  p <- tmp %>% pivot_wider(id_cols = year, names_from = age, values_from = pred) %>% select(-year) %>% as.matrix()
  pearson <-  tmp %>% pivot_wider(id_cols = year, names_from = age, values_from = pearson) %>% select(-year) %>% as.matrix()
  years <- tmp %>% distinct(year, n) %>% pull(year)
  Neff <- tmp %>% distinct(year, n) %>% pull(n)
  plot_osa_comps(o, p, pearson, index=ages, years=years, index_label='age', Neff=Neff,
                 stock='GOArougheye', survey=unique(rebsage$index)[i], outpath='figs')
  }

# sablefish

# lengths
sablelens <- readRDS(here::here('data', 'sable_lencomps.RDS'))
for(i in 1:length(unique(sablelens$index))) {
  lens <- unique(sablelens$length)
  tmp <- sablelens %>% dplyr::filter(index == unique(sablelens$index)[i])
  o <- tmp %>% pivot_wider(id_cols = year, names_from = length, values_from = obs) %>% select(-year) %>% as.matrix()
  p <- tmp %>% pivot_wider(id_cols = year, names_from = length, values_from = pred) %>% select(-year) %>% as.matrix()
  pearson <-  tmp %>% pivot_wider(id_cols = year, names_from = length, values_from = pearson) %>% select(-year) %>% as.matrix()
  years <- tmp %>% distinct(year, n) %>% pull(year)
  Neff <- tmp %>% distinct(year, n) %>% pull(n)
  plot_osa_comps(o, p, pearson, index=lens, years=years, index_label='length', Neff=Neff,
                 stock='AKsablefish', survey=unique(sablelens$index)[i], outpath='figs')
}
# ages
sableage <- readRDS(here::here('data', 'sable_agecomps.RDS'))
for(i in 1:length(unique(sableage$index))) {
  ages <- unique(sableage$age)
  tmp <- sableage %>% dplyr::filter(index == unique(sableage$index)[i])
  o <- tmp %>% pivot_wider(id_cols = year, names_from = age, values_from = obs) %>% select(-year) %>% as.matrix()
  p <- tmp %>% pivot_wider(id_cols = year, names_from = age, values_from = pred) %>% select(-year) %>% as.matrix()
  pearson <-  tmp %>% pivot_wider(id_cols = year, names_from = age, values_from = pearson) %>% select(-year) %>% as.matrix()
  years <- tmp %>% distinct(year, n) %>% pull(year)
  Neff <- tmp %>% distinct(year, n) %>% pull(n)
  plot_osa_comps(o, p, pearson, index=ages, years=years, index_label='age', Neff=Neff,
                 stock='AKsablefish', survey=unique(sableage$index)[i], outpath='figs')
}