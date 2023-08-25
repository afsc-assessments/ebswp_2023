### Try fitting to the DB bootstrap outputs
pak::pkg_install("flexsurv")
library(flexsurv)
library(TMB)
compile("../src/gengamma.cpp")
dyn.load(dynlib('../src/gengamma'))
library(tidyverse)
source('functions.R')
dbdat0 <-
  read.table('../Lognormal_experiment_outputs/goaallyrs_sims_041123.txt', header=TRUE) %>%
  janitor::clean_names()
mbdat0 <-
  read.table("../Lognormal_experiment_outputs/vast_goa_allyrs_sims.txt", header=TRUE)
theme_set(theme_bw())
dbdat <- dbdat0 %>% filter(grepl('999', x=stratum)) %>%
    mutate(biomass=exp(log_biomass_mt)/1e6)
key <- data.frame(
  stringsAsFactors = FALSE,
  species = c("ATF","pcod",
              "pollock","POP","dusky rockfish",
              "northern rockfish","flathead sole","northern rock sole",
              "southern rock sole"),
  GROUP = c(10110L,21720L,
            21740L,30060L,30152L,30420L,10130L,10261L,
            10262L)
)
dbdat <- merge(dbdat, key, by.x='group', by.y='GROUP') %>% arrange(species,year,bootstrap)
mbdat <- mutate(mbdat0, biomass=index/1e6)

## pdf('strata_dists.pdf', width=7, height=7)
## for(spp in unique(dbdat$species_code)){
##   xx <- filter(dbdat, !grepl('999', stratum) & species_code==spp) %>%
##     group_by(year,stratum) %>% mutate(y=(log_biomass_mt-mean(log_biomass_mt))/sd(log_biomass_mt))
##  g <- ggplot(xx, aes(sample=y, color=factor(stratum))) +
##    stat_qq(alpha=.5)+ stat_qq_line()+ theme_bw()+
##     facet_wrap('year', ncol=3, scales='free') + ggtitle(spp)
##  ## g <- ggplot(xx, aes(log_biomass_mt, color=factor(stratum), fill=factor(stratum))) +
##  ##   geom_histogram(bins=30, alpha=.3, position='identity') +
##  ##    facet_wrap('year', ncol=3, scales='free') + ggtitle(spp)
##   print(g)
## }
## dev.off()


## Does the mean fit right?
stop('something not right')
vastfit <- readRDS('C:/Users/cole.monnahan/Downloads/VASTfit.RDS')
vastfit$Report$Index_ctl[1,vastfit$years_to_plot,1]/1e6
years <- vastfit$year_labels[vastfit$years_to_plot]
index <-
  summary(parameter_estimates$SD) %>% as.data.frame %>%
  mutate(par=row.names(.)) %>%
  filter(grepl('ln_Index', par) & Estimate > 6.2) %>%
  mutate(year=years, Index=exp(Estimate))
cbind(index, mb_pollock_ests)



### Run all DB estimates
estlist <- NULL
for(spp in unique(mbdat$species)){
  sppmbdat <- filter(mbdat, species==spp)
  mbfits <- lapply(unique(sppmbdat$year), function(year) fit_gengamma(sppmbdat[sppmbdat$year==year,'biomass'], spp, year))
  mbests <- lapply(mbfits, function(x) x$est) %>% bind_rows %>% mutate(type='model-based')
  estlist <- bind_rows(estlist, mbests)
}
mbests <- estlist
write.csv(estlist, '../mb_estimates_all_spp.csv', row.names=FALSE)
g <- ggplot(filter(estlist, par=='Q'), aes(species, y=est)) + geom_violin() +
  geom_hline(yintercept=0) + geom_jitter(height = 0, width=0.1, alpha=.5)+
  coord_flip() + labs(x=NULL, y='Q') + ylim(-1.3,.7)
ggsave('../all_q_compare_vast.png', g, width=5, height=3.5)
### Run all DB estimates
estlist <- NULL
for(spp in unique(dbdat$species)){
  sppdbdat <- filter(dbdat, species==spp)
  dbfits <- lapply(unique(sppdbdat$year), function(year) fit_gengamma(sppdbdat[sppdbdat$year==year,'biomass'], spp, year))
  dbests <- lapply(dbfits, function(x) x$est) %>% bind_rows %>% mutate(type='design-based')
  estlist <- bind_rows(estlist, dbests)
}
dbests <- estlist
write.csv(estlist, '../db_estimates_all_spp.csv', row.names=FALSE)
g <- ggplot(filter(estlist, par=='Q'), aes(factor(species), y=est)) + geom_violin() +
  geom_hline(yintercept=0) + geom_jitter(height = 0, width=0.1, alpha=.5)+
  coord_flip() + labs(x=NULL, y='Q') + ylim(-1.3,.7)
