
library(tidyverse)# library(dplyr)
library(readr)
library(lubridate)
library(ggplot2)
library(ggthemes)
#install.packages("data.table") #install.packages("DT") library(data.table) library(DT)
df <- tibble(read.csv("norpac_haul_hook_count_report.csv"))
names(df)
unique(df$Gear)
df <- df %>% transmute(Year,Cruise, Haul.Date,
OTC=Official.Total.Catch..mt.,
vess=Vessel,
wt=Extrapolated.Weight..kg. )
#"Fishing.Start.Date"       "Fishing.Depth..Fathoms."   
#"Bottom.Depth..Fathoms."   "Vessel"                    "Vessel.Length..ft."       "NMFS.Area"                
#"Lat.DD.Start"              "Lon.DD.Start"             "Lat.DD.End"                "Lon.DD.End"               

dfsum <- df %>% group_by(vess) %>% summarise(poll=sum(wt),gf=sum(OTC),prop=poll*1e-3/gf)
dfsum %>% ggplot(aes(x=vess,y=prop)) + theme_few() + geom_point() 