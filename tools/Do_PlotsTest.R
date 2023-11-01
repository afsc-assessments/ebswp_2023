library(tidyverse)
library(ggthemes)
.THEME <- ggthemes::theme_few()
if (doplots) {
  do_data_plots <- FALSE
#---September 2023 figures---

#--tuned figures
  p1 <- plot_ats(modlst[c(2:7)]) +
        scale_x_continuous(limits=c(1994-.5,2023.5)) + theme_few(base_size = 12);p1
  p1 <- plot_avo(modlst[c(7)]) +
        scale_x_continuous(limits=c(2005-.5,2023.5)) + theme_few(base_size = 12);p1
  p1 <- plot_bts(modlst[c(5,7)]) +
        scale_x_continuous(limits=c(1994-.5,2023.5)) + theme_few(base_size = 12);p1

  p1 <- plot_bts(modlst[c(3,6)]) +
    coord_cartesian( ylim = c(0,20000) )+
        scale_x_continuous(limits=c(1994-.5,2024.5)) + theme_few(base_size = 12);p1
  #---Compare selectivity for base w/ vast
   df <- data.frame(sel=modlst[[1]]$sel_fut,Age=1:15,Model="base")
   df <- rbind(df,data.frame(sel=modlst[[2]]$sel_fut,Age=1:15,Model="tuned"))
   p1 <- df %>% ggplot(aes(x=Age,y=sel,color=Model)) + geom_line(linewidth=1.5) + ggthemes::theme_few() +
     ylab("Selectivity") + scale_x_continuous(breaks=1:15);p1
   library(viridis)
   library(scales)
   library(ggridges)

 p1 <- plot_sel(sel=modlst[[7]]$sel_bts,styr=1982,fill="darkblue") ;p1

 p1 <- plot_sel(sel=modlst[[8]]$sel_ats,styr=1994,fill="darkblue") ;p1
ggsave("doc/figs/mod_ats_sel.pdf",plot=p1,width=4,height=8.0,units="in")



#ggsave("doc/figs/sel_comp_vast.pdf",plot=p1,width=8,height=4.0,units="in")
#---Age diversity
  df <- data.frame(Year=M$Yr,Age=M$H,Measure="Population Age\n diversity")

  p1 <- plot_avo(modlst[c(2)], ylim=NULL) + xlim(c(2005,2024)) + theme_few(base_size = 18);p1
  p1 <- plot_avo(modtune[c(1,2)], ylim=NULL) + xlim(c(2005,2023)) + facet_grid(Model~.,scales='free')+theme_few(base_size = 18);p1

#--tuned figures
  #p1 <- plot_ats(modlst[c(1,3)]) +
  library(ebswp)
  p1 <- plot_ats(modtune[c(1,2)]) +
        scale_x_continuous(limits=c(1994-.5,2022.5)) + facet_grid(Model~.) + theme_few(base_size = 12);p1
  ggsave("doc/figs/mod_ats_updated.pdf",plot=p1,width=5.2,height=3.7,units="in")
  # "Last year",   #1
  # "Base 22",     #2
  # "AVO new",     #3
  # "AVO full",    #4
  # "Tuned22",     #5
  # "Ageing Error",#6
  # "Diag cov BTS",#7
  # "GenGam",      #8
  # "SSB=mean ",   #9
  # "SSB Emp. wt-age", #10
  # "SSB RE wt-age") #11

  .OVERLAY=TRUE
  p1 <- plot_ssb(modlst[c(2,7)],xlim=c(2008.5,2023.5));p1
  p2 <- plot_recruitment(modlst[c(2,7)],xlim=c(2000.5,2023.5)) +
    theme_few(base_size = 15);p2
  p3 <- ebswp::plot_srr(modlst[c(1,7)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000)) +
    theme_few(base_size = 15);p3

  p1 <- plot_bts(modlst[c(8,5)],xlim=c(1981.5,2023.5),ylim=c(0,15500)) ;p1
  ggsave("doc/figs/mod_bts_gengam.pdf",plot=p1,width=8,height=5.0,units="in")

  p1 <- plot_bts(modlst[c(5,7)],xlim=c(1981.5,2023.5),ylim=c(0,15500)) ;p1
  ggsave("doc/figs/mod_bts_diag.pdf",plot=p1,width=8,height=5.0,units="in")

  p1 <- plot_ssb(modlst[c(1,2)],xlim=c(2008.5,2023.5));p1
  ggsave("doc/figs/mod_ats_updated_ssb.pdf",plot=p1,width=5.2,height=3.7,units="in")

  p1 <- plot_ssb(modlst[c(5,7)],xlim=c(2008.5,2023.5));p1
  ggsave("doc/figs/mod_diag_ssb.pdf",plot=p1,width=5.2,height=3.7,units="in")

  p1 <- plot_ssb(modlst[c(5,9:11)],xlim=c(2008.5,2023.5));p1
  ggsave("doc/figs/mod_ssb_ssb.pdf",plot=p1,width=5.2,height=3.7,units="in")

#---Get SSB wt-age------------
  M <- modlst[[5]]
 df<- rbind(data.frame(M$wt_fsh,year=1964:2022,source='Base'), data.frame(modlst[[9]]$wt_ssb,year=1964:2022,source='SSB0'),
            data.frame(modlst[[10]]$wt_ssb,year=1964:2022,source='SSB1'), data.frame(modlst[[11]]$wt_ssb,year=1964:2022,source='SSB2'))
  names(df)=c(as.character(1:15),"year","source")
  glimpse(df)
  p1<- df |>  pivot_longer(cols=1:15,values_to="wt",names_to="age")  |>
    mutate(age=as.numeric(age) ) |>  filter(age<11,age>2,year>1990) |>
    group_by(year,source,age) |>  summarise(age=as.numeric(age),weight=mean(wt)) |>
    ggplot(aes(x=year,y=weight,color=source)) + geom_line(size=1) + facet_grid(age~.,scale='free') +
    xlab("Year") + ylab("Mean weight (kg)") +ggthemes::theme_few() + ggtitle("Pollock body weight-at-age"); p1
  ggsave("doc/figs/wt_ssb.pdf",plot=p1,width=6,height=7.7,units="in")

#---Compare survey fits------------
  #--BTS------------------
  # Age error
  p1 <- plot_bts(modlst[c(5,6)],xlim=c(1981.5,2023.5),ylim=c(0,15500)) ;p1
  ggsave("doc/figs/mod_bts_ageerr.pdf",plot=p1,width=8,height=5.0,units="in")

  p1 <- plot_bts(modlst[c(5,8)],xlim=c(1981.5,2023.5),ylim=c(0,15500)) ;p1
  ggsave("doc/figs/mod_bts_gengam.pdf",plot=p1,width=8,height=5.0,units="in")

for (i in 1:nmods) print(paste(modlst[[i]]$rmse_bts ,mod_names[i] ))
  df<-data.frame(rmse=NULL,model=NULL)
for (i in c(2,4,5))
  df <- rbind(df,data.frame(rmse=modlst[[i]]$rmse_bts ,model=mod_names[i] ))

df |> ggplot(aes(x=model,fill=model,y=rmse)) + geom_bar(stat='identity') + ggthemes::theme_few()

  #--ATS------------------
p1 <- plot_ats(modlst[c(8,5)],xlim=c(1993.5,2023.5),ylim=c(0,10000)) ;p1
  ggsave("doc/figs/mod_ats_gengam.pdf",plot=p1,width=8,height=5.0,units="in")
  #--AVO------------------

#---Compare selectivity for base w/ vast
#df <- data.frame(sel=modlst[[2]]$sel_fut,Age=1:15,Model="base")
#df <- rbind(df,data.frame(sel=modlst[[4]]$sel_fut,Age=1:15,Model="With 2021"))
##df %>% group_by(Model) %>% summarize(mean(sel))
#p1 <- df %>% ggplot(aes(x=Age,y=sel,color=Model)) + geom_line(size=1.5) + theme_few() + ylab("Selectivity") + scale_x_continuous(breaks=1:15)
#ggsave("doc/figs/sel_comp_vast.pdf",plot=p1,width=8,height=4.0,units="in")
#---Age diversity
  df <- data.frame(Year=M$Yr,Age=M$H,Measure="Population Age\n diversity")
  df <- rbind(df,data.frame(Year=M$Yr,Age=M$avg_age_mature,Measure="SSB Age\n diversity"))
  p1 <- df %>% filter(Year>1979) %>% ggplot(aes(x=Year,y=Age,color=Measure)) + geom_line(size=2) +
    theme_few() + scale_x_continuous(limits=c(1980,2023), breaks=seq(1980,2023,5));p1
  p1
  ggsave("doc/figs/age_diversity.pdf",plot=p1,width=8,height=3.0,units="in")
#---Recruit
  #p1 <- plot_recruitment(modlst[c(1,2,3)],xlim=c(2008.5,2019.5));p1
  #p1 <- plot_ssb(modlst[c(1,2,3)],xlim=c(2008.5,2019.5));p1
  #p1 <- plot_bts(modlst[c(1,2,3)],xlim=c(2008.5,2019.5));p1
  #p1 <- plot_Nage_3(modlst[c(1,2)],xlim=c(2000.5,2023.5));p1
  p1 <- plot_recruitment(modlst[c(3,2)],xlim=c(2000.5,2022.5))+ylab("");p1

  p2 <- plot_recruitment(modlst[c(2,3)],xlim=c(2000.5,2022.5))+ylab("");
  p3 <- plot_recruitment(modlst[c(3,4)],xlim=c(2000.5,2022.5))+ylab("");
  p4 <- plot_recruitment(modlst[c(4,5)],xlim=c(2000.5,2022.5))+ylab("");
  p5 <- plot_recruitment(modlst[c(5,6)],xlim=c(2000.5,2022.5))+ylab("");
  p6 <- plot_recruitment(modlst[c(6,7)],xlim=c(2000.5,2022.5))+ylab("");
  p7 <- plot_recruitment(modlst[c(7,8)],xlim=c(2000.5,2022.5))+ylab("");
  p8 <- plot_recruitment(modlst[c(8,9)],xlim=c(2000.5,2022.5))+ylab("");
  p1 <- plot_recruitment(modlst[c(1,8)],xlim=c(2000.5,2022.5))+ylab("");p1
  (p1+p2)/
  (p3+p4)/
  (p5+p6)/
  (p7+p8)
   #p2 <- plot_ssb(modlst[c(1:7)],xlim=c(2008.5,2021.5),breaks=seq(2008,2021,by=2),alpha=.2); p2
  #p2 <- plot_ssb(modlst[c(1,4)],xlim=c(2008.5,2021.5),breaks=seq(2008,2021,by=2),alpha=.2); p2
  #p2 <- plot_ssb(modlst[c(1,5)],xlim=c(2008.5,2021.5),breaks=seq(2008,2021,by=2),alpha=.2); p2
#---SSB-------------------------
  modlst[[3]]$SSB
  p1 <- plot_ssb(modlst[c(1,6,5,4)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1

  p1 <- plot_ssb(modlst[c(6,5,4)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1
  p1 <- plot_recruitment(modlst[c(1,2)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1
  p1 <- plot_ssb(modlst[c(6,5,4)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1
  p1 <- plot_ssb(modlst[3],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1
  p2 <- plot_ssb(modlst[c(8,9)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p2
  # Comparing base with 2 vast configurations
  p3 <- p1/p2; p3
  ggsave("doc/figs/mod_bridge.pdf",plot=p1,width=8,height=5.0,units="in")

#---BTS Fit---------------------
  # Comparing base with 2 vast configurations
  #p1 <- plot_recruitment(modlst[c(2,4,5)],xlim=c(2010.8,2019.5));p1
  p1 <- plot_bts(modlst[c(3,2)],xlim=c(1981.5,2023.5),ylim=c(0,15500)) ;p1
  ggsave("doc/figs/mod_bts_fit.pdf",plot=p1,width=8,height=4.0,units="in")
  #p1 <- plot_ssb(modlst[c(3,4)],xlim=c(2000.5,2020.5),alpha=.2); p1
  #plot_recruitment(modlst,xlim=c(2004.5,2018.5))
  #plot_ssb(modlst,xlim=c(2004.5,2020.5),alpha=.1)
  #plot_ssb(modlst[c(2,3)],xlim=c(2004.5,2020.5),alpha=.1)
  #plot_bts(modlst,xlim=c(1981.5,2019.5),ylim=c(0,35000))
  #ggsave("doc/figs/mod_eval0a.pdf",plot=p1,width=6,height=4,units="in")
  p1 <- plot_bts(modlst[c(1,2)],xlim=c(2009.5,2022.5),ylim=c(0,15000)) ;p1
#  plot_bts(modlst[c(3)],xlim=c(1982,2019.5),ylim=c(0,15000))
##  plot_bts(modlst[c(2)],xlim=c(1982,2019.5),ylim=c(0,15000))
  ggsave("doc/figs/mod_bts_bridge.pdf",plot=p1,width=8,height=4,units="in")
  #M$maxabc2s
  #M$sel_fut
#  names(M)
  #M$sel_fsh
  #sel
  #M<- modlst[[thismod]]
#---Selectivity-----------------
  yr=c(M$Yr,2024);sel<-rbind(M$sel_fsh,M$sel_fut)
  p1 <- plot_sel(Year=yr,sel=sel,scale=3); p1
  #p1 <- plot_sel();p1
  #dtmp <- p1$data %>% filter(Year==2022)
  #p1 <- p1 + geom_density_ridges(data=dtmp, stat="identity",fill="gold",alpha=.02) ;p1
  #p1 <- p1 + geom_density_ridges(data=dtmp, stat="identity",fill="gold",alpha=.2) ;p1

  #plot_sel(sel=Alt$sel_fsh)
  ggsave("doc/figs/mod_fsh_sel.pdf",plot=p1,width=4,height=9,units="in")

  p1 <- plot_sel(sel=M$sel_bts,styr=1982,fill="darkblue") ;p1
  #plot_sel(sel=M$sel_eit,styr=1994,fill="darkblue")
  M<-modlst[[1]]
  p1 <- plot_sel(sel=M$sel_ats[,-1],styr=2020) ;p1
  ggsave("doc/figs/mod_bts_sel.pdf",plot=p1,width=4,height=8,units="in")
 # p1 <- plot_mnage(modlst[c(2,3)])
  #p1 <- plot_mnage(modlst[thismod]) ;p1
  p1 <- plot_mnage(modlst[thismod]) ;p1 # Note used model 1 for figure...because of kludge for age compos
  ggsave("doc/figs/mod_mean_age.pdf",plot=p1,width=5.8,height=8,units="in")
  p1 <- plot_bts(modlst[thismod]) ; p1
  ggsave("doc/figs/mod_bts_biom.pdf",plot=p1,width=5.2,height=3.7,units="in")


  ggsave("doc/figs/mod_ats_bridging.pdf",plot=p1,width=5.2,height=3.7,units="in")

#  p1 <- p1+ geom_vline(xintercept=2006.5,color="grey",size=1)
  #p1 <- p1+scale_y_log10()
  p1 <- plot_ats(modlst[c(1,8)]) +theme_few(base_size=11) ;p1
  ggsave("doc/figs/mod_ats_biom.pdf",plot=p1,width=9.2,height=3.7,units="in");
  p1 <- plot_avo(modlst[c(1,7,8)], ylim=NULL) + xlim(c(2005,2023)) + facet_grid(Model~.,scales='free')+theme_few(base_size = 18);p1
#  p1 <- plot_avo(modlst[c(2)]) ;p1
  ggsave("doc/figs/mod_avo_fit.pdf",plot=p1,width=9.2,height=4.7,units="in")
  #p1 <- plot_cope(modlst[[2]]) ;p1
  p1 <- plot_cpue(modlst[[thismod]])
  ggsave("doc/figs/mod_cpue_fit.pdf",plot=p1,width=5.2,height=3.7,units="in")
  p1 <- plot_recruitment(modlst[thismod],xlim=c(1963.5,2021.5),fill="yellow");p1
  p1 <- plot_recruitment(modlst[c(1:2)],xlim=c(2000.5,2022.5),fill="yellow") + theme_few(base_size = 14);p1
  p1 <- plot_ssb(modlst[c(1:2)],xlim=c(2000.5,2022.5),fill="yellow");p1
  ggsave("doc/figs/mod_rec.pdf",plot=p1,width=9,height=4,units="in")
  ggsave("doc/figs/mod_rec.pdf",plot=p1,width=9,height=4,units="in")

#  p1 <- plot_srr(modlst[c(thismod)],alpha=.2,xlim=c(0,5200),ylim=c(0,77000));p1
#  ggsave("doc/figs/mod_srr_sq_a.pdf",plot=p1,width=9,height=4,units="in")

  #srr_dir  = c("../runs/sr0/","../runs/sr1/", "../runs/sr2/","../runs/sr3/")
  #srr_names  = c("Standard","Ignore 1978 YC","Diffuse prior","FMSY=F35%")
  #fn       <- paste0(srr_dir,"pm")
  #srrlst   <- lapply(fn, read_admb)
  #names(srrlst) <- c(srr_names)
  #nsrrmods <- length(srr_names)
  ##for (i in 1:nmods) {
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000)                    );p1
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=1978,sizeout=1,sizein=5);p1
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1,8)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000),sizeout=3,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),sizeout=3,sizein=1);p1
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(2)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1,3)],alpha=.2,xlim=c(0,5200),ylim=c(0,95000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1,4)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1,2)],alpha/ssb=.2,xlim=c(0,5200),ylim=c(0,100000));p1
#
#  p1 <- plot_srr(modlst[c(1,8)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000),sizeout=2,sizein=4,yrsin=c(1977,1979:2020));p1

