setwd("~/_mymods/ebswp/doc")
library(doParallel)
library(patchwork)
registerDoParallel(5)
source("../R/prelims.R")
thisyr    = 2020
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
mod_names <- c("16.2","16.2 last year","20.0 USV","20.1 USVast","20.0a base")
.MODELDIR <- c( "../runs/2020/","../runs/last_year/","../runs/usv/","../runs/usv_vast/","../runs/base/")
fn        <- paste0(.MODELDIR, "pm")
nmods <- length(mod_names)
system.time( modlst <- mclapply(fn, read_admb,mc.cores=nmods) )
names(modlst) <- mod_names

# The model picked
thismod <- 5 # the selected model
#add_stuff<-function(idx){ proj_file<- paste0(.MODELDIR[idx],"proj/bigfile.out") #modlst[[idx]] <- c(modlst[[idx]],get_vars(modlst[[idx]])) return( c(modlst[[i]],get_vars(modlst[[i]])) ) }
#system.time( modlst<-mclapply(1:nmods,add_stuff,mc.cores=nmods) )
#system.time( 
for (i in 1:nmods) {
  proj_file<- paste0(.MODELDIR[i],"proj/bigfile.out")
  modlst[[i]] <- c(modlst[[i]],get_vars(modlst[[i]])) 
} 
M        <- modlst[[thismod]]
P        <- modlst[[2]] # Last year's model (P=previous)
Alt      <- modlst[[3]] # Last year's model (P=previous)
M$future_catch[12,1]

#
rhodf      <- read.csv("../doc/data/mohnrho.csv",header=T)
rhoMohn10  <-  rhodf[11,3]
rhoMohn20  <-  rhodf[21,3]

fc  <- (read_csv("../doc/data/fig_captions.csv"))
figcap <<- fc$cap; figlab <<- fc$label; fnum <<- fc$no
reffig <<- function(i){ cat(paste0("\\ref{fig:",figlab[fnum==i],"}")) }  
printfig <<- function(tmp,i){ cat(paste0("\n![",figcap[fnum==i],"\\label{fig:",figlab[fnum==i],"}](figs/",tmp,")   \n ")) } 

tc  <- (read_csv("../doc/data/table_captions.csv"))
tabcap <- tc$cap; tablab <- tc$label
# tap <- data_frame(t=c(1,2),c=c(1,2))
printtab <<- function(tmp,i){tab <- xtable(tmp, digits=0, auto=TRUE,caption = tabcap[i], label = paste0("tab:",tablab[i])); print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x}) } 
reftab <<- function(i){ cat(paste0("tab:",tablab[i])) }  
#print(tablab)

#source("../R/Do_Plots.R")
#source("../R/Do_MCMC.R")
#source("../R/Do_Proj.R")
