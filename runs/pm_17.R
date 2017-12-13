source("../R/prelims.R")
thisyr    = 2017
lastyr    = thisyr-1
nextyr    = thisyr+1

# The model specs
#mod_names <- c("2016 Model", "2017 update","16.0a")
mod_names <- c("Model 16.0 \nlast year", "Model 16.0","16.0a \n(acoustics to 0.5m)")
.MODELDIR = c( "../runs/arc/16.1/", "../runs/3m/", "../runs/16.0/") 
#.MODELDIR = c( "../runs/arc/16.1/", "../runs/3m/") #, "../runs/16.0/") 
#.MODELDIR = c( "../runs/16.0/lastyr/", "../runs/16.0/") 
#mod_names <- c("Age error", "2017 update ")
#.MODELDIR = c( "../runs/agerr/", "../runs/16.0/") 
.THEME    = theme_bw(base_size = 11, base_family = "")
.OVERLAY  = TRUE
thismod <- 3 # the selected model

# Read report file and create gmacs report object (a list):
fn       <- paste0(.MODELDIR, "pm")
modlst   <- lapply(fn, read_admb)
names(modlst) <- mod_names
# The model picked
M        <- modlst[[thismod]]
#source("../runs/pm_17.R")
npar <- M$fit$nopar
# "B_Bnofsh" "Bzero" "Percent_Bzero"     "Percent_Bzero_1"   "Percent_Bzero_2"  [934] "Percent_B100"      "Percent_B100_1"    "Percent_B100_2"   [937] "SPR_OFL"           "F40"               "F35"              
                # String versions of these values
M$age3plus<-M$fit$est[M$fit$names=="age_3_plus_biom"][1:length(M$R[,1])]  
M$age3plus.sd<-M$fit$std[M$fit$names=="age_3_plus_biom"][1:length(M$R[,1])]  
M$age3plus.cv<- M$age3plus.sd/M$age3plus 
bmsy    <- M$fit$est[M$fit$names=="Bmsy"];       bmsys      <- format(bmsy,big.mark=",",scientific=F,digits=0)
bmsyr   <- M$fit$est[M$fit$names=="Bmsy2"];      bmsyrs      <- format(bmsyr,big.mark=",",scientific=F,digits=0)
bmsy.sd <- M$fit$std[M$fit$names=="Bmsy"]; 
bmsy.cv <- bmsy.sd/bmsy 
sprmsy  <- M$fit$est[M$fit$names=="SPR_OFL"]; 
sprmsy.sd <- M$fit$std[M$fit$names=="SPR_OFL"]; 
sprmsy.cv <- sprmsy.sd/sprmsy 
steep   <- M$fit$est[M$fit$names=="steepness"];  
b0      <- M$fit$est[M$fit$names=="Bzero"];      b0s        <- format(b0,  big.mark=",",scientific=F,digits=0)
b100    <- M$fit$est[M$fit$names=="SB100"];      b100s      <- format(b100,big.mark=",",scientific=F,digits=0)
dynb0   <- M$fit$est[M$fit$names=="B_Bnofsh"];   dynb0s     <- format(dynb0,big.mark=",",scientific=F,digits=2)
repl_yld<- M$repl_yld;                           repl_ylds  <- format(round(repl_yld,-1),big.mark=",",scientific=F,digits=0)
curssb   <- M$SSB[length(M$SSB[,1]),2];          curssbs    <- format(round(curssb,-1),big.mark=",",scientific=F,digits=0)
curssb.sd<- M$SSB[length(M$SSB[,1]),3];          curssb.sds <- format(round(curssb.sd,-1),big.mark=",",scientific=F,digits=0)
curssb.cv <- curssb.sd/curssb
nextyrssb<- as.numeric(M$future_SSB[11,2]);      nextyrssbs <- format(round(nextyrssb,-2) ,big.mark=",",scientific=F)
nextyrssb.sd <- as.numeric(M$future_SSB.sd[11,2])
nextyrssb.cv <- nextyrssb.sd/nextyrssb
dim(M$R)
avgrec <- mean(M$R[14:54,2]);     avgrecs <- format(round(avgrec,-1),big.mark=",",scientific=F)
yc2000 <- (M$R[M$R[,1]==2001,2]); yc2000s <- format(round(yc2000,-2),big.mark=",",scientific=F)
yc2006 <- (M$R[M$R[,1]==2007,2]); yc2006s <- format(round(yc2006,-2),big.mark=",",scientific=F)
yc2008 <- (M$R[M$R[,1]==2009,2]); yc2008s <- format(round(yc2008,-2),big.mark=",",scientific=F)
yc2012 <- (M$R[M$R[,1]==2013,2]); yc2012s <- format(round(yc2012,-2),big.mark=",",scientific=F)

