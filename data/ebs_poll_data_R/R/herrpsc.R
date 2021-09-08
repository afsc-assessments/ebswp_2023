library(tidyverse)
library(ggplot2)
library(ggthemes)
library(lubridate)

hdf <- read_csv("herrpsc.csv")

thdf <- hdf %>% filter(FMP_SUBAREA=="BS") %>% transmute(Year=YEAR,date=dmy(WEEK_END_DATE),
                                                              Area    = REPORTING_AREA_CODE ,
                                                              seas    = ifelse(month(date)>5,"B","A"),
                                                              gear    = FMP_GEAR          ,
                                                              target  = TRIP_TARGET_NAME  ,
                                                              catch   = PSCNQ_ESTIMATE)

thdf %>% filter(Year>999,Area<600) %>% mutate(Season=seas) %>% group_by(Year,Season) %>% summarise(catch=sum(catch),effort=n(),CPUE=(catch)/(effort)) %>% 
  ggplot(aes(x=Year,y=catch,color=Season)) +ylab("Herring PSC (t)") + geom_line(size=2) + theme_few()

thdf %>% filter(NMFS_Area<600) %>% group_by(Year,seas) %>% summarise(catch=sum(catch),effort=sum(hooks),CPUE=(catch)/(effort)) %>% 
  ggplot(aes(x=Year,y=CPUE,color=seas)) + geom_line(width=2) + theme_few()

thdf %>% filter(hooks>0) %>% group_by(Year,seas,NMFS_Area) %>% summarise(catch=sum(catch),effort=sum(hooks),CPUE=(catch)/(effort)) %>% 
  ggplot(aes(x=Year,y=catch,color=seas)) + geom_line() + theme_few() + facet