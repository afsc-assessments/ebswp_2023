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
source(here::here("tools", "plot_osa_comps.R"))

## example of how it works on simulated data (help file)
o <- rmultinom(100, 25, c(.2,.2,.1,.1,.1,.3))
p <- matrix(rep(25*c(.2,.2,.1,.1,.1,.3), 100), nrow=6)
res <- compResidual::resMulti(o,p)
plot(res)
colSums(o)
colSums(p)

## EBS pollock info
load(file="doc/modtune.rdata")
ages <- 2:15
datfile<-read_dat("runs/dat/pm_base22.dat")

names(modtune)
M<-(modtune[[2]])
o    <- M$pobs_ats[,3:16]
p    <- M$phat_ats[,3:16]
Neff <- M$EffN_ats[,2]
pearson <- Neff*(o-p)/sqrt(p*Neff)
years <- M$pobs_ats[,1]
plot_osa_comps(o,p, pearson, index=ages, years=years, index_label='age', Neff=Neff,
               stock='EBSpollock', survey='tuned_ats', outpath='doc/figs')

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
