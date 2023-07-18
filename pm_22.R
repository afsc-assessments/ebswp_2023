setwd("~/_mymods/ebswp/doc")
rm(list=ls())
#install.packages("ggridges")
source("../R/prelims.R")
library(doParallel)
library(patchwork)
thisyr    <<- 2022
lastyr    <<- thisyr-1
nextyr    <<- thisyr+1

# The model specs
.THEME    = theme_few(base_size = 11, base_family = "")
.OVERLAY  = TRUE

# Read report file and create gmacs report object (a list):
mod_names <- c("Last year",
  "Catch 2022",
  "Fish ages",
  "Fish wts",
  "BTS index",
  "BTS ages",
  "ATS index+",
  "Base",
  "Est M", 
  "Wt comp")
  #"SigmaR.6")
.MODELDIR <- c( 
  "../runs/c21/",
  "../runs/01/",
  "../runs/02/",
  "../runs/03/",
  "../runs/04/",
  "../runs/05/",
  "../runs/06/",
  "../runs/07/",
  "../runs/08/",
  "../runs/09/")
  #"../runs/10/")

fn        <- paste0(.MODELDIR, "pm");fn
#fn
nmods <- length(mod_names)
#system.time( modlst <- mclapply(fn, read_admb,mc.cores=nmods) )
registerDoParallel(nmods)
system.time( modlst <- parLapply(fn, read_admb,mc.cores=nmods) )

num_cores<-detectCores()-1

cl<-makeCluster(num_cores)
clusterExport(cl, c("read_fit", "read_admb","read_rep","read_psv"), 
                               envir=environment())
system.time(modlst <- parLapply(clust <-cl,fn,read_admb))

?read_admb

#modlst[[2]] <- read_admb(fn[1])
names(modlst) <- mod_names
# The model picked
thismod <- 8 # the selected model
#add_stuff<-function(idx){ proj_file<- paste0(.MODELDIR[idx],"proj/bigfile.out") #modlst[[idx]] <- c(modlst[[idx]],get_vars(modlst[[idx]])) return( c(modlst[[i]],get_vars(modlst[[i]])) ) }
#system.time( modlst<-mclapply(1:nmods,add_stuff,mc.cores=nmods) )
#system.time( 
i=8
nmods
for (i in 1:nmods) {
  proj_file<- paste0(.MODELDIR[i],"proj/spm_detail.csv")
  print(i)
  # fixed to a single
  #proj_file<- "../runs/base/proj/bigfile.out"
  modlst[[i]] <- c(modlst[[i]],get_vars(modlst[[i]])) 
} 

#===Need this lines because last year's Tier was different
modlst[[1]]$abc1       <- (modlst[[1]]$Tier2_ABC1)
modlst[[1]]$abc2       <- (modlst[[1]]$Tier2_ABC2)
modlst[[1]]$abc1s      <- format(round(1e3*modlst[[1]]$abc1,-3),big.mark=",",scientific=F,digits=1)
modlst[[1]]$abc2s      <- format(round(1e3*modlst[[1]]$abc2,-3),big.mark=",",scientific=F,digits=1)

proj_file<- paste0(.MODELDIR[8],"proj/spm_detail_full.csv")
bfs        <- read_csv(proj_file) |> mutate(Alt=Alternative)
Tier3_abc_full <<-  bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(ABC),0))
Tier3_abc_fulls <<- format(round(1e3*Tier3_abc_full,-3),big.mark=",",scientific=F,digits=1)

M        <- modlst[[thismod]]
names(M)
P        <- modlst[[1]] # Last year's model (P=previous)
Alt      <- modlst[[9]] # Last year's model (P=previous)
#M$future_catch[12,1]
#M$future_catch[5,1]

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
# tap <- data_frame(t=c(1,2),c=c(1,2))
printtab <<- function(tmp,i){tab <- xtable(tmp, digits=0, auto=TRUE,caption = tabcap[i], label = paste0("tab:",tablab[i])); print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x}) } 
reftab <<- function(i){ cat(paste0("tab:",tablab[i])) }  
#print(tablab)

#source("../R/Do_Plots.R")
#source("../R/Do_MCMC.R")
#source("../R/Do_Proj.R")

