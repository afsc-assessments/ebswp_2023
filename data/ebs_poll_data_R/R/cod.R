#  inseason stuff
#install.packages("lubridate")
R
library(tidyverse)
library(lubridate)
library(ggplot2)
#install.packages("data.table")
library(data.table)
library(DT)
.THEME <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank() )
.THEME <- .THEME + theme(text=element_text(size=12)) + theme(axis.title.x=element_text(size=14) ,axis.title.y=element_text(size=14))
#.THEME <- .THEME + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_line(colour="grey60", linetype="dashed"), panel.grid.major.y = element_blank() )
.THEME <- .THEME + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
mytheme <- .THEME
.OVERLAY <- TRUE
 getwd()
setwd("..")
.inseasdir <- "c:/users/jim.ianelli.nmfs/OneDrive/ebswp/StockStructure/"
inseas <- read.csv(paste0(.inseasdir,"cod.csv"),as.is = T,header=F)
names(inseas) <-c( "v", "haul", "cruise","mm",  "dd", "yr", "lon","lat","v_type","dur","fdepth","bdepth","otc","wt","no","chin","chum","date","Time","dlat","dlon","gear_type","area","nhooks")
inseas$dur <-as.numeric(inseas$dur)
inseas$nhooks <-as.numeric(inseas$nhooks)
inseas <- data.frame(inseas)
names(inseas)
str(inseas)

inseas$date <-   ymd(paste0(inseas$yr,"-",inseas$mm,"-",inseas$dd))
inseas$week <- week(inseas$date)
inseas$seas<-inseas$week>=25
inseas$seas[inseas$seas]<-"B"
inseas$seas[inseas$seas!="B"]<-"A"
inseas <- data.table(inseas)
inseas$Year <- as.factor(inseas$yr)