msyr <- M$fit$est[M$fit$names=="Fmsy2"]
b40  <- .40*b100; b40s  <- format(b40,big.mark=",",scientific=F,digits=0)
b35  <- .35*b100; b35s  <- format(b35,big.mark=",",scientific=F,digits=0)
pdf     <- as.data.frame(M$T1)
names(pdf) <- c("Year","ABC","OFL", "SSB","age3plus","CatchFut","harmeanF","arithmeanF","geomB","SPRABC","SPROFL")
arithmeanF <-  round(pdf$arithmeanF[1],3)
harmeanF   <-  round(pdf$harmeanF[1],3)
maxFabc    <-  harmeanF
age3plus1  <-  pdf$age3plus[1]
age3plus1s <-  format(round(1e3*pdf$age3plus[1],-3),big.mark=",",scientific=F,digits=0)
age3plus2  <-  pdf$age3plus[2]
age3plus2s <-  format(round(1e3*pdf$age3plus[2],-3),big.mark=",",scientific=F,digits=0)
ssb1       <-  pdf$SSB[1]
ssb2       <-  pdf$SSB[2]
ssb1s      <-  format(round(1e3*pdf$SSB[1],-3),big.mark=",",scientific=F,digits=0)
ssb2s      <-  format(round(1e3*pdf$SSB[2],-3),big.mark=",",scientific=F,digits=0)
ABC_biom1  <-  pdf$geomB[1];  ABC_biom1s  <- format(round(ABC_biom1,0),big.mark=",",scientific=F,digits=0)
ABC_biom2  <-  pdf$geomB[2];  ABC_biom2s  <- format(round(ABC_biom2,0),big.mark=",",scientific=F,digits=0)
maxabc1    <-  pdf$ABC[1]
maxabc2    <-  pdf$ABC[2]
maxabc1s   <-  format(round(1e3*pdf$ABC[1],-3),big.mark=",",scientific=F,digits=0)
maxabc2s   <-  format(round(1e3*pdf$ABC[2],-3),big.mark=",",scientific=F,digits=0)
ofl1       <-  pdf$OFL[1]
ofl2       <-  pdf$OFL[2]
ofl1s      <-  format(round(1e3*pdf$OFL[1],-3),big.mark=",",scientific=F,digits=0)
ofl2s      <-  format(round(1e3*pdf$OFL[2],-3),big.mark=",",scientific=F,digits=0)
bfs        <- read.csv("data/proj.csv",header=T)
Tier3_ABC1 <- bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(ABC),0))
Tier3_OFL1 <- bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(OFL),0))
Tier3_OFL1s<- format(round(1e3*Tier3_OFL1,-3),big.mark=",",scientific=F,digits=0)
Tier3_SSB1 <- bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(SSB),0))
Tier3_F1   <- Tier3_ABC1 / ABC_biom1
Tier3_ABC2 <- bfs %>% filter(Alt==2,Yr==1+nextyr) %>% summarize(round(mean(ABC),0))
Tier3_OFL2 <- bfs %>% filter(Alt==2,Yr==1+nextyr) %>% summarize(round(mean(OFL),0))
Tier3_OFL2s<- format(round(1e3*Tier3_OFL2,-3),big.mark=",",scientific=F,digits=0)
Tier3_SSB2 <- bfs %>% filter(Alt==2,Yr==1+nextyr) %>% summarize(round(mean(SSB),0))
Tier3_F2   <- Tier3_ABC2 /ABC_biom2
abc1       <- Tier3_ABC1
abc2       <- Tier3_ABC2
abc1s      <- format(round(1e3*abc1,-3),big.mark=",",scientific=F,digits=0)
abc2s      <- format(round(1e3*abc2,-3),big.mark=",",scientific=F,digits=0)
fabc       <- Tier3_ABC1 /ABC_biom1
rhodf      <- read.csv("data/mohnrho.csv",header=T)
rhoMohn10  <-  rhodf[11,3]
rhoMohn20  <-  rhodf[21,3]

