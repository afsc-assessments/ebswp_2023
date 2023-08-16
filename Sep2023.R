#setwd("~/_mymods/ebswp/doc")
rm(list=ls())
#install.packages("ggridges")
source("R/prelims.R")
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

  modlst<-get_results()
  names(modlst)
  save(modlst,file="~/_mymods/ebswp/doc/septmod.rdata")

# a one-off to get the variance term from covariance diagonal into the ob_bts_std
in_data <- read_dat("../runs/dat/pm_base22.dat")
cov<- as.matrix(read_table("../runs/dat/diag_2022.dat",col_names = F))
std <- sqrt(diag(cov))
in_data$ob_bts_std <- std
write_dat(tmp=in_data)

# Set an initial working directory
  mod_names <- c("base22","p1")
  .MODELDIR <- c( "../runs/base22/", '../runs/ProcTune/')
  fn        <- paste0(.MODELDIR, "pm");fn
  run_model(m="ProcTune")
  M <-get_results()

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
  mod_names <- c("diag","tuned")
  mod_dir <- c( "../runs/diag/",  "../runs/tune/")
  fn        <- paste0("../runs/",mod_dir,"/pm");fn
  modtune<-get_results()
  save(modtune,file="~/_mymods/ebswp/doc/modtune.rdata")

#---Try process error tuning--------------
  mod_names <- c("base22","Process tune 1")
  .MODELDIR <- c( "../runs/base22/",  "../runs/ProcTune/")
  fn        <- paste0(.MODELDIR, "pm");fn
  modtune<-get_results()
  tab_fit(modtune[c(1:2)])
  tab_fit(modlst[c(1:3)])

for (i in 1:nmods) print(paste(modlst[[i]]$maxabc1s ,mod_names[i] ))
for (i in 1:nmods) print(paste(modlst[[i]]$Tier3_ABC1 ,mod_names[i] ))
names(modlst)
save(modlst,file="~/_mymods/ebswp/doc/septmod.rdata")

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