modlst
  p1 <- plot_srr(modlst[c(4:6)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000),sizeout=2,sizein=4,yrsin=c(1977,1979:2020));p1
#  p1 <- plot_srr(modlst[c(1,2)],alpha=.2,xlim=c(0,5200),ylim=c(0,100000));p1
  ggsave("doc/figs/mod_srr_M",plot=p1,width=9,height=4,units="in")
  #p1 <- plot_srr(modlst[c(3,5)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000));p1
  #p1 <- plot_srr(modlst[c(3,6)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000));p1
  #p1 <- plot_srr(modlst[c(1,8)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000));p1

  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),
  #Save status quo (sq) and c and d for comparisons
  #ggsave("doc/figs/mod_srr_sq_c_d.pdf",plot=p1,width=9,height=4,units="in")
  #names(modlst) modlst[[3]]$abc1s modlst[[4]]$abc1s modlst[[3]]$maxabc1s
  #p1 <- p1 + theme_few(base_size=16) p1
  #p1 <- plot_srr(modlst[c(thismod)],alpha=.2,xlim=c(0,4500),ylim=c(0,80000),
  p1 <- plot_srr(modlst[c(1,6)],alpha=.2,xlim=c(0,4500),ylim=c(0,80000),
    yrsin=c(1977,1979:2020),sizeout=2,sizein=4);p1
  ggsave("doc/figs/mod_srr.pdf",plot=p1,width=7.4,height=4.9,units="in")
  #p1 <- plot_srr(modlst[c(2,4)],alpha=.2,xlim=c(0,5200),ylim=c(0,75000))
  #ggsave("doc/figs/bholt_ricker.pdf",plot=p1,width=7.4,height=3.9,units="in")

#--Age fits-----
  af_title <- paste(thisyr,"Assessment")
  #plot_agefit(modlst[[thismod]],case_label=af_title,gear="bts",type="survey")
  af_title<-"2023 Assessment, VAST+ISS (new base, 23.0)"
  plot_agefit(modlst[[thismod]],case_label=af_title,gear="bts",type="survey",styr=1982,ageplus=10)
  ggsave("doc/figs/mod_bts_age.pdf",width=6,height=8)
  af_title<-"2023 Assessment, DB"
  plot_agefit(modlst[[7]],case_label=af_title,gear="bts",type="survey",styr=1982,ageplus=10)
  ggsave("doc/figs/mod_bts_age_db.pdf",width=6,height=8)
  af_title<-"2023 Assessment, VAST"
  plot_agefit(modlst[[8]],case_label=af_title,gear="bts",type="survey",styr=1982,ageplus=10)
  ggsave("doc/figs/mod_bts_age_vast.pdf",width=6,height=8)

plot_agefit(modlst[[9]],case_label=af_title,gear="fsh",type="fishery",styr=1984,ageplus=10)
plot_agefit(modlst[[6]],case_label=af_title,gear="bts",type="survey",styr=1984,ageplus=10)()
  pdf("doc/figs/mod_ats_age.pdf",width=6,height=8)
  plot_agefit(modlst[[2]],case_label=af_title,gear="ats",type="survey",styr=2001)
  plot_agefit(modlst[[1]],case_label=af_title,gear="ats",type="survey",styr=2001)
  dev.off()
#  plot_agefit(modlst[[2]],case_label=af_title,gear="fsh",type="fishery",styr=1992)
  pdf("doc/figs/mod_fsh_age.pdf",width=6,height=8)
  plot_agefit(modlst[[thismod]],case_label=af_title,gear="fsh",type="fishery",styr=1992,ageplus=10)
  plot_agefit(modlst[[thismod]],case_label=af_title,gear="fsh",type="fishery",styr=1978,ageplus=10)
  dev.off()
  #plot_agefit(modlst[[2]],case_label=af_title,gear="fsh",type="fishery",styr=1992,ageplus=10)
  #plot_agefit(M,case_label=af_title,gear="fsh",type="fishery")

  #---Data influence------------
  #XXXXXX
  #CAB_names <- factor(c("Model 16.1 \nlast year", "Catch added", "Add ATS", "Add BTS", "Add AVO"),levels=c("Model 16.1 \nlast year", "Catch added", "Add ATS", "Add BTS", "Add AVO"))
  #CAB_names <- c("Model 16.1 \nlast year", "Catch added","C")
  #factor(sizes, levels = c("small", "medium", "large"))
  #.CABMODELDIR = c( "../runs/lastyr/", "../runs/C/","../runs/CA/","../runs/CAB/","../runs/CABA/")
  #CAB_names <- (c("Model 16.2 \nlast year", "Catch added", "Add Catch-age", "Add DB USV", "VAST USV")) ,levels=c("Model 16.2 \nlast year", "Catch added", "Add Catch-age", "Add DB USV", "VAST USV"))
#  .CABMODELDIR = c( "../runs/2020/", "../runs/ca/","../runs/cab/","../runs/base/")

  # Read report file and make list
  #fn       <- paste0(.CABMODELDIR, "pm")
  #CABmodlst   <- lapply(fn, read_admb)
  CAB_names <- (c("last year", "Add 2021 catch", "Add BTS", "Add ATS", "Add AVO"))
  CABmodlst   <- modlst[c(2,4,6,7,8)]
  names(CABmodlst)
  str(CABmodlst)

  #CAB_names <- c("last year", "Catch added", "+Catch-age", "+BTS", "+AVO")
#  CAB_names <- c("last year", "Catch added","Agin")
  names(CABmodlst) <- CAB_names
  names(CABmodlst)
  nmods <- length(CAB_names)
  #for (i in 1:nmods) CABmodlst[[i]] <- c(CABmodlst[[i]],get_vars(CABmodlst[[i]]))
  #p1 <-  plot_ssb(CABmodlst[c(1,3,5)],xlim=c(2009.5,2019.5),alpha=.1,ylim=c(0,5200)); p1
  A <- .get_ssb_df(CABmodlst)
  names(A)
  A$Model <- factor(A$Model ,levels= c("last year", "Add 2021 catch", "Add BTS", "Add ATS","Add AVO"))
  p1 <- ggplot(A,aes(x=year,y=ssb,ymin=lb,ymax=ub,fill=Model)) + labs(x = "Year", y = "Spawning biomass") +
        theme_few(base_size=14) +
        expand_limits(y = 0) + geom_line(aes(linetype=Model,color=Model),size=1.2) +
        scale_x_continuous(limits=c(2010,2022), breaks=2010:2022)  +
        geom_ribbon(alpha = 0.1)  ;p1
  ggsave("doc/figs/mod_data.pdf",plot=p1,width=8,height=4,units="in")
  #plot_ssb(CABmodlst,xlim=c(2009.5,2020.5),alpha=.05,ylim=c(0,6000),breaks=2009:2020)
  #p2 <-  plot_recruitment(CABmodlst,xlim=c(2009.5,2020.5),alpha=.05) ;p2
  #p2 <-  p2 + scale_fill_discrete(labels=CAB_names) + scale_color_discrete(labels=CAB_names) + theme_few()
  #p3 <- p1/p2
  #p1
  #plot_ssb(modlst[],xlim=c(2004.5,2018.5),alpha=.1,ylim=c(0,5200))
  #for (i in 1:length(mod_names)) modlst[[i]] <- c(modlst[[i]],get_vars(modlst[[i]]))
  #plot_recruitment(CABmodlst[c(1,5)],xlim=c(2000.5,2019.5),fill="yellow")

#--q sensitivity----------
# taken from tab.Rmd (proflst)
#names(proflst)
#.MODELFN  = c("r_1","r_2","r_3","r_4","r_5")
#prof_names  = c("CV70%","CV50%","CV20%","CV10%","CV05%")
#fn       <- paste0("../runs/q_sens/prof/",.MODELFN)
#proflst   <- lapply(fn, read_admb)
#proflst[[6]] <- M
#names(proflst) <- c(prof_names,"16.1")
#nmods <- length(prof_names)
#for (i in 1:nmods) {
  ##print(i)k
  #proflst[[i]] <- c(proflst[[i]],get_vars(proflst[[i]]))
#}

#p1 <- plot_ssb(proflst[c(2,6)],ylim=c(0,5500),xlim=c(1990.5,2019.5),alpha=.1) + scale_x_continuous(limits=c(1990,2020),breaks=seq(1990,2020,5))
#p2 <- plot_ssb(proflst[c(5,6)],ylim=c(0,5500),xlim=c(1990.5,2019.5),alpha=.1)+ scale_x_continuous(limits=c(1990,2020),breaks=seq(1990,2020,5))
#p3 <- arrangeGrob(p1,p2,nrow=2)
#ggsave("doc/figs/q_sens_ssb.pdf",plot=p3,width=5.2,height=7.5,units="in")
  #q<-NULL
  #for (i in 1:5)
	  #q <- rbind(q,data.frame(Year=1982:2019,Model=names(proflst[i]),q=rowMeans(proflst[[i]]$q_bts_3_8)))
#
	#head(q)
	#av <- read.table("../runs/dat/avail.dat",header=TRUE)
	#av <- av %>% transmute(Year=Year,Model="COLE",q=q)
	#q <- rbind(q,av)
	#q <- q %>% group_by(Model) %>% mutate(mq=mean(q)) %>% ungroup() %>% transmute(Year=Year,Model=Model,q=q/mq)
#
  #q %>% group_by(Model) %>% summarize(mean(q))
	#p3 <- q %>% filter(Model %in% c("CV70%")) %>% ggplot(aes(y=q,x=Year,col=Model)) + geom_line(size=1.3) + theme_few() +  scale_x_continuous(limits=c(1987,2019),breaks=seq(1987,2019,by=3)) ;p3
	#p3 <- q %>% filter(Model %in% c("COLE","CV05%","CV50%")) %>% ggplot(aes(y=q,x=Year,col=Model)) + geom_line(size=1.3) + theme_few() +  scale_x_continuous(limits=c(1987,2019),breaks=seq(1987,2019,by=3)) ;p3
#ggsave("doc/figs/q_sens.pdf",plot=p3,width=8.2,height=3.5,units="in")

#--CV sensitivity----------
#.MODELFN  = c("../runs/usv/","../runs/usv_vast/","../runs/estcvdb/","../runs/estcvvast/")
#prof_names  = c("DB CV20%","VAST CV20%","DB Sampling CV","VAST est. CV")
#fn       <- paste0(.MODELFN,"pm")
#cvlst   <- lapply(fn, read_admb)
##proflst[[6]] <- M
#names(cvlst) <- c(prof_names)
#nmods <- length(prof_names)
#for (i in 1:nmods) {
  #cvlst[[i]] <- c(cvlst[[i]],get_vars(cvlst[[i]]))
#}
#p1 <- plot_ssb(cvlst, ylim=c(0,6500),breaks=seq(1990,2020,2), xlim=c(1990.5,2020.5),alpha=.1) ;p1
#
#p1 <- plot_ats(cvlst[c(1:2)]) +theme_few(base_size=11) ;p1
#p2 <- plot_ats(cvlst[c(3:4)]) +theme_few(base_size=11) ;p2
#p5 <- p1/p2
#p5
#ggsave("doc/figs/mod_ats_eval1.pdf",plot=p5,height=7,width=6.0,units="in");
#p3 <- plot_ssb(cvlst[c(1,3)] , ylim=c(0,6000),breaks=seq(1990,2020,5), xlim=c(1990.5,2020.5),alpha=.1) ;p3
#p4 <- plot_ssb(cvlst[c(2,4)] , ylim=c(0,6000),breaks=seq(1990,2020,5), xlim=c(1990.5,2020.5),alpha=.1) ;p4
#p5 <- p3/p4
#ggsave("doc/figs/mod_ats_eval2.pdf",plot=p5,height=7,width=6.0,units="in");

 #---SSB figure----------------------------
  M <- modlst[[7]]
  P <- modlst[[1]]
  M$future_catch[4,2:6]
  M$future_catch
  M$future_SSB[5,2:6 ]
  M$future_SSB
df <- rbind(
  rbind(data.frame(Model="This year",Year= M$SSB[,1], SSB=M$SSB[,2], lb=M$SSB[,4], ub=M$SSB[,5]),
data.frame(Model="This year",Year= nextyr:(nextyr+4), SSB=M$future_SSB[4,2:6], lb = M$future_SSB[4,2:6] -2*M$future_SSB.sd[4,2:6], ub = M$future_SSB[4,2:6] +2*M$future_SSB.sd[4,2:6])),
      rbind(data.frame(Model="Last year",Year= P$SSB[,1], SSB=P$SSB[,2], lb=P$SSB[,4], ub=P$SSB[,5]),
data.frame(Model="Last year",Year= (nextyr-1):(nextyr+3), SSB=P$future_SSB[4,2:6], lb = P$future_SSB[4,2:6] -2*P$future_SSB.sd[4,2:6], ub = P$future_SSB[4,2:6] +2*P$future_SSB.sd[4,2:6]))
    )