if (doplots) {
  p1 <- plot_recruitment(modlst,xlim=c(2004.5,2017.5))
  ggsave("figs/mod_eval0b.pdf",plot=p1,width=6,height=4,units="in")
  p1 <- plot_ssb(modlst,xlim=c(2004.5,2017.5),alpha=.3)
  ggsave("figs/mod_eval0a.pdf",plot=p1,width=6,height=4,units="in")
  p1 <- plot_sel()
  ggsave("figs/mod_fsh_sel.pdf",plot=p1,width=4,height=8,units="in")
  p1 <- plot_sel(sel=M$sel_bts,styr=1982,fill="darkblue") 
  ggsave("figs/mod_bts_sel.pdf",plot=p1,width=4,height=8,units="in")
  p1 <- plot_mnage(modlst[thismod]) 
  ggsave("figs/mod_mean_age.pdf",plot=p1,width=5.5,height=7,units="in")
  p1 <- plot_bts(modlst[thismod]) 
  ggsave("figs/mod_bts_biom.pdf",plot=p1,width=5.2,height=3.7,units="in")
  p1 <- plot_ats(modlst[thismod]) 
  ggsave("figs/mod_ats_biom.pdf",plot=p1,width=5.2,height=3.7,units="in")
  p1 <- plot_avo(modlst[thismod]) 
  ggsave("figs/mod_avo_fit.pdf",plot=p1,width=5.2,height=3.7,units="in")
  p1 <- plot_cpue(modlst[[thismod]]) 
  ggsave("figs/mod_cpue_fit.pdf",plot=p1,width=5.2,height=3.7,units="in")
  p1 <- plot_recruitment(modlst[thismod],xlim=c(1963.5,2017.5),fill="yellow")
  ggsave("figs/mod_rec.pdf",plot=p1,width=6,height=4,units="in")
  p1 <- plot_srr(modlst[thismod],alpha=.2,xlim=c(0,5200),ylim=c(0,75000))
  ggsave("figs/mod_srr.pdf",plot=p1,width=5.2,height=3.7,units="in")
  pdf("../doc/figs/mod_fsh_age.pdf",width=6,height=8)
  plot_agefit(M,case_label="2017 Assessment",gear="fsh")
  dev.off()

  #---Roe data------------------
  rd <- as.data.frame(read.csv("data/roe.csv",header=T))
  rd <- select(rd,Year, Season, Prod,t) %>% group_by(Year,Season,Prod) %>% summarize(t=sum(t)) #gather(Season,Year) %>% head
  #df <-data.frame(Year=M$Yr,M$F); names(df) <- c("Year",1:15); df.g <- gather(df,age,F,2:16,-Year)
  .THEME <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank() )
  .THEME <- .THEME + theme(text=element_text(size=12)) + theme(axis.title.x=element_text(size=14) ,axis.title.y=element_text(size=14))
  .THEME <- .THEME + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
  #p1 <- rd %>% ggplot(aes(x=Year,y=t,shape=Season,col=Prod)) + geom_point(size=2) + geom_line(size=1.0) + .THEME + ylab("Tons of roe produced") + expand_limits(y=0) + scale_x_continuous(breaks=seq(1982,2018,1))
  p1 <- rd %>% filter(Prod=="ROE") %>% ggplot(aes(x=Year,y=t,shape=Season,col=Season)) + geom_point(size=2) + geom_line(size=1.0) + .THEME + ylab("Tons of roe produced") + expand_limits(y=0) + 
       scale_x_continuous(breaks=seq(2000,2018,2))
        #  + geom_hline(yintercept=mst,linetype="dashed") + geom_hline(yintercept=mbt,linetype="dashed") 
  ggsave("figs/roe.pdf",plot=p1,width=7.5,height=4.5,units="in")

  #--- Catch-age estimates for sex catch age --------------------------
  i=2016
  edt <- (read.table(paste0("../../../sampler/cases/ebswp/results/Est_",i,".dat"),header=T))
  for (i in 2015:1991){
    tdt <- (read.table(paste0("../../../sampler/cases/ebswp/results/Est_",i,".dat"),header=T))
    edt <- rbind(edt,tdt)
  }
  tot <- edt %>% filter(type=="N",sex<3,stratum<5) %>% mutate(season=ifelse(stratum==1,"A","B"),sex=ifelse(sex==1,"Male",ifelse(sex==2,"Female","Total"))) %>% 
          group_by(year,sex) %>% summarize(Catch=sum(value)) 
  tot$season <-"all"
  p1 <- edt %>% filter(type=="N",sex<3,stratum<5) %>% mutate(season=ifelse(stratum==1,"A","B"),sex=ifelse(sex==1,"Male",ifelse(sex==2,"Female","Total"))) %>% 
          group_by(year,sex,season) %>% summarize(Catch=sum(value)) %>% rbind(tot) %>%
          ggplot(aes(x=year,y=Catch,color=season,shape=sex,linetype=season)) + .THEME + geom_point(size=3.5) + geom_line(size=1.2) + expand_limits(y=0) + 
          scale_x_continuous(breaks=seq(1990,2018,5)) + ylab("Catch (thousands)") + xlab("Year")
          p1
  ggsave("figs/catch_sex.pdf",plot=p1,width=7.5,height=4.5,units="in")

  #---temperature------------------
  td <- as.data.frame(read.csv("data/Temps_82to17.csv",header=T))
  mbt <- mean(td$Bottom)
  mst <- mean(td$Surface)
  td.g <- gather(td,Source,temp,-YEAR)
  .THEME <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank() )
  .THEME <- .THEME + theme(text=element_text(size=12)) + theme(axis.title.x=element_text(size=14) ,axis.title.y=element_text(size=14))
  .THEME <- .THEME + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
  p1 <- ggplot(td.g,aes(x=YEAR,y=temp,col=Source,shape=Source)) + geom_point(size=2) + geom_line(size=1.0) + .THEME + ylab("Degrees C") + expand_limits(y=0) + 
       scale_x_continuous(breaks=seq(1982,2018,3)) + geom_hline(yintercept=mst,linetype="dashed") + geom_hline(yintercept=mbt,linetype="dashed") 
  ggsave("figs/bts_temp.pdf",plot=p1,width=7.5,height=4.5,units="in")

  #---R/S------------------
  dt <- data.table(yr=M$SSB[1:53,1],ssb= M$SSB[1:53,2], r=M$R[2:54,2] )
  dt$rs <- log(dt$r/dt$ssb)
  p1 <- ggplot(dt,aes(x=yr,y=rs)) + geom_point(size=4,col="red") + geom_line() +geom_smooth() + .THEME + ylab("ln(Recruits/spawning biomass)") + xlab("Year")
  #ggplot(dt,aes(x=ssb,y=rs)) + geom_point(size=4,col="red") + geom_path() +geom_smooth(method="lm") + .THEME + ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)")
  p2 <- ggplot(dt,aes(x=ssb,y=rs,col=yr,label=yr,size=yr)) + geom_text() + geom_path(size=.5,alpha=.4) +geom_smooth(method="lm") + .THEME + 
       ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)") +  guides(size=FALSE,shape=FALSE,alpha=FALSE,col=FALSE) 
  p3 <- arrangeGrob(p1,p2,nrow=2)
  ggsave("figs/mod_rs.pdf",plot=p3,width=5.2,height=7.5,units="in")

  p1 <- plot_ser(modlst[thismod],xlim=c(1964,2017),alpha=.7)
  ggsave("figs/mod_ser.pdf",plot=p1,width=9.2,height=7.0,units="in")

  #---fishing mortality mod_F.pdf-----------------------------------------------------------------
  df <-data.frame(Year=M$Yr,M$F); names(df) <- c("Year",1:15); df.g <- gather(df,age,F,2:16,-Year)
  p1 <- df.g %>% mutate(age=as.numeric(age)) %>% filter(age<11)%>% ggplot(aes(y=age,x=Year,fill=F)) + geom_tile() + .THEME + ylab("Age")+ geom_contour(aes(z=F),color="darkgrey",size=.5,alpha=.4) +
            scale_fill_gradient(low = "white", high = "red") + scale_x_continuous(breaks=seq(1965,2017,5)) + geom_line(data=df.g[df.g$age=="6",],aes(x=Year,y=F*10)) +
            annotate("text", label = "Age 6 F (x10)" , x = 2015, y = 1.2, size = 5, colour = "black") + scale_y_continuous(breaks=seq(0,10,1)) 
  ggsave("figs/mod_F.pdf",plot=p1,width=9.2,height=6.0,units="in")

  #---Fits to bts age mod_bts_age.pdf-------------------------------------------------------------
  pdf("../doc/figs/mod_bts_age.pdf",width=6,height=8)
  plot_agefit(M,case_label="2017 Assessment",gear="bts")
  dev.off()

  #---Historical assessment retrospectives--------------------------------------------------------
  dd <- as.data.frame(read.csv("data/history.csv",header=T))
  names(dd) <- c("Year",2016:2006,2001:1997)
  dd.g <- gather(dd,Assessment,Biomass,2:17)
    t = data.frame(Year=1964:2019, Assessment=2017,Biomass=M$fit$est[M$fit$names=="age_3_plus_biom"]  )
  dd.g <- rbind(dd.g,t) 
  p1 <- ggplot(dd.g,aes(x=Year,y=Biomass,color=Assessment,shape=Assessment)) + geom_line(alpha=.8,size=.75) + geom_point() + .THEME +
    scale_x_continuous(breaks=seq(1964,2018,5))  +  xlab("Year") + ylim(0,14000) + ylab("Age 3+ biomass (kt)") +
    guides(size=FALSE,shape=FALSE,alpha=FALSE,col=FALSE) 
  ggsave("figs/mod_hist.pdf",plot=p1,width=9.2,height=7.0,units="in")

  #---Fits to ats age mod_ats_age.pdf-------------------------------------------------------------
  pdf("../doc/figs/mod_ats_age.pdf",width=6,height=8)
  plot_agefit(M,case_label="2017 Assessment",gear="ats")
  dev.off()
  
  #----Read in retro results-----------------
  j='16.0'
  i=0
  #read_rep("../runs/16.0/retro/r_1.rep")
  retouts <- list()
  for (i in 0:20) {
      rn=paste0("../runs/16.0/retro/r_",i,".rep")
      mn=paste0("r_",i)
      assign(mn,read_rep(rn))
      retouts[[mn]] <- (get(mn))
    }
  p1 <- plot_ssb(retouts,xlim=c(1990,2017),legend=F)
  p2 <- plot_ssb_rel(retouts,xlim=c(1990,2017),ylim=c(0.5,1.5),legend=F,alpha=.2)
  p3 <- arrangeGrob(p1,p2,nrow=2)
  ggsave("figs/mod_retro.pdf",plot=p3,width=7.2,height=9.0,units="in")
  p1 <- plot_R_rel(retouts,xlim=c(1990,2017),legend=F,rel=FALSE)
  p2 <- plot_R_rel(retouts,xlim=c(1990,2017),ylim=c(0.5,1.5),legend=FALSE,alpha=.2)
  p3 <- arrangeGrob(p1,p2,nrow=2)
  ggsave("figs/mod_retroR.pdf",plot=p3,width=7.2,height=9.0,units="in")
  #plot_recruitment(retouts,xlim=c(1990,2017),rel=T,legend=FALSE,alpha=.2)
  #plot_R_rel(retouts,xlim=c(1980,2017),ylim=c(0.5,1.5),legend=FALSE,alpha=.2)
  # Mohn's rho
  rc = retouts[[1]]$SSB[,2]
  ntmp=0
  rho=0
  df <- data.frame(peel=1:21,rho=1:21)
  for (i in 1:21) {
    rn <- names(retouts[i])
    dtmp = (get(paste0(rn))$SSB )
    lr   = length(dtmp[,1])
    rho  = rho +(dtmp[lr,2] -rc[lr])/rc[lr]
    df$peel[i] <- i-1
    df$rho[i] <- rho/i
    print(paste(i,rho/i))
  }    
  write.csv(df,"data/mohnrho.csv")
  #--------phase plane figure-------------------
  df <- read.table(paste0(.MODELDIR[thismod],"F40_t.rep"),header=T)
  p1 <- df %>% filter(Year>1977) %>% mutate(F.Fmsy=meanF/Fmsy,B.Bmsy=SSB/Bmsy) %>% ggplot(aes(x=B.Bmsy,y=F.Fmsy,label=Year)) + 
         geom_text(aes(color=Year,size=Year*.4,alpha=.4)) + .THEME + xlim(c(0,1.8))+ ylim(c(0,1.8)) + xlab("B/Bmsy") + ylab("F/Fmsy") +
         geom_hline(size=1.0,yintercept=1) + geom_vline(size=0.5,linetype="dashed",xintercept=.2) + geom_vline(size=1.,xintercept=1) + geom_path(size=.2) + guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE) 
  ggsave("figs/mod_phase.pdf",plot=p1,width=5.2,height=3.7,units="in")

