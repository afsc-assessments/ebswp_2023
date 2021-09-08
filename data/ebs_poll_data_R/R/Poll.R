#  inseason stuff
#install.packages("lubridate")
#cat inseas_pre19.csv inseas20.csv >inseas.csv

radian
library(tidyverse)
library(dplyr)
library(readr)
library(lubridate)
library(ggplot2)
library(ggthemes)
#install.packages("data.table")
library(data.table)
#install.packages("DT")
library(DT)
.THEME <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank() )
.THEME <- .THEME + theme(text=element_text(size=18)) + theme(axis.title.x=element_text(size=24) ,axis.title.y=element_text(size=24))
#.THEME <- .THEME + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_line(colour="grey60", linetype="dashed"), panel.grid.major.y = element_blank() )
.THEME <- .THEME + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
mytheme <- .THEME
.inseasdir <- "~/OneDrive/ebswp/StockStructure/"
.inseasdir <- "~/OneDrive/"
.inseasdir <- "c:/users/jim.ianelli/OneDrive/ebswp/StockStructure/"
#inseas <- read.csv(paste0(.inseasdir,"cod.csv"),as.is = T)
#inseas <- read.csv(paste0(.inseasdir,"inseas18.csv"),as.is = T)
.inseasdir <- "~/OneDrive/ebswp/StockStructure/"
inseas <- read_csv(paste0(.inseasdir,"inseas_all.csv"),col_names=FALSE)
inseas2<- read_csv(paste0(.inseasdir,"inseas_all2020.csv"),col_names=FALSE)
#inseas2<- read.csv(paste0(.inseasdir,"inseas_all2020.csv"),as.is = T,header=FALSE)

#inseas <- read.csv("inseas.csv",as.is = T,header=T)
names(inseas)
names(inseas) <-c( "v", "haul", "cruise","mm",  "dd", "yr", "lon","lat","v_type","dur","fdepth","bdepth","otc", "pollwt","pollno", "pcodwt","pcodno", "sablwt","sablno", "atkawt","atkano", "herrwt","herrno", "chinno","chumno","date","Time","dlat","dlon","CDQ","area","xx")
names(inseas2) <-c( "v", "haul", "cruise","mm",  "dd", "yr", "lon","lat","v_type","dur","fdepth","bdepth","otc", "pollwt","pollno", "pcodwt","pcodno", "sablwt","sablno", "atkawt","atkano", "herrwt","herrno", "chinno","chumno","date","Time","dlat","dlon","CDQ","area","xx")

inseas <- inseas %>% filter(yr<2020)
inseas <- rbind(inseas,inseas2)
names(inseas)
glimpse(inseas)
inseas$dur <-as.numeric(inseas$dur)
summary(inseas$yr)
inseas$date <-   ymd(paste0(inseas$yr,"-",inseas$mm,"-",inseas$dd))
d <- inseas
d$date <- ymd(paste(d$yr,"-",d$mm,"-",d$dd,sep=""))
d$week <- week(d$date)
d$seas<-d$week>=25
d$seas[d$seas]<-"B"
d$seas[d$seas!="B"]<-"A"
glimpse(d)
tmp <- d %>% filter(!is.na(pollno), !is.na(pollwt), yr==2008) %>% group_by(week) %>%summarise(sum(otc),avgwt=sum(pollwt)/sum(pollno)) 

