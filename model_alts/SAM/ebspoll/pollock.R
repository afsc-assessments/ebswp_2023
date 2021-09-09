# devtools::install_github('fishfollower/SAM/stockassessment')
#setwd(tempdir())
library(stockassessment)
rm(list=ls())
#filestoget <- c("cn.dat", "cw.dat", "dw.dat", "lf.dat", "lw.dat", "mo.dat", "nm.dat", "pf.dat", "pm.dat", "sw.dat", "survey.dat")
#url <- "https://raw.githubusercontent.com/fishfollower/SAM/master/stockassessment/tests/nsher/"
#url <- "https://www.stockassessment.org/datadisk/stockassessment/userdirs/user3/Upsi/data/"
#url <- "https://www.stockassessment.org/datadisk/stockassessment/userdirs/user90/jak/data/"
#d <- lapply(filestoget, function(f)download.file(paste(url,f,sep=""), f))
cn <- read.ices("data/cn.dat")
cw <- read.ices("data/cw.dat")
dw <- read.ices("data/dw.dat")
lf <- read.ices("data/lf.dat")
lw <- read.ices("data/lw.dat")
mo <- read.ices("data/mo.dat")
nm <- read.ices("data/nm.dat")
pf <- read.ices("data/pf.dat")
pm <- read.ices("data/pm.dat")
sw <- read.ices("data/sw.dat")
surveys <- read.ices("data/survey.dat")
dat<-setup.sam.data(surveys=surveys,
                    residual.fleet=cn, 
                    prop.mature=mo, 
                    stock.mean.weight=sw, 
                    catch.mean.weight=cw, 
                    dis.mean.weight=dw, 
                    land.mean.weight=lw,
                    prop.f=pf, 
                    prop.m=pm, 
                    natural.mortality=nm, 
                    land.frac=lf)
names(dat)

# Read in 2017 Assessment results and store in a "fit like" object
source("~/Onedrive/ebswp/EBSpollock/R/prelims.R")
cwd <- getwd()
setwd("~/OneDrive/ebswp/EBSpollock/runs")
fn       <- "16.0/pm"
M <- read_admb(fn)
names(M)
setwd(cwd)
#
#w <- matrix(0.3^2, nrow=nrow(surveys[[2]]), ncol=ncol(surveys[[2]]) )
#attr(surveys[[2]],"weight") <- w
#surveys
dat <- setup.sam.data(surveys=surveys, residual.fleet=cn, prop.mature=mo, stock.mean.weight=sw, catch.mean.weight=cw, dis.mean.weight=dw, land.mean.weight=lw, prop.f=pf, prop.m=pm, natural.mortality=nm, land.frac=lf) 
###~~~-----------------------------------------------------~~~###
### Create config file
conf <- defcon(dat)
# Fbar range
conf$fbarRange <- c(3,7)
# F states
conf$keyLogFsta[1,] <- c(0,1:10,10,10,10,10)
#conf$keyLogFsta[1,]<-c(0,1:8,8)
# F rw variance
conf$keyVarF
conf$keyVarF[1,]    <- c(0:3,rep(4,11))
# Correlated random walks for F
conf$corFlag <- 2
# N rw variance
#conf$keyVarLogN <- c(-1,rep(0,9))
conf$keyVarLogN <- c(0:1,rep(2,13))
# survey catchability PARAMETERS
conf$keyLogFpar
conf$keyLogFpar[2,] <- c(0:7, rep(7,7))
conf$keyLogFpar[3,] <- c(8:15, rep(15,7))
# survey Observation variances
conf$keyVarObs[1,] <- c(0:3, 4, 4, 4, 4, 4, 5, rep(5,5))
conf$keyVarObs[2,] <- c(6:9,10,10,10,10,10,11,rep(11,5))
conf$keyVarObs[3,] <- c(12:16, rep(17, 10))
conf$keyVarObs
# Observation correlation structure
# 1="ID" (independent), 2="AR" (correlated), 3="US" (unstructured)
conf$obsCorStruct[1] <- "ID"  
conf$obsCorStruct[2] <- "ID"  
conf$obsCorStruct[3] <- "ID"  
# If "AR" or "US" is used, then change keyCorObs from NA to 0
conf$keyCorObs[2,1:8] <- NA
conf$keyCorObs

