# Top -----------------------------------------------------------------------------
# Title:                      BSAI pollock fisheries otolith selector
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

# SQL queries -----------------------------------
# first go get all the species encountered in obsint.debriefed_spcomp, and assign them to a group.
# NOTE: this list accounts for all species encountered in Pollock Fishery up through 7/22/2020, and groups those.
# In the future, if new species are encountered in the pollock fishery, they will need to be added to this list to be assigned to a group.
# CAUTION: this one will take 2-4 minutes to execute on VPN!!!

# first get from the "DEBRIEFED" tables, for all data prior to the current year.
df_age <- ( dbGetQuery(channel, paste0("SELECT  BARCODE,
T_TABLE,
CRUISE,
PERMIT,
VESSEL,
GEAR,
NMFS_AREA,
LATDD_START,
LONDD_START,
LATDD_END,
LONDD_END,
LENGTH_SEQ,
PERFORMANCE,
FISHING_DEPTH_FATHOMS,
BOTTOM_DEPTH_FATHOMS,
LENGTH,
WEIGHT,
SPECIES,
SEX,
HAUL_OFFLOAD_DATE,
HAUL_OFFLOAD,
SPECIMEN_NUMBER,
AGE,
MATURITY_CODE,
MATURITY_DESCRIPTION,
SPECIMEN_TYPE,
SPECIMEN_TYPE_DESCRIPTION,
HAUL_JOIN,
PORT_JOIN,
YEAR,
VIABILITY,
INJURY,
SPECIAL_PROJECT_CODE,
SAMPLE_SYSTEM,
ADIPOSE_PRESENT,
LANDING_REPORT_ID,
HAUL_PURPOSE_CODE
FROM obsint.debriefed_age
WHERE nmfs_area between 500 and 539
AND species = 201
AND gear = 2
AND year = ",year ) ) )
df_age <- df_age %>% filter(SPECIES==201)

write.csv(df_age,"EBS_Pollock_age_2020.csv",row.names=FALSE)
df_age_oto <- df_age %>% filter(SPECIMEN_TYPE_DESCRIPTION=="Otoliths") %>%
  arrange(HAUL_OFFLOAD_DATE) #%>% sample_n(3000)
write.csv(df_age_oto,"EBS_Pollock_age_2020_otoliths.csv",row.names=FALSE)

df_age_oto %>% group_by(month=month(HAUL_OFFLOAD_DATE)) %>% tally()
# How many in B-season
df_age_oto %>% filter(month(HAUL_OFFLOAD_DATE)>5) %>% tally()

df_age_oto_b <- df_age_oto %>% filter(month(HAUL_OFFLOAD_DATE)>5) %>% sample_n(1700)
dim(df_age_oto_b)
# Note in 2020 the A-season request was done separately outside of R
df_age_oto_b %>% filter(month(HAUL_OFFLOAD_DATE)>5) %>%
  group_by(week=week(HAUL_OFFLOAD_DATE),
           area=as.factor(ifelse(NMFS_AREA>519,"NW","SE"))) %>%  tally() %>%
  ggplot(aes(x=week,y=n,color=area)) + geom_line(size=3) + theme_few()
write.csv(df_age_oto_b,"EBS_Pollock_B_Season.csv",row.names=FALSE)

#
# Make summary table by species and date -------------------
#

df_sum_spp_by_year <-
  df_haul_species %>%
  group_by(SPECIES_GROUP,
           YEAR) %>%
  summarize(TOTAL_CATCH_KG  = sum(OFFICIAL_TOTAL_CATCH)*1000,
            TOTAL_SPP_WT = sum(EXTRAPOLATED_WEIGHT)
  ) %>%
  mutate(PROP_SPP = TOTAL_SPP_WT/(TOTAL_CATCH_KG))


# wt-len-----------------------------
df_lw <- ( dbGetQuery(channel, paste("SELECT
T_TABLE,
CRUISE,
PERMIT,
VESSEL,
GEAR,
NMFS_AREA,
LATDD_START,
LONDD_START,
LATDD_END,
LONDD_END,
LENGTH_SEQ,
PERFORMANCE,
FISHING_DEPTH_FATHOMS,
BOTTOM_DEPTH_FATHOMS,
SPECIES,
LENGTH,
WEIGHT,
SEX,
HAUL_OFFLOAD_DATE,
HAUL_OFFLOAD,
SPECIMEN_NUMBER,
AGE,
MATURITY_CODE,
MATURITY_DESCRIPTION,
SPECIMEN_TYPE,
SPECIMEN_TYPE_DESCRIPTION,
HAUL_JOIN,
PORT_JOIN,
YEAR,
VIABILITY,
INJURY,
SPECIAL_PROJECT_CODE,
SAMPLE_SYSTEM,
ADIPOSE_PRESENT,
LANDING_REPORT_ID,
HAUL_PURPOSE_CODE
FROM obsint.debriefed_age
WHERE nmfs_area between 500 and 539
AND (species=201 OR species between 221 and 229)
AND Weight > 0
AND length > 0 " ) ) )

# plots------------------------------
df_lw %>% group_by(SPECIES) %>% tally()
df_lw %>% filter(SPECIES==221) %>% group_by(YEAR) %>% tally() %>%
   ggplot(aes(y=n,x=YEAR)) + geom_line() + theme_few()

df_lw %>% filter(SPECIES==221) %>% mutate(Year=as.factor(YEAR) ) %>%
   ggplot(aes(y=WEIGHT,x=LENGTH,color=Year)) + geom_point() + theme_few()

# Save LW file ------------

Write_Data <- function(dat=df_lw,file="LW_data.csv") {
  cat(paste(file,Sys.time(),'\n'), file="TimeStamps.dat", append=TRUE)
  write.csv(dat,row.names=FALSE,file=file) }
#Write_Data()

# Inseason status ---------
# extract data ---------
df_inseas  <- ( dbGetQuery(channel, paste("SELECT
h.vessel, h.haul, h.cruise , h.haul_date,
(h.latdd_end+h.latdd_start)/2 lat,
(h.londd_end+h.londd_start)/2 lon,
h.vessel_type                 ,
   60*(h.retrieval_date- h.deployment_date) dur,
h.fishing_depth_fathoms,
h.BOTTOM_DEPTH_fathoms,
h.official_total_catch ,
sum(decode(x.species,201,x.extrapolated_weight) ) pollwt,
sum(decode(x.species,201,x.extrapolated_number) ) pollno,
sum(decode(x.species,203,x.extrapolated_weight) ) sablwt,
sum(decode(x.species,203,x.extrapolated_number) ) sablno,
sum(decode(x.species,611,x.extrapolated_weight) ) herrwt,
sum(decode(x.species,611,x.extrapolated_number) ) herrno,
sum(decode(x.species,222,x.extrapolated_number) ) chin,
sum(decode(x.species,221, x.extrapolated_number, 223 , x.extrapolated_number ,224 , x.extrapolated_number ,225 ,
           x.extrapolated_number ,226 , x.extrapolated_number ,227 , x.extrapolated_number ,228 ,
           x.extrapolated_number ,229 , x.extrapolated_number) ) chum,
h.deployment_date,
h.deployment_latitude         ,
h.deployment_longitude_converted        ,
h.cdq_code                    ,
h.nmfs_area                   ,
h.PERFORMANCE
from current_haul  h, current_spcomp  x
where
  h.haul_join=x.haul_join and
  (x.species = 201 or x.species=203 or x.species=611 or
  x.species between 221 and 229) and
  h.gear_type = 2 and h.year >= 2010 and
  h.nmfs_area between 500 and 539
group by h.vessel, h.cruise, h.haul,
   h.haul_date,
(h.latdd_end+h.latdd_start)/2 ,
(h.londd_end+h.londd_start)/2 ,
   h.vessel_type                ,
   h.retrieval_date,
   h.deployment_date,
   fishing_depth_fathoms,
   bottom_depth_fathoms,
   h.official_total_catch        ,
   h.deployment_date,
   h.deployment_latitude         ,
   h.deployment_longitude_converted        ,
   h.cdq_code                    ,
   h.nmfs_area                   ,
   h.PERFORMANCE ;" ) ) )

df_inseas <- df_inseas %>% mutate(year=year(HAUL_DATE))
## write csv...---------
Write_Data(dat=df_inseas,file="inseas21.csv")

## Sablefish herring...---------
df_inseas %>% filter(month(HAUL_DATE)<3) %>% group_by(year) %>% summarise(herring=sum(HERRWT,na.rm=T)/1000,sable=sum(SABLWT,na.rm=T)/1000,pollock=sum(POLLWT,na.rm=TRUE)/1000)

df_inseas %>% filter(year>=2015,month(HAUL_DATE)<3) %>% group_by(year=as.factor(year),week=week(HAUL_DATE)) %>%
   summarise(herring=sum(HERRWT),CPUE=herring/sum(DUR)) %>%
   ggplot(aes(x=week,y=CPUE,color=year)) + geom_point(size=3) + theme_few() #+ ylim(c(0,40))

## CPUE -----------------------
df_inseas %>% filter(year>=2015,month(HAUL_DATE)<3) %>% group_by(year=as.factor(year),week=week(HAUL_DATE)) %>% summarise(poll=sum(POLLWT)/1000,CPUE=poll/sum(DUR)) %>%
   ggplot(aes(x=week,y=CPUE,color=year)) + geom_line(size=3) + theme_few() + ylim(c(0,40))

df_inseas %>% filter(year>=2015,month(HAUL_DATE)<3) %>% group_by(year=as.factor(year),week=week(HAUL_DATE)) %>%
   summarise(poll=sum(POLLWT)/1000,Effort=sum(DUR)) %>%
   ggplot(aes(x=week,y=Effort,color=year)) + geom_line(size=3) + theme_few() #+ ylim(c(0,40))

   summarise(herring=sum(HERRWT,na.rm=T)/1000,sable=sum(SABLWT,na.rm=T)/1000,pollock=sum(POLLWT,na.rm=TRUE)/1000)

## Mean weight...---------
df_inseas %>% filter(year>=2015,POLLNO>0,month(HAUL_DATE)<3) %>% group_by(year=as.factor(year),week=week(HAUL_DATE)) %>%
   summarise(poll=sum(POLLWT),Mean_Wt=poll/sum(POLLNO)) %>%
   ggplot(aes(x=week,y=Mean_Wt,color=year)) + geom_line(size=3) + theme_few(base_size=24)


## Mean Lat...---------
df_inseas %>% filter(year>=2011,month(HAUL_DATE)<3) %>% group_by(year=as.factor(year),week=week(HAUL_DATE)) %>%
   summarise(poll=sum(POLLWT),Mean_Lat=mean(LAT)) %>%
   ggplot(aes(x=week,y=Mean_Lat,color=year)) + geom_line(size=3) + theme_few(base_size=24)



