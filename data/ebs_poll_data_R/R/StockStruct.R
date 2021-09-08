library(tidyr)
library(maps)
library(mapproj)
library(mapdata)
library(dplyr)
library(ggplot2)
library(lubridate)
library(ggmap)
source("~/Downloads/ADFGareas.R")
mytheme <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(), panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
mytheme <- mytheme + theme(text=element_text(size=18)) + theme(axis.title.x=element_text(size=24) ,axis.title.y=element_text(size=24))
mytheme <- mytheme + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(), panel.grid.major.y = element_line(colour="grey60", linetype="dashed"))
mytheme <- mytheme + theme(panel.background = element_rect(fill="white"),panel.border = element_rect(size=2))
mytheme <- mytheme + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
ad <- read.csv("poll_age_surv.csv")
ld <- read.csv("poll_lf_surv.csv")
rd <- read.table("age1_rec.dat",header=T)
sd <- read.table("ssb.dat",header=T)
##################
#Recruitment figure
rdf <- filter(rd,yr>1977) %>% group_by(area) %>% mutate(nrec=(rec-mean(rec))/sd(rec)) 
,c("AI","EBS","GOA"))
  ggplot(rdf,color=area) + geom_point(aes(x=nrec ,y=nrec,colour=area )) +mytheme
bsrdf <- filter(rdf,area=="EBS") %>% select(yr,EBS=nrec,-rec,-area)
bsrdf
gordf <- filter(rdf,area=="GOA") %>% select(yr,GOA=nrec)
left_join(bsrdf,gordf,by="yr") %>% select(yr,goa=nrec.y)
dd <- left_join(bsrdf,gordf,by="yr") #%>% select(yr,goa=nrec.y)
dd
dplyr::select(dd,area.x,yr)

plot(log(bsrdf$rec),log(gordf$rec))
length(bsrdf$rec)
length(gordf$rec)

?acf
plot(rd)
  ggplot(rdf,aes(x=rec,y=nrec,fill=area)) +

  ggplot(rdf,aes(x=as.factor(yr),y=nrec,fill=area)) +
  xlab("Year") + ylab("Age 1 recruitment anomaly") + mytheme +
theme(axis.text.x = element_text(angle=90, hjust=1)) +
  geom_bar(stat="Identity",position="dodge") 
##################
# SSB
sdf <- filter(sd,yr>1977) %>% group_by(area) %>% mutate(nssb=(ssb-mean(ssb))/sd(ssb)) 
ggplot(sdf,aes(x=yr,y=nssb,linetype=area,colour=area)) + xlab("Year") + 
  ylab("Relative spawning biomass") + mytheme + geom_line(size=1.5)

##################
# Select and summarize length frequency data
head(ld)
ldf <- ld %>%  filter(haul_type==3,yr>1981,len<=80,len>0,area!="HBS",area!="HG",area!="WC") %>% 
  mutate( lat=((beg_lat+end_lat)/2) , lon=((beg_lon+end_lon)/2)) %>%
  select(yr,area,freq,lat,lon,len,haul_type,gear_temp) 
