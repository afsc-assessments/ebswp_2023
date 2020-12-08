library(ggplot2)
library(lubridate)
library(tidyverse)
library(data.table)
library(xtable)
mytheme <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(), panel.grid.major.y = element_blank())# element_line(colour="grey60", linetype="dashed"))
mytheme <- mytheme + theme(text=element_text(size=18)) + theme(axis.title.x=element_text(size=22) ,axis.title.y=element_text(size=22))
mytheme <- mytheme + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank() )
mytheme <- mytheme + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=.5))
setwd("~/Onedrive/sampler/cases/ebswpSAM")
#--------------------------
# Fishery wts
#--------------------------
i=1991
wadt <- data.table(read.table(paste0("results/wtage",i,".rep"),header=TRUE) )
#wadt <- data.table(read.table(paste0("mainresults/wtage",i,".rep"),header=TRUE) )
names(wadt) <- c("bs","sam","yr",1:15)
for (i in 1992:2018) {
  wadt <- rbind(wadt,data.table(read.table(paste0("results/wtage",i,".rep"),header=TRUE)) ,use.names=FALSE)
}
summary(wadt)
# wide to long
wadt <- data.table(wadt)
wadt
wadt.m <- melt(wadt, measure.vars = 4:18, variable.name = "age", value.name = "wt")
wadt.m$age <-as.numeric(wadt.m$age )
dtmp <- wadt.m[,.(bs,yr,wt,mnwt=mean(wt)),.(age)] #%>% mutate(bs,wt,mnwt,swt=wt/mnwt)
dtmp <- dtmp[,.(yr,bs,age,wt,mnwt,swt=wt/mnwt)] #%>% mutate(bs,wt,mnwt,swt=wt/mnwt)
dtmp
library(ggthemes) 
#theme(panel.grid.major.y = element_line(colour="grey",linetype="dashed",size=0.5) ) theme(panel.grid.major.x = element_line(colour="grey",linetype="dashed",size=0.5) )  + theme(panel.border = element_rect(colour="grey",size=0.5) ) ,panel.grid.major.x = element_blank() )
mytheme <- mytheme + theme(panel.grid.major.y = element_line(colour="grey",linetype="dotted",size=1) ) + 
theme(panel.grid.major.x = element_blank()) 
##########
# unstratified results wt-age
##########
i = 2020
for (i in c(1999,2004,2009,2014 ,2019)) {
  p <- dtmp[yr %between% c(i-4,i) &age>2&age<11] %>% ggplot(aes(x=as.factor(age),y=swt,fill=as.factor(yr-age))) +
       geom_hline(yintercept=1,color="brown",size=1) + scale_fill_discrete(guide=FALSE) +
       geom_violin() + facet_grid(yr~.) + xlab("Age") + ylab("Body weight relative to mean") + 
       mytheme + scale_y_continuous(limits=c(0.7,1.3),breaks=c(0.8,1.0,1.2)) #+ scale_fill_brewer(palette="Pastel2")    # scale_colour_manual(palette-"Pastel2") #scale_fill_discrete()
  print(p)
  #p <- p + coord_flip()
 #scale_fill_brewer(palette="Pastel2") # + scale_colour_manual(palette-"Pastel2") #scale_fill_discrete()
  ggsave(paste0("~/_mymods/ebswp/doc/figs/fsh_wtage_comb_",i,".pdf"),p,width=5,height=8)
}
ggsave("~/OneDrive/ebswp/EBSpollock/doc/figs/fsh_wtage_comb.pdf",p,width=5,height=8)
#-------------------------------------------------
# Stratified weights
#-------------------------------------------------
i=1991
#swadt <- data.table(read.table(paste0("mainresults/str_wtage",i,".rep"),header=TRUE) )
swadt <- data.table(read.table(paste0("results/str_wtage",i,".rep"),header=TRUE) )
names(swadt) <- c("bs","sam","yr","str",1:15)
for (i in 1992:2019) 
{
  swadt <- rbind(swadt,data.table(read.table(paste0("results/str_wtage",i,".rep"),header=TRUE)) ,use.names=FALSE)
}