library(patchwork)
plot_cpue <- function( spp="poll", df=d ,bysector=FALSE,byseas=TRUE,leg=TRUE,metric="wt",poll=TRUE){
  #cpue %>% group_by(yr,sector) %>% summarise(catch=sum(catch)) %>% ggplot(aes(x=yr,y=catch,color=sector)) + geom_line()
  spname = ifelse(spp=="poll","Pollock",ifelse(spp=="herr","Herring",
           ifelse(spp=="sabl","Sablefish",ifelse(spp=="sabl","Sablefish",
           ifelse(spp=="chin","Chinook salmon","Chum")))))
  cpue <- d %>% filter(v_type<4,otc>0,pollwt/otc>800)%>% 
        mutate(sector=ifelse(v_type==1,"CV",ifelse(v_type==2,"MS","CP"))) %>% 
        group_by(yr,seas,sector) %>% 
        summarise( time=sum(dur,na.rm=T), catch=sum(get(paste0(spp,metric)),na.rm=T) ,cpue=catch/time/1000)
  if (bysector) 
    dtmp <- cpue %>% group_by(yr,seas,sector) %>% summarise(CPUE=sum(catch)/sum(time)) 
  else
    dtmp <- cpue %>% group_by(yr,seas) %>% summarise(CPUE=sum(catch)/sum(time)) 

  if (!byseas) 
    if (bysector) 
      dtmp <- cpue %>% group_by(yr,sector) %>% summarise(CPUE=sum(catch)/sum(time)) 
    else
      dtmp <- cpue %>% group_by(yr) %>% summarise(CPUE=sum(catch)/sum(time)) 

  p <- ggplot(dtmp,aes(x=yr,y=CPUE/10000,color=seas)) + expand_limits(y = 0) + 
             geom_line(size=1) + theme_few() + ylab("Nominal CPUE") + 
             xlab("Year") + ggtitle(paste(spname,"CPUE",ifelse(metric=="wt","(by weight)","(by number)")))
  if (bysector) p <- p + facet_grid(sector~.)
  if (!leg) p <- p + guides(color=FALSE)
 return(p)
}
#-----------------------------------------------------------------------------
## Duration plot
#-----------------------------------------------------------------------------
plot_dur <- function(stwk=23,endwk=35, spp="poll", df=d, 
        polltows=TRUE, metric="wt",yrs=2010:2020,title="",width=1){
  var <- paste0(spp,metric) 
  df %>% filter(week>=stwk&week<=endwk, yr %in% yrs) %>% group_by(yr,week) %>%
      summarise(dur=sum(dur,na.rm=TRUE),catch=sum(get(var)/1000,na.rm=TRUE)) %>%
      summarise(Year=as.factor(yr),cs=cumsum(catch), cd=cumsum(dur)) %>%
  ggplot(aes(x=cd,y=cs,col=Year)) + geom_line(size=width) + 
  expand_limits(y=0) + ggtitle(title) +
  theme_few() + ylab("Cumulative catch (tons)") + 
  xlab("Cumulative time fishing ")  
}
#-----------------------------------------------------------------------------
## Weight-bin plot, 
#-----------------------------------------------------------------------------
library(ggridges)
plot_wt <- function(df=d, stwk=23,endwk=45, spp="poll", 
        yrs=2015:2020,title="",width=1,binf=20,scale=3,xlim=c(100,1250)){
  varw<- paste0(spp,"wt") 
  varn<- paste0(spp,"no") 
  p <- df %>% filter(!is.na(get(varn)),week>=stwk&week<=endwk, yr %in% yrs) %>% 
      mutate(wtbin=1000*round(binf*get(varw)/get(varn))/binf ,
      Year=as.factor(yr),
      week=as.factor(week) ) %>%
      group_by(Year,week,wtbin) %>%
      summarise(freq=sum(get(varw)/1000,na.rm=TRUE)) %>% 
  ggplot(aes(x=wtbin,y=reorder(week, desc(week)),height=freq)) + 
    geom_density_ridges(stat = "identity",scale = scale, alpha = .2,
         fill="salmon",color="black") + theme_few() +
         scale_y_discrete(limits = rev(levels(week)))+
         xlim(xlim)+ ylab("Week") + 
         xlab("Size (grams)") + facet_wrap(.~Year) 
 return(p)
}
yrs=2000:2020
df=d;stwk=23;endwk=45
rm(df)
spp="poll"
binf=20;scale=3;xlim=c(100,1250);width=1
plot_wt_yr <- function(df=d, stwk=23,endwk=45, spp="poll", 
        yrs=2000:2020,title="",width=1,binf=20,scale=3,xlim=c(100,1250)){
  varw<- paste0(spp,"wt") 
  varn<- paste0(spp,"no") 
  p <- df %>% filter(!is.na(get(varn)), !is.na(get(varw)), 
      yr %in% yrs) %>% 
      filter(get(varw)/get(varn) < 4 ) %>%
      mutate(wtbin=1000*round(binf*get(varw)/get(varn))/binf ,
      Year=as.factor(yr)) %>%
      group_by(Year,seas,wtbin) %>%
      summarise(freq=sum(get(varw)/1000)) %>% 
  ggplot(aes(x=wtbin,y=reorder(Year, desc(Year)),height=freq)) + 
    geom_density_ridges(stat = "identity",scale = scale, alpha = .2,
         fill="salmon",color="black") + theme_few() +
         geom_vline(xintercept=500,color="coral",alpha=.3,size=1) +
         xlim(xlim)+ ylab("Year") + 
         xlab("Size (grams)") + facet_wrap(.~seas) 
         #scale_y_discrete(limits = rev(levels(Year)))+
 return(p)
}
plot_wt_yr(binf=50) 
 ggtitle("B-season weight-frequencies")