p1 <- ggplot(df,aes(x=Year,y=SSB,ymax=ub,ymin=lb,fill=Model)) + geom_ribbon(alpha=.6) + geom_line() +  theme_few() +
  scale_x_continuous(limits=c(2002,2028),breaks=seq(2002,2028,2)) +
  ylab("Female spawning biomass (kt)") +
  geom_vline(xintercept=2023,col="grey",size=1.2); p1
  ggsave("doc/figs/proj_ssb.pdf",plot=p1,width=7.4,height=4.5,units="in")

  #---R/S------------------
  M <- modlst[[7]]
  nyrs=length(M$SSB[,1])
  dt <- data.table(yr=M$SSB[1:nyrs,1],ssb= M$SSB[1:nyrs,2], r=M$R[2:(nyrs-1),2] )
  dt <- dt %>% mutate(Year=substr(as.character(yr),3,4),rs= log(dt$r/dt$ssb))
  head(dt)
  p1 <- ggplot(dt,aes(x=yr,y=rs)) + geom_point(size=4,col="red") + geom_line() +geom_smooth() + theme_few(base_size=12) + ylab("ln(Recruits/spawning biomass)") + xlab("Year")
  #ggplot(dt,aes(x=ssb,y=rs)) + geom_point(size=4,col="red") + geom_path() +geom_smooth(method="lm") + .THEME + ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)")
  p2 <- ggplot(dt,aes(x=ssb,y=rs,label=Year)) + geom_text() + geom_path(size=.5,alpha=.4) +geom_smooth(method="lm") + theme_few(base_size=12) +
       ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)") +  guides(size=FALSE,shape=FALSE,alpha=FALSE,col=FALSE)
  p3 <- p1 / p2;p3
  ggsave("doc/figs/mod_rs.pdf",plot=p3,width=5.2,height=7.5,units="in")

  thismod=7
  p1 <- plot_ser(modlst[thismod],xlim=c(1964,thisyr+1),alpha=.7) + scale_x_continuous(breaks=seq(1965,thisyr+1,5))
  p1
  ggsave("doc/figs/mod_ser.pdf",plot=p1,width=9.2,height=7.0,units="in"); p1

  #---fishing mortality mod_F.pdf-----------------------------------------------------------------
  df <-data.frame(Year=M$Yr,M$F); names(df) <- c("Year",1:15); df.g <- gather(df,age,F,2:16,-Year)
  df
  p1 <- df.g %>% mutate(age=as.numeric(age)) %>% filter(age<11)%>% ggplot(aes(y=age,x=Year,fill=F)) + geom_tile() + .THEME + ylab("Age")+ geom_contour(aes(z=F),color="darkgrey",size=.5,alpha=.4) +
            scale_fill_gradient(low = "white", high = "red") + scale_x_continuous(breaks=seq(1965,thisyr,5)) + geom_line(data=df.g[df.g$age=="6",],aes(x=Year,y=F*10)) +
            annotate("text", label = "Age 6 F (x10)" , x = 2015, y = 1.2, size = 5, colour = "black") + scale_y_continuous(breaks=seq(0,10,1))
  p1
  ggsave("doc/figs/mod_F.pdf",plot=p1,width=9.2,height=6.0,units="in")

  #---Historical assessment retrospectives--------------------------------------------------------
  dd <- as.data.frame(read.csv("doc/data/Age3history.csv",header=TRUE))
  head(dd)
  names(dd) <- c("Year",2021:2006,2001:1998)
  dd.g <- pivot_longer(dd,cols=2:21,names_to="Assessment",values_to="Biomass")
  head(dd.g)
  # this line to add current year estimate!!
  t <- data.frame(Year=1964:(thisyr+1), Assessment=thisyr,Biomass=c(M$age3plus,M$age3plus1)  )
  dd.g <- rbind(dd.g,t) %>% filter(as.numeric(Assessment) >2006)
  tmp <- dd.g %>% filter(Year>2006,Year==1+as.numeric(Assessment)) # %>% summarise(max(Year))
  p1 <- ggplot(dd.g,aes(x=Year,y=Biomass,color=Assessment)) + geom_line(alpha=.8,size=.75) +
    scale_x_continuous(breaks=seq(1980,thisyr+2,2),limits=c(1980,thisyr+1))  +  xlab("Year") + ylim(0,16000) + ylab("Age 3+ biomass (kt)") +
    geom_point(data=tmp,size=2) + theme_few() +
    guides(size=FALSE,shape=FALSE,alpha=FALSE,col=FALSE)
    p1
  ggsave("doc/figs/mod_hist.pdf",plot=p1,width=9.2,height=4.0,units="in")

#----------------------------------------------------------
  # Extract Fmsy for different selectivity years

  idx=grep("msy2_dec",M$fit$name)
  length(idx)

  fdf <- data.frame(year=rep(2013:2022,2),
  Source=M$fit$name[idx],
  est = M$fit$est[idx],
  std = M$fit$std[idx])
  unique(fdf$Source)

p1<-  fdf %>% filter(Source!="Fmsy2_decwt") %>%
    ggplot(aes(x=year+.1,y=est,ymax=est+2*std,ymin=est-2*std))+
          geom_errorbar(width=.3) + geom_point(size=5,color="purple") + theme_few(base_size=12) + xlab("Year selected for MSY calculation") +
    scale_x_continuous(breaks=seq(2013,thisyr,1),limits=c(2012,thisyr+1))  +
          ylab("Fmsy");p1
  ggsave("doc/figs/fmsy_sel_hist.pdf",plot=p1,width=5.2,height=4.0,units="in")

  ##
  sel <- M$sel_fsh
  seldf=NULL
  yrs <- (thisyr-10):(thisyr)
     lrow<-dim(sel)[1]
      seldf<-rbind(seldf, data.frame(yrs,rep(thisyr,11),sel[(lrow-10):lrow,])) %>% rbind(c("proj",thisyr,M$sel_fut))
      #assign(mn,read_rep(rn))
  names(seldf) <- c("Year","Assessment",1:15)
  seldfm <- seldf %>%  pivot_longer(cols=3:17,names_to="age",values_to="Selectivity") %>%
                  mutate(
                    age=as.numeric(age),
                    Selectivity=as.numeric(Selectivity),
                    Assessment=as.numeric(Assessment),
                    case = ifelse(Year=="proj","Proj.","Est."),
                    Year=as.numeric(ifelse(Year=="proj",Assessment+1,Year))
                    )
  glimpse(seldfm)
 assdf <- seldfm %>% filter(Year>Assessment) %>% mutate(age=as.factor(age),Year=as.factor(Year))
 yrdf  <- seldfm %>% filter(Year<=Assessment,Year>thisyr-10) %>%mutate(age=as.factor(age),Year=as.factor(Year))
p1<- seldfm %>% filter(age<9,Year>thisyr-10)%>% group_by(Year,Assessment,case) %>%
 summarise(mnage=sum(Selectivity*age)/sum(Selectivity)) %>%
 ggplot(aes(x=Year,y=mnage,shape=case,color=case)) + geom_point(size=2) +
 theme_few() + ylim(c(0,10)) + ylab( "Mean age selected")+
      scale_x_continuous(breaks=seq(2010,2022,by=2))
p1
p1 <-    ggplot(assdf,aes(x=age,y=Selectivity,color=case,group=Year)) +
          geom_point(size=.5) + geom_line() + theme_few() +
          facet_grid(Year~.) + geom_point(data=yrdf,size=.5) + facet_grid(Year~.)
p1
  ggsave("doc/figs/retro_sel.pdf",plot=p1,width=5.2,height=9.0,units="in")
  #plot_recruitment(retouts,xlim=c(1990,2017),rel=T,legend=FALSE,alpha=.2)


  # Plot of regimes on base model

regime=c("1964-77", "1978-present", "1978-99", "1978-89", "1990-present", "1990-99", "2000-present", "1964-present")
hlr <- M$regime[2]
  p3 <- tibble(regime=regime,Mean=M$regime,ub=Mean+2*M$regime.sd,lb=Mean-2*M$regime.sd) %>%
  ggplot(aes(x=regime,y=Mean,ymax=ub,ymin=lb)) + geom_linerange(size=1.5) + theme_few(base_size=12) +
         ylab("Mean recruitment (age 1)") + geom_point(size=4,color="red") + geom_hline(yintercept=hlr,linetype=2)
  ggsave("doc/figs/mod_regimes.pdf",plot=p3,width=9.2,height=5.0,units="in")

  #---Fits to ats age mod_ats_age.pdf-------------------------------------------------------------
  pdf("doc/figs/mod_ats_age.pdf",width=6,height=8)
  plot_agefit(M,case_label=paste(thisyr,"Assessment"),gear="ats")
  dev.off()
run_dir ;
mod_dir
.MODELDIR <- paste0('2023_runs/',mod_dir,'/')
.MODELDIR

  #----Read in retro results-----------------

  i=2
mod=9
  getret <- function(nyrs=10, mod=1){
    retouts<- list()
    for (i in 0:nyrs) {
      rn=paste0(.MODELDIR[mod],"retro/r_",i,".rep")
      mn=paste0("r_",i)
      assign(mn,read_rep(rn))
      retouts[[mn]] <- (get(mn))
    }
    return(retouts)
  }
  library(patchwork)
  ret1<-getret(mod=9,nyrs=20)
  ret2<-getret(mod=2,nyrs=20)
  ret3<-getret(mod=3,nyrs=20)
  p1 <- plot_ssb(ret2,xlim=c(2000,thisyr),legend=F,breaks=seq(2000,2023,2),ylim=c(0,6900)) + xlab("") +ggtitle("Sept 2023") + coord_cartesian(ylim=c(0,NA));p1
  p2 <- plot_ssb(ret1,xlim=c(2000,thisyr),legend=F,breaks=seq(2000,2023,2),ylim=c(0,6900))+ggtitle("2023.0 base") + coord_cartesian(ylim=c(0,NA));p2
  #p3 <- plot_ssb(ret3,xlim=c(2000,thisyr),legend=F,breaks=seq(2000,2022,2),ylim=c(0,6900))+ggtitle("w/o BTS") + coord_cartesian(ylim=c(0,NA));p3
  p3 <- p1/p2   + plot_annotation(title = 'Spawning biomass retrospectives ')
    #subtitle = 'EBS walleye pollock assessment', caption = 'Disclaimer: Draft results, please do not cite' ); p3
  ggsave("doc/figs/retcompSSB.pdf",plot=p3,width=7.2,height=9.0,units="in")

  # recruitment
  p1 <- plot_R_rel(ret2,xlim=c(thisyr-20,thisyr-1),legend=F,rel=FALSE,ylim=c(0,120000),ylab="Age-1 recruitment") + xlab("") +ggtitle("Sept 2023")+coord_cartesian(ylim=c(0,125000));p1
  p2 <- plot_R_rel(ret1,xlim=c(thisyr-20,thisyr-1),legend=F,rel=FALSE,ylim=c(0,120000),ylab="Age-1 recruitment") + ggtitle("2023.0 base") + coord_cartesian(ylim=c(0,125000));p2
  p3 <- p1/p2   #+ plot_annotation(title = 'Age 1 recruitment with and without acoustic trawl survey data',
  #  subtitle = 'EBS walleye pollock assessment', caption = 'Disclaimer: Draft results, please do not cite' ); p3
  ggsave("doc/figs/retcompR.pdf",plot=p3,width=7.2,height=9.0,units="in")
  p3

  ## Make dataframe to plot by cohort
  nyrs=15
  i=2
  retdf

  i=12

  names(ret1)
  mean(ret1[["r_0"]]$R[,2])
  get_coh <- function(ret=ret1,run="Base",nyrs=20){
    M <- as.data.frame(NULL)
    for (i in 0:nyrs) {
      mn=paste0("r_",i)
      A <- as.data.frame(ret[[mn]]$R)
      is.data.frame(A)
      A$ret <- i
      A$run <- run
      A$cohort <- A[,1]-1
      A$term_yr <- 2022-A$ret
      A$Yrs_of_data <- A$term_yr-A$cohort
      names(A) <- c("Year","est","sd","lb","ub","peel","run","cohort","term_yr","Years_data")
      M <- rbind(M,A)
    }
    return(M)
  }
  # Plot by years of data
ret_df <- rbind(get_coh(ret1),get_coh(ret2,run="Sept. base")) |> mutate(Years_data=ifelse(run=="Base",Years_data-.14,Years_data+.14))
ret_df <- rbind(get_coh(ret1),get_coh(ret2,run="Without ATS"),get_coh(ret3,run="Without BTS")) |> mutate(Years_data=ifelse(run=="Base",Years_data-.18,ifelse(run=="Without ATS",Years_data,Years_data+.18))  )

plot_coh <- function(dat=ret_df,coh=cohsub,logscale=FALSE,grid=T){
  p1 <- dat |>  filter(cohort %in% coh) |>
  ggplot( aes(x=Years_data,label=term_yr,y=est,color=run,ymin=lb,ymax=ub)) + geom_point(size=1) + geom_errorbar(size=.5,width=0) +
    theme_few(base_size = 11) +
    ylim(c(0,NA)) +
    geom_hline(yintercept=22.5e3,color="blue",size=.1) +
    ylab("Millions") +
    ggtitle("Age-1 recruitment estimates by cohort") #+ geom_text( aes(x=mean(Yeaes()x=mean()Years_data
   if (logscale) p1 <- p1 +  scale_y_log10()
   if (grid) p1 <- p1 +facet_grid(cohort~.) else p1 <- p1 +facet_wrap(cohort~.)
 return(p1)
}

ret_df <- get_coh(ret1)|> mutate(Years_data=ifelse(run=="Base",Years_data-.14,Years_data+.14))
cohsub <- c(2003:2005,2008)
cohsub <- c(2012:2013,2008)
cohsub <- c(2012:2013,2008)
plot_coh( grid=FALSE, coh= cohsub)
plot_coh( grid=FALSE, coh= c(2005,2008,2012:2013,2016,2018) )
plot_coh( grid=FALSE, coh= c(2005,2008,2012:2013,2016,2018) )
plot_coh( grid=FALSE, coh= c(2003:2005,2008) )
plot_coh( grid=T, coh= c(2003:2005) )
plot_coh( grid=T, coh= c(2008,2012:2013,2016,2018) ) + theme_few(base_size=14) + ylab("millions") + xlab("Years of data")
  ggsave("doc/figs/retro_cohort.pdf",width=7.2,height=9.0,units="in")
plot_coh( grid=T, coh= c(2008,2012:2013,2018) , logscale=TRUE)
plot_coh(logscale=TRUE)

  # Plot by endyr
  ret_df <- rbind(plot_coh(ret1),plot_coh(ret1,run="WS")) |> mutate(term_yr=ifelse(run=="Base",term_yr-.1,term_yr+.1))
  ggplot(ret_df |>
  #         filter(cohort %in% c(2008:2022)),
           filter(cohort %in% c(2008,2012:2013,2016,2018)),
         aes(x=term_yr,y=est,color=run,ymin=lb,ymax=ub)) + geom_point(size=2) + geom_errorbar(size=1,width=0) +
    theme_few() + facet_grid(cohort~.) + scale_y_log10() + geom_hline(yintercept=22.5e3,color="blue",size=.1) +
    ggtitle("Age-1 recruitment estimates by cohort") + theme_few(base_size=14) + xlab("Terminal year") + ylab("millions")
  ggsave("doc/figs/retro_cohort_termyr.pdf",width=7.2,height=9.0,units="in")

  ggsave("doc/figs/mod_retro.pdf",plot=p3,width=7.2,height=9.0,units="in")
  p1 <- plot_R_rel(retouts,xlim=c(thisyr-10,thisyr),legend=F,rel=FALSE,ylab="Age 1 recruitment");p1
  p2 <- plot_R_rel(retouts,xlim=c(thisyr-10,thisyr),ylim=c(0.,3.5),legend=FALSE,alpha=.2);p2 <- p2+ylim(0,4); p2
  p3 <- p1/p2;p3
  ggsave("doc/figs/mod_retroR.pdf",plot=p3,width=7.2,height=9.0,units="in")
  p1 <- plot_R_rel(retouts,xlim=c(thisyr-20,thisyr),legend=F,rel=FALSE);p1
  p2 <- plot_R_rel(retouts,xlim=c(thisyr-20,thisyr),ylim=c(0.,3.5),legend=FALSE,alpha=.2);p2 <- p2+ylim(0,4); p2
  p3 <- p1/p2
  ggsave("doc/figs/mod_retroR20.pdf",plot=p3,width=7.2,height=9.0,units="in")
  p3
  ###
  # Get sel_fut from retrospectives and compare
  i=2
  getwd()
  seldf<-NULL
  for (i in 0:10) {
      mn=paste0("r_",i)
      #seldf<-rbind(seldf,
     sel <-get(mn)$sel_fsh
     yrs <- (thisyr-i-10):(thisyr-i)
     lrow<-dim(sel)[1]
      seldf<-rbind(seldf, data.frame(yrs,rep(thisyr-i,11),sel[(lrow-10):lrow,])) %>% rbind(c("proj",thisyr-i,get(mn)$sel_fut))
      #assign(mn,read_rep(rn))
      #retouts[[mn]] <- (get(mn))
    #seldf <- rbind()
  }
  names(seldf) <- c("Year","Assessment",1:15)
  seldfm <- seldf %>%  pivot_longer(cols=3:17,names_to="age",values_to="Selectivity") %>%
                  mutate(
                    age=as.numeric(age),
                    Selectivity=as.numeric(Selectivity),
                    Assessment=as.numeric(Assessment),
                    case = ifelse(Year=="proj","Proj.","Est."),
                    Year=as.numeric(ifelse(Year=="proj",Assessment+1,Year))
                    )
  glimpse(seldf)
  glimpse(seldfm)
  tail(seldfm)
 assdf <- seldfm %>% filter(Year>Assessment) %>% mutate(age=as.factor(age),Year=as.factor(Year))
 yrdf  <- seldfm %>% filter(Year<=Assessment,Year>thisyr-10) %>%mutate(age=as.factor(age),Year=as.factor(Year))