ggsave('../all_q_compare_db.png', g, width=5, height=3.5)
estlist %>%  select(-lwr, -upr, -type, -se) %>%
  pivot_wider(names_from='par', values_from=est,
              id_cols=c('species', 'year')) %>%
  mutate(mu=exp(logmu), sigma=exp(logsigma))  %>%
  write.csv('../db_estimates_all_spp_wide.csv', row.names=FALSE)

## put together for scatterplot
ests.all <- bind_rows(dbests, mbests) %>% filter(par=='Q') %>%
  pivot_wider(id_cols=c('species','year'),
                         names_from=type, values_from=est) %>%
  rename('db'='design-based', 'mb'='model-based')

ggplot(ests.all, aes(db, mb, color=species)) + geom_point()
ggplot(ests.all, aes(db, mb)) + geom_point() + facet_wrap('species')
ggplot(ests.all, aes(year, mb, color=species)) + geom_point()

## plot for all species
pdf('mb_gengamma_fits_all_spp_hists.pdf', onefile=TRUE, width=7, height=7)
for(spp in unique(mbdat$species)){
  par(mfrow=c(4,4), mgp=c(1.5,.25,0),  oma=c(0,0,3,0), mar=c(2,1,1,.5), tck=-.01, cex=.6)
  sppmbdat <- filter(mbdat, species==spp)
  for(yr in unique(sppmbdat$year)){
    y <- sppmbdat[sppmbdat$year==yr,'biomass']
    fit <- fit_gengamma(y, spp, yr)
    plot_gengamma_fit(fit,y,FALSE)
  }
  mtext(spp, outer=TRUE)
}
dev.off()
## rerun by with nll=TRUE
pdf('mb_gengamma_fits_all_spp_nll.pdf', onefile=TRUE, width=7, height=7)
for(spp in unique(mbdat$species   )){
  par(mfrow=c(4,4), mgp=c(1.5,.25,0),  oma=c(0,0,3,0), mar=c(2,1,1,.5), tck=-.01, cex=.6)
  sppmbdat <- filter(mbdat, species==spp)
  for(yr in unique(sppmbdat$year)){
    y <- sppmbdat[sppmbdat$year==yr,'biomass']
    fit <- fit_gengamma(y, spp, yr)
    plot_gengamma_fit(fit,y,TRUE)
  }
  mtext(spp, outer=TRUE)
}
dev.off()
pdf('db_gengamma_fits_all_spp_hists.pdf', onefile=TRUE, width=7, height=7)
for(spp in unique(dbdat$species)){
  par(mfrow=c(4,4), mgp=c(1.5,.25,0),  oma=c(0,.5,3,0), mar=c(2,1,1,.5), tck=-.01, cex=.6)
  sppdbdat <- filter(dbdat, species==spp)
  for(yr in unique(sppdbdat$year)){
    y <- sppdbdat[sppdbdat$year==yr,'biomass']
    fit <- fit_gengamma(y, spp, yr)
    plot_gengamma_fit(fit,y,FALSE)
  }
  mtext(spp, outer=TRUE)
}
dev.off()
## rerun by with nll=TRUE
pdf('db_gengamma_fits_all_spp_nll.pdf', onefile=TRUE, width=7, height=7)
for(spp in unique(dbdat$species   )){
  par(mfrow=c(4,4), mgp=c(1.5,.25,0),  oma=c(0,.5,3,0), mar=c(2,1,1,.5), tck=-.01, cex=.6)
  sppdbdat <- filter(dbdat, species==spp)
  for(yr in unique(sppdbdat$year)){
    y <- sppdbdat[sppdbdat$year==yr,'biomass']
    fit <- fit_gengamma(y, spp, yr)
    plot_gengamma_fit(fit,y,TRUE)
  }
  mtext(spp, outer=TRUE)
}
dev.off()