names(d)
plot_wt()
plot_wt(yrs=2019:2020, stwk=1,endwk=18,binf=50)
plot_wt_yr(yrs=2019:2020, binf=50)
plot_wt(yrs=2008:2009)
plot_wt(spp="herr",binf=10)
plot_wt(spp="sabl",binf=10,stwk=23,xlim=c(500,3000))
#  geom_hline(yintercept=6e5) + xlim(c(0,1.5e5)) + ylim(c(0,7.5e5))
plot_dur(df=d,spp="poll",yrs=c(2011,2016:2020),stwk=0,title="Whole year")
plot_dur(df=d,spp="herr",yrs=c(2000:2020),stwk=0,title="Whole year, herring PSC",width=.5)
plot_dur(df=d,spp="chin",yrs=c(2000:2020),stwk=0,title="Whole year, Chinook salmon PSC",width=.5,metric="no")
plot_dur(df=d,spp="chum",yrs=c(2000:2020),stwk=0,title="Whole year, Chinook salmon PSC",width=.5,metric="no")
plot_dur(df=d,spp="herr",yrs=c(2000:2020),stwk=23,endwk=45,title="B-season, herring PSC",width=.5)
plot_dur(df=d,spp="poll",yrs=c(2009:2020),endwk=45,title="B-season pollock")
plot_dur(df=d,spp="poll",yrs=c(2009:2020),stwk=0,endwk=23,title="A-season pollock")
plot_dur(df=d,spp="sabl",yrs=c(2009:2020),stwk=0,endwk=45,title="Sablefish whole year")
p1 <- plot_dur(df=d,spp="sabl",yrs=c(2011,2016:2020),stwk=0,endwk=23,title="A-season pollock")
p1
p11<- plot_cpue(bysector=F,metric="wt") ;p11
p21<- plot_cpue(df=(d%>%filter(seas="A")),bysector=F,leg=FALSE,metric="wt") 
plot_cpue(df=d2,bysector=F,leg=FALSE,metric="wt") 
names(d)
d2<- d%>%filter(seas=="A")
p2 <- plot_dur(df=d,spp="poll",yrs=c(2011,2016:2020),endwk=45,title="B-season pollock")
p3 <- p1/p11/p2;p3
p2
kkkkkkkkk
p1 <- plot_cpue(spp="herr",bysector=F,metric="wt") + theme_few(base_size=10)
p2 <- plot_cpue(spp="sabl",bysector=F,metric="wt",leg=F) + theme_few(base_size=10)
p3 <- plot_cpue(spp="chin",bysector=F,metric="no",leg=F) + theme_few(base_size=10)
p4 <- plot_cpue(spp="chum",bysector=F,metric="no",leg=F) + theme_few(base_size=10)
p5 <- plot_cpue(spp="poll",bysector=F,metric="wt",leg=F) + theme_few(base_size=10)
p6 <- p1/p2/p3/p4/p5
p6 
qq q1
p1 <- plot_cpue(bysector=F,leg=FALSE,metric="wt") /
plot_cpue(spp="sabl",bysector=F,leg=FALSE,metric="wt") /
plot_cpue(spp="herr",bysector=F,metric="wt")
p1
plot_cpue(spp="chin",bysector=TRUE,metric="no")
plot_cpue(spp="chum",bysector=FALSE,metric="no")

#-----------------------------------------------------------------------------
## Duration plot
#-----------------------------------------------------------------------------
d <- d %>% filter(v_type <=3) 
d %>% group_by(v_type) %>% summarize(sum(wt))
# d <-data.table(d) setkey(d,Year,week)

#  geom_hline(yintercept=6e5) + xlim(c(0,1.5e5)) + ylim(c(0,7.5e5))
plot_dur(df=d,spp="poll",yrs=c(2011,2016:2020),stwk=0,title="Whole year")
plot_dur(df=d,spp="herr",yrs=c(2000:2020),stwk=0,title="Whole year, herring PSC",width=.5)
plot_dur(df=d,spp="chin",yrs=c(2000:2020),stwk=0,title="Whole year, Chinook salmon PSC",width=.5,metric="no")
plot_dur(df=d,spp="herr",yrs=c(2000:2020),stwk=23,endwk=45,title="B-season, herring PSC",width=.5)
plot_dur(df=d,spp="poll",yrs=c(2011,2016:2020),endwk=45,title="B-season")
plot_dur(df=d,spp="sabl",yrs=c(2010:2020),endwk=45,title="B-season")
p1 <- plot_dur(df=d,spp="poll",yrs=c(2011,2016:2020),stwk=0,endwk=23,title="A-season pollock")
p2 <- plot_dur(df=d,spp="poll",yrs=c(2011,2016:2020),endwk=45,title="B-season pollock")
p3 <- (p1+plot_spacer())/(plot_spacer()+p2);p3


# compute Number of chinook by season
d %>% filter(!is.na(chinno),yr==2020) %>% group_by(yr,seas) %>% summarise(Chin= sum(chinno))
d %>% filter(!is.na(chinno),yr==2019) %>% group_by(yr,seas) %>% summarise(Chin= sum(chinno))
d %>% filter(!is.na(chinno),yr==2020) %>% group_by(yr,seas,v_type) %>% summarise(Chin= sum(chinno))