p1<- seldfm %>% filter(age<9,Year>thisyr-10)%>% group_by(Year,Assessment,case) %>%
 summarise(mnage=sum(Selectivity*age)/sum(Selectivity)) %>%
 ggplot(aes(x=Year,y=mnage,shape=case,color=case)) + geom_point(size=2) +
 theme_few() + ylim(c(4,8)) + ylab( "Mean age selected")+
      scale_x_continuous(breaks=seq(2010,2022,by=2))
      p1
  ggsave("doc/figs/retro_sel_mnage.pdf",plot=p1,width=5.2,height=4.0,units="in")
  assdf %>% print(n=Inf)
  yrdf %>% filter(Assessment==2021) %>%inner_join(assdf,join_by Year)
  %>% print(n=Inf)

p1 <-    ggplot(assdf,aes(x=age,y=Selectivity,color=case,group=Year)) +
          geom_point(size=.8) + geom_line() + theme_few() +
          facet_grid(Year~.) + geom_point(data=yrdf,size=1) + facet_grid(Year~.)
p1
  ggsave("doc/figs/retro_sel.pdf",plot=p1,width=5.2,height=9.0,units="in")
  #plot_recruitment(retouts,xlim=c(1990,2017),rel=T,legend=FALSE,alpha=.2)
  #plot_R_rel(retouts,xlim=c(1980,2017),ylim=c(0.5,1.5),legend=FALSE,alpha=.2)
  # Mohn's rho

  #icesAdvice::mohn()
     #base   -1   -2   -3   -4   -5
#2009 0.96 0.95 0.94 0.92 0.89 0.86
#2010 0.72 0.71 0.70 0.67 0.63 0.59
#2011 0.82 0.79 0.78 0.73 0.67 0.60
#2012 0.80 0.75 0.73 0.66 0.54   NA
#2013 0.67 0.62 0.61 0.51   NA   NA
#2014 0.74 0.66 0.63   NA   NA   NA
#2015 0.63 0.52   NA   NA   NA   NA
#2016 0.57   NA   NA   NA   NA   NA
#r$> mohn(shake)
#[1] -0.2310701

retouts<-ret1
i=2
getMohn <- function(retouts=ret1,nyrs=20){
  rc = retouts[[1]]$SSB[,2]
  ntmp=0
  rho=0
  df <- data.frame(peel=1:20,rho=1:20)
  for (i in 1:20) {
    rn <- names(retouts[i])
    dtmp = (get(paste0(rn))$SSB )
    lr   = length(dtmp[,1])
    rho  = rho +(dtmp[lr,2] -rc[lr])/rc[lr]
    df$peel[i] <- i-1
    df$rho[i] <- rho/i
    print(paste(i,rho/i))
  }
}
  write.csv(df,"doc/data/mohnrho.csv")
  df
  library(flextable)
  # A try at a catch table not quite there...
cd <- read_csv("../data/fishery/sampler/imported/akfin_cat.csv")
names(cd) <- c("Year","Area","Subarea","NMFS_area","Trip_code","Trip_name","Species","ret_disc","Gear_code","catch","WED")
cd_tab<- cd %>% filter(Area=="BSAI") %>% mutate(Subarea=ifelse(NMFS_area==518,"Bogoslof",
                                               ifelse(NMFS_area<520,"SE",
                                               ifelse(NMFS_area<540,"NW","Aleutians")))) %>%
group_by(Year,Subarea,ret_disc) %>% summarise(catch=sum(catch)) %>%
pivot_wider(names_from=c(Subarea,ret_disc),values_from=catch) %>% flextable() %>%  print(n=Inf)
print(cd_tab)
  #--------new catch/biomass figure-------------
  #M$SSB
  #df <- data.table(Year=M$SSB[,1],SSB=2*M$SSB[,2],Catch=M$obs_catch,U=M$obs_catch/(2*M$SSB[,2]))
  #ggplot(df,aes(x=Year,y=U)) + geom_line(size=2,color="red") + .THEME + xlim(c(1990,2020)) + ylab("Catch / spawning biomass")
  #--------phase plane figure-------------------
  source("../R/do-phase.R")


#Look at SER

  idx
  idx=grep("SER_Fmsy",M$fit$name)
  est = M$fit$est[idx]
  std = M$fit$std[idx]
  std/est

#---Catch grid and future effort consequences---------------------------------------------------
  dc <-data.frame(Catch=M$future_catch,scen=c(seq(.5,1.5,.05),2),"catch");
  dc[1:5] <- dc[1:5]/1350
  dc <-data.frame(Year=thisyr:(thisyr+5),Catch=c(1350,M$future_catch[22,]), F=M$Future_F[22,], SSB=M$future_SSB[22,])
  dc <-data.frame(Year=thisyr:(thisyr+5),F=M$Future_F[22,], SSB=M$future_SSB[22,])
  M$Future_F
  dc$F <- dc$F/dc$F[1]
  dc$SSB <- dc$SSB/dc$SSB[1]
  df.g <- gather(dc,key=Measure,val,-Year)
  df.g
  p1 <-   df.g %>% ggplot(aes(x=Year,y=val,col=Measure)) + .THEME + geom_line(size=2) + ylim(0.25,2.00) + ggtitle(paste0("Projected trend relative to ",thisyr," given future catch=1,350 kt")) + ylab("Relative value")
  p1
  ggsave("doc/figs/future_F.pdf",plot=p1,width=7.4,height=5,units="in")

  # ,scen=c(seq(.5,1.5,.05),2),"catch");
  names(dc) <- c(2020:2024,"scen","var")
  db <-data.frame(SSB=M$future_SSB,scen=seq(.5,1.5,.05),"SSB");
  db<- cbind(db[,2:6]/db[,1],db[,7:8])
  db$scen <- dc[,1]
  names(db) <- c(2018:2022,"scen","var")
  df.g <- rbind( gather(dc,year,val,1:5) , gather(db,year,val,1:5) )
  df.g$year <- as.numeric(df.g$year)
  head(df.g)
  # df.g %>% filter(var=="catch") %>% ggplot(aes(x=year,y=scen,z=val)) + .THEME + geom_contour() + ()
  df.g %>% filter(Measure=="catch") %>% select(year,scen,val) %>% ggplot(aes(x=year,y=scen)) + .THEME + geom_density_2d()

# Look at some of the retros and mcmc runs
# mcmc first
srdf <-read.table(paste0(.MODELDIR[thismod],"/mcmc/mcSRR.rep"))
srdf <-read_table("mcmc/mcSRR.rep")
srdf
srsm <- sample(1:5000,2000)
names(srdf) <- c("draw","stock","recruits")
srdf<-srdf %>% filter(draw %in% srsm) %>% mutate(stock=as.numeric(stock),recruits=as.numeric(recruits),draw=as.factor(draw)) #%>%
srdf %>% ggplot(aes(x=stock,y=recruits,group=draw)) + geom_line(size=.1,alpha=.4,color="coral") + theme_few() +
xlim(c(0,6000)) + ylim(c(0,50000))
srsm

