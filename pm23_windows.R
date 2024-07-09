#setwd("~/_mymods/ebswp/doc")
rm(list=ls())
.THEME=ggthemes::theme_few()
.OVERLAY=TRUE
#install.packages("ggridges")
#source("R/prelims.R")
#source("prelims.R")
library(ebswp)
library(tidyverse)
# library(here)
thisyr    <<- 2023
lastyr    <<- thisyr-1
nextyr    <<- thisyr+1
thismod   <<- 7
the_run_dir <<-"2023_runs"
#bat_dir <<-paste0("C:\\GitProjects\\EBSpollock\\",the_run_dir,"\\")

#source("tools/print_Tier3_tables.R")
# The model specs

#--Main models to present in Sept   -----------
# Read report file and create gmacs report object (a list):
mod_names <- c("base22",
                "sep23",
                "addavo23",
                "addatsage",
                "addcatage",
                "addbtsind",
                "addvastage",
               "usehulsoniss")

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
mod_dir <- c("base22",
    "sep23",
    "addavo23",
    "addatsage",
    "addcatage",
    "addbtsind",
    "addvastage",
    "usehulsoniss")

# WARNING, commented out line will re-run all the models in the mod_dir directories within "runs"
# Won't do tier 3 spm (proj) model in the subdirectory at the moment
#---Read in the results for modelsl already run--------------
#Jim's lines:
#run_model(run_on_mac = FALSE) #run folder is specified within .run_mod_windows. very lame and quit trying to fix it.
#run_proj(run_on_mac = FALSE) #run folder is specific within.run_proj_windows. very lame. hard to fix.
#-------------------
#Carey's lines for trying to run without parallel processing
#stuff<-.run_mod_windows(moddir = "2023_runs\\usehulsoniss") outdated, but tried using stringr to pull apart 2023_runs from usehulsoniss. worked for .run_mod_windows, but not in parallel. ??
#stuff<-.run_mod_windows(moddir = "usehulsoniss")
#tier3 <-.run_proj_windows(moddir = "usehulsoniss")



#-------------------
modlst<-get_results(rundir="C:\\GitProjects\\EBSpollock\\2023_runs",run_on_mac = FALSE)
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
rhodf      <- read.csv("doc/data/mohnrho.csv",header=T) #this datafile is produced somewhere else - in .qmd? (CRM)
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