#---Catch grid and future effort consequences---------------------------------------------------
  dc <-data.frame(Catch=M$future_catch,scen=c(seq(.5,1.5,.05),2),"catch"); 
  dc[1:5] <- dc[1:5]/1350
   dc
  dc <-data.frame(Year=2017:2022,Catch=c(1350,M$future_catch[22,]), F=M$Future_F[22,], SSB=M$future_SSB[22,])
  dc <-data.frame(Year=2017:2022,F=M$Future_F[22,], SSB=M$future_SSB[22,])
  dc$F <- dc$F/dc$F[1]
  dc$SSB <- dc$SSB/dc$SSB[1]
 df.g <- gather(dc,key=Measure,val,-Year) 
p1 <-   df.g %>% ggplot(aes(x=Year,y=val,col=Measure)) + .THEME + geom_line(size=2) + ylim(0.5,1.5) + ggtitle("Projected trend relative 2017 given future catch=1,350 kt") + ylab("Relative value")
  ggsave("figs/future_F.pdf",plot=p1,width=7.4,height=5,units="in")

  # ,scen=c(seq(.5,1.5,.05),2),"catch"); 
  names(dc) <- c(2018:2022,"scen","var") 
  names(dc) <- c(2018:2022,"scen","var") 
  db <-data.frame(SSB=M$future_SSB,scen=seq(.5,1.5,.05),"SSB"); 
  db<- cbind(db[,2:6]/db[,1],db[,7:8])
  db$scen <- dc[,1]
  names(db) <- c(2018:2022,"scen","var") 
  df.g <- rbind( gather(dc,year,val,1:5) , gather(db,year,val,1:5) )
  df.g$year <- as.numeric(df.g$year)
  head(df.g)
  # df.g %>% filter(var=="catch") %>% ggplot(aes(x=year,y=scen,z=val)) + .THEME + geom_contour() + ()
  df.g %>% filter(var=="catch") %>% select(year,scen,val) %>% ggplot(aes(x=year,y=scen)) + .THEME + geom_density_2d()

