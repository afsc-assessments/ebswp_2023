# Top -----------------------------------------------------------------------------
# Title:                      BSAI pollock survey length-weight
# Purpose:                    Randomly select among otoliths collected which to age
# Author:                     Jim Ianelli
# Contact:                    Jim.Ianelli@noaa.gov
# Create date:                2021/03/10
# Notes: --------------------------#--------------------------------------------
# 1. Object naming conventions:
#                                  a.  df_     = data.frame
#                                  b.  fn_     = function
#                                  c.  plot_   = plot
#                                  d.  ts_     = time series
#                             2. Uses library svDialogs to have the user input the desired date range.
#                                This defaults to June 10 thru July 26 for each year.
#                                Change the day/month combination in the dialog box that is prompted when executing the 'first_date' and 'last_date' variables.
#
# Load packages -------------------------------------------------------------------------
source('init.R')

# wt-len-----------------------------
df_slw <- ( dbGetQuery(channel, paste(" SELECT
x.REGION region, x.VESSEL vess, x.CRUISE crz, x.HAUL haul, x.SPECIMENID spid,
x.BIOSTRATUM stratum, x.SPECIES_CODE spp, x.LENGTH length, x.SEX sex, x.WEIGHT wt, x.AGE age,
x.MATURITY mat, x.MATURITY_TABLE mat_table, x.GONAD_WT gwt,
x.SPECIMEN_SUBSAMPLE_METHOD sam_meth, x.SPECIMEN_SAMPLE_TYPE sample_type, x.AGE_DETERMINATION_METHOD age_meth,
h.PERFORMANCE, h.START_TIME, h.DURATION, h.DISTANCE_FISHED,
h.NET_WIDTH, h.NET_MEASURED, h.NET_HEIGHT, h.START_LATITUDE,
h.END_LATITUDE, h.START_LONGITUDE, h.END_LONGITUDE, h.BOTTOM_DEPTH, h.SURFACE_TEMPERATURE,
h.GEAR_TEMPERATURE
from
 RACEBASE.SPECIMEN x,
 RACEBASE.HAUL h
where h.CRUiSEJOIN=x.cruisejoin and
h.hauljoin=x.hauljoin and  x.SPECIES_CODE=21740 ;" ) ) )
# N rock sole
#SPECIES_CODE=10260 or SPECIES_CODE=10261 or SPECIES_CODE=10263;
#fn_Write_Data(dat=df_slw,file="data/LW_data_srv.csv")
#
# plots------------------------------
df_slw <- read.csv("data/LW_data_srv.csv")
names(df_slw)
unique(df_slw$REGION)
unique(df_slw_b$REGION)
unique(df_slw$CRZ)
unique(df_slw$STRATUM)
names(df_slw)
str(df_slw)
unique(df_slw_b$week)
unique(df_slw_b$region)
str(df_lw_b)
str(df_slw_b)
names(df_slw_b)
names(df_lw_b)

# Pare down to EBS
df_slw_b <- df_slw %>% filter(LENGTH>0,WT>0,REGION=="BS") %>% transmute(year=year(START_TIME),
                                                                        week=week(START_TIME),
                                                                        date=(START_TIME),
                                                                        lat=(START_LATITUDE+END_LATITUDE)/2,
                                                                        lon=(START_LONGITUDE+END_LONGITUDE)/2,
                                                                        sex=SEX,age=AGE,length=round(LENGTH/10,0),
                                                                        wt=WT)
df_slw_b %>% filter(year>1998) %>%   group_by(year) %>% tally()
head(df_slw_b)
ebs_dat <- readr::read_csv(file = "~/_mymods/rooper/akfishcondition/2020-08-22_ebs_condition_data_2020_ESR.csv")
names(ebs_dat)
unique(ebs_dat$SPECIES_CODE)
sr_lw <- ebs_dat %>%
         filter(SPECIES_CODE==21740) %>%
        transmute(year=YEAR,
           week=29,
           sex=SEX,length=round(LENGTH/10,0),
           wt=WEIGHT)
#Plot up online data w/ sql
#
sr_lw %>% mutate(length,wt=wt,year,source="akcond") %>% bind_rows(df_slw_b %>%
          filter(year>1998) %>%
            mutate(length,wt,year,source="sql")) %>%
   ggplot(aes(x=length,y=wt,col=source)) + theme_few() + geom_point(alpha=.2) + facet_wrap(.~year)

sr_lw %>% mutate(length,wt=wt,year,source="akcond") %>% bind_rows(df_slw_b %>%
          filter(year>1998) %>%
            mutate(length,wt,year,source="sql")) %>% group_by(source,year,length) %>% tally() %>%
   ggplot(aes(x=length,y=n,col=source)) + theme_few() + geom_line(size=2,alpha=.8) + facet_wrap(.~year)

#Normalize data from akfishcondition
#
sr_lw %>%  group_by(year) %>% tally()
df_lw_a <-  bind_rows(tibble(df_lw_b,source="Fishery"),tibble(df_slw_b,source="Survey"))
df_lw_b$sex <- ifelse(df_lw_b$sex=="F",1,ifelse(df_lw_b$sex=="M",2,3) )
df_slw_b$date <- date(df_slw_b$date)
df_lw_a <-  bind_rows(tibble(df_lw_b,source="Fishery"),tibble(df_slw_b,source="Survey"))
head(df_lw_a)
# Length frequency...
df_lw_a %>% group_by(length,source) %>% tally() %>%
  ggplot(aes(x=length,y=n,fill=source)) + geom_bar(stat='identity') + theme_few()

df_lw_a %>% filter(year>2000,week>20, week<37) %>% group_by(source,year,length) %>% tally() %>%
  ggplot(aes(x=length,y=n,fill=source,group=year)) + geom_bar(position=position_dodge(), stat='identity') + theme_few() + facet_wrap(year~.) +
  xlim(c(0,65))
head(df_lws_b)


# now for proportions----------
df_lw_a %>% filter(year>2010,week>20, week<37) %>% group_by(source,year,length) %>% tally() %>% ungroup() %>% group_by(source,year) %>% mutate(p=n/sum(n)) %>%
  ggplot(aes(x=length,y=p,fill=source,group=year)) + geom_area(stat='identity') + theme_few() + facet_grid(source~year) +  xlim(c(0,75)) + geom_vline(xintercept=50)

devtools::install_github("sean-rohan-noaa/akfishcondition")
library(readr)
library(viridis)

# Check the akfishcondition package is installed
if(!("akfishcondition" %in% installed.packages())) {
  devtools::install_github("sean-rohan-NOAA/akfishcondition")
}

library(akfishcondition)
pkg_version <- packageVersion("akfishcondition")
pkg_version

df_slw_b %>%  group_by(year) %>%  tally()

#Compute mean weight given length================
df_wl_mn <- df_lw_a %>% filter(year>2000,week>20, week<37) %>% group_by(source,year,length) %>% tally()
head(df_wl_mn)

  df_slw_b %>% group_by(length) %>% tally() %>%
  ggplot(aes(x=length,y=n)) + geom_bar(stat='identity') + theme_few()
names(df_lw)

df_lw %>% filter(SPECIES==201) %>% group_by(LENGTH) %>% tally() %>%
  ggplot(aes(x=LENGTH,y=n)) + geom_bar(stat='identity') + theme_few()

# Length frequency...
df_slw_b %>% group_by(length) %>% tally() %>%
  ggplot(aes(x=length,y=n)) + geom_bar(stat='identity') + theme_few()

df_slw_b %>% filter(lon<0,length<25) %>%
  ggplot(aes(x=lon,y=lat)) + geom_point(size=4,alpha=.3) + theme_few()

df_slw_b %>% group_by(year) %>% tally() %>%
  ggplot(aes(y=n,x=year)) + geom_point(size=4) + theme_few()

df_slw_b %>% group_by(size=round(length,0)) %>% tally() %>%
  ggplot(aes(y=n,x=size)) + geom_point(size=4) + theme_few()

df_slw_b %>% group_by(size=round(length,0)) %>% summarise(weight=mean(wt)) %>%
  ggplot(aes(y=weight,x=size)) + geom_point(size=4) + theme_few()

df_lw %>% group_by(year) %>% tally() %>%
  ggplot(aes(y=n,x=year)) + geom_point(size=4) + theme_few()