d %>% filter(!is.na(sablno),yr>=2000) %>% group_by(yr,seas) %>% summarise(Sablefish = sum(sablwt)) %>% pivot_wider(names_from=seas,values_from=Sablefish)

d %>% filter() %>% group_by(as.factor(yr), seas) %>% summarise(Chin= sum(chin))
d %>% filter(no>0,yr==2019) %>% group_by(v_type) %>% summarise(mwt= sum(wt)/sum(no),sum(wt)) 
d %>% filter(v_type==3,!is.na(no),yr==2019) %>% group_by(seas) %>% summarise(mwt= sum(wt)/sum(no),sum(wt)) 
d %>% filter(v_type>=2,!is.na(no),yr==2019) %>% group_by(seas) %>% summarise(mwt= sum(wt)/sum(no),sum(wt)) 
d %>% filter(!is.na(no),yr==2019) %>% group_by(yr,seas) %>% summarise(mwt = sum(wt)/sum(no),no= sum(no), mwt*no) %>%
ggplot(aes(x=yr, y=mwt,color=seas)) + geom_line() + theme_minimal()
glimpse(d)

tt <-    d %>% mutate(Longitude=lat ,Latitude=lon)  %>% filter(yr>=206,seas=="A")
title="A-season fishing locale"
# This map includes AI but collapsed over all years combined (to get target more clearly)---------
library(ggmap)
    ggmap(testmap) + geom_point(aes(x= Longitude, y=Latitude), size=.4,color="yellow" , alpha=0.03, data=tt) +
      ggtitle(title) + xlab("Longitude") +ylab("Latitude") + 
          scale_x_continuous(limits = c(-180.5, -159.0), expand = c(0, 0)) +
          scale_y_continuous(limits = c(53.00, 62.80), expand = c(0, 0)) +
      theme_bw(base_size=10) 
    ggsave(paste0("t.png"))


#d$dur <- d$dur/60
# Remove negative
  d <- filter(d,dur<40,dur>0,!is.na(dur),!is.na(wt),!is.na(v))

summary(d$dur)
summary(d$week)
d <- mutate(d, strata = ifelse(seas == "A", 1,ifelse(area > 519, 2,3)))
# EBS only
#dd <- dplyr::filter(d,nmfs_area>500,yr>=2003,yr<2009,nmfs_area<540,gear<=4) 
#dd <- filter(d,nmfs_area>500,yr>=2008,yr<2011,nmfs_area<540,gear<=4) 
dd <- filter(d,nmfs_area>500,yr>=2003,yr<2025,nmfs_area<540,gear<=4) 
# get report of chinook bycatch by year and strata ======================================

# trawl week ======================================
title="Pollock trawl effort"
eff <- dd %>% filter(gear==2) %>% group_by(yr,week) %>% summarise( time=sum(duration,na.rm=T)) 
eff <- d %>% filter(week<16)%>% group_by(yr,week) %>% summarise( time=sum(dur,na.rm=T)) eff <- d %>% filter(week<16)%>% group_by(yr,week) %>% summarise( catch=sum(wt,na.rm=T)) cpue <- d %>% filter(week<16)%>% group_by(yr,week) %>% summarise( time=sum(dur,na.rm=T), catch=sum(wt,na.rm=T) )

cpue <- d %>% group_by(yr,seas) %>% summarise( time=sum(dur,na.rm=T), catch=sum(wt,na.rm=T) )
cpue$cpue <- cpue$catch/cpue$time

title="Pollock CPUE A-Season"
cpue <- d %>% filter(v_type<4,otc>0,wt/otc>800)%>% mutate(sector=ifelse(v_type==1,"CV",ifelse(v_type==2,"MS","CP"))) %>% group_by(yr,seas,sector) %>% 
              summarise( time=sum(dur,na.rm=T), catch=sum(wt,na.rm=T) ,cpue=catch/time/1000)
cpue %>% group_by(yr,sector) %>% summarise(catch=sum(catch)) %>% ggplot(aes(x=yr,y=catch,color=sector)) + geom_line()
cpue %>% group_by(yr,seas) %>% summarise(CPUE=sum(catch)/sum(time)) %>% ggplot(aes(x=yr,y=CPUE/10000,color=seas)) + 
             geom_line(size=2) + theme_few() + ylab("Pollock nominal CPUE") + xlab("Year")

ggplot(cpue,aes(x=yr,y=cpue,color=seas,linetype=sector)) + ggtitle(title) + geom_line(size=1.2)+geom_point(size=3) + mytheme

ggplot(eff,aes(x=week,y=catch,color=as.factor(yr),linetype=as.factor(yr))) + ggtitle(title) + geom_line()+geom_point() + .THEME
ggplot(eff,aes(x=week,y=time,color=as.factor(yr),linetype=as.factor(yr))) + ggtitle(title) + geom_line()+geom_point() + mytheme
ggplot(cpue,aes(x=week,y=cpue,color=as.factor(yr),linetype=as.factor(yr))) + ggtitle(title) + geom_line()+geom_point() + mytheme