dd <- df.g %>% filter(var=="SSB")
dc <- df.g %>% filter(var=="catch")
df.g%>% filter(var=="catch") %>% ggplot(aes(x=year,y=scen,fill=val,col=var)) + .THEME + geom_contour(aes(z=val),size=2) + 
            scale_x_continuous(breaks=seq(2018,2022,1))  + 
             geom_text(data=dc,aes(x=year-.15,y=scen,label=format(100*(val-1),digits=0)) )#+
df.g%>% filter(var=="catch") %>% ggplot(aes(x=year,y=scen,fill=val,col=var)) + .THEME + 
            scale_x_continuous(breaks=seq(2018,2022,1))  + geom_contour(data=dd,aes(x=year,y=scen,z=val),size=2,col="darkgreen") + 
             geom_text(data=dd,aes(x=year+.15,y=scen,label=format(100*(val-1),digits=0)),col="darkgreen" ) 
f1 <-  df.g%>% filter(var=="catch") %>% ggplot(aes(x=year,y=scen,fill=val,col=var)) + .THEME + geom_contour(aes(z=val),size=2) + 
            scale_x_continuous(breaks=seq(2018,2022,1))  + geom_contour(data=dd,aes(x=year,y=scen,z=val)) + 
             geom_text(data=dd,aes(x=year+.05,y=scen,label=format(100*(val-1),digits=0)) ) +
             geom_text(data=dc,aes(x=year-.05,y=scen,label=format(100*(val-1),digits=0)) )#+