# retros maybe
  fmdf<-NULL
  i=2
  for (i in 0:10) {
      mn=paste0("r_Fmort_",i)

#---Compare selectivity for base w/ vast
#df <- data.frame(sel=modlst[[2]]$sel_fut,Age=1:15,Model="base")
#df <- rbind(df,data.frame(sel=modlst[[4]]$sel_fut,Age=1:15,Model="With 2021"))
##df %>% group_by(Model) %>% summarize(mean(sel))
#p1 <- df %>% ggplot(aes(x=Age,y=sel,color=Model)) + geom_line(size=1.5) + theme_few() + ylab("Selectivity") + scale_x_continuous(breaks=1:15)
#ggsave("doc/figs/sel_comp_vast.pdf",plot=p1,width=8,height=4.0,units="in")
#---Age diversity
  df <- data.frame(Year=M$Yr,Age=M$H,Measure="Population Age\n diversity")
  df <- rbind(df,data.frame(Year=M$Yr,Age=M$avg_age_mature,Measure="SSB Age\n diversity"))
  p1 <- df %>% filter(Year>1979) %>% ggplot(aes(x=Year,y=Age,color=Measure)) + geom_line(size=2) + theme_few() + scale_x_continuous(limits=c(1980,2022), breaks=seq(1980,2022,5));p1
  ggsave("doc/figs/age_diversity.pdf",plot=p1,width=8,height=3.0,units="in")
#---Recruit
  #p1 <- plot_recruitment(modlst[c(1,2,3)],xlim=c(2008.5,2019.5));p1
  #p1 <- plot_ssb(modlst[c(1,2,3)],xlim=c(2008.5,2019.5));p1
  #p1 <- plot_bts(modlst[c(1,2,3)],xlim=c(2008.5,2019.5));p1
  #p1 <- plot_Nage_3(modlst[c(1,2)],xlim=c(2000.5,2023.5));p1
  p1 <- plot_recruitment(modlst[c(3,2)],xlim=c(2000.5,2022.5))+ylab("");p1

  p2 <- plot_recruitment(modlst[c(2,3)],xlim=c(2000.5,2022.5))+ylab("");
  p3 <- plot_recruitment(modlst[c(3,4)],xlim=c(2000.5,2022.5))+ylab("");
  p4 <- plot_recruitment(modlst[c(4,5)],xlim=c(2000.5,2022.5))+ylab("");
  p5 <- plot_recruitment(modlst[c(5,6)],xlim=c(2000.5,2022.5))+ylab("");
  p6 <- plot_recruitment(modlst[c(6,7)],xlim=c(2000.5,2022.5))+ylab("");
  p7 <- plot_recruitment(modlst[c(7,8)],xlim=c(2000.5,2022.5))+ylab("");
  p8 <- plot_recruitment(modlst[c(8,9)],xlim=c(2000.5,2022.5))+ylab("");
  p1 <- plot_recruitment(modlst[c(1,8)],xlim=c(2000.5,2022.5))+ylab("");p1
  (p1+p2)/
  (p3+p4)/
  (p5+p6)/
  (p7+p8)
   #p2 <- plot_ssb(modlst[c(1:7)],xlim=c(2008.5,2021.5),breaks=seq(2008,2021,by=2),alpha=.2); p2
  #p2 <- plot_ssb(modlst[c(1,4)],xlim=c(2008.5,2021.5),breaks=seq(2008,2021,by=2),alpha=.2); p2
  #p2 <- plot_ssb(modlst[c(1,5)],xlim=c(2008.5,2021.5),breaks=seq(2008,2021,by=2),alpha=.2); p2
#---SSB-------------------------
  modlst[[3]]$SSB
  p1 <- plot_ssb(modlst[c(1,6,5,4)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1

  p1 <- plot_ssb(modlst[c(6,5,4)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1
  p1 <- plot_recruitment(modlst[c(1,2)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1
  p1 <- plot_ssb(modlst[c(6,5,4)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1
  p1 <- plot_ssb(modlst[3],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p1
  p2 <- plot_ssb(modlst[c(8,9)],xlim=c(2008.5,2022.5),breaks=seq(2008,2024,by=2),alpha=.2); p2
  # Comparing base with 2 vast configurations
  p3 <- p1/p2; p3
  ggsave("doc/figs/mod_bridge.pdf",plot=p1,width=8,height=5.0,units="in")

#---BTS Fit---------------------
  # Comparing base with 2 vast configurations
  #p1 <- plot_recruitment(modlst[c(2,4,5)],xlim=c(2010.8,2019.5));p1
  p1 <- plot_bts(modlst[c(3,2)],xlim=c(1981.5,2023.5),ylim=c(0,15500)) ;p1
  ggsave("doc/figs/mod_bts_fit.pdf",plot=p1,width=8,height=4.0,units="in")
  #p1 <- plot_ssb(modlst[c(3,4)],xlim=c(2000.5,2020.5),alpha=.2); p1
  #plot_recruitment(modlst,xlim=c(2004.5,2018.5))
  #plot_ssb(modlst,xlim=c(2004.5,2020.5),alpha=.1)
  #plot_ssb(modlst[c(2,3)],xlim=c(2004.5,2020.5),alpha=.1)
  #plot_bts(modlst,xlim=c(1981.5,2019.5),ylim=c(0,35000))
  #ggsave("doc/figs/mod_eval0a.pdf",plot=p1,width=6,height=4,units="in")
  p1 <- plot_bts(modlst[c(1,2)],xlim=c(2009.5,2022.5),ylim=c(0,15000)) ;p1
#  plot_bts(modlst[c(3)],xlim=c(1982,2019.5),ylim=c(0,15000))
##  plot_bts(modlst[c(2)],xlim=c(1982,2019.5),ylim=c(0,15000))
  ggsave("doc/figs/mod_bts_bridge.pdf",plot=p1,width=8,height=4,units="in")
  #M$maxabc2s
  #M$sel_fut
#  names(M)
  #M$sel_fsh
  #sel
  #M<- modlst[[thismod]]
#---Selectivity-----------------
  yr=c(M$Yr,2023);sel<-rbind(M$sel_fsh,M$sel_fut)
  p1 <- plot_sel(Year=yr,sel=sel,scale=3); p1
  #p1 <- plot_sel();p1
  #dtmp <- p1$data %>% filter(Year==2022)
  #p1 <- p1 + geom_density_ridges(data=dtmp, stat="identity",fill="gold",alpha=.02) ;p1
  #p1 <- p1 + geom_density_ridges(data=dtmp, stat="identity",fill="gold",alpha=.2) ;p1

  #plot_sel(sel=Alt$sel_fsh)
  ggsave("doc/figs/mod_fsh_sel.pdf",plot=p1,width=4,height=9,units="in")

  p1 <- plot_sel(sel=M$sel_bts,styr=1982,fill="darkblue") ;p1
  #plot_sel(sel=M$sel_eit,styr=1994,fill="darkblue")
  M<-modlst[[1]]
  p1 <- plot_sel(sel=M$sel_ats[,-1],styr=2020) ;p1
  ggsave("doc/figs/mod_bts_sel.pdf",plot=p1,width=4,height=8,units="in")
 # p1 <- plot_mnage(modlst[c(2,3)])
  #p1 <- plot_mnage(modlst[thismod]) ;p1
  p1 <- plot_mnage(modlst[thismod]) ;p1 # Note used model 1 for figure...because of kludge for age compos
  ggsave("doc/figs/mod_mean_age.pdf",plot=p1,width=5.8,height=8,units="in")
  p1 <- plot_bts(modlst[thismod]) ; p1
  ggsave("doc/figs/mod_bts_biom.pdf",plot=p1,width=5.2,height=3.7,units="in")


  ggsave("doc/figs/mod_ats_bridging.pdf",plot=p1,width=5.2,height=3.7,units="in")

#  p1 <- p1+ geom_vline(xintercept=2006.5,color="grey",size=1)
  #p1 <- p1+scale_y_log10()
  p1 <- plot_ats(modlst[c(1,8)]) +theme_few(base_size=11) ;p1
  ggsave("doc/figs/mod_ats_biom.pdf",plot=p1,width=9.2,height=3.7,units="in");
  p1 <- plot_avo(modlst[c(1,7,8)], ylim=NULL) + xlim(c(2005,2023)) + facet_grid(Model~.,scales='free')+theme_few(base_size = 18);p1
#  p1 <- plot_avo(modlst[c(2)]) ;p1
  ggsave("doc/figs/mod_avo_fit.pdf",plot=p1,width=9.2,height=4.7,units="in")
  #p1 <- plot_cope(modlst[[2]]) ;p1
  p1 <- plot_cpue(modlst[[thismod]])
  ggsave("doc/figs/mod_cpue_fit.pdf",plot=p1,width=5.2,height=3.7,units="in")
  p1 <- plot_recruitment(modlst[thismod],xlim=c(1963.5,2021.5),fill="yellow");p1
  p1 <- plot_recruitment(modlst[c(1:2)],xlim=c(2000.5,2022.5),fill="yellow") + theme_few(base_size = 14);p1
  p1 <- plot_ssb(modlst[c(1:2)],xlim=c(2000.5,2022.5),fill="yellow");p1
  ggsave("doc/figs/mod_rec.pdf",plot=p1,width=9,height=4,units="in")
  ggsave("doc/figs/mod_rec.pdf",plot=p1,width=9,height=4,units="in")

#  p1 <- plot_srr(modlst[c(thismod)],alpha=.2,xlim=c(0,5200),ylim=c(0,77000));p1
#  ggsave("doc/figs/mod_srr_sq_a.pdf",plot=p1,width=9,height=4,units="in")

  #srr_dir  = c("../runs/sr0/","../runs/sr1/", "../runs/sr2/","../runs/sr3/")
  #srr_names  = c("Standard","Ignore 1978 YC","Diffuse prior","FMSY=F35%")
  #fn       <- paste0(srr_dir,"pm")
  #srrlst   <- lapply(fn, read_admb)
  #names(srrlst) <- c(srr_names)
  #nsrrmods <- length(srr_names)
  ##for (i in 1:nmods) {
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000)                    );p1
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=1978,sizeout=1,sizein=5);p1
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1,8)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000),sizeout=3,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),sizeout=3,sizein=1);p1
  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(2)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1,3)],alpha=.2,xlim=c(0,5200),ylim=c(0,95000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1,4)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  #p1 <- plot_srr(srrlst[c(1,2)],alpha/ssb=.2,xlim=c(0,5200),ylim=c(0,100000));p1
#
#  p1 <- plot_srr(modlst[c(1,8)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000),sizeout=2,sizein=4,yrsin=c(1977,1979:2020));p1

modlst
  p1 <- plot_srr(modlst[c(4:6)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000),sizeout=2,sizein=4,yrsin=c(1977,1979:2020));p1
#  p1 <- plot_srr(modlst[c(1,2)],alpha=.2,xlim=c(0,5200),ylim=c(0,100000));p1
  ggsave("doc/figs/mod_srr_M",plot=p1,width=9,height=4,units="in")
  #p1 <- plot_srr(modlst[c(3,5)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000));p1
  #p1 <- plot_srr(modlst[c(3,6)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000));p1
  #p1 <- plot_srr(modlst[c(1,8)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000));p1

  #p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),
  #Save status quo (sq) and c and d for comparisons
  #ggsave("doc/figs/mod_srr_sq_c_d.pdf",plot=p1,width=9,height=4,units="in")
  #names(modlst) modlst[[3]]$abc1s modlst[[4]]$abc1s modlst[[3]]$maxabc1s
  #p1 <- p1 + theme_few(base_size=16) p1
  #p1 <- plot_srr(modlst[c(thismod)],alpha=.2,xlim=c(0,4500),ylim=c(0,80000),
  p1 <- plot_srr(modlst[c(1,6)],alpha=.2,xlim=c(0,4500),ylim=c(0,80000),
    yrsin=c(1977,1979:2020),sizeout=2,sizein=4);p1
  ggsave("doc/figs/mod_srr.pdf",plot=p1,width=7.4,height=4.9,units="in")
  #p1 <- plot_srr(modlst[c(2,4)],alpha=.2,xlim=c(0,5200),ylim=c(0,75000))
  #ggsave("doc/figs/bholt_ricker.pdf",plot=p1,width=7.4,height=3.9,units="in")
  af_title <- paste(thisyr,"Assessment")
  #plot_agefit(modlst[[thismod]],case_label=af_title,gear="bts",type="survey")
  pdf("doc/figs/mod_bts_age.pdf",width=6,height=8)
  plot_agefit(modlst[[thismod]],case_label=af_title,gear="bts",type="survey",styr=1982,ageplus=10)
  dev.off()

  pdf("doc/figs/mod_ats_age.pdf",width=6,height=8)
  plot_agefit(modlst[[2]],case_label=af_title,gear="ats",type="survey",styr=2001)
  plot_agefit(modlst[[1]],case_label=af_title,gear="ats",type="survey",styr=2001)
  dev.off()
#  plot_agefit(modlst[[2]],case_label=af_title,gear="fsh",type="fishery",styr=1992)
  pdf("doc/figs/mod_fsh_age.pdf",width=6,height=8)
  plot_agefit(modlst[[thismod]],case_label=af_title,gear="fsh",type="fishery",styr=1992,ageplus=10)
  plot_agefit(modlst[[thismod]],case_label=af_title,gear="fsh",type="fishery",styr=1978,ageplus=10)
  dev.off()
  #plot_agefit(modlst[[2]],case_label=af_title,gear="fsh",type="fishery",styr=1992,ageplus=10)
  #plot_agefit(M,case_label=af_title,gear="fsh",type="fishery")

  #---Data influence------------
  #XXXXXX
  #CAB_names <- factor(c("Model 16.1 \nlast year", "Catch added", "Add ATS", "Add BTS", "Add AVO"),levels=c("Model 16.1 \nlast year", "Catch added", "Add ATS", "Add BTS", "Add AVO"))
  #CAB_names <- c("Model 16.1 \nlast year", "Catch added","C")
  #factor(sizes, levels = c("small", "medium", "large"))
  #.CABMODELDIR = c( "../runs/lastyr/", "../runs/C/","../runs/CA/","../runs/CAB/","../runs/CABA/")
  #CAB_names <- (c("Model 16.2 \nlast year", "Catch added", "Add Catch-age", "Add DB USV", "VAST USV")) ,levels=c("Model 16.2 \nlast year", "Catch added", "Add Catch-age", "Add DB USV", "VAST USV"))
#  .CABMODELDIR = c( "../runs/2020/", "../runs/ca/","../runs/cab/","../runs/base/")

  # Read report file and make list
  #fn       <- paste0(.CABMODELDIR, "pm")
  #CABmodlst   <- lapply(fn, read_admb)
  CAB_names <- (c("last year", "Add 2021 catch", "Add BTS", "Add ATS", "Add AVO"))
  CABmodlst   <- modlst[c(2,4,6,7,8)]
  names(CABmodlst)
  str(CABmodlst)

  #CAB_names <- c("last year", "Catch added", "+Catch-age", "+BTS", "+AVO")
#  CAB_names <- c("last year", "Catch added","Agin")
  names(CABmodlst) <- CAB_names
  names(CABmodlst)
  nmods <- length(CAB_names)
  #for (i in 1:nmods) CABmodlst[[i]] <- c(CABmodlst[[i]],get_vars(CABmodlst[[i]]))
  #p1 <-  plot_ssb(CABmodlst[c(1,3,5)],xlim=c(2009.5,2019.5),alpha=.1,ylim=c(0,5200)); p1
  A <- .get_ssb_df(CABmodlst)
  names(A)
  A$Model <- factor(A$Model ,levels= c("last year", "Add 2021 catch", "Add BTS", "Add ATS","Add AVO"))
  p1 <- ggplot(A,aes(x=year,y=ssb,ymin=lb,ymax=ub,fill=Model)) + labs(x = "Year", y = "Spawning biomass") +
        theme_few(base_size=14) +
        expand_limits(y = 0) + geom_line(aes(linetype=Model,color=Model),size=1.2) +
        scale_x_continuous(limits=c(2010,2022), breaks=2010:2022)  +
        geom_ribbon(alpha = 0.1)  ;p1
  ggsave("doc/figs/mod_data.pdf",plot=p1,width=8,height=4,units="in")
  #plot_ssb(CABmodlst,xlim=c(2009.5,2020.5),alpha=.05,ylim=c(0,6000),breaks=2009:2020)
  #p2 <-  plot_recruitment(CABmodlst,xlim=c(2009.5,2020.5),alpha=.05) ;p2
  #p2 <-  p2 + scale_fill_discrete(labels=CAB_names) + scale_color_discrete(labels=CAB_names) + theme_few()
  #p3 <- p1/p2
  #p1
  #plot_ssb(modlst[],xlim=c(2004.5,2018.5),alpha=.1,ylim=c(0,5200))
  #for (i in 1:length(mod_names)) modlst[[i]] <- c(modlst[[i]],get_vars(modlst[[i]]))
  #plot_recruitment(CABmodlst[c(1,5)],xlim=c(2000.5,2019.5),fill="yellow")

#--q sensitivity----------
# taken from tab.Rmd (proflst)
#names(proflst)
#.MODELFN  = c("r_1","r_2","r_3","r_4","r_5")
#prof_names  = c("CV70%","CV50%","CV20%","CV10%","CV05%")
#fn       <- paste0("../runs/q_sens/prof/",.MODELFN)
#proflst   <- lapply(fn, read_admb)
#proflst[[6]] <- M
#names(proflst) <- c(prof_names,"16.1")
#nmods <- length(prof_names)
#for (i in 1:nmods) {
  ##print(i)k
  #proflst[[i]] <- c(proflst[[i]],get_vars(proflst[[i]]))
#}

#p1 <- plot_ssb(proflst[c(2,6)],ylim=c(0,5500),xlim=c(1990.5,2019.5),alpha=.1) + scale_x_continuous(limits=c(1990,2020),breaks=seq(1990,2020,5))
#p2 <- plot_ssb(proflst[c(5,6)],ylim=c(0,5500),xlim=c(1990.5,2019.5),alpha=.1)+ scale_x_continuous(limits=c(1990,2020),breaks=seq(1990,2020,5))
#p3 <- arrangeGrob(p1,p2,nrow=2)
#ggsave("doc/figs/q_sens_ssb.pdf",plot=p3,width=5.2,height=7.5,units="in")
  #q<-NULL
  #for (i in 1:5)
	  #q <- rbind(q,data.frame(Year=1982:2019,Model=names(proflst[i]),q=rowMeans(proflst[[i]]$q_bts_3_8)))
#
	#head(q)
	#av <- read.table("../runs/dat/avail.dat",header=TRUE)
	#av <- av %>% transmute(Year=Year,Model="COLE",q=q)
	#q <- rbind(q,av)
	#q <- q %>% group_by(Model) %>% mutate(mq=mean(q)) %>% ungroup() %>% transmute(Year=Year,Model=Model,q=q/mq)
#
  #q %>% group_by(Model) %>% summarize(mean(q))
	#p3 <- q %>% filter(Model %in% c("CV70%")) %>% ggplot(aes(y=q,x=Year,col=Model)) + geom_line(size=1.3) + theme_few() +  scale_x_continuous(limits=c(1987,2019),breaks=seq(1987,2019,by=3)) ;p3
	#p3 <- q %>% filter(Model %in% c("COLE","CV05%","CV50%")) %>% ggplot(aes(y=q,x=Year,col=Model)) + geom_line(size=1.3) + theme_few() +  scale_x_continuous(limits=c(1987,2019),breaks=seq(1987,2019,by=3)) ;p3
#ggsave("doc/figs/q_sens.pdf",plot=p3,width=8.2,height=3.5,units="in")

#--CV sensitivity----------
#.MODELFN  = c("../runs/usv/","../runs/usv_vast/","../runs/estcvdb/","../runs/estcvvast/")
#prof_names  = c("DB CV20%","VAST CV20%","DB Sampling CV","VAST est. CV")
#fn       <- paste0(.MODELFN,"pm")
#cvlst   <- lapply(fn, read_admb)
##proflst[[6]] <- M
#names(cvlst) <- c(prof_names)
#nmods <- length(prof_names)
#for (i in 1:nmods) {
  #cvlst[[i]] <- c(cvlst[[i]],get_vars(cvlst[[i]]))
#}
#p1 <- plot_ssb(cvlst, ylim=c(0,6500),breaks=seq(1990,2020,2), xlim=c(1990.5,2020.5),alpha=.1) ;p1
#
#p1 <- plot_ats(cvlst[c(1:2)]) +theme_few(base_size=11) ;p1
#p2 <- plot_ats(cvlst[c(3:4)]) +theme_few(base_size=11) ;p2
#p5 <- p1/p2
#p5
#ggsave("doc/figs/mod_ats_eval1.pdf",plot=p5,height=7,width=6.0,units="in");
#p3 <- plot_ssb(cvlst[c(1,3)] , ylim=c(0,6000),breaks=seq(1990,2020,5), xlim=c(1990.5,2020.5),alpha=.1) ;p3
#p4 <- plot_ssb(cvlst[c(2,4)] , ylim=c(0,6000),breaks=seq(1990,2020,5), xlim=c(1990.5,2020.5),alpha=.1) ;p4
#p5 <- p3/p4
#ggsave("doc/figs/mod_ats_eval2.pdf",plot=p5,height=7,width=6.0,units="in");

 #---SSB figure----------------------------
df <- rbind(
  rbind(data.frame(Model="This year",Year= M$SSB[,1], SSB=M$SSB[,2], lb=M$SSB[,4], ub=M$SSB[,5]),
data.frame(Model="This year",Year= nextyr:(nextyr+4), SSB=M$future_SSB[4,2:6], lb = M$future_SSB[4,2:6] -2*M$future_SSB.sd[4,2:6], ub = M$future_SSB[4,2:6] +2*M$future_SSB.sd[4,2:6])),
      rbind(data.frame(Model="Last year",Year= P$SSB[,1], SSB=P$SSB[,2], lb=P$SSB[,4], ub=P$SSB[,5]),
data.frame(Model="Last year",Year= (nextyr-1):(nextyr+3), SSB=P$future_SSB[4,2:6], lb = P$future_SSB[4,2:6] -2*P$future_SSB.sd[4,2:6], ub = P$future_SSB[4,2:6] +2*P$future_SSB.sd[4,2:6]))
    )
p1 <- ggplot(df,aes(x=Year,y=SSB,ymax=ub,ymin=lb,fill=Model)) + geom_ribbon(alpha=.6) + geom_line() +  theme_few() +
  scale_x_continuous(limits=c(2002,2028),breaks=seq(2002,2028,2)) +
  ylab("Female spawning biomass (kt)") +
  geom_vline(xintercept=2022,col="grey",size=1.2); p1
  ggsave("doc/figs/proj_ssb.pdf",plot=p1,width=7.4,height=4.5,units="in")

  #---R/S------------------
  nyrs=length(M$SSB[,1])
  dt <- data.table(yr=M$SSB[1:nyrs,1],ssb= M$SSB[1:nyrs,2], r=M$R[2:(nyrs-1),2] )
  dt <- dt %>% mutate(Year=substr(as.character(yr),3,4),rs= log(dt$r/dt$ssb))
  head(dt)
  p1 <- ggplot(dt,aes(x=yr,y=rs)) + geom_point(size=4,col="red") + geom_line() +geom_smooth() + theme_few(base_size=12) + ylab("ln(Recruits/spawning biomass)") + xlab("Year")
  #ggplot(dt,aes(x=ssb,y=rs)) + geom_point(size=4,col="red") + geom_path() +geom_smooth(method="lm") + .THEME + ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)")
  p2 <- ggplot(dt,aes(x=ssb,y=rs,label=Year)) + geom_text() + geom_path(size=.5,alpha=.4) +geom_smooth(method="lm") + theme_few(base_size=12) +
       ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)") +  guides(size=FALSE,shape=FALSE,alpha=FALSE,col=FALSE)
  p3 <- p1 / p2;p3
  ggsave("doc/figs/mod_rs.pdf",plot=p3,width=5.2,height=7.5,units="in")

  p1 <- plot_ser(modlst[thismod],xlim=c(1964,thisyr+1),alpha=.7) + scale_x_continuous(breaks=seq(1965,thisyr+1,5))
  ggsave("doc/figs/mod_ser.pdf",plot=p1,width=9.2,height=7.0,units="in"); p1

  #---fishing mortality mod_F.pdf-----------------------------------------------------------------
  df <-data.frame(Year=M$Yr,M$F); names(df) <- c("Year",1:15); df.g <- gather(df,age,F,2:16,-Year)
  p1 <- df.g %>% mutate(age=as.numeric(age)) %>% filter(age<11)%>% ggplot(aes(y=age,x=Year,fill=F)) + geom_tile() + .THEME + ylab("Age")+ geom_contour(aes(z=F),color="darkgrey",size=.5,alpha=.4) +
            scale_fill_gradient(low = "white", high = "red") + scale_x_continuous(breaks=seq(1965,thisyr,5)) + geom_line(data=df.g[df.g$age=="6",],aes(x=Year,y=F*10)) +
            annotate("text", label = "Age 6 F (x10)" , x = 2015, y = 1.2, size = 5, colour = "black") + scale_y_continuous(breaks=seq(0,10,1))
  ggsave("doc/figs/mod_F.pdf",plot=p1,width=9.2,height=6.0,units="in")

  #---Historical assessment retrospectives--------------------------------------------------------
  dd <- as.data.frame(read.csv("data/Age3history.csv",header=TRUE))
  head(dd)
  names(dd) <- c("Year",2021:2006,2001:1998)
  dd.g <- pivot_longer(dd,cols=2:21,names_to="Assessment",values_to="Biomass")
  head(dd.g)
  # this line to add current year estimate!!
  t <- data.frame(Year=1964:(thisyr+1), Assessment=thisyr,Biomass=c(M$age3plus,M$age3plus1)  )
  dd.g <- rbind(dd.g,t) %>% filter(as.numeric(Assessment) >2006)
  tmp <- dd.g %>% filter(Year>2006,Year==1+as.numeric(Assessment)) # %>% summarise(max(Year))
  p1 <- ggplot(dd.g,aes(x=Year,y=Biomass,color=Assessment)) + geom_line(alpha=.8,size=.75) +
    scale_x_continuous(breaks=seq(1980,thisyr+2,2),limits=c(1980,thisyr+1))  +  xlab("Year") + ylim(0,16000) + ylab("Age 3+ biomass (kt)") +
    geom_point(data=tmp,size=2) + theme_few() +
    guides(size=FALSE,shape=FALSE,alpha=FALSE,col=FALSE)
    p1
  ggsave("doc/figs/mod_hist.pdf",plot=p1,width=9.2,height=4.0,units="in")