d$Year <- (d$yr)
d <- data.table(d)
d<-d[!is.na(dur),,]
d$Year <- as.factor(d$yr)
mytheme=.THEME

dd <- d %>% group_by(yr,seas) %>% transmute(w=get("dur")) %>% summarize(sum(w,na.rm=TRUE)) 
(dd %>% filter(yr>2010))
dsetwd(.inseasdir)
tt <- d[week>23&week<27&(yr==2011|yr==2013|yr>=2016),.(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur)), by=list(Year)][,-1]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("B-season catch (tons)") + xlab("B-season time fishing ") + geom_hline(yintercept=6e5) + xlim(c(0,1.5e5)) + ylim(c(0,7.5e5))
ggsave("p1.png")
tt <- d[week>23&week<31&(yr==2011|yr==2013|yr>=2016),.(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur)), by=list(Year)][,-1]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("B-season catch (tons)") + xlab("B-season time fishing ") + geom_hline(yintercept=6e5) + xlim(c(0,1.5e5))+ ylim(c(0,7.5e5))
ggsave("p2.png")

tt <- d[week>23&week<30&(yr==2011|yr==2013|yr>=2016),.(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur)), by=list(Year)][,-1]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("B-season catch (tons)") + xlab("B-season time fishing ") + geom_hline(yintercept=6e5) + xlim(c(0,1.5e5))+ ylim(c(0,7.5e5))

tt <- d[week>23&week<35&(yr==2011|yr==2013|yr>=2016),.(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur)), by=list(Year)][,-1]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("B-season catch (tons)") + xlab("B-season time fishing ") + geom_hline(yintercept=6e5) + xlim(c(0,1.5e5))+ ylim(c(0,7.5e5))
ggsave("p3.png")
library(ggthemes)
d %>% filter(week>23,week<29) %>% group_by(yr) %>% summarise(Prop_pollock=sum(wt/1000)/sum(otc)) %>%
ggplot(aes(x=yr,y=Prop_pollock)) + theme_few() + geom_line(size=2,stat="Identity") + xlab("Year") + ylab("Proportion pollock in catch, June 10-July 26")

tt <- d[week>23&(yr==2011|yr==2013|yr>=2016),.(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur)), by=list(Year)][,-1]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("B-season catch (tons)") + xlab("B-season time fishing ") + geom_hline(yintercept=6e5) + xlim(c(0,1.5e5))+ ylim(c(0,7.5e5)) +
              annotate("text", label="2018", x=1.1e5, y=7.3e5,size=8,col="grey") +
              annotate("text", label="2019", x=1.3e5, y=6.5e5,size=8,col="grey") 
ggsave("p4.png")
tt <- d[week>23&(yr>=2011|yr==2013|yr>=2016),.(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur)), by=list(Year)][,-1]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("B-season catch (tons)") + xlab("B-season time fishing ") + geom_hline(yintercept=6e5) + xlim(c(0,1.5e5))+ ylim(c(0,7.5e5)) +
              annotate("text", label="2018", x=1.1e5, y=7.3e5,size=8,col="grey") +
              annotate("text", label="2019", x=1.3e5, y=6.5e5,size=8,col="grey") 
ggsave("p5.png")
tt <- d[week>23&yr>2010, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur)), by=list(Year)][,-1]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("B-season catch (tons)") + xlab("B-season time fishing ") + geom_hline(yintercept=6e5) + xlim(c(0,1.5e5))+ ylim(c(0,7.5e5))
ggsave("p5.png")
tt <- d[week<23&yr>2010, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur)), by=list(Year)][,-1]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("A-season catch (tons)") + 
             xlab("A-season time fishing ") +
              annotate("text", label="2019", x=2.2e4, y=5.5e5,size=8,col="grey") +
              annotate("text", label="2018", x=2.75e4, y=5.1e5,size=8,col="grey") +
              annotate("text", label="2017", x=3.6e4, y=5.7e5,size=8,col="grey") 