f1

             # geom_text(data=dd,aes(x=year+.15,y=scen,label=format(100*(val-1),digits=0)) )
# p1 <-  df.g %>% ggplot(aes(x=year,y=scen,fill=val,col=var)) + .THEME + geom_contour(aes(z=val),size=2) + 
#             scale_x_continuous(breaks=seq(2018,2022,1))  +
#              geom_contour(data=dd,aes(x=year,y=scen,z=val)) + 
#              geom_text(data=dc,aes(x=year-.15,y=scen,label=format(100*(val-1),digits=0)) )+
#              geom_text(data=dd,aes(x=year+.15,y=scen,label=format(100*(val-1),digits=0)) )
#             #scale_fill_gradient(low = "white", high = "red") + geom_tile() + 
# p1

#   direct.label(p1)
#             annotate("text", label = "Age 6 F (x10)" , x = 2017, y = 1.2, size = 5, colour = "black") + scale_y_continuous(breaks=seq(0,10,1)) 
#   geom_tile()
#   color="black",size=.5,alpha=.4) 
#    ylab("Age")+ 
#   geom_tile() + .THEME 
#             scale_fill_gradient(low = "white", high = "red") + scale_x_continuous(breaks=seq(1965,2017,5)) + 
#             annotate("text", label = "Age 6 F (x10)" , x = 2017, y = 1.2, size = 5, colour = "black") + scale_y_continuous(breaks=seq(0,10,1)) 
#   ggsave("figs/mod_F",plot=p1,width=9.2,height=7.0,units="in")
}