#----------------------------------------------------------
  # Extract Fmsy for different selectivity years

  idx=grep("msy2_dec",M$fit$name)
  length(idx)

  fdf <- data.frame(year=rep(2013:2022,2),
  Source=M$fit$name[idx],
  est = M$fit$est[idx],
  std = M$fit$std[idx])
  unique(fdf$Source)

p1<-  fdf %>% filter(Source!="Fmsy2_decwt") %>%
    ggplot(aes(x=year+.1,y=est,ymax=est+2*std,ymin=est-2*std))+
          geom_errorbar(width=.3) + geom_point(size=5,color="purple") + theme_few(base_size=12) + xlab("Year selected for MSY calculation") +
    scale_x_continuous(breaks=seq(2013,thisyr,1),limits=c(2012,thisyr+1))  +
          ylab("Fmsy");p1
  ggsave("doc/figs/fmsy_sel_hist.pdf",plot=p1,width=5.2,height=4.0,units="in")

  ##
  sel <- M$sel_fsh
  seldf=NULL
  yrs <- (thisyr-10):(thisyr)
     lrow<-dim(sel)[1]
      seldf<-rbind(seldf, data.frame(yrs,rep(thisyr,11),sel[(lrow-10):lrow,])) %>% rbind(c("proj",thisyr,M$sel_fut))
      #assign(mn,read_rep(rn))
  names(seldf) <- c("Year","Assessment",1:15)
  seldfm <- seldf %>%  pivot_longer(cols=3:17,names_to="age",values_to="Selectivity") %>%
                  mutate(
                    age=as.numeric(age),
                    Selectivity=as.numeric(Selectivity),
                    Assessment=as.numeric(Assessment),
                    case = ifelse(Year=="proj","Proj.","Est."),
                    Year=as.numeric(ifelse(Year=="proj",Assessment+1,Year))
                    )
  glimpse(seldfm)
 assdf <- seldfm %>% filter(Year>Assessment) %>% mutate(age=as.factor(age),Year=as.factor(Year))
 yrdf  <- seldfm %>% filter(Year<=Assessment,Year>thisyr-10) %>%mutate(age=as.factor(age),Year=as.factor(Year))
p1<- seldfm %>% filter(age<9,Year>thisyr-10)%>% group_by(Year,Assessment,case) %>%
 summarise(mnage=sum(Selectivity*age)/sum(Selectivity)) %>%
 ggplot(aes(x=Year,y=mnage,shape=case,color=case)) + geom_point(size=2) +
 theme_few() + ylim(c(0,10)) + ylab( "Mean age selected")+
      scale_x_continuous(breaks=seq(2010,2022,by=2))
p1
p1 <-    ggplot(assdf,aes(x=age,y=Selectivity,color=case,group=Year)) +
          geom_point(size=.5) + geom_line() + theme_few() +
          facet_grid(Year~.) + geom_point(data=yrdf,size=.5) + facet_grid(Year~.)
p1
  ggsave("doc/figs/retro_sel.pdf",plot=p1,width=5.2,height=9.0,units="in")
  #plot_recruitment(retouts,xlim=c(1990,2017),rel=T,legend=FALSE,alpha=.2)


  # Plot of regimes on base model

regime=c("1964-77", "1978-present", "1978-99", "1978-89", "1990-present", "1990-99", "2000-present", "1964-present")
hlr <- M$regime[2]
  p3 <- tibble(regime=regime,Mean=M$regime,ub=Mean+2*M$regime.sd,lb=Mean-2*M$regime.sd) %>%
  ggplot(aes(x=regime,y=Mean,ymax=ub,ymin=lb)) + geom_linerange(size=1.5) + theme_few(base_size=12) +
         ylab("Mean recruitment (age 1)") + geom_point(size=4,color="red") + geom_hline(yintercept=hlr,linetype=2)
  ggsave("doc/figs/mod_regimes.pdf",plot=p3,width=9.2,height=5.0,units="in")

  #---Fits to ats age mod_ats_age.pdf-------------------------------------------------------------
  pdf("doc/figs/mod_ats_age.pdf",width=6,height=8)
  plot_agefit(M,case_label=paste(thisyr,"Assessment"),gear="ats")
  dev.off()

  #----Read in retro results-----------------
  i=0
  thismod <- 2 # the selected model
  getret <- function(nyrs=15, mod=1){
    retouts<- list()
    for (i in 0:nyrs) {
      rn=paste0(.MODELDIR[mod],"retro/r_",i,".rep")
      mn=paste0("r_",i)
      assign(mn,read_rep(rn))
      retouts[[mn]] <- (get(mn))
    }
    return(retouts)
  }
  ret1<-getret(mod=1,nyrs=20)
  ret2<-getret(mod=2,nyrs=20)
  ret3<-getret(mod=3,nyrs=20)
  p1 <- plot_ssb(ret1,xlim=c(2000,thisyr),legend=F,breaks=seq(2000,2022,2),ylim=c(0,6900)) + xlab("") +ggtitle("Base")+ coord_cartesian(ylim=c(0,NA));p1
  p2 <- plot_ssb(ret2,xlim=c(2000,thisyr),legend=F,breaks=seq(2000,2022,2),ylim=c(0,6900))+ggtitle("w/o ATS") + coord_cartesian(ylim=c(0,NA));p2
  p3 <- plot_ssb(ret3,xlim=c(2000,thisyr),legend=F,breaks=seq(2000,2022,2),ylim=c(0,6900))+ggtitle("w/o BTS") + coord_cartesian(ylim=c(0,NA));p3
  p3 <- p1/p2   + plot_annotation(title = 'Spawning biomass with and without acoustic trawl survey data',
    subtitle = 'EBS walleye pollock assessment', caption = 'Disclaimer: Draft results, please do not cite' ); p3
  ggsave("doc/figs/retcompSSB.pdf",plot=p3,width=7.2,height=9.0,units="in")
  # recruitment
  p1 <- plot_R_rel(ret1,xlim=c(thisyr-15,thisyr-1),legend=F,rel=FALSE,ylim=c(0,120000),ylab="Age-1 recruitment") + xlab("") +ggtitle("Base")+coord_cartesian(ylim=c(0,125000));p1
  p2 <- plot_R_rel(ret2,xlim=c(thisyr-15,thisyr-1),legend=F,rel=FALSE,ylim=c(0,120000),ylab="Age-1 recruitment") + ggtitle("w/o ATS") + coord_cartesian(ylim=c(0,125000));p2
  p3 <- p1/p2   + plot_annotation(title = 'Age 1 recruitment with and without acoustic trawl survey data',
    subtitle = 'EBS walleye pollock assessment', caption = 'Disclaimer: Draft results, please do not cite' ); p3
  ggsave("doc/figs/retcompR.pdf",plot=p3,width=7.2,height=9.0,units="in")

  ## Make dataframe to plot by cohort
  nyrs=15
  i=2
  retdf

  i=12

  names(ret1)
  mean(ret1[["r_0"]]$R[,2])
  get_coh <- function(ret=ret1,run="Base",nyrs=20){
    M <- as.data.frame(NULL)
    for (i in 0:nyrs) {
      mn=paste0("r_",i)
      A <- as.data.frame(ret[[mn]]$R)
      is.data.frame(A)
      A$ret <- i
      A$run <- run
      A$cohort <- A[,1]-1
      A$term_yr <- 2022-A$ret
      A$Yrs_of_data <- A$term_yr-A$cohort
      names(A) <- c("Year","est","sd","lb","ub","peel","run","cohort","term_yr","Years_data")
      M <- rbind(M,A)
    }
    return(M)
  }
  # Plot by years of data
ret_df <- rbind(get_coh(ret1),get_coh(ret3,run="Without BTS")) |> mutate(Years_data=ifelse(run=="Base",Years_data-.14,Years_data+.14))
ret_df <- rbind(get_coh(ret1),get_coh(ret2,run="Without ATS"),get_coh(ret3,run="Without BTS")) |> mutate(Years_data=ifelse(run=="Base",Years_data-.18,ifelse(run=="Without ATS",Years_data,Years_data+.18))  )

plot_coh <- function(dat=ret_df,coh=cohsub,logscale=FALSE,grid=T){
  p1 <- dat |>  filter(cohort %in% coh) |>
  ggplot( aes(x=Years_data,label=term_yr,y=est,color=run,ymin=lb,ymax=ub)) + geom_point(size=1) + geom_errorbar(size=.5,width=0) +
    theme_few(base_size = 11) +
    ylim(c(0,NA)) +
    geom_hline(yintercept=22.5e3,color="blue",size=.1) +
    ylab("Millions") +
    ggtitle("Age-1 recruitment estimates by cohort") #+ geom_text( aes(x=mean(Yeaes()x=mean()Years_data
   if (logscale) p1 <- p1 +  scale_y_log10()
   if (grid) p1 <- p1 +facet_grid(cohort~.) else p1 <- p1 +facet_wrap(cohort~.)
 return(p1)
}

cohsub <- c(2003:2005,2008)
cohsub <- c(2012:2013,2008)
cohsub <- c(2012:2013,2008)
plot_coh( grid=FALSE, coh= cohsub)
plot_coh( grid=FALSE, coh= c(2005,2008,2012:2013,2016,2018) )
plot_coh( grid=FALSE, coh= c(2005,2008,2012:2013,2016,2018) )
plot_coh( grid=FALSE, coh= c(2003:2005,2008) )
plot_coh( grid=T, coh= c(2003:2005) )
plot_coh( grid=T, coh= c(2012:2013) )
plot_coh(logscale=TRUE)

  # Plot by endyr
  ret_df <- rbind(plot_coh(ret1),plot_coh(ret2,run="Without ATS")) |> mutate(term_yr=ifelse(run=="Base",term_yr-.1,term_yr+.1))
  ggplot(ret_df |>
  #         filter(cohort %in% c(2008:2022)),
           filter(cohort %in% c(2008,2012:2013,2016,2018)),
         aes(x=term_yr,y=est,color=run,ymin=lb,ymax=ub)) + geom_point(size=2) + geom_errorbar(size=1,width=0) +
    theme_few() + facet_grid(cohort~.) + scale_y_log10() + geom_hline(yintercept=22.5e3,color="blue",size=.1) +
    ggtitle("Age-1 recruitment estimates by cohort")



  ggsave("doc/figs/mod_retro.pdf",plot=p3,width=7.2,height=9.0,units="in")
  p1 <- plot_R_rel(retouts,xlim=c(thisyr-10,thisyr),legend=F,rel=FALSE,ylab="Age 1 recruitment");p1
  p2 <- plot_R_rel(retouts,xlim=c(thisyr-10,thisyr),ylim=c(0.,3.5),legend=FALSE,alpha=.2);p2 <- p2+ylim(0,4); p2
  p3 <- p1/p2;p3
  ggsave("doc/figs/mod_retroR.pdf",plot=p3,width=7.2,height=9.0,units="in")
  p1 <- plot_R_rel(retouts,xlim=c(thisyr-20,thisyr),legend=F,rel=FALSE);p1
  p2 <- plot_R_rel(retouts,xlim=c(thisyr-20,thisyr),ylim=c(0.,3.5),legend=FALSE,alpha=.2);p2 <- p2+ylim(0,4); p2
  p3 <- p1/p2
  ggsave("doc/figs/mod_retroR20.pdf",plot=p3,width=7.2,height=9.0,units="in")
  p3
  ###
  # Get sel_fut from retrospectives and compare
  i=2
  getwd()
  seldf<-NULL
  for (i in 0:10) {
      mn=paste0("r_",i)
      #seldf<-rbind(seldf,
     sel <-get(mn)$sel_fsh
     yrs <- (thisyr-i-10):(thisyr-i)
     lrow<-dim(sel)[1]
      seldf<-rbind(seldf, data.frame(yrs,rep(thisyr-i,11),sel[(lrow-10):lrow,])) %>% rbind(c("proj",thisyr-i,get(mn)$sel_fut))
      #assign(mn,read_rep(rn))
      #retouts[[mn]] <- (get(mn))
    #seldf <- rbind()
  }
  names(seldf) <- c("Year","Assessment",1:15)
  seldfm <- seldf %>%  pivot_longer(cols=3:17,names_to="age",values_to="Selectivity") %>%
                  mutate(
                    age=as.numeric(age),
                    Selectivity=as.numeric(Selectivity),
                    Assessment=as.numeric(Assessment),
                    case = ifelse(Year=="proj","Proj.","Est."),
                    Year=as.numeric(ifelse(Year=="proj",Assessment+1,Year))
                    )
  glimpse(seldf)
  glimpse(seldfm)
  tail(seldfm)
 assdf <- seldfm %>% filter(Year>Assessment) %>% mutate(age=as.factor(age),Year=as.factor(Year))
 yrdf  <- seldfm %>% filter(Year<=Assessment,Year>thisyr-10) %>%mutate(age=as.factor(age),Year=as.factor(Year))
