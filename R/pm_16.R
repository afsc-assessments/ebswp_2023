rm(list=ls())
#-------------------------------------------------------------------------------
# Visual compare runs
#-------------------------------------------------------------------------------
#source("R/compareRuns.r")
R
source("../R/prelims.R")
ls()
# Read in the output of the assessment
# Read in model results
i=7
for (i in 0:4) {
for (i in c(".1",1,5,50,100,200,420,500)) {
#--- get M profile------
for (i in 10:30) {
  rn=paste0("16.1m/arc/r_R",i,".rep")
  mn=paste0("m",i)
  assign(mn,readList(rn))
  print(rn)
}
pset <- list( p.1=p.1,p1 = p1, p5 = p5, p50 = p50, p100 = p100, p200 = p200,p420=p420,p500=p500)
AgeFits("t5/arc/p_R420.rep")
AgeFits(p420)
AgeFits("t5/arc/p_R1.rep")
AgeFits(labrep.file="16.1/For_R.rep",case_label="2016 Assessment")
AgeFits(labrep.file="16.1/For_R.rep",case_label="2016 Assessment")
AgeFits(labrep.file="b0.5/For_R.rep",case_label="2016 Assessment")
AgeFits(labrep.file="b0.1/For_R.rep",case_label="2016 Assessment")
AgeFits(labrep.file="b1.0/For_R.rep",case_label="2016 Assessment")
AgeFits(labrep.file="b0.0/For_R.rep",case_label="2016 Assessment")
AgeFitsSrv(labrep.file="b0.0/For_R.rep",case_label="2016 Assessment")
AgeFits(labrep.file=paste("t5/arc/p_R1.rep",sep=""),case_label="2016 Assessment")
AgeFits
ls()
modsc$FW_fsh
mod16.02$FW_fsh
df <- data.frame(wt=c(.1,1,5,50,100,200,420,500),FW=1:8 )
df <- data.frame(wt=c(0,.1,.5,1,50),FW_fsh=1:5,FW_bts=1:5 )
for (i in 1:5) 
  {
    df$FW_fsh[i] <- scset[[i]]$FW_fsh
    df$FW_bts[i] <- scset[[i]]$FW_bts
  }
df
ggplot(df,aes(x=wt,y=FW)) + geom_line()
length(pset)
getwd()
mod4$yr_bts
modc <- readList("c/For_R.rep")
modca <- readList("ca/For_R.rep")
modcab <- readList("cab/For_R.rep")
modcabe <- readList("cabe/For_R.rep")
cabeset <- list( c = modc, ca = modca, cab = modcab, cabe= modcabe)
mod16.01 <- readList("16.01/For_R.rep")
mod16.01 <- readList("16.01/For_R.rep")
mod16.01 <- readList("16.01/For_R.rep")
mod16.01 <- readList("16.01/For_R.rep")
mod16.02 <- readList("16.02/For_R.rep")
modsc <- readList("sc/For_R.rep")

mod0.0 <- readList("0.0/For_R.rep")
mod15.1 <- readList("15.1/For_R.rep")
mod16.1 <- readList("16.1/For_R.rep")
modlst <- list("16.1"=mod16.1,  "15.1 2016"=mod15.1,"15.1 2015"=mod0.0) 
modlst <- list("15.1 2015"=mod0.0, "15.1 2016"=mod15.1,"16.1"=mod16.1  )
modlst <- list("16.1"=mod16.1,  "15.1 2016"=mod15.1,"15.1 2015"=mod0.0) 
plot_srr(modlst,alpha=.4,xlim=c(0,5000),ylim=c(0,90000))
plot_ssb(modlst,xlim=c(2005,2016),alpha=.3)
plot_recruitment(modlst,xlim=c(2004.5,2016.5))
plot_ssb(modlst,xlim=c(2004.5,2016.5),alpha=.3)
plot_recruitment(modlst,xlim=c(1963.5,2016.5))

srrset4 <- list("base condition"=mod16.1,  "Mod condition"=mod16.1a, "Low condition"=mod16.1b  )
mod16.1a <- readList("16.1a/For_R.rep")
mod16.1b <- readList("16.1b/For_R.rep")
srrset1<- list("base condition"=mod16.1) 
srrset2 <- list("base condition"=mod16.1,  "Mod condition"=mod16.1a )
srrset3 <- list("base condition"=mod16.1,  "Low condition"=mod16.1b) 
srrset4 <- list("base condition"=mod16.1,  "Mod condition"=mod16.1a, "Low condition"=mod16.1b  )
plot_srr(srrset1,alpha=.4,xlim=c(0,5000),ylim=c(0,90000))
plot_srr(srrset2,alpha=.4,xlim=c(0,5000),ylim=c(0,90000))
plot_srr(srrset3,alpha=.4,xlim=c(0,5000),ylim=c(0,90000))
plot_srr(srrset4,alpha=.4,xlim=c(0,5000),ylim=c(0,90000))
plot_srr(srrset3,alpha=.4,xlim=c(0,5000))
,ylim=c(0,190000))
plot_srr(srrset4,alpha=.3,xlim=c(0,5000),ylim=c(0,90000))
mod16.1 <- readList("16.1/For_R.rep")
mod16.1g <- readList("16.1g/For_R.rep")
modb0.0 <- readList("b0.0/For_R.rep")
modb0.1 <- readList("b0.1/For_R.rep")
modb0.5 <- readList("b0.5/For_R.rep")
modb1.0 <- readList("b1.0/For_R.rep")
modb100 <- readList("16.02/For_R.rep")
base <- list("Base"=mod16.1)
, "Geostatistical"=mod16.1g)
geo <- list("Base"=mod16.1, "Geostatistical"=mod16.1g)
 , "Mod. constraint"=modb0.5 , "Little constraint"=modb1.0 , "Diffuse"=modb100) 