conf$corFlag <- 2
conf$keyLogFpar
conf$keyLogFsta
conf$keyVarLogP
conf$keyVarLogN
conf$keyVarObs
#conf$keyVarObs[1,] <- c(0:3,rep(4,11))
#conf$keyVarObs[2,] <- c(5:7,rep(8,12))
#conf$keyVarObs[3,] <- c(9:12,rep(13,11))
#conf$minAge
names(conf)
#conf$keyLogFsta[1,9:13] <- 8
#conf$fixVarToWeight <- 1

#conf$keyLogFpar <- matrix(c( -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, -1,    0,    1,    2,    3,    4,    5,    6,   -1, -1,    7,   -1,   -1,   -1,   -1,   -1,   -1,   -1, 8,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1), nrow=4, byrow=TRUE)
#conf$obsCorStruct[3] <- "US"
#conf$obsCorStruct[3] <- "AR"
#conf$obsCorStruct[3] <- "ID"
#conf$keyCorObs[3,1:7] <- 0


par <- defpar(dat,conf)
names(par)
#par$logSdLogObs[3]<- log(.3)
#These default initial can be modified (like the configuration), but it is rarely necessary. To illustrate we modify the initial values for the catchabilities #par$logFpar <- rep(0,9)
#Now we are ready to optimize the model.
fit1 <- sam.fit(dat,conf,par)

forec <- forecast(fit=fit1,catchval=rep(10,5))
  #fval=0.25)
c(.01,.05,.1,rep(.25,12)))
args(forecast)
 
resid <- residuals(fit1)
resp <- procres(fit1)
?procres
plot(resp)
retro1 <- retro(fit1)
ssbplot(retro1)
conf
summary(fit1)
par$itrans_rho <- .5
par
d<- t <- conf$keyVarObs
conf$keyVarObs
    exp(fit1$pl$logSdLogObs)
is.data.frame(d)
d <-  expand.grid(c("Fishery","Trawl survey", "Acoustic survey"),1:15)
d$cv <- NA
for (i in 1:3)
  for (j in 1:15)
  {
    t[i,j] <- exp(fit1$pl$logSdLogObs[(t[i,j]+1)])
  }
  d$cv <- as.data.frame(as.table(t))[,3]
  library(ggplot2)
  names(d) <- c("Source","Age","CV")
  ggplot(d,aes(,x=Age,y=CV,fill=Source)) + geom_bar(stat="Identity",position="dodge") + mytheme

conf
conf2$keyVarLogN <- c(0:2,rep(3,12))
conf2$keyVarLogN 

fit2 <- sam.fit(dat,conf,par ,map=list(itrans_rho=factor(NA)))          
fit1$rep$obsCov
#This fitted model object contains all information about the fit and can be used to plot and extract all requested quantities. 
# Let's plot the SSB, Fbar, rectuitment, and total catch.
fit1$log(fit1)
(fit1$pl$logFpar)
$keyLogFpar
[2,] <- c(0:7, rep(7,7))
    surveyName <- "TrawlSurvey"
    print(xyplot(value+ubnd+lbnd ~ age | fleet,catch,
             scale=list(alternating=FALSE,y=list(relation="free")),as.table=TRUE,
             type="l",lwd=c(2,1,1),col=c("black","grey","grey"),
             subset=fleet %in% surveyName,
             main="Survey catchability parameters",ylab="Catchability",xlab="Age"))
    surveyName <- "AcoustTrawl"
    print(xyplot(value+ubnd+lbnd ~ age | fleet,catch,
             scale=list(alternating=FALSE,y=list(relation="free")),as.table=TRUE,
             type="l",lwd=c(2,1,1),col=c("black","grey","grey"),
             subset=fleet %in% surveyName,
             main="Survey catchability parameters",ylab="Catchability",xlab="Age"))
obscorrplot(fit1)
plot(fit1)
dev.off()
parplot(fit1)
tsbplot(fit1)
srplot(fit1)
fitplot(fit1)
plot.samypr(fit1)
ssbplot(fit1)
fbarplot(fit1)
recplot(fit1)
catchplot(fit1)
plot(resid)
retro1 <- retro(fit1,year=10)
ssbplot(retro)
plot(retro)
matplot(exp(t(fit1$pl$logF)))
obscorrplot(fit1)
exp(coef(fit1))
lo <- leaveout(fit1)
plot(lo)
###~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~j~~~~~~~~~~~~~~~
# Compare w/ 2017 Assessment
###~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~j~~~~~~~~~~~~~~~
r.df <- data.frame(R = M$N[,1])
r.df$ass <- "EBSwp"
r.df$yr <- 1964:2017
names(fit1$sdrep)
N  <- exp(t(fit1$pl$logN))
dim(N)
tt <- data.frame(R=as.vector(N[,1]))
tt$ass <- "SAM"
tt$yr <- 1964:2017
r.df <- rbind(r.df,tt)
r.df
library(ggplot2)
ggplot(r.df, aes(x=yr,y=R,col=ass)) + geom_line(size=2) + .THEME
cor.plot(fit1))