p1<- seldfm %>% filter(age<9,Year>thisyr-10)%>% group_by(Year,Assessment,case) %>%
 summarise(mnage=sum(Selectivity*age)/sum(Selectivity)) %>%
 ggplot(aes(x=Year,y=mnage,shape=case,color=case)) + geom_point(size=2) +
 theme_few() + ylim(c(4,8)) + ylab( "Mean age selected")+
      scale_x_continuous(breaks=seq(2010,2022,by=2))
      p1
  ggsave("doc/figs/retro_sel_mnage.pdf",plot=p1,width=5.2,height=4.0,units="in")
  assdf %>% print(n=Inf)
  yrdf %>% filter(Assessment==2021) %>%inner_join(assdf,join_by Year)
  %>% print(n=Inf)

p1 <-    ggplot(assdf,aes(x=age,y=Selectivity,color=case,group=Year)) +
          geom_point(size=.8) + geom_line() + theme_few() +
          facet_grid(Year~.) + geom_point(data=yrdf,size=1) + facet_grid(Year~.)
p1
  ggsave("doc/figs/retro_sel.pdf",plot=p1,width=5.2,height=9.0,units="in")
  #plot_recruitment(retouts,xlim=c(1990,2017),rel=T,legend=FALSE,alpha=.2)
  #plot_R_rel(retouts,xlim=c(1980,2017),ylim=c(0.5,1.5),legend=FALSE,alpha=.2)
  # Mohn's rho

  #icesAdvice::mohn()
     #base   -1   -2   -3   -4   -5
#2009 0.96 0.95 0.94 0.92 0.89 0.86
#2010 0.72 0.71 0.70 0.67 0.63 0.59
#2011 0.82 0.79 0.78 0.73 0.67 0.60
#2012 0.80 0.75 0.73 0.66 0.54   NA
#2013 0.67 0.62 0.61 0.51   NA   NA
#2014 0.74 0.66 0.63   NA   NA   NA
#2015 0.63 0.52   NA   NA   NA   NA
#2016 0.57   NA   NA   NA   NA   NA
#r$> mohn(shake)
#[1] -0.2310701

retouts<-ret1
i=2
getMohn <- function(retouts=ret1,nyrs=20){
  rc = retouts[[1]]$SSB[,2]
  ntmp=0
  rho=0
  df <- data.frame(peel=1:20,rho=1:20)
  for (i in 1:20) {
    rn <- names(retouts[i])
    dtmp = (get(paste0(rn))$SSB )
    lr   = length(dtmp[,1])
    rho  = rho +(dtmp[lr,2] -rc[lr])/rc[lr]
    df$peel[i] <- i-1
    df$rho[i] <- rho/i
    print(paste(i,rho/i))
  }
}
  write.csv(df,"data/mohnrho.csv")
  df
  library(flextable)
  # A try at a catch table not quite there...
cd <- read_csv("../data/fishery/sampler/imported/akfin_cat.csv")
names(cd) <- c("Year","Area","Subarea","NMFS_area","Trip_code","Trip_name","Species","ret_disc","Gear_code","catch","WED")
cd_tab<- cd %>% filter(Area=="BSAI") %>% mutate(Subarea=ifelse(NMFS_area==518,"Bogoslof",
                                               ifelse(NMFS_area<520,"SE",
                                               ifelse(NMFS_area<540,"NW","Aleutians")))) %>%
group_by(Year,Subarea,ret_disc) %>% summarise(catch=sum(catch)) %>%
pivot_wider(names_from=c(Subarea,ret_disc),values_from=catch) %>% flextable() %>%  print(n=Inf)
print(cd_tab)
  #--------new catch/biomass figure-------------
  #M$SSB
  #df <- data.table(Year=M$SSB[,1],SSB=2*M$SSB[,2],Catch=M$obs_catch,U=M$obs_catch/(2*M$SSB[,2]))
  #ggplot(df,aes(x=Year,y=U)) + geom_line(size=2,color="red") + .THEME + xlim(c(1990,2020)) + ylab("Catch / spawning biomass")
  #--------phase plane figure-------------------
  source("../R/do-phase.R")


#Look at SER

  idx
  idx=grep("SER_Fmsy",M$fit$name)
  est = M$fit$est[idx]
  std = M$fit$std[idx]
  std/est

#---Catch grid and future effort consequences---------------------------------------------------
  dc <-data.frame(Catch=M$future_catch,scen=c(seq(.5,1.5,.05),2),"catch");
  dc[1:5] <- dc[1:5]/1350
  dc <-data.frame(Year=thisyr:(thisyr+5),Catch=c(1350,M$future_catch[22,]), F=M$Future_F[22,], SSB=M$future_SSB[22,])
  dc <-data.frame(Year=thisyr:(thisyr+5),F=M$Future_F[22,], SSB=M$future_SSB[22,])
  M$Future_F
  dc$F <- dc$F/dc$F[1]
  dc$SSB <- dc$SSB/dc$SSB[1]
  df.g <- gather(dc,key=Measure,val,-Year)
  df.g
  p1 <-   df.g %>% ggplot(aes(x=Year,y=val,col=Measure)) + .THEME + geom_line(size=2) + ylim(0.25,2.00) + ggtitle(paste0("Projected trend relative to ",thisyr," given future catch=1,350 kt")) + ylab("Relative value")
  p1
  ggsave("doc/figs/future_F.pdf",plot=p1,width=7.4,height=5,units="in")

  # ,scen=c(seq(.5,1.5,.05),2),"catch");
  names(dc) <- c(2020:2024,"scen","var")
  db <-data.frame(SSB=M$future_SSB,scen=seq(.5,1.5,.05),"SSB");
  db<- cbind(db[,2:6]/db[,1],db[,7:8])
  db$scen <- dc[,1]
  names(db) <- c(2018:2022,"scen","var")
  df.g <- rbind( gather(dc,year,val,1:5) , gather(db,year,val,1:5) )
  df.g$year <- as.numeric(df.g$year)
  head(df.g)
  # df.g %>% filter(var=="catch") %>% ggplot(aes(x=year,y=scen,z=val)) + .THEME + geom_contour() + ()
  df.g %>% filter(Measure=="catch") %>% select(year,scen,val) %>% ggplot(aes(x=year,y=scen)) + .THEME + geom_density_2d()

  ## VAST figure
  idxOut <- read.csv("doc/data/vast.csv",header=TRUE)
  glimpse(idxOut)
  df  <- idxOut |> filter(Year!=2020) |> mutate(CV = sd/Biomass, sd=sd/1e6, Biomass=Biomass / 1e6, ll=Biomass-2*sd,ul=2*sd+Biomass) %>%
      select(Model, Area, Year,Biomass, CV,ul,ll)
  p1 <- ggplot(df |> filter(Year!=2020) ,aes(x=Year,y=Biomass)) + geom_point() + geom_smooth(span=.1,se=F) +
      geom_errorbar(aes(ymin=ll,ymax=ul),width=.5,position=position_dodge(width=0.5)) + ggthemes::theme_few(base_size=19) +
      scale_x_continuous(breaks=seq(1982,2022,by=4))  +
      geom_hline(yintercept=0) + facet_grid(Area~.,scales="free") + ylab("Biomass (millions of t)"); p1

  ggsave("doc/figs/vast_idx.pdf",plot=p1,width=9.4,height=5,units="in")

  glimpse(df)
  p1 <-df |> filter(Area=="Both") |> mutate(ll=ll/1000,ul=ul/1000,Biomass=Biomass/1000) |>
    ggplot(aes(x=Year,y=Biomass)) + geom_point(size=3,color="red") +
      geom_errorbar(aes(ymin=ll,ymax=ul),width=.5,position=position_dodge(width=0.5)) + theme_few(base_size=19) +
      scale_x_continuous(breaks=seq(1982,2024,by=4))  + ylim(c(0,15)) +
      ylab("Biomass (millions of t)") + geom_hline(yintercept =  6.864028,color="grey30");
  p1
  mean(p1$data$Biomass)

  ggsave("doc/figs/bts_biom.png",plot=p1,width=9.4,height=7,units="in")
  ggsave("doc/figs/bts_biom.pdf",plot=p1,width=9.4,height=7,units="in")

# Look at some of the retros and mcmc runs
# mcmc first
srdf <-read.table(paste0(.MODELDIR[thismod],"/mcmc/mcSRR.rep"))
srdf <-read_table("mcmc/mcSRR.rep")
srdf
srsm <- sample(1:5000,2000)
names(srdf) <- c("draw","stock","recruits")
srdf<-srdf %>% filter(draw %in% srsm) %>% mutate(stock=as.numeric(stock),recruits=as.numeric(recruits),draw=as.factor(draw)) #%>%
srdf %>% ggplot(aes(x=stock,y=recruits,group=draw)) + geom_line(size=.1,alpha=.4,color="coral") + theme_few() +
xlim(c(0,6000)) + ylim(c(0,50000))
srsm

# retros maybe
  fmdf<-NULL
  i=2
  for (i in 0:10) {
      mn=paste0("r_Fmort_",i)
      #seldf<-rbind(seldf,
      read_table(mn)
     yrs <- (thisyr-i-10):(thisyr-i)
     lrow<-dim(sel)[1]
      seldf<-rbind(seldf, data.frame(yrs,rep(thisyr-i,11),sel[(lrow-10):lrow,])) %>% rbind(c("proj",thisyr-i,get(mn)$sel_fut))
      #assign(mn,read_rep(rn))
      #retouts[[mn]] <- (get(mn))
    #seldf <- rbind()
  }
  names(seldf) <- c("Year","Assessment",1:15)
  seldfm <- seldf %>%  pivot_longer(cols=3:17,names_to="age",values_to="Selectivity") %>%
                  mutate(
                    age=as.numeric(age),
                    Selectivity=as.numeric(Selectivity),
                    Assessment=as.numeric(Assessment),
                    case = ifelse(Year=="proj","Proj.","Est."),
                    Year=as.numeric(ifelse(Year=="proj",Assessment+1,Year))
                    )
  glimpse(seldf)
  glimpse(seldfm)


#dd <- df.g %>% filter(var=="SSB")
#dc <- df.g %>% filter(var=="catch")
#df.g%>% filter(var=="catch") %>% ggplot(aes(x=year,y=scen,fill=val,col=var)) + .THEME + geom_contour(aes(z=val),size=2) +
#            scale_x_continuous(breaks=seq(2018,2022,1))  +
#             geom_text(data=dc,aes(x=year-.15,y=scen,label=format(100*(val-1),digits=0)) )#+
#df.g%>% filter(var=="catch") %>% ggplot(aes(x=year,y=scen,fill=val,col=var)) + .THEME +
#            scale_x_continuous(breaks=seq(2018,2022,1))  + geom_contour(data=dd,aes(x=year,y=scen,z=val),size=2,col="darkgreen") +
#             geom_text(data=dd,aes(x=year+.15,y=scen,label=format(100*(val-1),digits=0)),col="darkgreen" )
#f1 <-  df.g%>% filter(var=="catch") %>% ggplot(aes(x=year,y=scen,fill=val,col=var)) + .THEME + geom_contour(aes(z=val),size=2) +
#            scale_x_continuous(breaks=seq(2018,2022,1))  + geom_contour(data=dd,aes(x=year,y=scen,z=val)) +
#             geom_text(data=dd,aes(x=year+.05,y=scen,label=format(100*(val-1),digits=0)) ) +
#             geom_text(data=dc,aes(x=year-.05,y=scen,label=format(100*(val-1),digits=0)) )#+
#f1

             # geom_text(data=dd,aes(x=year+.15,y=scen,label=format(100*(val-1),digits=0)) )
# p1 <-  df.g %>% ggplot(aes(x=year,y=scen,fill=val,col=var)) + .THEME + geom_contour(aes(z=val),size=2) +
#             scale_x_continuous(breaks=seq(2018,2022,1))  +
#              geom_contour(data=dd,aes(x=year,y=scen,z=val)) +
#              geom_text(data=dc,aes(x=year-.15,y=scen,label=format(100*(val-1),digits=0)) )+
#              geom_text(data=dd,aes(x=year+.15,y=scen,label=format(100*(val-1),digits=0)) )
#             #scale_fill_gradient(low = "white", high = "red") + geom_tile() +
# p1

#   direct.label(p1)
#             annotate("text", label = "Age 6 F (x10)" , x = 2017, y = 1.2, size = 5, colour = "black") + scale_y_continuous(breaks=seq(0,10,1))
#   geom_tile()
#   color="black",size=.5,alpha=.4)
#    ylab("Age")+
#   geom_tile() + .THEME
#             scale_fill_gradient(low = "white", high = "red") + scale_x_continuous(breaks=seq(1965,2017,5)) +
#             annotate("text", label = "Age 6 F (x10)" , x = 2017, y = 1.2, size = 5, colour = "black") + scale_y_continuous(breaks=seq(0,10,1))
#   ggsave("doc/figs/mod_F",plot=p1,width=9.2,height=7.0,units="in")
}
###Stuff to look at raw survey wt-age data-----------------------------------------------------
radf <- read_csv("data/raceage.csv",col_names=FALSE)
names(radf) <- c("haul","Region","x","date", "lat","lon","spp", "len","sex","wt","age","xx")
radf <- radf%>%select(date,lat,lon,len,sex,wt,age) %>% mutate(date=lubridate::dmy(date),year=year(date),len=len/10,sex=ifelse(sex==1,"Male",ifelse(sex==2,"Female","U")))
radf %>% filter(year>1999,wt>0,age>0,age<15) %>% group_by(year,age) %>% summarise(wt=mean(wt)) %>%
ggplot(aes(y=wt,x=age,col=as.factor(year))) + geom_point(alpha=.6) + theme_few()
radf %>% filter(year>1999,wt>0,age>0,age<15) %>% group_by(year,age) %>% summarise(len=mean(len)) %>%
ggplot(aes(y=len,x=age,col=as.factor(year))) + geom_point(alpha=.6) + theme_few()

radf %>% filter(year>1999,wt>0,age>0,age<15) %>% group_by(year,age) %>% summarise(len=mean(len)) %>% filter(age==6) %>%
ggplot(aes(y=len,x=year,)) + geom_line(size=2) + theme_few()