scset <- list("Fixed Sel"=modb0.0, "Constrained"=modb0.1 , "Mod. constraint"=modb0.5 , "Little constraint"=modb1.0 , "Diffuse"=modb100) 
scset <- list("base"=modb100,  "Mod. constraint"=modb0.5 )
, "Little constraint"=modb1.0 , "Diffuse"=modb100) 
names(scset)/
plot_ssb(geo,xlim=c(1990,2017))
plot_ssb(geo,xlim=c(1990,2017))
plot_ssb(shit,xlim=c(2005,2016),alpha=.25)
plot_ssb(cabeset,xlim=c(2008,2016),alpha=.25)
plot_ssb(cabeset,xlim=c(1990,2016),alpha=.25)
plot_ssb(scset)
plot_bts(cabeset)
plot_eit(cabeset,ylim=c(0,16000))
plot_bts(cabeset,ylim=c(0,18000))
plot_recruitment(scset)
plot_ssb(scset)
plot_recruitment(base,xlim=c(1963.5,2016.5))
plot_recruitment(base,xlim=c(1963.5,2016.5))
plot_mnage(scset)
plot_mnage(base)
dt <- data.table(yr=mod16.1$SSB[1:52,1],ssb= mod16.1$SSB[1:52,2], r=mod16.1$R[2:53,2] )
dt$rs <- log(dt$r/dt$ssb)
ggplot(dt,aes(x=yr,y=rs)) + geom_point(size=4,col="red") + geom_line() +geom_smooth() + .THEME + ylab("ln(Recruits/spawning biomass)") + xlab("Year")
ggplot(dt,aes(x=ssb,y=rs)) + geom_point(size=4,col="red") + geom_path() +geom_smooth(method="lm") + .THEME + ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)")
ggplot(dt,aes(x=ssb,y=rs)) + geom_text(size=5,col="red",label=dt$yr) + geom_path(size=.5) +geom_smooth(method="lm") + .THEME + ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)")
AgeFits(modb100,rec_age=1,case_label="Base 16.01")
# Wt age fig for survey scaling
wdf <- read.table("wtage.dat",header=TRUE)
ggplot(wdf,aes(x=fsh,y=srv,col=as.factor(age))) + .THEME + geom_abline(intercept=0,slope=1) +
geom_point(size=3) + xlab("Scaled survey weights at age and year (kg)") + ylab("Fishery weights at age (kg)") +
 scale_colour_discrete(guide=FALSE) #+ theme(legend.position="none")
getwd()

ts <- data.table(read.table("16.1/F40_t.rep",header=TRUE))
names(ts)
ggplot(ts,aes(x=Year,y=Implied_SPR)) + .THEME + geom_line(size=2.7,color="salmon")  + ylab("Realized SPR") + geom_hline(yintercept=mean(ts$Implied_SPR)) 
ggplot(ts,aes(x=Year,y=B.Bmsy)) + .THEME + geom_line(size=2.7,color="salmon")  + xlim(c(1990,2016)) + ylim(c(0,1.8)) + geom_hline(yintercept=1) + ylab("B/Bmsy")
mod14.1 <- readList("14.1/For_R.rep")
mod0.0 <- readList("0.0/For_R.rep")
modt1 <- readList("t1/For_R.rep")
modt2 <- readList("t2/For_R.rep")
modt3 <- readList("t3/For_R.rep")
modt4 <- readList("16.02/For_R.rep")
modset1 <- list( s10 = modt1, s5 = modt2, s2 = modt3, s1= modt4)
modset1 <- list( s10 = modt1, s5 = modt2, s2 = modt3, s1= modt4)
modset1 <- list( s10 = modt1, s5 = modt2, s2 = modt3, s1= modt4)
FWpset[[1]]$FW_fsh
plot_sel(modt4)
plot_ssb(pset)
plot_bts(pset)
modt4

plot_ssb(modset1)
modset1 <- list( Base = modt1)
plot_mnage(modset1)
plot_mnage(modset1)
plot_mnage(list(modt4))
plot_sel(modt3)
plot_sel(modt2)
plot_sel(mod15.1)
#Selectivity
#mod0.0 <- readList("0.0/For_R.rep")
#mod16.03 <- readList("16.03/For_R.rep")
mod0    <- readList("../../prg/arc/mod2.1_for_R.rep")

modset0 <- list( "2015 Assessment" = mod0.0, Current = modcabe)
ms0 <- list( "2015 Assessment" = mod0.0)
modset1 <- list( "14.1" = mod14.1, "15.1" = mod15.1)
modset1 <- list( Base = mod0.0,Last_yr = mod0)
modset1 <- list( "15.1" = mod15.1,Last_yr = mod0.0)
modset2 <- list( "14.1" = mod14.1,"15.1" = mod15.1, "16.01" = mod16.01, "16.02" = mod16.02)
modset2 <- list( "16.01" = mod16.01, "16.02" = mod16.02)

