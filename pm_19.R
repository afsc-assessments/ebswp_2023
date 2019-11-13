#setwd("~/_mymods/ebswp/doc")
source("../R/prelims.R")
doplots <- F
domcmc  <- F
doproj  <- F
thisyr    = 2019
lastyr    = thisyr-1
nextyr    = thisyr+1

# The model specs
#mod_names <- c("lastyr","base","VAST with cold-pool","VAST BTS and ATS");#.MODELDIR = c( "runs/lastyr/","runs/base/","runs/vast_cp/","runs/vastall/")
#mod_names <- c("lastyr","base","Const BTS Sel","VAST with cold-pool","VAST BTS and ATS") #.MODELDIR = c( "runs/lastyr/","runs/base/","runs/constsel/","runs/vast_cp/","runs/vastall/")
#mod_names <- c("Design-based","VAST NBS","Add NBS") #.MODELDIR = c( "../runs/dbebs/","../runs/V1/","../runs/nbs/")
.THEME    = theme_few(base_size = 11, base_family = "")
.OVERLAY  = TRUE
thismod <- 2 # the selected model

# Read report file and create gmacs report object (a list):
mod_names <- c("lastyr","Model 16.1","VAST","VAST+cold-pool","VAST ATS")
.MODELDIR = c( "../runs/lastyr/","../runs/base/","../runs/vast_nocp/","../runs/vast_cp/","../runs/vast_cp_ats/")
fn       <- paste0(.MODELDIR, "pm")
modlst   <- lapply(fn, read_admb)
names(modlst) <- mod_names
# The model picked
nmods <- length(mod_names)
for (i in 1:nmods) {
  #print(i)k
  modlst[[i]] <- c(modlst[[i]],get_vars(modlst[[i]]))
}
#names(modlst)

M        <- modlst[[thismod]]
P        <- modlst[[1]] # Last year's model (P=previous)
Alt      <- modlst[[3]] # Last year's model (P=previous)
#
rhodf      <- read.csv("../doc/data/mohnrho.csv",header=T)
rhoMohn10  <-  rhodf[11,3]
rhoMohn20  <-  rhodf[21,3]


fc  <- (read_csv("../doc/data/fig_captions.csv"))
figcap <- fc$cap; figlab <- fc$label; fnum <- fc$no
reffig <- function(i){ cat(paste0("\\ref{fig:",figlab[fnum==i],"}")) }  
printfig <- function(tmp,i){ cat(paste0("\n![",figcap[fnum==i],"\\label{fig:",figlab[fnum==i],"}](figs/",tmp,")   \n ")) } 

tc  <- (read_csv("../doc/data/table_captions.csv"))
tabcap <- tc$cap; tablab <- tc$label
# tap <- data_frame(t=c(1,2),c=c(1,2))
printtab <- function(tmp,i){tab <- xtable(tmp, digits=0, auto=TRUE,caption = tabcap[i], label = paste0("tab:",tablab[i])); print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x}) } 
reftab <- function(i){ cat(paste0("tab:",tablab[i])) }  
#print(tablab)

#source("../R/Do_Plots.R")
#source("../R/Do_MCMC.R")
#source("../R/Do_Proj.R")