###~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~j~~~~~~~~~~~~~~~
#
#   Look at reference based on dynamic Bzero
#
###~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fit <- fit1
library(ggplot2)
mytheme <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank() )
mytheme <- mytheme + theme(text=element_text(size=18)) + theme(axis.title.x=element_text(size=24) ,axis.title.y=element_text(size=24))
mytheme <- mytheme + theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_line(colour="grey60", linetype="dashed"), panel.grid.major.y = element_blank() )
mytheme <- mytheme + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
N  <- exp(t(fit1$pl$logN))
dim(N)
nyrs <- dim(N)[1]
nages <- dim(N)[2]
Nf <- exp(t(fit1$pl$logN))
# Selectivity
F <- exp(t(fit1$pl$logF))
nFages <- dim(F)[2]
F <- cbind(F,rep(F[,nFages],nages-nFages))
S <- F/apply(F[,4:8],1,mean)
for (i in 1:(nyrs-1)) {
  for (j in 1:(nages-1) ) {
	  N[i+1,j+1]  <- N[i,j]  * exp(-.3 )
	  Nf[i+1,j+1] <- Nf[i,j] * exp(-.3 - S[i,j]*.3)
	}
  N[i+1,nages]  <- N[i+1,nages]  + N[i,nages]  * exp(-.3 )
  Nf[i+1,nages] <- Nf[i+1,nages] + Nf[i+1,nages] * exp(-.3 - S[i,nages]*.3)
}