modset2 <- list( "16.02" = mod16.02, "sc" = modsc)
cbind(mod15.1$ot_bts, mod16.01$ot_bts, mod16.02$ot_bts, mod16.03$ot_bts)
cbind(mod15.1$ob_bts, mod16.01$ob_bts, mod16.02$ob_bts, mod16.03$ob_bts)
cbind(mod15.1$eb_bts, mod16.01$eb_bts, mod16.02$eb_bts, mod16.03$eb_bts)
plot_ssb(modset0,xlim=c(1980,2016),alpha=.3)
plot_ssb(modset1,xlim=c(1980,2016),alpha=.3)
plot_ssb(modset2,xlim=c(2000,2016),alpha=.13)
plot_ssb(modset1,xlim=c(1980,2016),alpha=.13)
plot_bts(modset0)
plot_bts(modset1,biomass=FALSE,ylab="Bottom trawl survey numbers")
plot_bts(modset2,biomass=FALSE,ylab="Bottom trawl survey numbers")
plot_bts(modset2)
,biomass=FALSE,ylab="Bottom trawl survey numbers")
plot_eit(modset2)
names(mod0.0)
mod0.0$steepness
modcabe$steepness
plot_srr(ms0,alpha=.2,xlim=c(0,5000),ylim=c(0,80000))
plot_srr(list(modcabe),alpha=.2,xlim=c(0,5000),ylim=c(0,80000))
plot_srr(modset0,alpha=.2,xlim=c(0,5000),ylim=c(0,80000))
plot_srr(modset1,alpha=.2,xlim=c(0,5000),ylim=c(0,80000))
plot_srr(modset2,alpha=.2,xlim=c(0,5000),ylim=c(0,80000))
,Model_1= mod1, Model_2= mod2, Model_3= mod3, Model_4= mod4)

# AVO Figure (also one in excel...)
avo <- data.table(pred=mod16.1$pred_avo,obs=mod16.1$obs_avo,yr=2006:2015)
ggplot(avo,aes(x=yr,y=obs)) + geom_errorbar(ymin=avo$obs-avo$obs*.25,ymax=avo$obs+avo$obs*.25) + geom_line(aes(x=avo$yr,y=avo$pred)) + .THEME + geom_point(size=4,col="red") + xlab("Year") + 
             scale_x_continuous(breaks=seq(2006,2016,1)) + ylab("AVO index") + ylim(c(0,1.5))

at <-read.table("at_srv.dat",header=T)
ggplot(at,aes(x=yr,y=at)) + geom_smooth() + .THEME + geom_point(size=4,color="red") + xlab("Year") + 
             scale_x_continuous(breaks=seq(1982,2016,2)) + ylab("Survey biomass (millions of t)") + ylim(c(0,6.5))
             


cbind(mod16.03$ot_bts, mod15.1$ot_bts)
cbind(mod16.01$ob_bts, mod15.1$ob_bts)
cbind(mod14.1$ob_bts, mod15.1$ob_bts)
h_prior
q_prior        
m11$surv_like     
m11$cpue_like      
m11$avo_like      
m11$sel_like       
m11$sel_like_dev  
m11$age_like       
m11$len_like       
m11$rec_like       
 repl_yld       
 repl_SSB       
 Yr             
 steepness     
  SR_resids     
  sigr           
  SRR_SSB        
  rechat         
  repl_F        
  future_SSB    
  SSB
"future_SSB.sd"  "catch_future"   "Fcur_Fmsy"      "Fcur_Fmsy.sd"  
"Bcur_Bmsy"      "Bcur_Bmsy.sd"   "Bcur_Bmean"     "Bcur_Bmean.sd" 
"Bcur2_Bmsy"     "Bcur2_Bmsy.sd"  "Bcur2_B20"      "Bcur2_B20.sd"  
"Bcur3_Bcur"     "Bcur3_Bcur.sd"  "Bcur3_Bmean"    "Bcur3_Bmean.sd"
"LTA1_5R"        "LTA1_5R.sd"     "MatAgeDiv1"     "MatAgeDiv1.sd" 
"MatAgeDiv2"     "MatAgeDiv2.sd"  "RelEffort"      "RelEffort.sd"  
"LTA1_5"         "LTA1_5.sd"      "SER"            "SSB"           
"R"              "N"              "yrs_avo"        "obs_avo"       
"obs_avo_std"    "pred_avo"       "pobs_fsh"       "phat_fsh"      
"phat_bts"       "phat_eit"       "pobs_biom_bts"  "pobs_eit"      
"EffN_Fsh_1"     "F"              "P_SSB"          "wt_ssb"        
"wt_cur"         "wt_cur.sd"      "wt_next"        "wt_next.sd"    
"wt_yraf"        "wt_yraf.sd"     "wt_fsh"         