if(domcmc){
  #source("../R/plotMCMCpairs.R")
  #.plotMCMCpairs(tt)
  library(GGally)
  mc <- data.frame(read.table(paste0(.MODELDIR[thismod],"mcmc/mceval.rep")))
  names(mc) <- c("ObjFun","Steepness","lnR0","Fmsyr","SPR_msy","SER_msy","B0","BMSY","B100","B17","B18","B_Bmsy","B_Bmean","B_B20","DynB0","q")
  head(mc)
  1/mean(1/mc$Fmsyr)
  mc$Chain=1
  mc$Iteration=1:length(mc$Chain)
  p1 <- mc %>% select(Steepness,lnR0,B_Bmsy,DynB0,B17,B_Bmean) %>% ggpairs(aes(color="blue",fill="lemonchiffon",alpha=.5)) + .THEME
  ggsave("figs/mcmc_pairs.pdf",plot=p1,width=7,height=7,units="in")
  #head(mc)
  mc.t <- select(mc,Iteration,ObjFun,q,Steepness,lnR0,B17,B_Bmean) %>% gather(Parameter,value,-Iteration) #%>% head
  ggplot(mc.t,aes(x=Iteration,y=value)) + geom_line() + .THEME + facet_wrap(~Parameter,scales="free")
  summary(mc)
  # table of Means and CVs
  for (i in 2:18) print(c(names(mc)[i],round(median(mc[,i]),3), round(mean(mc[,i]),3), paste0(round(100*sqrt(var(mc[,i]))/mean(mc[,i]),0),"%") ))
  ggplot(mc.t,aes(x=Iteration,y=value)) + geom_line() + .THEME + facet_wrap(~Parameter,scales="free")
  p1 <- mc %>% select(B17) %>% ggplot(aes(B17))+ geom_density(fill="lemonchiffon",alpha=.5 ) + .THEME + xlab("2017 Female spawning biomass") + 
  geom_vline(xintercept=M$SSB[54,2],col="green") + geom_vline(xintercept=mean(mc$B17),size=2,col="red",linetype="dashed") 
  p1
  p1 <- mc %>% select(B_Bmean) %>% ggplot(aes(B_Bmean))+ geom_density(fill="lemonchiffon",alpha=.5 ) + .THEME + xlab("2017 Female spawning biomass") + 
  geom_vline(xintercept=M$B_Bmean,col="green") + geom_vline(xintercept=mean(mc$B_BmeanB17),size=2,col="red",linetype="dashed") 
  p1

  #head(mc.t)
  #q  
}