names(ldf)
tbl_df(ld)
ldfa <- ldf %>% group_by(area) %>% summarise( n=sum(freq)) #%>% spread(area,n) 
ldfay <- ldf %>% group_by(area,yr) %>% summarise( n=sum(freq)) #%>% spread(area,n) 
ldfal <- ldf %>% group_by(area,len) %>% summarise( n=sum(freq)) #%>% spread(area,n) 
head(ld)
ldfa
ldfay
write.csv(file="SizeCompSampleSize.csv",spread(ldfay,area,n))
write.csv(file="SizeCompSampleSize.csv",
          spread(ldfa,area,n)
ldfal
# Total frequencies measured in survey
ggplot(ldfal,aes(x=len,y=n,fill=area)) + 
  geom_bar(position="stack",stat="identity") + xlab("Length (cm)") + ylab("Frequency") +
  facet_wrap(~ area,nrow=3,scale="free") + mytheme

p
# By latitude frequencies measured in survey
ldft  <- ldf %>%   mutate(lat=trunc(lat)) %>% select(yr,lat,area,len,freq,haul_type,gear_temp) 
ldftgo <- ldft %>% filter(area=="GOA",lat<64) %>% group_by(lat) #%>% mutate(mlen=sum(len*freq)/(sum(freq))) 
ldftbs <- ldft %>% filter(area=="BS",lat<64) %>% group_by(lat) #%>% mutate(mlen=sum(len*freq)/(sum(freq))) 
p <- ggplot(ldftbs,aes(x=as.factor(lat),y=len))+  
  scale_y_continuous(limits=c(0,70)) + xlab("Latitude") + ylab("Pollock length (cm)") + mytheme +
   geom_violin(width=1.8,aes(fill=area),alpha=.2,outlier.size=.2,notch=T,notch.width=.5,colour="brown")  #+geom_vline(xintercept=(1.5:9.5),colour="grey",linetype="solid",linewidth=2) 
p <- p + coord_flip() + guides(fill=F)
p

?alpha
#a Select and summarize age data
adf <- ad %>%  filter(haul_type==3,yr>1981,age<=25,age>0,!is.na(age),!is.na(gear_temp),area!="HBS",area!="HG") %>%  mutate( lat=((beg_lat+end_lat)/2) , lon=((beg_lon+end_lon)/2)) %>%
  select(yr,lat,lon,area,age,wt,len,haul_type,gear_temp) 
  select(yr,area,age,len,wt,haul_type,gear_temp) 
adfa <- adf %>% group_by(age,area) %>% summarise( n=length(len)) %>% spread(area,n) 
adfs <- adf %>% group_by(yr,area) %>% summarise( n=length(len)) %>% spread(area,n) %>% arrange(yr)
adfs

#########################
# Compute some normalized mean weights
adft <- adf %>%  na.omit() %>%   group_by(age,area) %>% mutate(mwt = wt/mean(wt),mlen=len/(mean(len)))
p <- adft %>%  na.omit() %>% ggplot(aes(x=as.factor(yr),y=mwt)) + facet_wrap(~ area,nrow=3) +
  scale_y_continuous(limits=c(0.3,2)) + xlab("Year") + ylab("Pollock body mass anomaly") +
   geom_boxplot(aes(fill=area),outlier.size=.2) + geom_hline(yintercept=1) + mytheme
p
ggsave("wt_age_anom.png")
#########################

adft <- adf %>%  group_by(age,area) %>% mutate(mwt = wt/mean(wt),mlen=len/(mean(len)))
p <- ggplot(adft,aes(x=as.factor(yr),y=mlen))+  facet_wrap(~ area,nrow=3) + scale_x_discrete(breaks=c(seq(1982,2014,2))) +
  scale_y_continuous(limits=c(0.6,1.4)) + xlab("Year") + ylab("Pollock length anomaly") +
   geom_boxplot(aes(fill=area),outlier.size=.2) + geom_hline(yintercept=1) + mytheme
p
#########################
names(ad)

# By adfg
adfg <- ad %>%  filter(haul_type==3,yr>1981,age<=25,age>0,!is.na(age),!is.na(gear_temp)) %>% 
  mutate(long=(beg_lon+end_lon)/2,lat=((beg_lat+end_lat)/2),adfg=getADFG(long,lat)) %>% 
  select(yr,adfg,area,age,len,wt,haul_type,gear_temp) 
adfgm <- adfg %>%  group_by(age) %>% mutate(mwt = wt/mean(wt),mlen=len/(mean(len))) 
adfgm <- adfgm %>%  group_by(adfg) %>% summarise(Length_anomaly=median(mlen))
names(adfgm)
dim(adfgm)
(adfgm)

# By latitude
adf <- ad %>%  filter(haul_type==3,yr>1981,age<=25,age>0,!is.na(age),!is.na(gear_temp),area=="BS"|area=="GOA") %>% 
  mutate(lat=trunc((beg_lat+end_lat)/2)) %>% select(yr,lat,area,age,len,wt,haul_type,gear_temp) 
adftbs <- adf %>%  group_by(age) %>% mutate(mwt = wt/mean(wt),mlen=len/(mean(len))) 
adftbs
p <- ggplot(adftbs,aes(x=as.factor(lat),y=mlen))+  
  scale_y_continuous(limits=c(0.8,1.2)) + xlab("Latitude") + ylab("Pollock length anomaly") + mytheme + geom_hline(yintercept=1) +
   geom_boxplot(width=.6,aes(fill=area),outlier.size=.2,notch=T,notch.width=.5,colour="brown")  #+geom_vline(xintercept=(1.5:9.5),colour="grey",linetype="solid",linewidth=2) 
p <- p + coord_flip()
p # + ggtitle("Weight-at-Age (grams)")  + mytheme
dim(adftbs)
# Check data used...
write.csv(adftbs,"bs_agelen.csv")

## Growth patterns by region 
adf <- ad %>%  filter(haul_type==3,yr>1981,age<=10,age>0,!is.na(age),!is.na(gear_temp),area!="HBS",area!="HG") %>% 
  select(yr,area,age,len,wt,haul_type,gear_temp) 
names(adf)
mytheme <- mytheme + theme(text=element_text(size=28)) + theme(axis.title.x=element_text(size=32) ,axis.title.y=element_text(size=32))
p <- ggplot(adf,aes(x=as.factor(age),y=wt))+  
  scale_y_continuous(limits=c(0,15e2)) + xlab("Age") + ylab("Body mass of pollock (grams)") +
   geom_boxplot(width=.6,aes(fill=area),outlier.size=.2,notch=T,notch.width=.5,colour="brown")+  #+geom_vline(xintercept=(1.5:9.5),colour="grey",linetype="solid",linewidth=2) 
   mytheme
p
?colour
# + ggtitle("Weight-at-Age (grams)")  + mytheme