fit <- fit1
matplot(N)
matplot(Nf)
## constant Mat and Wt
(M$SSB)
mo
df <-  data.frame(dB0=M$SSB[,2]*2,Year=fit$data$years,SSB=summary(fit)[,4], lo=summary(fit)[,5], hi=summary(fit)[,6])
df <-  data.frame(dB0=(rowSums(M$N*mo*sw),Year=fit$data$years,SSB=summary(fit)[,4], lo=summary(fit)[,5], hi=summary(fit)[,6])
df <-  data.frame(dB0=(rowSums(N*colMeans(mo)*colMeans(sw))),Year=fit$data$years,SSB=summary(fit)[,4], lo=summary(fit)[,5], hi=summary(fit)[,6])
dim(mo)
x11()
plot(1964:2017,rowSums(mo*N*sw))
lines(1964:2017,rowSums(mo*M$N*sw))
head(sw)
summary(fit)
df <-  data.frame(dB0=(rowSums(N*mo*sw)),Year=fit$data$years,SSB=summary(fit)[,4], lo=summary(fit)[,5], hi=summary(fit)[,6])
df2 <- data.frame(dB0=(rowSums(Nf*mo*sw)),Year=fit$data$years,SSB=summary(fit)[,4], lo=summary(fit)[,5], hi=summary(fit)[,6])
df2$loRatio <- df2$lo/df2$dB0
df2$hiRatio <- df2$hi/df2$dB0
df2$dBRatio <- df2$SSB/df2$dB0
df$loRatio <- df$lo/df$dB0
df$hiRatio <- df$hi/df$dB0
df$dBRatio <- df$SSB/df$dB0
ggplot(df,aes(x=Year,y=SSB)) + geom_line(aes(x=Year,y=dB0),size=2,col="dark green") + 
          geom_ribbon(aes(ymin=lo, ymax=hi), fill="salmon",alpha=.2) + geom_line(aes(x=Year,y=SSB),size=0.9,col="black") + geom_line(data=df2,aes(x=Year,y=dB0), size=2,col="red") +mytheme
ssbplot(fit)

###~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
###~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# EQ sim stuff from here
#
###~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
runName <- "EBS Pollock"
save(list=c("fit", "retro", "lo", "res"), file=paste(runName,".RData",sep=""))
rm(ls())
library(stockassessment)
require(FLCore)
library(msy)

flq <- FLQuant(NA, dimnames = list(age = 1:15, year = 1964:2016), quant='age')
stk <- FLStock(stock.n = flq, name = "EBSPollock", desc = "FLStock_for_SAM")
units(stk)[1:17]    <- as.list(c(rep(c("tonnes","thousands","kg"),4), rep("NA",2),"f",rep("NA",2)))
# Mean F range
range(stk)[c("minfbar","maxfbar")]    <- c(4,8)
# Last age a plusgroup
stk  <- setPlusGroup(stk,stk@range["max"])

### Read from stockassessment.org
#user <- 90 # User 2 = Anders; User 3 = Guest; User 108 = David Miller
#url <- paste("https://www.stockassessment.org/datadisk/stockassessment/userdirs/user",user,"/jak/data/", sep="")  
#filestoget <- c("cn.dat", "cw.dat", "dw.dat", "lf.dat", "lw.dat", 
                #"mo.dat", "nm.dat", "pf.dat", "pm.dat", "sw.dat", 
                #"survey.dat")
#d <- lapply(filestoget, function(f)download.file(paste(url,f,sep=""), f))
catch.n(stk)[,ac(1964:2015)] <- landings.n(stk)[,ac(1964:2015)] <- t(read.ices("cn.dat"))
discards.n(stk)[] <- 0
catch.wt(stk)[,ac(1964:2015)] <- discards.wt(stk)[,ac(1964:2015)] <- landings.wt(stk)[,ac(1964:2015)] <- t(read.ices("cw.dat"))
catch.wt(stk)[1,] <- discards.wt(stk)[1,] <- landings.wt(stk)[1,] <- 0.001
discards(stk) <- computeDiscards(stk)
landings(stk) <- computeLandings(stk)
catch(stk) <- computeCatch(stk)

mat(stk)[] <- t(read.ices("mo.dat"))
m(stk)[] <- t(read.ices("nm.dat"))
harvest.spwn(stk)[] <- t(read.ices("pf.dat"))
m.spwn(stk)[] <- t(read.ices("pm.dat"))

### Update stock object from SAM fit
stock.n(stk)[] <- exp(fit$pl$logN)
stock.wt(stk)[] <- t(read.ices("sw.dat"))
stock(stk)[] <- computeStock(stk)
harvest(stk)[1:14,] <- exp(fit$pl$logF)
harvest(stk)[15,]  <- harvest(stk)[14,]
#harvest(stk)[1,]  <- 0

### Trim off last year of the stock object (incomplete data for 2016)
minYear <- range(stk)["minyear"]
maxYear <- range(stk)["maxyear"]
origStk <- stk
stk <- window(stk, start=minYear, end=(maxYear-1))

###-------------------------------------------------------------------------------
## 'refpts', define them here
refPts <- list()
refPts[["Fpa"]]  <- 0.25
refPts[["Flim"]] <- 0.4 
refPts[["Bpa"]]  <- 35000  # Used as Btrigger
refPts[["Blim"]] <- 22000

###-------------------------------------------------------------------------------
### Set up simulations

###~~~~~~~~~~~~~
### SRR Models
#appMods: "segreg","ricker", "bevholt"; or specials: "SegregBlim/Bloss" (breakpt. Blim/Bloss)
#appMods <- c("Segreg")#,"Ricker", "Bevholt")
#appMods <- c("SegregBloss")
appMods <- c("SegregBlim")
appMods <- c("Bevholt","Ricker")
appMods <- c("Bevholt")

## SRR years 
# Which years (SSB years) to exclude from the SRR fits
# Keep all
rmSRRYrs <- c() 
rmSRRYrs <- union(rmSRRYrs, c(maxYear-1,maxYear))

## determine segreg model with Blim breakpoint and (roughly) geomean rec above this
srYears <- setdiff(c(minYear:(maxYear-1)),rmSRRYrs)

## determine segreg model with Blim breakpoint and (roughly) geomean rec above this
#2015b geomean allYrs (less 2014, 2015): 13323828
SegregBloss  <- function(ab, ssb) log(ifelse(ssb >= min(ssb(stk)), ab$a * min(ssb(stk)), ab$a * ssb))

## SegregBlim (done below)
SegregBlim  <- function(ab, ssb) log(ifelse(ssb >= refPts[["Blim"]], ab$a * refPts[["Blim"]], ab$a * ssb))

###~~~~~~~~~~~~~
## autocorrelation
#if (savePlots) 

resPath <- "."
setwd(resPath); 
	tiff(file=paste(resPath,"_autoCor_plot.tiff",sep=""),height=5,width=7, units = "in", res=72)
x <- acf(rec(stk), plot=T, main="Autocor. in Rec")
dev.off()
#if (savePlots) dev.off()

###~~~~~~~~~~~~~
## Forecast error
##2015b: since 2007 
cvF  <- 0.2;	phiF <-	0.2
cvSSB <- 0.2; phiSSB <- 0.2

#cvF  <- 0;	phiF <-	0
#cvSSB <- 0; phiSSB <- 0

###~~~~~~~~~~~~~
## Bio params and selectivity
# Avg. Years
numAvgYrsB <- 20   #Bio
numAvgYrsS <- 20   #Sel
# Constant or resample?
const <- TRUE

# Use Btrigger
appBtrig <- T
if(appBtrig) refPts[["BmsyTrig"]]  <- refPts[["Bpa"]] else refPts[["BmsyTrig"]]  <- 0

# Number of sims
noSims <- 1000

###~~~~~~~~~~~~~
## Run Name
eqName <- paste(appMods[1],"_",numAvgYrsB,"yrBS",if(const) "const_" else "resamp_",if(appBtrig) "Btrig_" else "noBtrg_",noSims,sep="")

getwd()
system(paste("mkdir",eqName, sep=" "))
eqPath <- eqName
if (savePlots) windows() 

###-------------------------------------------------------------------------------
## Fit SRRs
FIT <- eqsr_fit(stk,nsamp=noSims, models = appMods, remove.years=rmSRRYrs)

# save model proportions and parameters:
stockName <- "EBSPollock"
write.csv(FIT$sr.det, paste(eqPath,"EqSim_",stockName,"_SRR_pars.csv",sep=""))
# Plot raw SRR results
# .wmf is a very large file, so use tiff instead
#if (savePlots) win.metafile(file=paste(eqPath,"EqSim_",stockName,"_eqSR_plot.wmf",sep=""),height=hght,width=wth)
#if (savePlots) 
tiff(file=paste(eqPath,"EqSim_",stockName,"_eqSR_plot.tiff",sep=""),height=5,width=7, units = "in", res=120)
eqsr_plot(FIT,n=2e4)
#if (savePlots) dev.off()

###-------------------------------------------------------------------------------
## Run simulations
SIM <- eqsim_run(FIT,  bio.years = c(maxYear-numAvgYrsB, maxYear-1), bio.const = const,
                 sel.years = c(maxYear-numAvgYrsB, maxYear-1), sel.const = const,
                 Fcv=cvF, Fphi=phiF, SSBcv=cvSSB, rhologRec=T,
                 Btrigger = refPts[["BmsyTrig"]], Blim=refPts[["Blim"]],Bpa=refPts[["Bpa"]],
                 Nrun=200, Fscan = seq(0,1.0,len=101),verbose=T)


# save per recruit plots
# Catch
#if (savePlots) win.metafile(file=paste(eqPath,"EqSim_",stockName,"_PR_plots_Catch.wmf",sep=""),height=hght,width=wth)
if (savePlots) tiff(file=paste(eqPath,"EqSim_",stockName,"_PR_plots_Catch.tiff",sep=""),height=hght,width=wth, units = "in", res=72)
eqsim_plot(SIM,catch=TRUE)  
if (savePlots) dev.off()

# save MSY and lim values
write.csv(t(SIM$refs_interval), paste(eqPath,"EqSim_",stockName,"_FMSYandp05.csv",sep=""))

###~~~~~~~~~~~~~
## More plots
source(paste(assPath,"CobyPlots_BW_eqsim.r",sep=""))

###-------------------------------------------------------------------------------
## Save workspace
save.image(file=paste(eqPath,stockName,"_",eqName,"_EqSim_Workspace.Rdata",sep=""))

# Combine fits c(fit1,fit2...)
#ls(2) # to show functions available
# ls(2)
# [1] "catchplot"        "defcon"           "defpar"           "fbarplot"        
# [5] "fbartable"        "leaveout"         "modelDescription" "nscodConf"       
# [9] "nscodData"        "nscodParameters"  "obscorrplot"      "obscov"          
#[13] "parplot"          "plotby"           "read.ices"        "recplot"         
#[17] "rectable"         "retro"            "runwithout"       "sam.fit"         
#[21] "setup.sam.data"   "ssbplot"          "ssbtable"         "tsbplot"         
#[25] "tsbtable"         "ypr"             
#summary(fit)




###~~~-----------------------------------------------------~~~###
### Create config file
conf<-defcon(dat)
# Fbar range
conf$fbarRange <- c(3, 7)  # set mean F range
# F states
conf$keyLogFsta[1,]<-c(-1,0:5,5,5,5)
#conf$keyLogFsta[1,]<-c(0,1:8,8)
# F rw variance
conf$keyVarF[1,] <- c(-1,rep(0,9))
#conf$keyVarF[1,] <- c(0,rep(1,9))
# Correlated random walks for F
conf$corFlag <- 2
# N rw variance
#conf$keyVarLogN <- c(-1,rep(0,9))
conf$keyVarLogN <- c(0,rep(1,9))
# survey catchability PARAMETERS
conf$keyLogFpar[2,] <- c(0:7, 7, -1)
conf$keyLogFpar[3,] <- c(8:15, 15, -1)
# survey Observation variances
conf$keyVarObs[2,] <- c(0,rep(1,7),2, -1) # differs from Jim
conf$keyVarObs[3,] <- c(3,rep(4,7), 5,-1) # differs from Jim
# Observation correlation structure
# 1="ID" (independent), 2="AR" (correlated), 3="US" (unstructured)
conf$obsCorStruct[1] <- "ID"  
conf$obsCorStruct[2] <- "AR"  
conf$obsCorStruct[3] <- "ID"  
# If "AR" or "US" is used, then change keyCorObs from NA to 0
conf$keyCorObs[2,1:8] <- 0
  d

### Try setting it up to read the config file from stockassessment.org too (i.e. duplicate assessment here)

###~~~-----------------------------------------------------~~~###
### Create parameter object
par<-defpar(dat,conf)
# to fix a parameter
par$itrans_rho = .5

###~~~-----------------------------------------------------~~~###
### Fit SAM model
fit<-sam.fit(dat,conf,par,newtonsteps=0) 

###~~~-----------------------------------------------------~~~###
### Plot results
setwd(resPath)

if(exists("fit")){
  png("ssb.png", 600, 600)
    ssbplot(fit)
  dev.off()

  png("fbar.png", 600, 600)
    fbarplot(fit)
  dev.off()
  
  png("rec.png", 600, 600)
    recplot(fit)
  dev.off()

  png("catch.png", 600, 600)
    catchplot(fit)
  dev.off()

  png("FbyAge.png", 600, 600)
    F<-t(exp(fit$pl$logF))
    matplot(fit$data$years,F,type="b", pch=c("1","2","3","4","+"))
  dev.off()

    png("sel.png", 600, 600)
  F<-t(exp(fit$pl$logF[fit$conf$keyLogFsta[1,]+1,]))
    gcols=grey(seq(0.1,0.9,length.out=ncol(F)));
    barplot(t(F/rowSums(F)),border=NA,space=c(0),xlab="Year", names.arg=fit$data$years)
    text(1,cumsum(t(F/rowSums(F))[,1]) - 0.5*t(F/rowSums(F))[,1] ,label=as.character(1:ncol(F)),cex=1.5,adj=c(0.0,0.2), bg="white")
  dev.off()
}

###~~~-----------------------------------------------------~~~###
### Run retro
ret<-retro(fit, year=10)

if(exists("ret")){
  png("retro.png", 600, 1000)
    plot(ret, dropAddCI=TRUE)
  dev.off()
}


###~~~-----------------------------------------------------~~~###
### Run leave-one-out
loo <- leaveout(fit)

if(exists("ret")){
  png("loo.png", 600, 1000)
  plot(loo)
  dev.off()
}
###~~~-----------------------------------------------------~~~###
### Check residuals
res<-residuals(fit)

if(exists("res")){
  png("resid.png", 600, 1000)
    plot(res)
  dev.off()
}

###~~~-----------------------------------------------------~~~###
# Save workspace
save(list=c("fit", "ret", "loo"), file=paste(runName,".RData",sep=""))


###-------------------------------------------------------------------------------
### Clean slate
rm(list=ls())

###~~~~~~~~~~~~~
## Save plots?
savePlots <- T
hght <- 10
wth <- 10

###-------------------------------------------------------------------------------
### Run name
#runName <- "test1_ID"
# runName <- "test3_AR"
stockName <- "Cod_Farp_2017_WKFAROE"  # = stock name in stockassesssment.org

### Set main working directory
# assPath <- "E:\\ICES benchmarks\\WKFAROE 2017\\Cod assessment\\"
# resPath <- paste(assPath,"Results\\",runName,"\\",sep="")

###-------------------------------------------------------------------------------
### Libraries
#require(devtools)
#devtools::install_github("fishfollower/SAM/stockassessment") # run once
library(stockassessment)
require(FLCore)
#install_github("wgmg/msy")
library(msy)

###-------------------------------------------------------------------------------
## Load SAM fit
#load(paste(resPath,"\\",runName,".RData", sep=""))

###-------------------------------------------------------------------------------
## Read data & update according to assessment
flq <- FLQuant(NA, dimnames = list(age = 1:10, year = 1959:2016), quant='age')
stk <- FLStock(stock.n = flq,
               name = "FarCod",
               desc = "FLStock_for_SAM")
units(stk)[1:17]    <- as.list(c(rep(c("tonnes","thousands","kg"),4), rep("NA",2),"f",rep("NA",2)))
# Mean F range
range(stk)[c("minfbar","maxfbar")]    <- c(3,7)
# Last age a plusgroup
stk  <- setPlusGroup(stk,stk@range["max"])

### Read from stockassessment.org
user <- 3 # User 2 = Anders; User 3 = Guest; User 108 = David Miller
url <- paste("https://www.stockassessment.org/datadisk/stockassessment/userdirs/user",user,"/","Cod_Farp_2017_WKFAROE","/data/", sep="")  
filestoget <- c("cn.dat", "cw.dat", "dw.dat", "lf.dat", "lw.dat", 
                "mo.dat", "nm.dat", "pf.dat", "pm.dat", "sw.dat", 
                "survey.dat")
d <- lapply(filestoget, function(f)download.file(paste(url,f,sep=""), f))

catch.n(stk)[,ac(1959:2015)] <- landings.n(stk)[,ac(1959:2015)] <- t(read.ices("cn.dat"))
discards.n(stk)[] <- 0
catch.wt(stk)[,ac(1959:2015)] <- discards.wt(stk)[,ac(1959:2015)] <- landings.wt(stk)[,ac(1959:2015)] <- t(read.ices("cw.dat"))
catch.wt(stk)[1,] <- discards.wt(stk)[1,] <- landings.wt(stk)[1,] <- 0.001
discards(stk) <- computeDiscards(stk)
landings(stk) <- computeLandings(stk)
catch(stk) <- computeCatch(stk)

mat(stk)[] <- t(read.ices("mo.dat"))
m(stk)[] <- t(read.ices("nm.dat"))
harvest.spwn(stk)[] <- t(read.ices("pf.dat"))
m.spwn(stk)[] <- t(read.ices("pm.dat"))

### Update stock object from SAM fit
stock.n(stk)[] <- exp(fit$pl$logN)
stock.wt(stk)[] <- t(read.ices("sw.dat"))
stock.wt(stk)[1,] <- 0.001
stock(stk)[] <- computeStock(stk)
harvest(stk)[2:7,] <- exp(fit$pl$logF)
harvest(stk)[8:10,]  <- harvest(stk)[7,]
harvest(stk)[1,]  <- 0

### Trim off last year of the stock object (incomplete data for 2016)
minYear <- range(stk)["minyear"]
maxYear <- range(stk)["maxyear"]
origStk <- stk
stk <- window(stk, start=minYear, end=(maxYear-1))

###-------------------------------------------------------------------------------
## 'refpts', define them here
refPts <- list()
refPts[["Fpa"]]  <- 0.35
refPts[["Flim"]]  <- 0.68
refPts[["Bpa"]]  <- 40000  # Used as Btrigger
refPts[["Blim"]]  <- 21000

###-------------------------------------------------------------------------------
### Set up simulations

###~~~~~~~~~~~~~
### SRR Models
#appMods: "segreg","ricker", "bevholt"; or specials: "SegregBlim/Bloss" (breakpt. Blim/Bloss)
#appMods <- c("Segreg")#,"Ricker", "Bevholt")
#appMods <- c("SegregBloss")
appMods <- c("SegregBlim")

## SRR years 
# Which years (SSB years) to exclude from the SRR fits
# Keep all
rmSRRYrs <- c() 
rmSRRYrs <- union(rmSRRYrs, c(maxYear-1,maxYear))

## determine segreg model with Blim breakpoint and (roughly) geomean rec above this
srYears <- setdiff(c(minYear:(maxYear-1)),rmSRRYrs)

## determine segreg model with Blim breakpoint and (roughly) geomean rec above this
#2015b geomean allYrs (less 2014, 2015): 13323828
SegregBloss  <- function(ab, ssb) log(ifelse(ssb >= min(ssb(stk)), ab$a * min(ssb(stk)), ab$a * ssb))

## SegregBlim (done below)
SegregBlim  <- function(ab, ssb) log(ifelse(ssb >= refPts[["Blim"]], ab$a * refPts[["Blim"]], ab$a * ssb))

###~~~~~~~~~~~~~
## autocorrelation
if (savePlots) tiff(file=paste(resPath,"_autoCor_plot.tiff",sep=""),height=hght,width=wth, units = "in", res=72)
x <- acf(rec(stk), plot=T, main="Autocor. in Rec")
if (savePlots) dev.off()

###~~~~~~~~~~~~~
## Forecast error
##2015b: since 2007 
cvF  <- 0.2;  phiF <- 0.2
cvSSB <- 0.2; phiSSB <- 0.2

#cvF  <- 0; phiF <- 0
#cvSSB <- 0; phiSSB <- 0

###~~~~~~~~~~~~~
## Bio params and selectivity
# Avg. Years
numAvgYrsB <- 20   #Bio
numAvgYrsS <- 20   #Sel
# Constant or resample?
const <- TRUE

# Use Btrigger
appBtrig <- T
if(appBtrig) refPts[["BmsyTrig"]]  <- refPts[["Bpa"]] else refPts[["BmsyTrig"]]  <- 0

# Number of sims
noSims <- 1000

###~~~~~~~~~~~~~
## Run Name
eqName <- paste(appMods[1],"_",numAvgYrsB,"yrBS",if(const) "const_" else "resamp_",if(appBtrig) "Btrig_" else "noBtrg_",noSims,sep="")

setwd(resPath); shell(paste("md",eqName, sep=" "))
eqPath <- paste(resPath,eqName,"\\",sep="")
if (savePlots) windows() 

###-------------------------------------------------------------------------------
## Fit SRRs
FIT <- eqsr_fit(stk,nsamp=noSims, models = appMods, remove.years=rmSRRYrs)

# save model proportions and parameters:
write.csv(FIT$sr.det, paste(eqPath,"EqSim_",stockName,"_SRR_pars.csv",sep=""))
# Plot raw SRR results
# .wmf is a very large file, so use tiff instead
#if (savePlots) win.metafile(file=paste(eqPath,"EqSim_",stockName,"_eqSR_plot.wmf",sep=""),height=hght,width=wth)
if (savePlots) tiff(file=paste(eqPath,"EqSim_",stockName,"_eqSR_plot.tiff",sep=""),height=hght,width=wth, units = "in", res=72)
eqsr_plot(FIT,n=2e4)
if (savePlots) dev.off()

###-------------------------------------------------------------------------------
## Run simulations
SIM <- eqsim_run(FIT,  bio.years = c(maxYear-numAvgYrsB, maxYear-1), bio.const = const,
                 sel.years = c(maxYear-numAvgYrsB, maxYear-1), sel.const = const,
                 Fcv=cvF, Fphi=phiF, SSBcv=cvSSB,
                 rhologRec=T,
                 Btrigger = refPts[["BmsyTrig"]], Blim=refPts[["Blim"]],Bpa=refPts[["Bpa"]],
                 Nrun=200, Fscan = seq(0,1.0,len=101),verbose=T)


# save per recruit plots
# Catch
#if (savePlots) win.metafile(file=paste(eqPath,"EqSim_",stockName,"_PR_plots_Catch.wmf",sep=""),height=hght,width=wth)
if (savePlots) tiff(file=paste(eqPath,"EqSim_",stockName,"_PR_plots_Catch.tiff",sep=""),height=hght,width=wth, units = "in", res=72)
eqsim_plot(SIM,catch=TRUE)  
if (savePlots) dev.off()

# save MSY and lim values
write.csv(t(SIM$refs_interval), paste(eqPath,"EqSim_",stockName,"_FMSYandp05.csv",sep=""))

###~~~~~~~~~~~~~
## More plots
source(paste("../CobyPlots_BW_eqsim.r",sep=""))

###-------------------------------------------------------------------------------
## Save workspace
save.image(file=paste(eqPath,stockName,"_",eqName,"_EqSim_Workspace.Rdata",sep=""))


