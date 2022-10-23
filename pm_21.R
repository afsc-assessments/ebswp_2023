
od <- getwd()
setwd("~/_mymods/ebswp/doc")
rm(list=ls())
#install.packages("ggridges")
source("../R/prelims.R")
library(doParallel)
library(patchwork)
thisyr    = 2021
lastyr    = thisyr-1
nextyr    = thisyr+1

# The model specs
.THEME    = theme_few(base_size = 11, base_family = "")
.OVERLAY  = TRUE

# Read report file and create gmacs report object (a list):
#mod_names <- c("No AVO","Model 16.1","VAST","Low AVO", "High AVO")
#.MODELDIR = c( "../runs/CA/","../runs/last_year/","../runs/usv/","../runs/sr1/")
#mod_names <- c("2020","last year","Low AVO")
#mod_names <- c("16.2","16.2 last year","20.0 USV","20.1 USVast","20.1a Ignore 1978 YC", "20.0c Fmsy=F35","20.0d Fmsy=F45","20.1b Diffuse SRR prior")
#.MODELDIR = c( "../runs/2020/","../runs/last_year/","../runs/usv/","../runs/usv_vast/","../runs/sr0/","../runs/sr1/","../runs/sr3/","../runs/sr2/")
#.MODELDIR = c( "../runs/2020/","../runs/last_year/","../runs/2020Lavo/")
#.MODELDIR = c( "../runs/2020/","../runs/last_year/","../runs/sr1/")
#mod_names <- c("16.2","16.2 last year","20.0 USV","20.1 USVast","20.0a base")
mod_names <- c("Last year","20.0a","20.0b","20.0c")
#.MODELDIR <- c( "../runs/2020base/","../runs/base/","../runs/l21/","../runs/c21/")
.MODELDIR <- c( "../runs/2020base/","../runs/base/","../runs/l21/","../runs/c21/")

#mod_names <- c("base","diagonal Covar")
#mod_names <- c("base","With CE","CEATTLE_M","CEATTLE_M_CE","Copepod index")
#.MODELDIR <- c( "../runs/withoutce/","../runs/withce/","../runs/Mmatrix/","../runs/Mmatrixce/","../runs/cope/")
#.MODELDIR <- c( "../runs/withoutce/","../runs/withce/","../runs/Mmatrix/","../runs/Mmatrixce/","../runs/cope/","../runs/copece/","../runs/copeceMmat/")
#mod_names <- c("base","With CE","CEATTLE_M","CEATTLE_M_CE","Copepod index","Copepod + CE","Copepod + CE + CE_M")
fn        <- paste0(.MODELDIR, "pm");fn
#fn
nmods <- length(mod_names)
registerDoParallel(nmods)
system.time( modlst <- mclapply(fn, read_admb,mc.cores=nmods) )
#modlst[[2]] <- read_admb(fn[1])
names(modlst) <- mod_names
# The model picked
thismod <- 4 # the selected model
#add_stuff<-function(idx){ proj_file<- paste0(.MODELDIR[idx],"proj/bigfile.out") #modlst[[idx]] <- c(modlst[[idx]],get_vars(modlst[[idx]])) return( c(modlst[[i]],get_vars(modlst[[i]])) ) }
#system.time( modlst<-mclapply(1:nmods,add_stuff,mc.cores=nmods) )
#system.time( 
i=2
for (i in 1:nmods) {
  proj_file<- paste0(.MODELDIR[i],"proj/bigfile.out")
  # fixed to a single
  #proj_file<- "../runs/base/proj/bigfile.out"
  modlst[[i]] <- c(modlst[[i]],get_vars(modlst[[i]])) 
} 
M        <- modlst[[thismod]]
names(M)
P        <- modlst[[1]] # Last year's model (P=previous)
Alt      <- modlst[[2]] # Last year's model (P=previous)
#M$future_catch[12,1]
#M$future_catch[5,1]
#M$abc1s

#
rhodf      <- read.csv("../doc/data/mohnrho.csv",header=T)
rhoMohn10  <-  rhodf[11,3]
rhoMohn20  <-  rhodf[21,3]
rhoMohn10

fc  <- (read_csv("../doc/data/fig_captions.csv"))
figcap <<- fc$cap; figlab <<- fc$label; fnum <<- fc$no
reffig <<- function(i){ cat(paste0("\\ref{fig:",figlab[fnum==i],"}")) }  
printfig <<- function(tmp,i){ cat(paste0("\n![",figcap[fnum==i],"\\label{fig:",figlab[fnum==i],"}](figs/",tmp,")   \n ")) } 

tc  <- (read_csv("../doc/data/table_captions.csv"))
tabcap <- tc$cap; tablab <- tc$label
printtab <<- function(tmp,i){tab <- xtable(tmp, digits=0, auto=TRUE,caption = tabcap[i], label = paste0("tab:",tablab[i])); print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x}) } 
reftab <<- function(i){ cat(paste0("tab:",tablab[i])) }  

# tap <- data_frame(t=c(1,2),c=c(1,2))
#print(tablab)

#source("../R/Do_Plots.R")
#source("../R/Do_MCMC.R")
#source("../R/Do_Proj.R")

setwd(od)