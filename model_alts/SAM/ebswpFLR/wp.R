#source("http://flr-project.org/R/instFLR.R")

library(FLCore)
library(FLa4a)
library(FLasher)
library(ggplot2)
library(ggplotFL)

rm(list=ls())
options(scipen=999)

# land <- readVPAFile("../Data/New Data in Lowestoft/TURT_50_IUU5_2016LA.DAT")
land   <- readVPAFile("cn.dat") #catch numbers
matu   <- readVPAFile("mo.dat") #maturity ogive
nm     <- readVPAFile("nm.dat")
cw     <- readVPAFile("cw.dat")
pf     <- readVPAFile("pf.dat")
pm     <- readVPAFile("pm.dat")
survey <- readVPAFile("survey.dat")
sw     <- readVPAFile("sw.dat")


cn <- land
#-- build FLStock object

stk <- FLStock(cn, plusgroup=9)
catch.n(stk) <- cn
catch.wt(stk) <- cw
catch(stk) <- computeCatch(stk)
landings(stk) <- catch(stk)
landings.n(stk) <- catch.n(stk)
landings.wt(stk) <- catch.wt(stk)
discards(stk) <- 0
discards.n(stk) <- 0
discards.wt(stk) <- 0
stock.wt(stk) <- sw
#m(stk) <- FLQuant(rep(0.19, 11), dimnames=list(age=1:9, year = (1963:2018)))
#mat(stk) <- FLQuant(matu, dimnames=list(age=1:9, year = (1963:2018)))

mat(stk) <- matu
m(stk) <- nm
m.spwn(stk) <- pm
harvest.spwn(stk) <- pf
range(stk)[c(6,7)] <- c(4,7)

#set units and range
name(stk)<-"EBS_AK_pollock"
desc(stk)<-"Stock object for NewSciFish August 2019"
units(catch(stk)) <- units(discards(stk)) <- units(landings(stk)) <- units(stock(stk)) <- 'mt'
units(catch.n(stk)) <- units(discards.n(stk)) <- units(landings.n(stk)) <- units(stock.n(stk)) <- '1000'
units(catch.wt(stk)) <- units(discards.wt(stk)) <- units(landings.wt(stk)) <- units(stock.wt(stk)) <- 'mt'
units(harvest(stk)) <- 'f'


idx <- readFLIndices("survey.dat")
idx
# change the entry for "plus group" to NA since the indices are for a single age
range(idx[[1]])[3] <- NA
range(idx[[2]])[3] <- NA
idx0 <- index(idx[[1]])
idx0 <- index(idx[[2]])
idx0[idx0==-1] <- NA
index(idx[[2]])<- idx0 
index(idx[[1]])<- idx0 

# code to change observed zeros to small value (otherwise, use NA for missing)
# for ( i in 1:length(idx)){
#   index(idx[[i]])[index(idx[[i]])==0] <- 0.01
# }
save(stk, file="./EBS_AK_pollock.Rdata")

fit1 <-sca(stk,idx,fmodel= ~te(age, year, k = c(1, 7), bs = "tp") + s(year, k = 10, by=as.numeric(age==1) ,wdir="~/scarun")
plot(stk+fit1)
t <- residuals(fit1,stk,idx)
plot(t)
wireframe(data~age+year,data=harvest(fit1))