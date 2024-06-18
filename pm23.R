#setwd("~/_mymods/ebswp/doc")
rm(list=ls())
.THEME=ggthemes::theme_few()
.OVERLAY=TRUE
#install.packages("ggridges")
#source("R/prelims.R")
#source("prelims.R")
library(ebswp)
library(tidyverse)
thisyr    <<- 2023
lastyr    <<- thisyr-1
nextyr    <<- thisyr+1
thismod   <<- 9

source("tools/print_Tier3_tables.R")
# The model specs

#--Main models to presesnt in Sept   -----------
# Read report file and create gmacs report object (a list):
mod_names <- c("Last year",   #1
               "m1",
               "m2 ",
               "m3",
               "m4",
               "m5",
               "m6",
               "m7",
               "m8")
               #BTS age compositions included through 2023
               #"Sept version",
               #"2023 AVO point",
               #"2022 ATS age updated",
               #"added 2022 catch-age",
               #"BTS to 2023",
               #"BTS db Age")
               #BTS age compositions included through 2023
               #but with Hulsons BTS input sample sizes

               #"Catch update",     #2
               #"AVO new",     #3
               #"AVO full",    #4
               #"Tuned22",     #5
               #"Ageing Error",#6
               #"Diag cov BTS",#7
               #"GenGam",      #8
               ###"SSB=mean ",   #9
               #"SSB Emp. wt-age", #10
               #"SSB RE wt-age") #10
mod_dir <- c(
  "m0",
  "m1",
  "m2",
  "m3",
  "m4",
  "m5",
  "m6",
  "m7",
  "m8")
# WARNING, commented out line will re-run all the models in the mod_dir directories within "runs"
# Won't do tier 3 spm (proj) model in the subdirectory at the moment
#---Read in the results for modelsl already run--------------
#run_model(rundir="2023_runs")
#run_proj(rundir="2023_runs")
modlst<-get_results(rundir="2023_runs")
#names(modlst)
M <<- modlst[[thismod]]
.MODELDIR<<-paste0("2023_runs/",mod_dir,"/")

  #tab_fit(modlst, mod_scen = c(2:9)) |> gt::gt()
  #tab_ref(modlst[c(2:9)]) |> gt::gt() |>  gt::fmt_markdown()
  #names(modlst)
  # Save result so it can be used by the document
  #save(modlst,file="doc/novmod.rdata")
#names(modlst)
#plot_avo(modlst[3:5])

#---Covariance diagonal extraction--------
#---Mohno rho read-----
rhodf      <- read.csv("doc/data/mohnrho.csv",header=T)
rhoMohn10  <-  rhodf[11,3]
rhoMohn20  <-  rhodf[21,3]
rhoMohn10

# Figure captions
fc  <- (read_csv("doc/data/fig_captions.csv"))
figcap <<- fc$cap; figlab <<- fc$label; fnum <<- fc$no
reffig <<- function(i){ cat(paste0("\\ref{fig:",figlab[fnum==i],"}")) }

#![Results of the EBS pollock model for recent spawning biomass estimates comparing the base model using the covariance matrix with the one where only the diagonal is applied.]
#(doc/figs/mod_diag_ssb.pdf){#fig-diagssb}
printfig <<- function(tmp,i){
  cat(paste0("\n![",figcap[fnum==i],"](doc/figs/",tmp,"){#fig-",figlab[fnum==i],"}\n") )
             }
# printfig <<- function(tmp,i){ cat(paste0("\n![",figcap[fnum==i],"\\label{fig:",figlab[fnum==i],"}](doc/figs/",tmp,")   \n ")) }

# Table captions
tc  <- (read_csv("doc/data/table_captions.csv"))
tablab <- tc$label
tabcap <- paste0("\\label{tab:",tablab,"}",tc$cap);
#tc
reftab <<- function(i){ cat(paste0("@tbl-",tablab[i])) }
#reffig(1)
#tabcap[1]
# tap <- data_frame(t=c(1,2),c=c(1,2))
#printtab <<- function(tmp,i){ cat(paste0("\n![",tabcap[fnum==i],"](doc/figs/",tmp,"){#tbl-",tablab[fnum==i],"}\n") )
printtab <<- function(tmp,i){tab <- xtable(tmp, digits=0, auto=TRUE,caption = tabcap[i], label = paste0("tab:",tablab[i])); print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x}) }
#print(tablab)

#source("../R/Do_Plots.R")
#source("../R/Do_MCMC.R")
#source("../R/Do_Proj.R")

