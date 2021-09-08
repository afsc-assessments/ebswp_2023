### Super quick script to explore fitting VAST to the AT and AVO
### data. Started 5/29/2020 by Cole

## Assumes your working directory is the shared folder
## VAST_acoustic
getwd()

library(VAST)
packageVersion('VAST')                  # 3.3.0 for cole
library(tidyverse)
theme_set(theme_bw())
ak_map <- subset(map_data("world"), region=='USA' & subregion=='Alaska')
ak_map <- rename(ak_map, lon=long)
## ak_map <- cbind(ak_map[rep(1:nrow(ak_map), times=nyr),], year=rep(years, each=nrow(ak_map)))

## This is the bottom-referenced output that we can temporarily
## convert and use here.
atsfull <- read.csv('ats_full_3.csv')##  %>%
ats <- atsfull %>% filter(year==2018) %>% mutate(type='ATS', SA=strata2+strata3) %>%
    select(year, lon, lat, SA, type)

## this is the data from Mike Levine, do not share!!
avo <- read.csv('bering_bottom_trawl_backscatter_2017.csv') %>%
  mutate(year=2017, type='AVO') %>%
  select(year,lon, lat, SA, type)


at <- rbind(avo, ats)
### Subsample?
## at <- at[seq(1,nrow(at), by=1),]

## Quick plot to check
g1 <- ggplot(ak_map, aes(x = lon, y = lat, group = group)) +
  geom_polygon(fill=gray(.5), colour = "white") + theme_bw() +
  geom_point(data=at, aes(group=NULL, color=type), size=1) +
  labs(x='Longitude', y='Latitude') +
    coord_cartesian(xlim=range(at$lon), ylim=range(at$lat))
ggsave('AT_AVO_map.png', g1, width=5, height=4, dpi=400)


### Quickly fit the AVO data across subsamples
## User settings ____ Try with rr= 'other' and rr = 'eastern_bering_sea'
nx <- 200                               # resolution
## What extrapolation region to use?? For now lets just do EBS
EBS_extrap = make_extrapolation_info( Region="Eastern_Bering_Sea")
NBS_extrap = make_extrapolation_info( Region="Northern_Bering_Sea", flip_around_dateline = TRUE )
Extrapolation_List = combine_extrapolation_info( "EBS"=EBS_extrap, "NBS"=NBS_extrap )
rr <- c('user', 'other', 'eastern_bering_sea')[3] # region
## user is broken, we need to stitch the two regions together still
stopifnot(rr!='user')
EL <- if(rr=='user') Extrapolation_List else NULL
wd <- paste0(getwd(), "/", rr, "_avo_", nx,"/")
dir.create(wd, FALSE)
settings <-
  make_settings(n_x=nx, Region=rr, fine_scale=TRUE,
                purpose='Index', bias.correct=FALSE)
settings$FieldConfig[2,] <- 0           # turn off spatiotemporal

## Fit quick model and plot results of fit
fitAVO <-
  fit_model(settings, Lat_i=at$lat, Lon_i=at$lon, b_i=at$SA,
            a_i=rep(1, nrow(at)), t_iz=rep(1, nrow(at)),
            working_dir=wd, knot_method='grid',
            observations_LL=data.frame(Lon=at$lon, Lat=at$lat),
            getsd=TRUE, newtonsteps=1, test_fit=FALSE)
plot_results(fitAVO, check_residuals=FALSE, working_dir=wd)


## check when rr= EBS
fitAVO$Report$jnll                      # [1] 222494.1