# wide to long
# Set strata labels
(swadt$str[swadt$str==1]="A-season")
(swadt$str[swadt$str==2]="B-season, NW")
(swadt$str[swadt$str==3]="B-season, SE")
(swadt$str[swadt$str==999]="Combined")
str(swadt)
swadt.m <- melt(swadt, measure.vars = 5:19, variable.name = "age", value.name = "wt")
swadt.m$age <-as.numeric(swadt.m$age )
swadt.m
mytheme <- mytheme + theme(panel.grid.major.y = element_line(colour="grey",linetype="dashed"))
#dt1 <- swadt.m[str=="Combined",.(bs,str,yr,wt,mnwt=mean(wt)),.(age)] 
#dt2 <- swadt.m[str!="Combined",.(mnwt=mean(wt)),.(age)]
dt1 <- swadt.m[str=="Combined",.(mnwt=mean(wt)),.(age)] 
#dt1 <- swadt.m[str==999,.(mnwt=mean(wt)),.(age)] 
dt1
dt2 <- swadt.m[,.(age,bs,str,yr,wt)] 
setkey(dt2,age)
setkey(dt1,age)
dtmp <- merge(dt1,dt2)
dt2 <- swadt.m[.(bs,str,yr,wt,mnwt=mean(wt)),.(age)] #%>% mutate(bs,wt,mnwt,swt=wt/mnwt)
dtmp <- dtmp[,.(yr,str,bs,age,wt,mnwt,swt=wt/mnwt)] #%>% mutate(bs,wt,mnwt,swt=wt/mnwt)
dtmp
# Plot over all years just by strata
  p <- dtmp[age>2&age<11&str!="Combined"] %>% ggplot(aes(x=as.factor(age),y=swt,fill=str)) 
  p <- p + geom_violin() + facet_grid(~str) + xlab("Age") + mytheme + 
       geom_hline(yintercept=1,size=1.0,color="brown") + ylab("Body weight relative to mean") +
  scale_fill_discrete(guide=FALSE) + scale_y_continuous(limits=c(0.4,1.6),breaks=c(0.5,.75,1.0,1.25,1.5))
       p
  #ggsave("~/OneDrive/ebswp/EBSpollock/doc/figs/fsh_wtage.pdf",plot=p,width=8,height=6)
  ggsave("~/_mymods/ebswp/doc/figs/fsh_wtage.pdf",plot=p,width=8,height=6)

i=2019
summary(dtmp)
for (i in c(1999,2004,2009,2014 ,2019)) {
  p <- dtmp[yr %between% c(i-4,i)&age>2&age<11&str!=999&str!="Combined"] %>% ggplot(aes(x=as.factor(age),y=swt,fill=as.factor(yr-age))) 
  # with combined
  #p <- dtmp[yr %between% c(i-4,i)&age>2&age<11] %>% ggplot(aes(x=as.factor(age),y=swt,fill=as.factor(yr-age))) 
  #p <- swadt.m[yr %between% c(i-4,i)&age>2&age<11&str!=999] %>% ggplot(aes(x=as.factor(age),y=wt,fill=as.factor(yr-age))) 
  p <- p + geom_violin() + facet_grid(yr~str) + xlab("Age") + mytheme + ylab("Body weight relative to mean")
  p <- p + scale_fill_discrete(guide=FALSE) + scale_fill_identity() + scale_y_continuous(limits=c(0.6,1.6),breaks=c(0.7,1.0,1.3))
  # ylab("Average weight (kg)")
  #scale_y_continuous(limits=c(0,1.6),breaks=c(0.5,1.0,1.5))
  #scale_fill_brewer(palette="Pastel2") # + scale_colour_manual(palette-"Pastel2") #scale_fill_discrete()
  ggsave(paste0("~/_mymods/ebswp/doc/figs/rel_bodywt_",i,".pdf"),plot=p,width=8,height=6)
}
ggsave(paste0("~/_mymods/ebswp/doc/figs/fsh_wtage_comb_",i,".pdf"),p,width=5,height=8)
i=2018
  p <- dtmp[yr %between% c(i-5,i)&age>2&age<11&str=="Combined"] %>% ggplot(aes(x=as.factor(age),y=swt,fill=as.factor(yr-age))) 
  p <- p + geom_violin() + facet_wrap(~yr,nrow=6 ) + xlab("Age") + theme_bw(base_size=13) +
       ylab("Body weight relative to mean") + geom_hline(yintercept=1)
  p <- p + scale_fill_discrete(guide=FALSE) + scale_y_continuous(limits=c(0.6,1.4),breaks=c(0.75,1.0,1.25)) #+coord_flip()   
p