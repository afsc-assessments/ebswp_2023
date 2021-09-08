# Top -----------------------------------------------------------------------------
# Title:                      BSAI pollock fisheries length-weight
# Purpose:                    Randomly select among otoliths collected which to age
# Author:                     Jim Ianelli
# Contact:                    Jim.Ianelli@noaa.gov
# Create date:                2021/03/02
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
df_lw <- ( dbGetQuery(channel, paste("SELECT
T_TABLE, CRUISE, PERMIT, VESSEL, GEAR, NMFS_AREA, LATDD_START, LONDD_START, LATDD_END, LONDD_END,
LENGTH_SEQ, PERFORMANCE, FISHING_DEPTH_FATHOMS, BOTTOM_DEPTH_FATHOMS,
SPECIES, LENGTH, WEIGHT, SEX, HAUL_OFFLOAD_DATE, HAUL_OFFLOAD,
SPECIMEN_NUMBER, AGE, MATURITY_CODE, MATURITY_DESCRIPTION, SPECIMEN_TYPE,
SPECIMEN_TYPE_DESCRIPTION, HAUL_JOIN, PORT_JOIN, YEAR, VIABILITY,
INJURY, SPECIAL_PROJECT_CODE, SAMPLE_SYSTEM, ADIPOSE_PRESENT, LANDING_REPORT_ID, HAUL_PURPOSE_CODE
FROM obsint.debriefed_age
WHERE nmfs_area between 500 and 539
AND (species=201 OR species between 221 and 229)
AND Weight > 0 AND length > 0 " ) ) )

# plots------------------------------
df_lw <- read.csv("data/LW_data.csv")
library(lubridate)
library(tidyverse)
df_lw$HAUL_OFFLOAD_DATE <- date(df_lw$HAUL_OFFLOAD_DATE )
str(df_lw)
df_lw_b <- df_lw %>% filter(LENGTH>0,WEIGHT>0,SPECIES==201) %>% transmute(year=year(HAUL_OFFLOAD_DATE),
                                                                          week=week(HAUL_OFFLOAD_DATE),
                                                                          date=date(HAUL_OFFLOAD_DATE),
                                                                          seas=ifelse(week>24,"B","A"),
                                                                          lat=(LATDD_START+LATDD_END)/2,
                                                                        lon=(LONDD_START+LONDD_END)/2,
                                                                        sex=SEX,age=AGE,length=LENGTH,
                                                                        wt=WEIGHT)
  #

head(df_lw_b)
library(ggthemes)
p_lw <- df_lw_b %>%  filter(year>2000,length>29,length<66) %>% group_by(seas,length) %>%  summarise(avg_wt=1000*mean(wt)) %>%
  ggplot(aes(x=length,y=avg_wt,color=seas,group=seas)) + geom_line() + theme_few() #+ facet_grid(.~seas)
write.csv(p_lw$data,"lw.csv")
p_lw
?write.csv
unique(df_lw)
unique(df_lw$GEAR)
df_lw1 <- df_lw %>% filter(SPECIES==201)

df_lw1 %>% filter(GEAR==1) %>% group_by(YEAR) %>% tally() %>%
  ggplot(aes(x=YEAR,y=n))

df_lw1 %>% group_by(GEAR) %>% tally()
df_lw %>% group_by(SPECIES) %>% tally()
df_lw %>% filter(SPECIES==221) %>% group_by(YEAR) %>% tally() %>%
   ggplot(aes(y=n,x=YEAR)) + geom_line() + theme_few()

df_lw %>% filter(SPECIES==221) %>% mutate(Year=as.factor(YEAR) ) %>%
   ggplot(aes(y=WEIGHT,x=LENGTH,color=Year)) + geom_point() + theme_few()

# Save LW file ------------

#fn_Write_Data()

