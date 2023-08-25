#setwd("~/_mymods/ebswp/doc")
rm(list=ls())
#install.packages("ggridges")
#source("R/prelims.R")
#source("prelims.R")
library(ebswp)
thisyr    <<- 2022
lastyr    <<- thisyr-1
nextyr    <<- thisyr+1

# The model specs

#--Main models to presesnt in Sept   -----------
# Read report file and create gmacs report object (a list):
mod_names <- c("Last year",
               "Base 22",
               "Ageing Error",
               "Diagonal cov BTS","GenGam","SSB=mean ",
               "SSB Empirical wt-age","SSB RE wt-age","AVO new","AVO full","AVO low CV")
length(mod_names)
mod_dir <- c(
  "base",
  "base22",
  "AgeErr",
  "diag",
  "gengam",
  "ssb0",
  "ssb1",
  "ssb2",
  "avon1",
  "avon2",
  "avon3"
  )
# WARNING, commented out line will re-run all the models in the mod_dir directories within "runs"
# Won't do tier 3 spm (proj) model in the subdirectory at the moment
# modlst <- run_model(Output=TRUE)
#---Read in the results for modelsl already run--------------
  library(tidyverse)
  modlst<-get_results()
  names(modlst)
  # Save result so it can be used by the document
  save(modlst,file="~/_mymods/ebswp/doc/septmod.rdata")

#---Covariance diagonal extraction--------
#   a one-off to get the variance term from covariance diagonal into the ob_bts_std
in_data <- read_dat("runs/dat/pm_base22.dat")
cov<- as.matrix(read_table("runs/dat/diag_2022.dat",col_names = F))
std <- sqrt(diag(cov))
in_data$ob_bts_std <- std
?write_dat
write_dat(tmp=in_data)

  # Read pm.dat, then write (e.g.,)
  pm.dat<-read_table("runs/base22/pm.dat",col_names=FALSE)
  row.names(pm.dat) <- c("Desc","main","sel","ctl","altFmsy","cov","wtage","cpue","temp","q")
  pm.dat[2,] <- "../dat/proctune1.dat"
  writeLines(as.character(pm.dat$X1),"runs/ProcTune/pm.dat")
  in_data <- read_dat("runs/dat/pm_base22.dat")
  write_dat(output_file = "runs/dat/proctune1.dat", tmp=in_data)
  # See if different from base
  tail(sc2)
  ctl <-read_dat("runs/ProcTune/control.dat")
  ctlb <-read_dat("runs/base22/control.dat")
  diff <- purrr::map_lgl(names(ctl), ~ !identical(ctl[[.]], ctlb[[.]]))
  sum(diff)
  names(ctl[diff])
  cbind(ctl[diff][2],ctlb[diff][2])
  names(ctl)
  ctl[56]
  write_dat("runs/base22/control.dat",ctl)

# Set an initial working directory
  mod_names <- c("base22","p1")
  mod_dir <- c( "base22", 'ProcTune')
  names(ctl)
  # Note, 0.2 CV for selectivity variability nails it (from base22)
  # Read, adjust, write...
  sc <-read_table("runs/dat/scmed22P.dat",col_names = FALSE); names(sc) <- c("Year","fsh","bts","ats")
  sc2 <-  sc |> mutate(ats = ifelse(ats>0,.2,0))
  write.table(sc2,file="runs/dat/scmed22P.dat",col.names = FALSE,row.names = FALSE)
  modtune <- run_model(Output=TRUE)
  modtune <- get_results()
  names(modtune)
  tab_fit(modtune, mod_scen = c(1,2)) |> gt::gt()
  save(modtune,file="~/_mymods/ebswp/doc/modtune.rdata")
  M <- modtune


#---Start setup for tuning by sdnrs
  df.out <- tibble(iter=0,
                   sdnr_bts=M[[1]]$sdnr_bts,
                   sdnr_ats=M$sdnr_ats,
                   sdnr_avo=M$sdnr_avo)
  df.out
  mod_names <- c("tune")
  .MODELDIR <- c( "../runs/tune/")
  fn        <- paste0(.MODELDIR, "pm");fn

#--Now iterate to get sdnrs near zero-----------
for (i in 1:4){
# step 1
  in_data$ob_ats_std = in_data$ob_ats_std * M$sdnr_ats
  in_data$ob_avo_std = in_data$ob_avo_std * M$sdnr_avo
  in_data$ob_bts_std = in_data$ob_bts_std * M$sdnr_bts
# step 4 now write new data (in_data)
  write_dat(tmp=in_data)
# step 2 run and get results
  system("cd ../runs/tune/; make")
  modlst<-get_results()
  M <- modlst[[1]]
  df.out <- rbind(df.out,tibble(iter=0,
                   sdnr_bts=M$sdnr_bts,
                   sdnr_ats=M$sdnr_ats,
                   sdnr_avo=M$sdnr_avo)
                  )

# step 3 replace stds with adjusted stds by sdnrs from results
  in_data <- read_dat("output.txt")
}
  df.out

#---Try process error tuning--------------
  mod_names <- c("base22","Tune ATS availability")
  mod_dir <- c( "../runs/base22/",  "../runs/ProcTune/")
  modtune<-get_results()
  mod_scen=c(1,2)

  tab_fit(modlst[c(1:3)])

for (i in 1:nmods) print(paste(modlst[[i]]$maxabc1s ,mod_names[i] ))
for (i in 1:nmods) print(paste(modlst[[i]]$Tier3_ABC1 ,mod_names[i] ))
names(modlst)
save(modlst,file="~/_mymods/ebswp/doc/septmod.rdata")
getwd()
save(modlst,file="septmod.rdata")

M<-(modlst[[1]])
M


#---Mohno rho read-----
rhodf      <- read.csv("../doc/data/mohnrho.csv",header=T)
rhoMohn10  <-  rhodf[11,3]
rhoMohn20  <-  rhodf[21,3]
rhoMohn10

# Figure captions
fc  <- (read_csv("../doc/data/fig_captions.csv"))
figcap <<- fc$cap; figlab <<- fc$label; fnum <<- fc$no
reffig <<- function(i){ cat(paste0("\\ref{fig:",figlab[fnum==i],"}")) }
printfig <<- function(tmp,i){ cat(paste0("\n![",figcap[fnum==i],"\\label{fig:",figlab[fnum==i],"}](figs/",tmp,")   \n ")) }

# Table captions
tc  <- (read_csv("../doc/data/table_captions.csv"))
tabcap <- tc$cap; tablab <- tc$label
# tap <- data_frame(t=c(1,2),c=c(1,2))
printtab <<- function(tmp,i){tab <- xtable(tmp, digits=0, auto=TRUE,caption = tabcap[i], label = paste0("tab:",tablab[i])); print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x}) }
reftab <<- function(i){ cat(paste0("tab:",tablab[i])) }
#print(tablab)

#source("../R/Do_Plots.R")
#source("../R/Do_MCMC.R")
#source("../R/Do_Proj.R")