names(mod4)
.OVERlAY=TRUE
.OVERlAY=FALSE
lstOuts <- list( Model_0= mod0,Model_1= mod1, Model_2= mod2, Model_3= mod3, Model_4= mod4)
retouts <- list( r0= r_16.1_0, r1= r_16.1_1, r2= r_16.1_2, r3= r_16.1_3, r4= r_16.1_4, r5= r_16.1_5, r6= r_16.1_6, r7= r_16.1_7, r8= r_16.1_8, r9= r_16.1_9, r10= r_16.1_10)
mouts <- list( m10= m10,   m11= m11,   m12= m12,   m13= m13,   m14= m14,   m15= m15,   m16= m16,   m17= m17,   m18= m18,   m19= m19,   m20= m20,   m21= m21,   m22= m22,   m23= m23,   m24= m24,   m25= m25,   m26= m26,   m27= m27,   m28= m28,   m29= m29,   m30= m30 )
plot_ssb(mouts,xlim=c(2000,2016),alpha=.2)
names(mouts)
= r_16.1_1, r2= r_16.1_2, r3= r_16.1_3, r4= r_16.1_4, r5= r_16.1_5, r6= r_16.1_6, r7= r_16.1_7, r8= r_16.1_8, r9= r_16.1_9, r10= r_16.1_10)
ls()
plot_ssb(modset1,xlim=c(1980,2015),alpha=.3)
plot_ssb(lstOuts,xlim=c(1995,2016),alpha=.3)
plot_recruitment(lstOuts,xlim=c(2000,2017))
p <- plot_recruitment(modset0,xlim=c(2004.5,2015.5)) 
p
print(p  + scale_fill_brewer(palette = "Accent") + scale_color_brewer(palette = "Accent") + geom_hline(yintercept=mean(modcabe$R[,2])) )
plot_bts(modset1)
plot_bts(lstOuts,biomass=FALSE,ylab="Bottom trawl survey numbers")
plot_eit(lstOuts)
plot_eit(lstOuts,biomass=FALSE,ylab="Acoustic trawl survey numbers")
lstOuts <- list( Model_1= mod1,Model_3= mod3)
lstOuts <- list( Model_1= mod1,Model_2= mod2)
lstOuts <- list( Model_2= mod2,Model_3= mod3)
lstOuts <- list( Model_3= mod3, Model_4= mod4)
lstOuts <- list( Model_0= mod0,Model_1= mod1, Model_2= mod2, Model_3= mod3, Model_4= mod4)
lstOuts <- list( Model_1= mod1, Model_2= mod2, Model_3= mod3, Model_4= mod4, Model_5= mod5, Model_6= mod6, Model_7= mod7 )
# -- Get likelihoods--------------
dt <- .get_like_df(mouts)
plot_lik
ggplot(dt,aes(x=Model,y=NLL)) + geom_line() + .THEME
tab     <- cbind(lstOuts[[1]]$Like_Comp_names,do.call(cbind,lapply(lstOuts,function(x){round(x[["Like_Comp"]],2)})))
tab
write.csv(tab,file=file.path(inputPath,"LikelihoodTable2015.csv"),row.names=F)
system(paste("open ",inputPath,"/LikelihoodTable2015.csv",sep=""))
lstOuts   <- list( Model_1= mod1, Model_5= mod5, Model_6= mod6, Model_7= mod7 )
lstOuts   <- list( Model_1= mod1, Model_5= mod5, Model_7= mod7 )
lstOuts   <- list( Model_1= mod1, Model_7= mod7 )
lstOuts   <- list( Model_1= mod1, Model_2= mod2 )
names(mod1)
mod1$M
mod2$M

#SSB ============================================================
df  <- data.table(Model = "Model 1", mod1$SSB )
for (i in 2:2) df <- rbind(df, data.table(Model=paste0("Model ",i),lstOuts[[i]]$SSB))
names(df) <- c("Model","yr","SSB","SE","lb","ub")
bdf <- filter(df,yr>1980,yr<=2016) %>% arrange(yr)
bdf

# try over same time range...
p1 <- ggplot() + scale_y_continuous(limits=c(0,6000)) + ylab("Spawning biomass") + xlab("Year") +  mytheme + geom_line(data=bdf,aes(x=yr,y=SSB,type=Model)) +
           geom_ribbon(data=bdf ,aes(x=yr,y=SSB,ymin=lb,ymax=ub,fill=Model),alpha=.7)  + guides(alpha=FALSE,col=FALSE) 
p1
#Recruits==========================================================
mytheme = mytheme + theme(axis.text.x = element_text(angle=90, hjust=1, vjust=.5))
rdf <- data.frame(modcabe$R)
rdf <- cbind(rdf,"16.02")
names(rdf) <- c("yr","R","se","lb","ub","case")
rdf  <- filter(rdf , yr>1990,yr<2016)
mnR <- mean(rdf$R)
mnR
rdf0 <- data.frame(mod0.0$R)
rdf0 <- cbind(rdf0,"15.1")
names(rdf0) <- c("yr","R","se","lb","ub","case")
rdf0 <- filter(rdf0, yr>1990,yr<2016)
rdf <- rbind(rdf0,rdf)
tbl_df(rdf)
dodge <- position_dodge(width=0.8)
mytheme <- .THEME
ggplot(rdf,aes(x=yr,y=R,fill=case)) + xlab("Year class") + ylab("Age 1 recruits (10e6)") + 
       geom_bar(width=0.75,position="dodge" ,stat="identity",aes(fill=case)) + 
       geom_errorbar(aes(ymin=lb,ymax=ub),width=.3,colour="blue",position=dodge) + mytheme + geom_hline(aes(yintercept=mnR),linetype="dashed")

  #scale_y_continuous(limits=c(0,1800))+
     ggtitle("2014") + mytheme
     ggtitle("2015") + mytheme

df <- data.frame(Year=1977:2015,mod5$M)
ggplot(df,aes(x=Year,y=X1))+geom_line(size=2) + mytheme + ylab("Natural mortality") + ylim(c(0,.4))

#-------------------------------------------------------------------------------
# Fit to survey data
dt <- data.frame(mod1$Obs_Survey_1[,1:3],mod2$Obs_Survey_1[,3],mod3$Obs_Survey_1[,3],mod4$Obs_Survey_1[,3])
dt <- data.table(dt)
names(dt) <- c("Year","Observed","Model_1","Model_2","Model_3","Model_4")
dt<-melt(dt,id="Year")
dt
,aes(x=Age,y=value,colour=variable)) 
ggplot(dt,aes(x=Year,y=value,col=variable)) + geom_point(data=dt[variable=="Observed"],size=3) + geom_line(data=dt[variable!="Observed"]) + ylim(c(0,1500000)) + labs(x="Year",y="Survey biomass") + mytheme #+
            geom_line(data=)
#-------------------------------------------------------------------------------
#Selectivity
            mod1$sel_fsh_1