ggsave("p6.png")
s.df <- d %>% filter(week<23) %>% group_by(yr,v) %>% summarize(catch=.001*sum(wt),eff=sum(dur) ,cpue=catch/eff) %>%  group_by(yr) %>% summarize(cpue=sum(catch)/sum(eff) ) %>% mutate(Season="A")
tmp <- d %>% filter(week>=23) %>% group_by(yr,v) %>% summarize(catch=.001*sum(wt),eff=sum(dur) ,cpue=catch/eff) %>%  group_by(yr) %>% summarize(cpue=sum(catch)/sum(eff) ) %>% mutate(Season="B")
s.df <- rbind(s.df,tmp)
s.df%>% ggplot(aes(x=yr,y=cpue,colour=Season)) + xlab("Year") + geom_line(size=2) + .THEME + ylim(c(0,20)) + ggtitle("A-Season CPUE")
ggsave("p7.png")
#-----------------------------------------------------------------------------
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("B-season catch (tons)") + xlab("B-season time fishing ") + geom_hline(yintercept=6e5) + xlim(c(0,1.5e5))
d %>% filter(week<23,yr>2010) %>%group_by(Year)%>%summarise(sum(wt/1000))
names(d)
tt
tt <- tt[,-1]
#d %>% group_by(yr) %>% summarize(catch=.001*sum(wt),eff=sum(dur) ,cpue=catch/eff) #%>%  group_by(yr) %>% summarize(cpue=sum(catch)/sum(eff) ) 
#d %>% filter(seas=="B") %>% group_by(yr) %>% summarize(catch=.001*sum(wt),eff=sum(dur) ,cpue=catch/eff) #%>%  group_by(yr) %>% summarize(cpue=sum(catch)/sum(eff) ) 
#du <- d %>% filter(seas=="A") %>% group_by(yr) %>% summarize(catch=.001*sum(wt),eff=sum(dur), med=.001*median(wt)/median(dur), mean=mean(catch)/mean(eff) ) 
#source("~/OneDrive/ebswp/EBSPollock/R/read-admb.R")
#M <- read_admb("~/OneDrive/ebswp/EBSPollock/runs/16.0/pm")
#names(M)
#db <- data.frame(yr=1964:2017,biom=rowSums(M$N*M$wt_fsh*M$sel_fsh) )
#db <- filter(db,yr>1999) %>% select(biom)
#
#df <- cbind(du,db)
#
#df <- df %>% mutate(model_biomass=biom/mean(biom),nominal_cpue=mean/mean(mean),med_cpue=med/mean(med)) %>% select(yr,model_biomass,nominal_cpue)

df.g <- gather(df,index,val,-yr)
head(df.g)
df.g %>% filter(index=="model_biomass") %>% ggplot(aes(x=yr,y=val,col=index)) + geom_line(size=2) + xlab("Year") + ylab("Relative index") + mytheme + ylim(c(0.65,1.4))
df.g %>% ggplot(aes(x=yr,y=val,col=index)) + geom_line(size=2) + xlab("Year") + ylab("Relative index") + mytheme+ ylim(c(0.65,1.45))

#annotate("text", label="2011", x=16.6e1, y=6.8e5,size=8,col="grey") + 
#annotate("text", label="2016", x=5.6e1, y=7.5e5,size=8,col="grey") + 
#annotate("text", label="2017", x=7.6e1, y=7.5e5,size=8,col="grey") 
# A season
tt <- d[week<18&yr, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur)), by=list(Year)]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + mytheme  + ylab("A-season catch (tons)") + xlab("A-season time fishing (hrs/1,000)") + geom_hline(yintercept=4e4) +
annotate("text", label="2017", x=3e1, y=5.5e3,size=8,col="grey") 
d$v <- as.factor(d$v)
summary(d$yr)

setkey(d,Year,week,v)
tt <- d[week<18&yr==2016, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur/1000)), by=list(v)]
tt <- d[week<18&yr==2017, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur/1000)), by=list(v)]

tt <- d[(week<18), .(cs=sum(wt/1000),cd=sum(dur/1000)), by=list(v,Year)][order(-cs)]
str(tt)
tt$idx<-1:length(tt$v)
ggplot(tt,aes(x=idx,y=cs,col=v)) + geom_point(size=1) + mytheme  + ylab("A-season catch (tons)") + xlab("A-season time fishing (hours)") 

ggplot(tt,aes(x=v,y=cs)) + geom_point(size=1) + mytheme  + ylab("A-season catch (tons)") + xlab("A-season time fishing (hours)") 

tt <- d[week<18, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur/1000)), by=list(v)]
ggplot(tt,aes(x=cd,y=cs,col=v)) + geom_point(size=1) + mytheme  + ylab("A-season catch (tons)") + xlab("A-season time fishing (hours)") 

ggplot(d,aes(x=v,y=dur)) + geom_boxplot() + mytheme #+ facet_wrap(~Year)

ggplot(tt,aes(x=week,y=cs,col=Year)) + geom_line(size=2) + mytheme 
ggplot(tt,aes(x=week,y=cd,col=Year)) + geom_line(size=2) + geom_point() + mytheme 

g(Year,week)][,.(Year=as.factor(Year),week,catch,hrs,cpue=catch/hrs),]   