d <- inseas
# Remove negative
d <- data.table(filter(inseas,(wt/otc)>100,dur<40,dur>0,!is.na(dur),!is.na(wt),!is.na(v),gear_type<4,week<20))
# A season trawl
tt <- d[yr>2015, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur/1000)), by=list(Year)]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + mytheme  + ylab("A-season catch (tons)") + xlab("A-season time fishing (hrs/1,000)") + geom_hline(yintercept=2e4) +
annotate("text", label="2018", x=2.5e1, y=1.0e4,size=8,col="grey") 
# A season longline
# 
d <- inseas
d <- data.table(filter(d,(wt/otc)>500,nhooks>0,!is.na(nhooks),!is.na(wt),!is.na(v),gear_type==8,week<20))
tt <- d[yr>2015, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(nhooks/1000)), by=list(Year)]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + mytheme  + ylab("A-season catch (tons)") + xlab("A-season number of hooks") + geom_hline(yintercept=4e4) +
annotate("text", label="2018", x=1.5e4, y=1.4e4,size=8,col="grey") 
ggplot(d,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + mytheme  + ylab("A-season catch (tons)") + xlab("A-season number of hooks") + geom_hline(yintercept=4e4) 
  

d <- inseas
d <- data.table(filter(d,wt/otc>500,otc>0,wt>0,!is.na(otc),!is.na(wt)))
                
plot(density(d$wt/d$otc))


d$v <- as.factor(d$v)
summary(d$yr)
#1	P	Non Pelagic Trawl
#2	P	Pelagic Trawl
#3	O	Trawl Gear
#4	H	Pair Trawl
#6	O	Pot Gear
#7	P	Jig
#8	O	Longline Gear
# EBS only
#dd <- dplyr::filter(d,nmfs_area>500,yr>=2003,yr<2009,nmfs_area<540,gear<=4) 
#dd <- filter(d,nmfs_area>500,yr>=2008,yr<2011,nmfs_area<540,gear<=4) 
#dd <- filter(d,nmfs_area>500,yr>=2003,yr<2015,nmfs_area<540,gear<=4) 

# trawl week ======================================
title="Pollock trawl effort"
eff <- dd %>% filter(gear==2) %>% group_by(yr,week) %>% summarise( time=sum(duration,na.rm=T)) 
eff <- d %>% filter(week<16)%>% group_by(yr,week) %>% summarise( time=sum(dur,na.rm=T)) 
eff <- d %>% filter(week<16)%>% group_by(yr,week) %>% summarise( catch=sum(wt,na.rm=T)) 
cpue <- d %>% filter(week<16)%>% group_by(yr,week) %>% summarise( time=sum(dur,na.rm=T), catch=sum(wt,na.rm=T) )
cpue$cpue <- cpue$catch/eff$time
ggplot(eff,aes(x=week,y=catch,color=as.factor(yr),linetype=as.factor(yr))) + ggtitle(title) + geom_line()+geom_point() + .THEME
ggplot(eff,aes(x=week,y=time,color=as.factor(yr),linetype=as.factor(yr))) + ggtitle(title) + geom_line()+geom_point() + mytheme
ggplot(cpue,aes(x=week,y=cpue,color=as.factor(yr),linetype=as.factor(yr))) + ggtitle(title) + geom_line()+geom_point() + mytheme


d

mytheme=.THEME
## Duration plot
names(d)
d %>% filter(v_type <=3) 
%>% group_by(v_type) %>% summarize(sum(wt))

mutate(percent=d$wt/d$otc) %>% ggplot(aes(percent)) + geom_hist() + mytheme + xlim(c(900,1100))

?geom_density
setkey(d,Year,week)
names(d)
d %>% group_by(yr,v) %>% summarize(catch=.001*sum(wt),eff=sum(dur) ,cpue=catch/eff) %>%  group_by(yr) %>% summarize(cpue=sum(catch)/sum(eff) ) 
d %>% group_by(yr) %>% summarize(catch=.001*sum(wt),eff=sum(dur) ,cpue=catch/eff) #%>%  group_by(yr) %>% summarize(cpue=sum(catch)/sum(eff) ) 
d %>% filter(seas=="B") %>% group_by(yr) %>% summarize(catch=.001*sum(wt),eff=sum(dur) ,cpue=catch/eff) #%>%  group_by(yr) %>% summarize(cpue=sum(catch)/sum(eff) ) 
du <- d %>% filter(seas=="A") %>% group_by(yr) %>% summarize(catch=.001*sum(wt),eff=sum(dur), med=.001*median(wt)/median(dur), mean=mean(catch)/mean(eff) ) 
source("~/OneDrive/ebswp/EBSPollock/R/read-admb.R")
M <- read_admb("~/OneDrive/ebswp/EBSPollock/runs/16.0/pm")
names(M)
db <- data.frame(yr=1964:2017,biom=rowSums(M$N*M$wt_fsh*M$sel_fsh) )
db <- filter(db,yr>1999) %>% select(biom)

df <- cbind(du,db)

df <- df %>% mutate(model_biomass=biom/mean(biom),nominal_cpue=mean/mean(mean),med_cpue=med/mean(med)) %>% select(yr,model_biomass,nominal_cpue)

df.g <- gather(df,index,val,-yr)
head(df.g)
df.g %>% filter(index=="model_biomass") %>% ggplot(aes(x=yr,y=val,col=index)) + geom_line(size=2) + xlab("Year") + ylab("Relative index") + mytheme + ylim(c(0.65,1.4))
df.g %>% ggplot(aes(x=yr,y=val,col=index)) + geom_line(size=2) + xlab("Year") + ylab("Relative index") + mytheme+ ylim(c(0.65,1.45))

+ geom_line() + mytheme
tt <- d[week<20&yr, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur/1000)), by=list(Year)]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + .THEME  + ylab("B-season catch (tons)") + xlab("B-season time fishing (hours)") + geom_hline(yintercept=6e5) +
annotate("text", label="2011", x=16.6e1, y=6.8e5,size=8,col="grey") + 
annotate("text", label="2016", x=5.6e1, y=7.5e5,size=8,col="grey") + 
annotate("text", label="2017", x=7.6e1, y=7.5e5,size=8,col="grey") 
# A season
tt <- d[gear<4,week<18&yr, .(week,Year,cs=cumsum(wt/1000),cd=cumsum(dur/1000)), by=list(Year)]
ggplot(tt,aes(x=cd,y=cs,col=Year)) + geom_line(size=2) + mytheme  + ylab("A-season catch (tons)") + xlab("A-season time fishing (hrs/1,000)") + geom_hline(yintercept=4e4) +
annotate("text", label="2017", x=2e1, y=2.5e3,size=8,col="grey") 
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
ddfg <- dd %>%  filter(gear==2) %>% 
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
ggplot(cpu,aes(x=week,y=cpue)) + geom_smooth(se=T) + geom_point(size=5) + ggtitle(title) + labs(x="Week",y="CPUE") + 
  #
  #
cpu <- d %>% filter(week>2,week<15) %>% group_by(week) %>% summarise( cpue=sum(chin,na.rm=T)/sum(.000001*wt,na.rm=T)) 
ggplot(cpu,aes(x=week,y=cpue)) + geom_smooth(se=T) + geom_point(size=5) + ggtitle(title) + labs(x="Week",y="CPUE") + 
  mytheme #+ scale_y_continuous(limits=c(0,3.1e4))
45*400