df <- data.frame(mod1$sel_fsh_1[,2:13] ); names(df) <- c("yr",1:11)
sdf <- gather(df,age,sel,2:12) %>% filter(yr>1990) %>% mutate(age=as.numeric(age)) #+ arrange(age,yr)
p1 <- ggplot(sdf, aes(x=age,y=sel/2+yr,group=yr)) +                  geom_ribbon(aes(ymin=yr,ymax=sel/1.9+yr),fill="tan",col="grey60",alpha=.3)  + ylab("")                        + xlab("Age") + guides(fill=FALSE,alpha=FALSE,col=FALSE) + mytheme
p1 <- p1 + scale_x_continuous(breaks = seq(1940, 1976, by = 4))
df <- data.frame(mod3$sel_fsh_1[,2:13] )%>% arrange(yr,age) ; names(df) <- c("yr",1:11)
sdf <- gather(df,age,sel,2:12) %>% filter(yr>1990) %>% mutate(age=as.numeric(age)) #+ arrange(age,yr)
p2 <- ggplot(sdf, aes(x=age,y=sel/2+yr,group=yr)) +                  geom_ribbon(aes(ymin=yr,ymax=sel/1.9+yr),fill="tan",col="grey60",alpha=.3)  + ylab("")                        + xlab("Age") + guides(fill=FALSE,alpha=FALSE,col=FALSE) + mytheme
grid.arrange(p1,p2,ncol=2)

df
p1

mod7$M
mod2$M_equil
IndexFit(mod16.02,yf=1980,yl=2015,f=1,main="Model 1",ylab="Survey biomass (t)")
IndexFit(mod5,yf=1980,yl=2015,f=1,main="Model 5",ylab="Survey biomass (t)")
IndexFit(mod7,yf=1980,yl=2015,f=1,main="Model 4",ylab="Survey biomass (t)")

AgeFits(mod0.0,rec_age=1,case_label="Model 1 assessment")
AgeFits(mod7,rec_age=1,case_label="Model 6 assessment")
AgeFits(mod4,rec_age=1,case_label="Model 4 assessment")
IndexFit(mod2,yf=1980,yl=2015,f=1,main="Model 2",ylab="Survey biomass (t)")
AgeFits(mod1,rec_age=1,case_label="Model 1 assessment")
AgeFits(mod2,rec_age=1,case_label="Model 2 assessment")
AgeFitsSrv(mod1,rec_age=1,case_label="2015 assessment")
Plot_Fspr()

#Selectivity==============================================
df <- data.frame(Model="Model 1",mod1$sel_fsh_1[,2:13] ); 
for (i in 2:7) df <- rbind(df, data.frame(Model=paste0("Model ",i),lstOuts[[i]]$sel_fsh_1[,2:13] ))
names(df) <- c("Model","yr",1:11)
sdf <- gather(df,age,sel,3:13)
tbl_df(sdf)
sdf$age <- as.numeric(sdf$age)
sdf <- data.table(sdf)
sdf <- sdf[yr>2010, (Selectivity=mean(sel)),.(Model,age)]
ggplot(sdf ,aes(x=age,y=V1,colour=Model),size=1.2) + geom_line(size=2) +ylab("Fishery selectivity") +xlab("Age")+ mytheme #+ facet_grid(yr~.)
#-------------------------------------------------------------------------------

p1 <- dplyr::filter(sdf,yr>1979) %>% arrange(yr,age) %>%ggplot(aes(x=age,y=sel/2+yr,group=yr)) + geom_ribbon(aes(ymin=yr,ymax=sel/1.9+yr),fill="tan",col="grey60",alpha=.3)  + ylab("Selectivity by year") + xlab("Age") + guides(fill=FALSE,alpha=FALSE,col=FALSE) + mytheme
p1

#-------------------------------------------------------------------------------
compareTime(lstOuts,"SSB",SD=T,Sum=NULL,legendPos="right",startYear=1980)
compareTime(lstOuts,"SSB",SD=F,Sum=NULL,startYear=1953)
compareTime(lstOuts,"R",SD=T)
compareTime(lstOuts,"TotBiom",SD=T)
compareMatrix(lstOuts,"TotF",SD=TRUE,Sum=NULL,YrInd=mod1$Yr,Apply=mean,legendPos="right")
#-------------------------------------------------------------------------------

p1 <- dplyr::filter(sdf,yr>1979) %>% arrange(yr,age) %>%ggplot(aes(x=age,y=sel/2+yr,group=yr)) + geom_ribbon(aes(ymin=yr,ymax=sel/1.9+yr),fill="tan",col="grey60",alpha=.3)  + ylab("Selectivity by year") + xlab("Age") + guides(fill=FALSE,alpha=FALSE,col=FALSE) + mytheme
p1
p2 <- dplyr::filter(sdf,yr>2002) %>% ggplot(aes(x=age,y=sel/2+yr,group=yr)) +                  geom_ribbon(aes(ymin=yr,ymax=sel/1.9+yr),fill="tan",col="grey60",alpha=.3)  + ylab("")                        + xlab("Age") + guides(fill=FALSE,alpha=FALSE,col=FALSE) + mytheme
grid.arrange(p1,p2,ncol=2)

p2 <- dplyr::filter(sdf,yr>1977) %>% ggplot(aes(x=age,y=sel/2+yr,group=yr)) + geom_ribbon(aes(ymin=yr,ymax=sel/1.6+yr,fill="salmon",col="grey",alpha=.2))  + ylab("")                        + xlab("Age") + guides(fill=FALSE,alpha=FALSE,col=FALSE) + mytheme