radf %>% filter(age>0,age<15) %>% group_by(year,age) %>% summarise(len=mean(len),wt=mean(wt)) %>% filter(age==6) %>%
ggplot(aes(y=len,x=year,)) + geom_line(size=2) + theme_few()
# LW for selected weird years
radf %>% filter(year %in% c(2000,2010),wt>0,len<70) %>%
ggplot(aes(y=wt,x=len,color=as.factor(year))) + geom_point(alpha=.2) + theme_few()

radf %>% filter(year >=2000,wt>0,len<70) %>% group_by(year,len) %>% summarise(wt=mean(wt)) %>%
ggplot(aes(y=wt,x=len,color=as.factor(year))) + geom_line(size=.2) + theme_few()
radf %>% filter(year %in% c(2000,2010,2021),wt>0,len<70) %>% group_by(year,len) %>% summarise(wt=mean(wt)) %>%
ggplot(aes(y=wt,x=len,color=as.factor(year))) + geom_line(size=2) + theme_few()
radf %>% filter(year %in% c(2000,2010),wt>0,len<70) %>% group_by(year,len) %>% summarise(wt=mean(wt)) %>%
ggplot(aes(y=wt,x=len,color=as.factor(year))) + geom_line(size=2) + theme_few()


# See if same thing happening w fishery data
fadf <- read_csv("../data/fishery/sampler/imported/akfin_age.csv")
adf <- fadf %>% filter(NMFS_AREA<540) %>%
      transmute(
        #haul   = ifelse((HAUL_JOIN==""),PORT_JOIN,HAUL_JOIN),
        haul   = HAUL_OFFLOAD,
        month  = month(HAUL_OFFLOAD_DATE),
        seas   = ifelse(month>5, 2, 1),
        strata = ifelse(seas==1, 1, ifelse(NMFS_AREA>519, 2, 3)),
        lat    = (LATDD_START+LATDD_END)/2,
        lon    = (LONDD_START+LONDD_END)/2,
        sex    = ifelse(SEX=="F",1,2) ,
        len    = LNGTH , age = ifelse(AGE==0,-9,AGE),
        wt = ifelse(is.na(WEIGHT) | WEIGHT==0,-9,WEIGHT) ,
        age=ifelse(is.na(age),-9,age ) ,
        year=YEAR
        ) %>% mutate( haul = as.integer(as.factor(haul)) )
adf


adf %>% mutate(date=lubridate::ymd(paste(year,month,01,sep="-"))) #%>% select(date,lat,lon,sex,len,wt,age,year) %>%mutate(source="Fishery") %>% rbind(radf %>% select(date,lat,lon,sex,len,wt,age,year)%>%mutate(source="Survey") )
cadf <- adf %>% mutate(date=lubridate::ymd(paste(year,month,01,sep="-")),wt=wt*1000) %>% select(date,lat,lon,sex,len,wt,age,year) %>%mutate(source="Fishery") %>% rbind(radf %>% select(date,lat,lon,sex,len,wt,age,year)%>%mutate(source="Survey") )
cadf %>% filter(year>1999,wt>0,age>0,age<15,month(date)>5) %>% group_by(source,year,age) %>% summarise(wt=mean(wt),len=mean(len)) %>% filter(age==6) %>%
ggplot(aes(y=len,x=year,color=source)) + geom_line(size=2) + theme_few()
cadf %>% filter(year>1990,wt>0,age>0,age<15,month(date)>5) %>% group_by(source,year,age) %>% summarise(wt=mean(wt),len=mean(len)) %>% filter(age==6) %>%
ggplot(aes(y=wt,x=year,color=source)) + geom_line(size=1) + geom_point(size=2) + theme_few()
cadf %>% filter(year>1990,wt>0,age>0,age<15,month(date)>5) %>% group_by(source,year,age) %>% summarise(n=n(),wt=mean(wt),len=mean(len)) %>% filter(age==6) %>%
ggplot(aes(y=n,x=year,color=source)) + geom_line(size=1) + geom_point(size=2) + theme_few()

library(ggplot2)
library(maps)
library(scatterpie)

# generate dataset
set.seed(123)
long <- rnorm(50, sd=100)
lat <- rnorm(50, sd=50)
d <- data.frame(long=long, lat=lat)
d <- with(d, d[abs(long) < 150 & abs(lat) < 70,])
n <- nrow(d)
d$region <- factor(1:n)
d$A <- abs(rnorm(n, sd=1))
d$B <- abs(rnorm(n, sd=2))
d$C <- abs(rnorm(n, sd=3))
d$D <- abs(rnorm(n, sd=4))
d[1, 4:7] <- d[1, 4:7] * 3
head(d)

# plot
world <- map_data('world')
p <- ggplot(world, aes(long, lat)) +
    geom_map(map=world, aes(map_id=region), fill=NA, color="black") +
    coord_quickmap()
p + geom_scatterpie(aes(x=long, y=lat, group=region, r=radius),
                    data=d, cols=LETTERS[1:4], color=NA, alpha=.8) +
    geom_scatterpie_legend(d$radius, x=-160, y=-55)

if(do_data_plots){
#--Fishery--------------------

#---Fishery stuff----------------------
wed <- read.csv("~/_mymods/ebswp/data/fishery/sampler/imported/akfin_cat.csv",as.is=TRUE)
tac <- read.csv("~/_mymods/ebswp/doc/data/tac_abc.csv",as.is=TRUE)
wed  %>% filter(FMP.Area=="BSAI") %>% group_by(Year) %>% summarize(sum(Weight.Posted..Sum.)) %>% tail()
df   <- wed %>% filter(FMP.Area=="BSAI",Species.Group.Name=="Pollock") %>% transmute(Year,ret=Retained.Discarded,wed=WED..mmdd.,
                target = Trip.Target.Name, season=ifelse(wed>610,"B","A"), area=Reporting.Area.Code,
                mgt    =ifelse(area == 518,"Bogoslof",ifelse(area>539,"Aleutians",ifelse(area>519,"NW","SE"))),
                strata =ifelse(season == "A","1",ifelse(area>519,2,ifelse(area<520,3,NA))), Catch=Weight.Posted..Sum.)
tsum <- (df) %>% group_by(ret,mgt,Year) %>% summarize(Catch=sum(Catch)) %>% pivot_wider(names_from=c(mgt,ret),values_from=Catch)
p1 <- df %>% filter(!is.na(strata)) %>% mutate(strata=ifelse(strata==1,"A-season",ifelse(strata==2,"NW B-season","SE B-season"))) %>% group_by(Year,strata) %>% summarize(Catch=sum(Catch)) %>%
      ggplot(aes(x=Year,y=Catch,fill=strata)) + geom_area(color="white") + theme_few(base_size=18)
      p1
ggsave("doc/figs/catch.pdf",plot=p1,width=7.5,height=4.5,units="in")
# flextable(tsum)
    #---Roe data------------------
      # Table comes from AKFIN: https://akfinbi.psmfc.org/analytics/saw.dll?Dashboard&PortalPath=%2Fshared%2FStock%20Assessment%2F_portal%2FStock%20Assessment&Page=Ianelli%20-%20Monthly%20EBS%20pollock%20production&Action=Navigate
      rd <- read_csv("doc/data/roe.csv")
      glimpse(rd)
      summary(rd)
      names(rd) <- c("Year","Month","TYPE","SECTOR","SPECIES_GROUP_CODE","FMP_SUBAREA","Prod","PERMITS","t","CONFIDENTIAL_FLAG")
     rd <- rd %>% mutate(Season=ifelse(Month<6,"A","B"))

      rd <- select(rd,Year, Season, Prod,t) %>% group_by(Year,Season,Prod) %>% summarize(t=sum(t))
      p1 <- rd %>% filter(Prod=="ROE") %>% ggplot(aes(x=Year,y=t,shape=Season,col=Season)) +
           geom_point(size=3) + geom_line(size=1.0) +
           ggthemes::theme_few(base_size=14) + ylab("Tons of roe produced") + expand_limits(y=0) +
           scale_x_continuous(breaks=seq(2000,2024,2)); #p1
            #  + geom_hline(yintercept=mst,linetype="dashed") + geom_hline(yintercept=mbt,linetype="dashed")
           p1
      ggsave("doc/figs/roe.pdf",plot=p1,width=7.5,height=4.5,units="in")


      #--- Catch-age estimates for sex catch age --------------------------
      # Updated
      edt <- NULL
      for (i in 2022:1991){
          edt <- rbind(edt,read_table(paste0("~/_mymods/ebs_main/data/fishery/sampler/results/Est_",i,".dat")))
      }
      tot <- edt %>% filter(type=="N",sex<3,stratum<5) %>% mutate(season=ifelse(stratum==1,"A","B"),sex=ifelse(sex==1,"Male",ifelse(sex==2,"Female","Total"))) %>%
              group_by(year,sex) %>% summarize(Catch=sum(value))
      tot$season <-"all"
      p1 <- edt %>% filter(type=="N",sex<3,stratum<5) %>% mutate(season=ifelse(stratum==1,"A","B"),sex=ifelse(sex==1,"Male",ifelse(sex==2,"Female","Total"))) %>%
              group_by(year,sex,season) %>% summarize(Catch=sum(value)) %>% rbind(tot) %>%
              ggplot(aes(x=year,y=Catch,color=season,shape=sex,linetype=season)) + theme_few(base_size=11) +
              geom_point(size=3.5) + geom_line(size=1.2) + expand_limits(y=0) +
              scale_y_continuous(label=comma)  + scale_x_continuous(breaks=seq(1990,2022,2)) +
              ylab("Catch (thousands)") + xlab("Year"); p1
        ggsave("doc/figs/catch_sex.pdf",plot=p1,width=7.5,height=4.5,units="in")
        # Look at catch in Number vs catch in weight
        edt_df <- edt |> mutate(Year=year) |> group_by(Year) |> summarise(Number=sum(value))
        cdf_df <- df |> group_by(Year) |> summarise(Biomass=sum(Catch))
        left_join(edt_df, cdf_df) |> ggplot(aes(x=Number,y=Biomass,label=Year)) + theme_few() + geom_text(size=3) +
          geom_smooth(method=lm)
        #left_join(edt_df, cdf_df) |> mutate(Number=Number/mean(Number),Biomass=Biomass/mean(Biomass) ) |> pivot_longer(!Year,names_to="Type",values_to="Catch") |> ggplot(aes(x=Year,y=Catch,color=Type)) +
        left_join(edt_df, cdf_df) |> pivot_longer(!Year,names_to="Type",values_to="Catch") |> ggplot(aes(x=Year,y=Catch,color=Type)) +
          scale_y_continuous(label=comma) +
          geom_line(size=2) + theme_few(base_size = 18) + facet_grid(Type~.,scales="free") +  theme(legend.position="none")
        ?pivot_longer
      #df <- tibble(read.csv("doc/data/product.csv",header=T))
      #df[,2] <- df[,2]/1e6
      #df
      #ggcorr(df[,c(2:3,5:8)] ,label=TRUE)+ theme_few()
      #ggpairs(df,columns=c(2:4,6:8)) + theme_few()
      #ggpairs(df[,c(2:3,5:8)] ,label=TRUE,
      #     upper = list(continuous = wrap(ggally_cor, displayGrid = FALSE)),
      #     diag = list(continuous = "blank"),
      #     lower = list(continuous = "smooth") ) + theme_few()
      #upper = list(continuous = "density", combo = "box_no_facet"),
      #lower = list(continuous = "points", geom_smooth(),combo = "dot_no_facet")
  # Compare ages
  adf <- as.data.frame(M$pobs_bts) %>% mutate(Model="VAST ages")
  adf <- rbind(adf,
  as.data.frame(modlst[[2]]$pobs_bts) %>% mutate(Model="Design-based") )
  names(adf) <- c("Year",1:15,"Model")#%>% mutate
  glimpse(adf)
  lage=10
  sdf       <- gather(adf,age,n,2:(lage+1),-Year) %>% mutate(age=as.numeric(age)) #+ arrange(age,yr)
  glimpse(sdf)
  p1 <- ggplot(sdf,aes(x=age,y=as.factor(Year),height = n,fill=Model,color=Model)) +
  geom_density_ridges(stat = "identity",scale = 4, alpha = .1) + theme_few() +
            xlim(c(1,lage))+ ylab("Year") + xlab("age")
  ggsave("doc/figs/vastage_vs_db.pdf",plot=p1,width=7,height=9,units="in")
#---Catch data table-------------------------------
  byc <- read.csv("data/byc_in_pollock.csv",header=T,as.is=TRUE)
 glimpse( byc)
length(byc[1,])
for (i in 2:length(byc[1,]) )
  byc[,i] <- formatC(byc[,i], format="d", big.mark=",")

  catch <- read_csv("../data/fishery/pollock_catch.csv")[,c(1,6,9,4,10,11)]
  names(catch)<-c("Year","target","gear","NMFS_area","Catch","wed")
  glimpse(catch)
catch <- catch %>%mutate(Area=
   #ifelse(NMFS_area %in% 540:543,"Aleutians",
   #ifelse(NMFS_area %in% 518,"Bogoslof",
   ifelse(NMFS_area %in% 520:529,"Northwest",
   ifelse(NMFS_area %in% c(500:517,519),"Southeast","Other"
       )),seas=ifelse(as.numeric(wed)<0600,"A","B")) %>%
  group_by(Year,Area,seas) %>% summarise(Catch=round(sum(Catch),0) )

catchw <-catch %>% filter(Area!="Other") %>%pivot_wider(names_from=c(Area,seas),values_from=Catch)
write_csv(catchw,"data/catch_tab.csv")

catch <- read_csv("data/catch_tab.csv")
catch <- catch %>% mutate(
  NW=Northwest_A+Northwest_B,
  SE=Southeast_A+Southeast_B,
  A=Northwest_A+Southeast_A,
  B=Northwest_B+Southeast_B,
  Total=A+B
)
  catch <- catch %>%mutate(Year=as.integer(Year))
glimpse(catch)
catch[,]
print(catch,n=Inf) %>%
length(as.vector(catch[1,]))
for (i in 2:length(catch[1,]) )
  catch[,i] <- formatC(catch[,i], format="d",digits=0, big.mark=",")
ncol=length(catch[1,])
ncol
cap <- tabcap[1]
lab <- tablab[1]
tab <- xtable(catch, caption = cap, label=paste0("tab:",tablab[1]),
  digits=0, auto=TRUE, big.mark=",",align=rep("r",(ncol+1)) )
print(tab, big.mark=",",caption.placement = "top",include.rownames = FALSE, sanitize.text.function = function(x){x},
       scalebox=.85)
#library(xtable)
#xtable(catchw)


  #---temperature------------------
  td <- as.data.frame(read.csv("doc/data/BTS_Temps.csv",header=T))
  mbt <- mean(td$Bottom)
  mst <- mean(td$Surface)
  td.g <- gather(td,Source,temp,-YEAR)
  .THEME <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank() )
  .THEME <- .THEME + theme(text=element_text(size=12)) + theme(axis.title.x=element_text(size=14) ,axis.title.y=element_text(size=14))
  .THEME <- .THEME + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
  p1 <- ggplot(td.g,aes(x=YEAR,y=temp,col=Source,shape=Source)) + geom_point(size=2) + geom_line(size=1.0) + .THEME + ylab("Degrees C") + expand_limits(y=0) +
       scale_x_continuous(breaks=seq(1982,2022,3)) + geom_hline(yintercept=mst,linetype="dashed") + geom_hline(yintercept=mbt,linetype="dashed") ;p1
  ggsave("doc/figs/bts_temp.pdf",plot=p1,width=7.5,height=4.5,units="in")

}
}
