if(doproj)
{

  .projdir <- paste0(.MODELDIR[thismod],"proj/")
  system(paste0("cd ",.projdir,"; main "))
  bf <- data.frame(read.table(paste0(.projdir,"bigfile.out"),header=TRUE,as.is=TRUE))
  # Stock Alt Sim Yr  SSB Rec Tot_biom SPR_Implied F Ntot Catch ABC OFL AvgAge AvgAgeTot SexRatio FABC FOFL
  bfsum <- bf %>% select(Alt,Yr,SSB,F,ABC ,Catch) %>% group_by(Alt,Yr) %>% summarise(Catch=mean(Catch),SSB=mean(SSB),F=mean(F),ABC=mean(ABC))
  t1 <- bfsum %>% select(Alt,Yr,Catch) %>% spread(Alt,Catch) 
  names(t1) <- c("Catch","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
  write.csv(t1,"data/tier3_proj_C.csv",row.names=F)
  t1 <- bfsum %>% select(Alt,Yr,SSB) %>% spread(Alt,SSB) 
  names(t1) <- c("SSB","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
  write.csv(t1,"data/tier3_proj_SSB.csv",row.names=F)
  t1 <- bfsum %>% select(Alt,Yr,F) %>% spread(Alt,F) 
  names(t1) <- c("F","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
  write.csv(t1,"data/tier3_proj_F.csv",row.names=F)
  t1 <- bfsum %>% select(Alt,Yr,ABC) %>% spread(Alt,ABC) 
  names(t1) <- c("ABC","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
  write.csv(t1,"data/tier3_proj_ABC.csv",row.names=F)


  # write some sims out for easy use later...
  bfs <- filter(bf,Sim<30)
  write.csv(bfs,"data/proj.csv")
  head(bfss)
  bfss <- bfs %>% filter(Alt==2) %>% select(Alt,Yr,Catch,SSB,Sim) 
  pf <- data.frame(read.table(paste0(.projdir,"percentdb.out"),header=F) )
  names(pf) <- c("stock","Alt","Yr","variable","value") 
  p1 <- pf %>% filter(substr(variable,1,1)=="C",variable!="CStdn",Alt==2) %>% select(Yr,variable,value) %>% spread(variable,value) %>%
    ggplot(aes(x=Yr,y=CMean),width=1.2) + geom_ribbon(aes(ymax=CUCI,ymin=CLCI),fill="goldenrod",alpha=.5) + .THEME + geom_line() +
    scale_x_continuous(breaks=seq(2018,2030,2))  +  xlab("Year") + ylim(0,3000) + ylab("Tier 3 ABC (kt)") + geom_point() + 
    geom_line(aes(y=Cabc)) + geom_line(aes(y=Cofl),linetype="dashed") + geom_line(data=bfss,aes(x=Yr,y=Catch,col=as.factor(Sim)))+ guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE) 
  p2 <- pf %>% filter(substr(variable,1,1)=="S",variable!="SSBStdn",Alt==2) %>% select(Yr,variable,value) %>% spread(variable,value) %>%
    ggplot(aes(x=Yr,y=SSBMean),width=1.2) + geom_ribbon(aes(ymax=SSBUCI,ymin=SSBLCI),fill="coral",alpha=.5) + .THEME + geom_line() +
    scale_x_continuous(breaks=seq(2018,2030,2))  +  xlab("Year") + ylim(0,5000) + ylab("Tier 3 Spawning biomass (kt)") + geom_point() + 
    geom_line(aes(y=SSBFabc)) + geom_line(aes(y=SSBFofl),linetype="dashed")+ geom_line(data=bfss,aes(x=Yr,y=SSB,col=as.factor(Sim)))+ guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE) 
  t3 <- grid.arrange(p1, p2, nrow=2)
  ggsave("figs/tier3_proj.pdf",plot=t3,width=5.4,height=7,units="in")
}


fc  <- (read_csv("data/fig_captions.csv"))
figcap <- fc$cap; figlab <- fc$label
reffig <- function(i){ cat(paste0("\ref{fig:",figlab[i],"}")) }  
printfig <- function(tmp,i){ cat(paste0("\n![",figcap[i],"\\label{fig:",figlab[i],"}](figs/",tmp,")   \n\n")) } 

tc  <- (read_csv("data/table_captions.csv"))
tabcap <- tc$cap; tablab <- tc$label
# tap <- data_frame(t=c(1,2),c=c(1,2))
printtab <- function(tmp,i){tab <- xtable(tmp, digits=0, auto=TRUE,caption = tabcap[i], label = paste0("tab:",tablab[i])); print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x}) } 
reftab <- function(i){ cat(paste0("tab:",tablab[i])) }  