#Survey selectivity==============================================
mod1$sel_ind_1
srv_sel <- mod1$sel_ind_1[1,3:13]
srv_sel <- data.frame(Age=1:11,Selectivity=srv_sel/max(srv_sel))
srv_sel
mytheme = mytheme + theme(axis.text.x = element_text(angle=0, hjust=1, vjust=.5))
ggplot(srv_sel) + geom_line(aes(x=Age,y=Selectivity),size=2) +mytheme
#=====================
# Retro
# get all retrospectives
#=====================
#r_R11.rep
setwd(outdir)
outdir
# Read in retro results
j=16.1
i=0
retouts <- list()
  for (i in 0:10) {
    rn=paste0(j,"/arc/r_R",i,".rep")
    mn=paste0("r_",j,"_",i)
    assign(mn,readList(rn))
    print(rn)
    #retouts[[mn]] <- list(get(mn))
  }
  names(retouts[[1]])
  names(retouts)
plot_retro(retouts)
plot_ssb_rel(retouts,xlim=c(1995,2016),ylim=c(0.5,1.5),legend=FALSE,alpha=.2)
plot_ssb(retouts,xlim=c(1995,2016),legend=FALSE,alpha=.2)

rc = retouts[[1]]$SSB[,2]
rc
ntmp=0
rho=0
for (i in 1:10) {
  dtmp <- retouts[[i]]$SSB[,2]
  lr   <- length(dtmp)
  ntmp <- ntmp+(dtmp[lr] - rc[lr])/rc[lr]
  rho  <- rho + (-(dtmp[i]-rc[i]))/rc[lr]
  print(paste(i,ntmp/i,rho))
}    
getwd()
tab
library(grid)
p1 <- ggplot() + scale_y_continuous(limits=c(0,590000)) + ylab("Spawning biomass") + xlab("Year") +  mytheme + geom_line(data=bdf,aes(x=yr,y=SSB),size=4) +
           geom_ribbon(data=bdf ,aes(x=yr,y=SSB,ymin=lb,ymax=ub),fill="tan",col="grey",alpha=.6)  + guides(fill=FALSE,alpha=FALSE,col=FALSE) 
for (i in 0:10) {
  rn=paste("r_1_",i,sep="");
  tdf <- data.frame(get(rn)$SSB); names(tdf) <- c("yr","SSB","SE","lb","ub"); tdf <- filter(tdf,yr>1977)
  p1 <- p1 + geom_line(data=tdf,aes(x=yr,y=SSB),col=i,linetype=i,size=1.25)
  #p1 <- p1 + geom_segment(data=tdf,aes(x=yr,xend=yr,yend=SSB,y=SSB),arrow=arrow(angle=90,length=unit(.2,"cm")),size=2,col=i)
  tdf <- tdf[dim(tdf)[1],]
  p1 <- p1 + geom_point(data=tdf,aes(x=yr,y=SSB),size=4,col=i)
  #p1 <- p1 + geom_point(get(rn)$SSB[lr,1],get(rn)$SSB[lr,2],pch=19,col=i)
}
p1
# If you want to post lines when new survey data arrive...
# p1 <- p1 +  geom_vline(xintercept=c(2014,2012,2010,2008),linetype="dashed",size=1,col="grey")
# Color blind palette
# cb_palette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# p1 <-    p1 + scale_fill_manual(values=cb_palette)
df <- data.frame(r_1_0$SSB )
plot_retro(rn="r_1",main="1-yr blocks")
plot_retro(rn="r_420",main="1-yr blocks, Francis-weights ~ 1.0")
plot_retro("r_420")
#grid.arrange(p1,p2,nrow=2)


#============================================================kkkkkkkkkk
# Model selected for 2013

# used in doc to compare this year w/ last...

rec_age=1
p.rec.hist(mod1,main="Model 1",ylab="Recruitment to age",fy=1930,ly=2015,plotmean="T")
# Survey fit
IndexFit(mod1,yf=1980,yl=2015,f=1,main="Model 1", ,ylab="Survey biomass (t)")
p.catch.fit(mod1,f=1,ylim=c(0,10000))
plot(mod1$SSB,typ="b",ylab="SSB",xlab="Year",ylim=c(0,.65e6))
mod1$SSB

#pdf(paste(Figdir,"TotB.pdf",sep=""),width=9, height=7)
detach(dat)
p.biom.pol(mod1,typ="SSB",main="Model 1",new=F,fy=1977,ly=2016)
lines(mod1$TotBiom[,1],mod1$TotBiom[,2],col="black",lty=2,lwd=3)
p.biom.pol(mod1,typ="TB",main="Model 1",new=F,fy=1977,ly=2014)
#dev.off()

styr=1976
p.stock.rec(mod6,main="Atka mackerel")
p.stock.rec(mod1,main="Atka mackerel")
p.eff.n(mod6,typ="F",f=1,main="Model")
p.eff.n(mod1,typ="S",f=1,main="Model 1")
AgeFits(mod1,rec_age=1,case_label="2015 assessment")
AgeFitsSrv(mod1,rec_age=1,case_label="2015 assessment")
#dev.off()
detach(dat)
# spawning biomass and last year's estimates 
p.biom.pol(mod1,typ="SSB",new=F,fy=1977,ly=2015)
lines(1976:2016,mod5$SSB[12:52,2],lwd=2)
#names(mod1)

# Rec
p.biom.stk(mod1,typ="R")
# Numbers at age
p.bub.age(mod1,siz=1000)
#dev.off()

p.rec.hist(mod1,fy=1977,ly=2015,main="Model 1")
lines(modsigmaR$R[,1],modsigmaR$R[,2],col="purple",lwd=2)
#dev.off()