library(DT)
dfp <- d[yr>2010,.(hrs=sum(dur),catch=sum(wt)),.(yr,week)][,.(yr=as.factor(yr),week,catch,hrs,cpue=catch/hrs),]   
names(d)
ggplot(dfp[week < 17 | week > 24,,],aes(x=hrs,y=catch,col=Year)) + geom_point(aes(size=2)) + .THEME 

dfp$Year = as.factor(dfp$yr)
#ggplot(dfp[week>20 & week < 40,,],aes(x=week,y=cpue,colour=Year,fill=Year,shape=Year)) + geom_point(aes(size=1.3)) + geom_smooth() + geom_line() + mytheme + xlab("Week of year") + ggtitle("B season")
#ggplot(dfp[week>20 & week < 40,,],aes(x=week,y=cpue,colour=Year,fill=Year,shape=Year)) + geom_smooth(se=FALSE,span=.2,aes(type=Year),size=1.3) + mytheme + xlab("Week of year") + ggtitle("B season")
ggplot(dfp[week>3  & week < 17,,],aes(x=week,y=cpue,colour=Year,fill=Year,shape=Year)) + geom_smooth(se=FALSE,span=.2,aes(type=Year),size=1.3) + mytheme + xlab("Week of year") + ggtitle("A season")
#ggplot(dfp[week>3 & week<16,,],aes(x=week,y=cpue,colour=Year,fill=Year)) + geom_point(size=1.2) + geom_smooth() + geom_line() + mytheme + xlab("Week of year")
setkey(dfp,Year,week)
dfp[, Cum.Sum := cumsum(catch), by=list(Year, week)] # cs=cumsum(catch), by=list(Year, week)]
dfp
tt <- dfp[week<18, .(week,cs=cumsum(catch),cd=cumsum(hrs)), by=list(Year)]
ggplot(tt,aes(x=week,y=cs,col=Year)) + geom_line() + mytheme 
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + mytheme  + ylab("A-season catch (tons)") + xlab("A-season time fishing (hours)") + geom_hline(yintercept=4e8) +
annotate("text", label="2016", x=5e4, y=6.6e8,size=8,col="grey") gplot(tt,aes(x=week,y=cs,col=Year)) + geom_line() + mytheme 
tt

###########
# Catch by ADFG area
# By adfg
adfg <- dd %>%  filter(gear==2) %>% 
  mutate(adfg=getADFG(lon,lat)) %>% 
  select(yr,adfg,pollwt) 
adfgm <- adfg %>%  group_by(age) %>% mutate(mwt = wt/mean(wt),mlen=len/(mean(len))) 
adfgm <- adfgm %>%  group_by(adfg) %>% summarise(Length_anomaly=median(mlen))
names(adfgm)
dim(adfgm)
(adfgm)
ak <- filter(map_data('worldHires')) #,subregion=='Alaska')
ak <- filter(map_data('world'),subregion=='Alaska'|region=="Canada")
?geom_polygon
ggplot(ak)+ geom_polygon(aes(y=lat,x=long,group=group,fill="red")) 
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
p <- ggplot(adfgm)+ geom_tile(aes(y=getLat(adfg),x=getLong(adfg),group=adfg,fill=Length_anomaly))  + 
  scale_fill_gradient2(low="red", mid="white", high="blue", midpoint=1) + mytheme  +#  coord_map("mercator") +
  scale_y_continuous(limits=c(50,63)) + scale_x_continuous(limits=c(-180,-133)) + 
  geom_tile(data=ak,aes(y=lat,x=long,stat="Identity")) + 
  ylab("Latitude") + xlab("Longitude") 
p
rm(p)

?geom_smooth

#d <- read.table("BigPull.csv",sep="|")
#names(d)<-c("vess", "haul", "cruz", "mo", "day", "yr", "lat", "lon", "gear", "vtype", "duration", "fdepth", "bdepth", 
            #"otc", "pollwt", "pollno", "pcodwt", "pcodno", "atkawt", "atkano", "nrswt", "nrsno", "yfswt", "yfsno", 
            #"phalwt", "phalno", "fhswt", "fhsno", "popwt", "popno", "chinno", "chumno", "ddate", "dlat", "dlon", "cdq", "disc", "hooks", "nmfs_area", "perf")
#
title <- "Pollock CPUE (kg/hour)"
title <- "Chinook / t of pollock "
cpu <- dd %>% filter(gear==2,week>2,week<43) %>% group_by(yr) %>% summarise( cpue=sum(pollwt,na.rm=T)/sum(duration,na.rm=T)) 
cpu <- d %>% filter(week>2,week<15) %>% group_by(week) %>% summarise( cpue=sum(wt,na.rm=T)/sum(dur,na.rm=T)) 
ggplot(cpu,aes(x=week,y=cpue)) + geom_smooth(se=T) + geom_point(size=5) + ggtitle(title) + labs(x="Week",y="CPUE")  
  #
  #