## subsetted plots
png('pollock_fits_example.png', width=6, height=4, units='in', res=500)
par(mfcol=c(2,3), mgp=c(1.5,.25,0),  oma=c(0,.5,3,0), mar=c(2,1,1,.5), tck=-.01, cex=.6)
spp <- 'pollock'
sppdbdat <- filter(dbdat, species==spp)
for(yr in unique(sppdbdat$year)[1:3]){
  y <- sppdbdat[sppdbdat$year==yr,'biomass']
  fit <- fit_gengamma(y, spp, yr)
  plot_gengamma_fit(fit,y,FALSE)
  plot_gengamma_fit(fit,y,TRUE)
}
dev.off()


#### old code to work with just pollock

spp <- 'pollock'
##!!!! temporary until Megsie reruns the whole DB suite
sppdbdat <-
  read.table('../Lognormal_experiment_outputs/goaallyrs_1000sims_21740_041123.txt', header=TRUE) %>%
  janitor::clean_names() %>% filter(stratum==999) %>% mutate(biomass=biomass_mt/1e6)
##sppdbdat <- filter(dbdat, species_code==21740)
##ggplot(sppdbdat, aes(log(biomass))) + geom_histogram() + facet_wrap('year')
dbfits <- lapply(unique(sppdbdat$year), function(year) fit_gengamma(sppdbdat[sppdbdat$year==year,'biomass'], spp, year))
dbpreds <- lapply(dbfits, function(x) x$pred) %>% bind_rows %>% mutate(type='design-based')
dbests <- lapply(dbfits, function(x) x$est) %>% bind_rows %>% mutate(type='design-based')
sppmbdat <- filter(mbdat, species=='pollock')
mbfits <- lapply(unique(sppmbdat$year), function(year) fit_gengamma(sppmbdat[sppmbdat$year==year,'biomass'], spp, year))
mbpreds <- lapply(mbfits, function(x) x$pred) %>% bind_rows %>% mutate(type='model-based')
mbests <- lapply(mbfits, function(x) x$est) %>% bind_rows %>% mutate(type='model-based')
preds <-  bind_rows(mbpreds, dbpreds)
ggplot(preds, aes(xpred, -ypred, color=type)) + geom_line() + facet_wrap('year')
q <- bind_rows(mbests, dbests) %>% filter(par=='Q') %>%
  mutate(year2=year+ifelse(type=='model-based', -.1,.1))
g <- ggplot(q, aes(year2, est, ymin=lwr, ymax=upr, color=type)) +
  geom_pointrange() + labs(x=NULL, y='Q', color=NULL) +
  geom_hline(yintercept=0) + theme(legend.position='top')
ggsave('../q_compare_pollock.png', g, width=5, height=3.5)
fits <- list()
png('pollock_gengamma_fits.png', width=9, height=5, units='in', res=400)
par(mfrow=c(3,4), mgp=c(2,.5,0), mar=c(3,3,3,.5), cex=.6)
for(i in 1:length(dbfits)){
  fits[[yr]] <- plot_gengamma_fit(dbfits[[i]], y=, nll=0)
}
dev.off()
png('pollock_gengamma_fits_nll.png', width=9, height=5, units='in', res=400)
par(mfrow=c(3,4), mgp=c(2,.5,0), mar=c(3,3,3,.5), cex=.6)
for(yr in unique(dbdat$year)){
  plot_gengamma_fit(dbdat$biomass[dbdat$year==yr], year=yr, nll=1)
}
dev.off()

db_pollock_ests <- dbests %>%
  pivot_wider(id_cols=year, names_from=par, values_from=est) %>%
  mutate(mu=exp(logmu), sigma=exp(logsigma))
write.csv(db_pollock_ests, 'db_pollock_ests.csv', row.names=FALSE)

mb_pollock_ests <- mbests %>%
  pivot_wider(id_cols=year, names_from=par, values_from=est) %>%
  mutate(mu=exp(logmu), sigma=exp(logsigma))
write.csv(mb_pollock_ests, 'mb_pollock_ests.csv', row.names=FALSE)
load('C:/Users/cole.monnahan/Downloads/parameter_estimates.RData')
str(parameter_estimates)

old.q <- read.csv('../db_estimates_all_spp.csv') %>%
  filter(species==21740 & par=='Q') %>% pull(est)
new.q <- db_pollock_ests$Q
cbind(old.q, new.q) %>% round(2)

db_pollock_ests
