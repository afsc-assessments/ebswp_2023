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

# Choose input date parameters ------------------
year <- 2020

# SQL queries -----------------------------------
# first go get all the species encountered in obsint.debriefed_spcomp, and assign them to a group.
# NOTE: this list accounts for all species encountered in Pollock Fishery up through 7/22/2020, and groups those.
# In the future, if new species are encountered in the pollock fishery, they will need to be added to this list to be assigned to a group.
# CAUTION: this one will take 2-4 minutes to execute on VPN!!!

# first get from the "DEBRIEFED" tables, for all data prior to the current year.
year=2020
df_age <- ( dbGetQuery(channel, paste0("SELECT  BARCODE,
T_TABLE, CRUISE, PERMIT, VESSEL, GEAR, NMFS_AREA, LATDD_START,
LONDD_START, LATDD_END, LONDD_END, LENGTH_SEQ, PERFORMANCE, FISHING_DEPTH_FATHOMS,
BOTTOM_DEPTH_FATHOMS, LENGTH, WEIGHT, SPECIES, SEX, HAUL_OFFLOAD_DATE, HAUL_OFFLOAD,
SPECIMEN_NUMBER, AGE, MATURITY_CODE, MATURITY_DESCRIPTION, SPECIMEN_TYPE, SPECIMEN_TYPE_DESCRIPTION,
HAUL_JOIN, PORT_JOIN, YEAR, VIABILITY, INJURY, SPECIAL_PROJECT_CODE, SAMPLE_SYSTEM, ADIPOSE_PRESENT, LANDING_REPORT_ID, HAUL_PURPOSE_CODE FROM obsint.debriefed_age
WHERE nmfs_area between 500 and 539
AND species = 201 AND gear = 2 AND year = ",year ) ) )
df_age <- df_age %>% filter(SPECIES==201)
fn_Write_Data(dat=df_age,file="data/age2020.csv")
#write.csv(df_age,"EBS_Pollock_age_2020.csv",row.names=FALSE)
df_age_oto <- df_age %>% filter(SPECIMEN_TYPE_DESCRIPTION=="Otoliths") %>%
  arrange(HAUL_OFFLOAD_DATE) #%>% sample_n(3000)

fn_Write_Data(dat=df_age_oto,file="data/age2020_otoliths.csv")
#write.csv(df_age_oto,"EBS_Pollock_age_2020_otoliths.csv",row.names=FALSE)

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