cpu <- d %>% filter(week>2,week<15) %>% group_by(week) %>% summarise( cpue=sum(chin,na.rm=T)/sum(.000001*wt,na.rm=T)) 
ggplot(cpu,aes(x=week,y=cpue)) + geom_smooth(se=T) + geom_point(size=5) + ggtitle(title) + labs(x="Week",y="CPUE") + 
  mytheme #+ scale_y_continuous(limits=c(0,3.1e4))
45*400


####################
#ADFG STAT 6 AREAS
####################

#The ADFG stat 6 area codes can be broken into multiple components
#the first 2 digits can be used to determine the longitude of the ADFG box (center, right, or left edge)
#the next 3 digits can be used to determine the latitude of the ADFG box (center, top, or bottom edge)
#the last digit describes if the box has been broken into multiple sub areas(0 for no, other value for yes)



#This function takes a vector of ADFG areas and converts the areas into lat/lon coordinates that are in the center of the box

getLatLong=function(ADFGvec){
       ADFGlong=as.numeric(substring(as.character(ADFGvec), 1,2))
       ADFGlat=as.numeric(substring(as.character(ADFGvec), 3,5))
       long=-((ADFGlong+100)+0.5)
       lat=ceiling(2*ADFGlat/10)/2+0.25
       return(cbind(long,lat))
       }

getLong=function(ADFGvec){
       ADFGlong=as.numeric(substring(as.character(ADFGvec), 1,2))
       long=-((ADFGlong+100)+0.5)
       return(long)
       }

getLat=function(ADFGvec){
       ADFGlat=as.numeric(substring(as.character(ADFGvec), 3,5))
       lat=ceiling(2*ADFGlat/10)/2+0.25
       return(lat)
       }

#an example with this function
ADFGcodes=c(695500,725430)
getLatLong(ADFGcodes)



#This function takes a vector of lats and a vector of longs (paired) and converts them into an ADFG area code
#Note that this process assigns ADFG boxes of the same size, so ADFG boxes that are broken into multiple sub areas are grouped together

getADFG=function(long,lat){
      areaLong=(-trunc(long)-100)
      areaLat1=trunc(lat)
      areaLat2=lat-trunc(lat)
      areaLat2[areaLat2<0.5]=0
      areaLat2[areaLat2>=0.5]=3
      ADFG=areaLong*10000+areaLat1*100+areaLat2*10
      return(ADFG)
      }

#an example
longs=c(-169.5,-172.5)
lats=c(55.25,54.75)
getADFG(longs,lats)



str(srv_l) 
srv_l$adfg <- getADFG(srv_l$LONGITUDE,srv_l$LATITUDE)
srv <- srv_l %>% transmute(Year=YEAR,lat=LATITUDE,long=LONGITUDE,length=LENGTH/10, sex=SEX,cpue=CPUE_LENGTH,adfg=getADFG(long,lat)) 
#--Now summarize by ADFG area...size of pollock---
srv_a <- srv %>% group_by(Year,adfg) %>% summarize(cpuewt=mean(cpue),mean=sum(cpue*length)/sum(cpue), N=n(),wt=0.008293819161*mean^3.) %>% filter(N>8)
head(srv_a)
srv_a <- srv_a%>% mutate(lng = -((as.numeric(substring(as.character(adfg),1,2))+100)+0.5), lat =  ceiling(2* as.numeric(substring(as.character(adfg), 3,5))/10)/2+0.25)


library(ggmap)
register_google(key="AIzaSyCQu3tASptLB1EFx3E8BXPc2cMDNFL5FCw")
testmap <- get_googlemap(center=c(lon=-178,lat=57) ,color="bw", maptype='satellite' ,zoom=4.0) #, xlim=c(-190,-130), ylim=c(51,63)) # set up mapframe

tt <-    srv_a %>% mutate(Longitude=lng ,Latitude=lat)  %>% filter(Year>=2016,mean>30,wt<1200)
title="Survey mean length"

# This map includes AI but collapsed over all years combined (to get target more clearly)---------
    ggmap(testmap) + geom_point(aes(x= Longitude, y=Latitude, size=cpuewt,color=wt ), alpha=0.32, data=tt) +
      ggtitle(title) + xlab("Longitude") +ylab("Latitude") + 
          scale_x_continuous(limits = c(-180.5, -159.0), expand = c(0, 0)) +
          scale_y_continuous(limits = c(53.00, 62.80), expand = c(0, 0)) +
      theme_bw(base_size=10) +  facet_wrap(Year~.)#+ scale_size(name = "Catch (num)", range = c(1,7)) #+ scale_color_continuous(low="yellow",high = "red")
kk    ggsave(paste0("t.png"))

      scale_x_continuous(limits = c(-190.5, -161.0), expand = c(0, 0)) +
      scale_y_continuous(limits = c(50.50, 61.20), expand = c(0, 0)) +