# Likelihood table
tab       <- cbind(lstOuts[[1]]$Like_Comp_names,do.call(cbind,lapply(lstOuts,function(x){round(x[["Like_Comp"]],2)})))
tab
do.call(cbind,lapply(lstOuts,function(x){round(x[["Like_Comp"]],2)}))
do.call(cbind,lapply(lstOuts,function(x){round(x[["Like_Comp"]],2)}))
rbind(
cbind("q",do.call(cbind,lapply(lstOuts,function(x){round(x[["q_1"]][1,2],2)}))),
cbind("Npars",do.call(cbind,lapply(lstOuts,function(x){round(x[["Num_parameters_Est"]],2)}))),
cbind("M",do.call(cbind,lapply(lstOuts,function(x){round(x[["Mest"]][2],2)}))),
cbind("SigmaR",do.call(cbind,lapply(lstOuts,function(x){round(x[["Sigmar"]][2],2)}))),
cbind("EffN_Fish",do.call(cbind,lapply(lstOuts,function(x){round(mean(x[["EffN_Fsh_1"]][,2]),2)}))),
cbind("EffN_Surv",do.call(cbind,lapply(lstOuts,function(x){round(mean(x[["EffN_Survey_1"]][,2]),2)}))),
tab,
cbind("F2014",do.call(cbind,lapply(lstOuts,function(x){round((x[["F_fsh_1"]][38,2]),2)}))),
cbind("F2014/F40%",do.call(cbind,lapply(lstOuts,function(x){round((x[["F_fsh_1"]][38,2])/(x[["F40_est"]]),2)}))),
cbind("B 1977",do.call(cbind,lapply(lstOuts,function(x){round((x[["TotBiom"]][1,2]),0)}))),
cbind("CV",do.call(cbind,lapply(lstOuts,function(x){round((x[["TotBiom"]][1,3])/(x[["TotBiom"]][1,2])*100,0)}))),
cbind("B 2014",do.call(cbind,lapply(lstOuts,function(x){round((x[["TotBiom"]][38,2]),0)}))),
cbind("CV",do.call(cbind,lapply(lstOuts,function(x){round((x[["TotBiom"]][38,3])/(x[["TotBiom"]][38,2])*100,0)}))),
cbind("2001 YC",do.call(cbind,lapply(lstOuts,function(x){round((x[["R"]][26,2]),0)}))),
cbind("CV",do.call(cbind,lapply(lstOuts,function(x){round((x[["R"]][26,3])/(x[["R"]][26,2])*100,0)}))),
cbind("2006 YC",do.call(cbind,lapply(lstOuts,function(x){round((x[["R"]][31,2]),0)}))),
cbind("CV",do.call(cbind,lapply(lstOuts,function(x){round((x[["R"]][31,3])/(x[["R"]][31,2])*100,0)})))
)

?do.call
names(mod1)



mod1$Like_Comp
mod1$Like_Comp_names
SSB_Lastyr=read.table("clipboard")
names(mod1)

p.biom.pol(mod0,typ="SSB",new=F)
p.biom.pol(mod1,typ="SSB",new=F)
p.biom.pol(mod2,typ="SSB",new=F,main="Model 2".ly=2013)
lines(mod0$SSB[,1],mod0$SSB[,2],col="red")
lines(mod1$SSB[,1],mod1$SSB[,2],col="green")

#++++SSB CV figure=========================
plot(d3$SSB[,1],d3$SSB[,3]/d3$SSB[,2],typ="l",lty=2,ylim=c(0,.4),ylab="CV on spawning biomass",xlab="Year",cex.lab=1.4)
lines(d3$SSB[,1],d1$SSB[,3]/d1$SSB[,2],lwd=2)
lines(d3$SSB[,1],d2$SSB[,3]/d2$SSB[,2],lty=1)
lines(d3$SSB[,1],d7$SSB[,3]/d7$SSB[,2],lty=3)
legend(1968,.4, c("sigma_d=0.1","sigma_d=0.2","sigma_d=0.3", "sigma_d=1.0"),lty=c(1,1,2,3),lwd=c(2,1,1,1))

lines(modvsel$SSB[,1],modvsel$SSB[,2],col="red")
lines(mod2$SSB[,1],mod1$SSB[,2],col="purple",lwd=2)
lines(mod2$SSB[,1],mod2$SSB[,2],col="green",lwd=2)
lines(mod2$SSB[,1],mod3$SSB[,2],col="pink",lwd=2)
lines(mod2$SSB[,1],mod4$SSB[,2],col="black",lwd=2)

lines(modestM$SSB[,1],modestM$SSB[,2],col="salmon",lwd=2)
lines(modsigmaR$SSB[,1],modsigmaR$SSB[,2],col="purple",lwd=2)
modestM$Index_Q_1
names(mod1)

#++++Selectivity figure=========================
SelLastYr=c(0.00228954, 0.0333104,	0.337153,	0.879725,	1.13117,	1.32736,	1.619,	1.61509,	1.46665,	1.29413,	1.29413)
SelLastYr[[1]][1:11]
d1=readList(paste(outdir,"arc\\ds.1_R.rep",sep=""))
d2=readList(paste(outdir,"arc\\ds.2_R.rep",sep=""))
d3=readList(paste(outdir,"arc\\ds.3_R.rep",sep=""))
d7=readList(paste(outdir,"arc\\ds1.0_R.rep",sep=""))
q1.3=readList(paste(outdir,"arc\\q1.3_R.rep",sep=""))
plot(d1$N[36,3:12],typ="p",pch=19)
lines(d7$N[36,3:12])
k=36
plot(1:11,d3$sel_fsh_1[k,3:13]/max(d3$sel_fsh_1[k,3:13]),typ="l", ylab="Selectivity",xlab="Age",lwd=3, cex.lab=1.8)
lines(d1$sel_fsh_1[k,3:13]/max(d1$sel_fsh_1[k,3:13]),lty=2)
lines(d7$sel_fsh_1[k,3:13]/max(d7$sel_fsh_1[k,3:13]),lty=3)
lines(q1.3$sel_fsh_1[k,3:13]/max(q1.3$sel_fsh_1[k,3:13]),lty=3)
lines(SelLastYr/max(SelLastYr),lty=4)
SelLastYr
abline(h=.5)
legend(1,.95, c("sigma_d=0.3","sigma_d=0.1","sigma_d=1.0", "2011 Assessment"),lty=1:4,lwd=c(3,1,1,1,1))
#END ofSelectivity figure=========================


