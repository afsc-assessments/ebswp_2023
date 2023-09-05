#setwd("~/_mymods/ebswp/doc")
rm(list=ls())
.THEME=ggthemes::theme_few()
.OVERLAY=TRUE
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
mod_names <- c("Last year",   #1
               "Base 22",     #2
               "AVO new",     #3
               "AVO full",    #4
               "Tuned22",     #5
               "Ageing Error",#6
               "Diag cov BTS",#7
               "GenGam",      #8
               "SSB=mean ",   #9
               "SSB Emp. wt-age", #10
               "SSB RE wt-age") #10
mod_dir <- c(
  "base",
  "base22",
  "avon1",
  "avon2",
  "ProcTune",
  "AgeErr",
  "diag",
  "gengam",
  "ssb0",
  "ssb1",
  "ssb2"
  )
# WARNING, commented out line will re-run all the models in the mod_dir directories within "runs"
# Won't do tier 3 spm (proj) model in the subdirectory at the moment
# modlst <- run_model(Output=TRUE)
#---Read in the results for modelsl already run--------------
  library(tidyverse)
  modlst<-get_results()
  #names(modlst)
  # Save result so it can be used by the document
  save(modlst,file="doc/septmod.rdata")



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
  mod_names <- c("AVON Full","Proc_tune")
  mod_dir <- c("avon2", "ProcTune")
  # Note, 0.2 CV for selectivity variability nails it (from base22)
  # Read, adjust, write...
  sc <-read_table("runs/dat/scmed22P.dat",col_names = FALSE); names(sc) <- c("Year","fsh","bts","ats")
  tail(sc )
  # Iterated on selectivity
  sc2 <-  sc |> mutate(ats = ifelse(ats>0,.138,0))
  write.table(sc2,file="runs/dat/scmed22P.dat",col.names = FALSE,row.names = FALSE)
  #modtune <- run_model(Output=TRUE)
  modtune<-get_results()
  tab_fit(modtune, mod_scen = c(1,2)) |> gt::gt()
  tab_ref(modtune, mod_scen = c(1,2)) |> gt::gt()
  tab_ref(modlst, mod_scen = c(4,5)) |> gt::gt()
  (modlst[[4]]$nextyrssbs)
  (modlst[[4]]$nextyrssb.sd)
  (modtune[[1]]$nextyrssbs)
  names(modtune)

  #Now see if can converge on AVON CV--------
  # Read datafile
  in_data <- read_dat("runs/dat/proctune0.dat")
  #in_data <- read_dat("runs/dat/pm_avon2.dat")
  in_data <- read_dat("runs/dat/proctune1.dat")
  in_data$ob_avo_std <- in_data$ob_avo_std * modtune[[2]]$sdnr_avo
  write_dat(output_file = "runs/dat/proctune1.dat", tmp=in_data)
  modtune <- run_model(Output=TRUE)
  tab_fit(modtune, mod_scen = c(1,2)) |> gt::gt()

  save(modtune,file="~/_mymods/ebswp/doc/modtune.rdata")
  #---Compare selectivity for base w/ vast
  modtune[[2]]$sel_ats
  p1 <- plot_sel(sel=modtune[[2]]$sel_ats,styr=1993,fill="darkblue") ;p1
  library(ggridges)
  p1 <- plot_sel(Year=modtune[[2]]$Yr,sel=modtune[[2]]$sel_ats,fage=2,lage=10,styr=1994,fill="darkblue") ;p1
  ggsave("doc/figs/sel_ats_tuned.pdf",plot=p1,width=5,height=8.0,units="in")

  in_data <- read_dat("runs/dat/proctune1.dat")

  write_dat(output_file = "runs/dat/proctune1.dat", tmp=in_data)

  p1 <- plot_sel(sel=M$sel_bts,styr=1982) ;p1
  plot(M$sel_bts[19:59,1])

#---Start setup for tuning by sdnrs-------
  in_data <- read_dat("runs/dat/pm_base22.dat")
  #Get base_22 run to start out (initial SDNRs)
  M <- modtune[[1]]
  # write to new file (the one that gets tuned)
  write_dat(output_file="runs/dat/std_tune.dat",tmp=in_data)
  mod_names <- c("tune"); mod_dir   <- c( "tune")

  # Datafrmame to store convergence
  df.out <- tibble(iter=0,
                   sdnr_bts=M$sdnr_bts,
                   sdnr_ats=M$sdnr_ats,
                   sdnr_avo=M$sdnr_avo)
  df.out
#--Now iterate to get sdnrs near zero-----------
for (i in 1:4){
# step 1
  in_data$ob_ats_std = in_data$ob_ats_std * M$sdnr_ats
  in_data$ob_avo_std = in_data$ob_avo_std * M$sdnr_avo
  in_data$ob_bts_std = in_data$ob_bts_std * M$sdnr_bts
# step 4 now write new data (in_data)
  write_dat(output_file="runs/dat/std_tune.dat",tmp=in_data)
# step 2 run and get results
  system("cd runs/tune/; make")
  modlst<-get_results()
  M <- modlst[[1]]
  df.out <- rbind(df.out,tibble(iter=0,
                   sdnr_bts=M$sdnr_bts,
                   sdnr_ats=M$sdnr_ats,
                   sdnr_avo=M$sdnr_avo)
                  )

# step 3 replace stds with adjusted stds by sdnrs from results
  in_data <- read_dat("runs/dat/std_tune.dat")
}
  df.out

  mod_names <- c("base22","Obs_tune","Proc_tune")
  mod_dir <- c( "base22",  "tune", "ProcTune")
  modtune<-get_results()
  names(modtune)
  tab_fit(modlst[c(3)])
  library(patchwork)
  library(ggthemes)

  .OVERLAY=TRUE
  p1 <- plot_bts(modtune[c(1,2,3)]) + coord_cartesian( ylim = c(0,15000) )+
        scale_x_continuous(limits=c(1982-.5,2022.5)) + theme_few(base_size = 10);p1
  p2 <- plot_ats(modtune[c(1,2,3)]) + coord_cartesian( ylim = c(0,7500) )+
        scale_x_continuous(limits=c(1990-.5,2022.5)) + theme_few(base_size = 10);p2
  p3 <- plot_avo(modtune[c(1,2,3)]) + coord_cartesian( ylim = c(0,1.6) ) +
        scale_x_continuous(limits=c(1990-.5,2022.5)) + theme_few(base_size = 10);p3
p4<-p2/p3 + plot_layout(guides='collect') ;p4
  ggsave("doc/figs/mod_index_fits_tuned.pdf",plot=p4,width=9,height=7.0,units="in")
  #scale_x_continuous(limits=c(1992-.5,2022.5)) ;p4
    #theme(legend.position='bottom') +
  ggsave("doc/figs/mod_bts_fit_tuned.pdf",plot=p1,width=8,height=4.0,units="in")
  #p4<- p1 / ((p2 | p3) + plot_layout(guides='collect')) +
  #plot_annotation(tag_levels = list('a',c(')',')',')')))

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