lines(mod1$TotBiom[,1],mod1$TotBiom[,2],lty=2,lwd=2)
pdf("Atka_2013.pdf",width=9, height=7)
Mntns(mod0,"Model 0")
Mntns(mod1,"Model 1")
Mntns(mod2,"Model 2")
mod1$Q_Survey_1
mod2$Q_Survey_1
dev.off()

pdf(paste(Figdir,"Selectivity.pdf",sep=""),width=7, height=11)
par(mfrow=c(1,2))
sel.age.mountain(mod1, f=1, new="F",typ="F", xvec=c(1:11),main="Model 1")
sel.age.mountain(mod2, f=1, new="F",typ="F", xvec=c(1:11),main="Model 2")
sel.age.mountain(mod2.2, f=1, new="F",typ="F", xvec=c(1:11),main="Model 2.2")
sel.age.mountain(mod1.2, f=1, new="F",typ="F", xvec=c(1:11),main="Model 2.2")
dev.off()
par(mfcol=c(1,1),mar=c(5,5,4,2) + 0.1)  

p.catch.fit(mod1,f=1,ylab="Catch biomass (t)",ylim=c(0,120000))
names(mod1)
                 
mod1$Fshry_names="Trawl"                 
spwn_ratio(mod1,main="Model 1")
cont.f.age.res(mod1, typ = "F", f = 1, lage = 1, hage = 11, cl ="COL")
p.bub.age(mod1,lage=1,hage=11,fy=1977,ly=2011,siz=100)
detach(dat)
Plot_Phase()
AgeFits(mod2,f=1,case_label="2013 assessment",rec_age=1)
AgeFits(mod1,f=1,case_label="2013 assessment",rec_age=1)
                 
modsigmaR$R
                 xlab="Age",ylab="Year",zscale=2.5,new=F,cex.yax=1.,fy=1980)
detach(dat)
IndexFit(mod,yf=1980,yl=2010,f=2,main=main)

par(mfcol=c(1,1))

# show fit to catch biomass
CatchFit(mod2.2)

# show spawning biomass relative to population with no fishing
spwn_ratio(mod1,fy=1962,ly=2015) 
fix(spwn_ratio) 

detach(dat)
# example of writing multiple plots to pdf file:
#pdf("figs/agefits.pdf",width=9, height=7)
  #AgeFits(am1,f=1)
#dev.off()

# another example of writing multiple plots to pdf file:
#pdf("figs/survey_fit.pdf",width=7, height=9)
#Mntns(am1,"Model 1")
    # Indices(am1,"Model 1")
par(mfrow=c(1,1))
IndexFit(mod1,main="Model 1",yf=1990,ylab="Survey biomass (t)")
detach(dat) 
Plot_Fspr()
source("R/Plot_Atkas.R")
#spwn_ratio(am1) 
#plt_proj(am1)
#dev.off()

dev.off()

p.biom.pol(retro2,typ="SSB",main="Model 1",new=F,fy=1977,ly=2013)
for (i in 1:9) {
  rn=paste0("retro1",i);
  lines(get(rn)$SSB[,1],get(rn)$SSB[,2],col=i)
}
pdf(paste(Figdir,"Retro_Mod2.pdf",sep=""),width=7, height=9)
par(mfrow=c(2,1))
p.biom.pol(retro0,typ="SSB",main="Model 2",new=F,fy=1977,ly=2017)
#plot(retro0$SSB[,1],retro0$SSB[,2],ylim=c(0,550),      ylab="Spawning biomass (kt)",type="l",lwd=2,xlab="",lty=2)
ssb=1966:2013
retro0$R
names(retro1)
rrr=1977:2012
for (i in 0:10) {
  rn=paste("retro",i,sep="");
  lines(get(rn)$SSB[,1],get(rn)$SSB[,2],col=i)
  ssb=rbind(ssb,c(t(get(rn)$SSB[,2]),rep(NA,i)))
  rrr=rbind(rrr,c(t(get(rn)$R[,2]),rep(NA,i)))
  }
plot(retro0$SSB[,1],rep(0,length(retro0$SSB[,1])),
     ylim=c(-.7,.7),
     ylab="Relative difference from terminal year",
     type="l",xlab="Year",lty=2,lwd=2)
for (i in 1:10) {
  rn=paste("retro",i,sep="");
  lines(get(rn)$SSB[,1],
        (get(rn)$SSB[,2]/retro0$SSB[1:(48-i),2])-1,col=i)
  }


dev.off()
p.biom.pol(mod2,typ="SSB",n.mod=1,main="Model 2",new=F,fy=1977,ly=2013)

p.biom.pol(mod2,typ="SSB",n.mod=2,mod1,main="Model 1",new=F,fy=1977,ly=2013)
lines(SSB_Lastyr[,1],SSB_Lastyr[,2]/2,lwd=2,col="red")

# Plot selectivity in multiple crappy panels
p.select.hist(mod1,typ="F",h="T",f=1,lage=1,hage=11,fy=1985,ly=2000)
# Plot selectivity in multiple crappy color grayscale 
c.select(mod1)
dev.off()  
