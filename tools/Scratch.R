
[1] "N"              "C"              "Z"              "S"              "H"              "avg_age_mature" "h_prior"        "q_prior"        "sdnr_bts"       "sdnr_ats"       "sdnr_avo"       "FW_fsh"
 [13] "FW_fsh1"        "FW_fsh2"        "FW_fsh3"        "obs_catch"      "pred_catch"     "FW_bts"         "FW_eit"         "dec_tab_catch"  "sam_fsh"        "sam_bts"        "sam_eit"        "sel_fsh"
 [25] "sel_bts"        "sel_eit"        "steepness"      "SR_resids"      "sigr"           "SRR_SSB"        "rechat"         "rechat.sd"      "repl_F"         "repl_yld"       "repl_SSB"       "cat_like"
 [37] "Fpen_like"      "wt_like"        "all_like"       "surv_like"      "cpue_like"      "avo_like"       "sel_like"       "sel_like_dev"   "age_like"       "len_like"       "rec_like"       "tot_like"
 [49] "Yr"             "yr_bts"         "ob_bts"         "eb_bts"         "ot_bts"         "et_bts"         "sd_ob_bts"      "sd_ot_bts"      "yr_eit"         "ob_eit"         "eb_eit"         "ot_eit"
 [61] "et_eit"         "sd_ob_eit"      "sd_ot_eit"      "sd_eit"         "future_F"       "future_SER"     "future_SSB"     "future_SSB.sd"  "future_catch"   "Fcur_Fmsy"      "Fcur_Fmsy.sd"   "Bcur_Bmsy"
 [73] "Bcur_Bmsy.sd"   "Bcur_Bmean"     "Bcur_Bmean.sd"  "Bcur2_Bmsy"     "Bcur2_Bmsy.sd"  "Bcur2_B20"      "Bcur2_B20.sd"   "Bcur3_Bcur"     "Bcur3_Bcur.sd"  "Bcur3_Bmean"    "Bcur3_Bmean.sd" "LTA1_5R"
 [85] "LTA1_5R.sd"     "MatAgeDiv1"     "MatAgeDiv1.sd"  "MatAgeDiv2"     "MatAgeDiv2.sd"  "RelEffort"      "RelEffort.sd"   "LTA1_5"         "LTA1_5.sd"      "SER"            "SSB"            "R"
 [97] "yrs_cpue"       "obs_cpue"       "obs_cpue_std"   "pred_cpue"      "yrs_avo"        "obs_avo"        "obs_avo_std"    "pred_avo"       "pobs_fsh"       "phat_fsh"       "phat_bts"       "phat_eit"
[109] "pobs_bts"       "pobs_eit"       "EffN_bts"       "EffN_ats"       "EffN_fsh"       "F"              "P_SSB"          "wt_ssb"         "wt_cur"         "wt_cur.sd"      "wt_next"        "wt_next.sd"
[121] "wt_yraf"        "wt_yraf.sd"     "wt_fsh"         "wt_fut"         "q_bts_3_8"      "T1"             "Cat_Fut"        "YC"             "fit"            "run_name"       "post.samp"
names(x)
p1 <- plot_cope(modlst[[1]])+ggtitle("Base") ;p1
p5 <- plot_cope(modlst[[5]])+ggtitle("Copepod index fit")  ;p5
p1/p5
p_Nage3 <- plot_Nage_3(modlst[c(1,5)])+theme_few(base_size=14) ;p_Nage3
p_srr <- plot_srr(modlst[c(1,2)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000))+theme_few(base_size=18);p_srr
p_srr <- plot_srr(modlst[c(1,5)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000))+theme_few(base_size=18);p_srr
p_srr <- plot_srr(modlst[c(1,6)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000))+theme_few(base_size=18);p_srr
p_srr <- plot_srr(modlst[c(1,2,5,6)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000))+theme_few(base_size=18);p_srr

ii=5
M <- modlst
tab_fit <- function(M,mod_scen=NULL){
  df <- NULL
  if (is.null(mod_scen)) mod_scen=1:length(M)
    for (ii in mod_scen) {
      x         <- M[[ii]]
      rmse_bts  <- round(x$rmse_bts,2); names(rmse_bts)   <- paste0("RMSE BTS")
      rmse_ats  <- round(x$rmse_ats,2); names(rmse_ats)   <- paste0("RMSE ATS")
      rmse_avo  <- round(x$rmse_avo,2); names(rmse_avo)   <- paste0("RMSE AVO")
      rmse_cpue <- round(x$rmse_cpue,2); names(rmse_cpue) <- paste0("RMSE CPUE")
      sdnr_bts  <- round(x$sdnr_bts,2); names(sdnr_bts)   <- paste0("SDNR BTS")
      sdnr_ats  <- round(x$sdnr_ats,2); names(sdnr_ats)   <- paste0("SDNR ATS")
      sdnr_avo  <- round(x$sdnr_avo,2); names(sdnr_avo)   <- paste0("SDNR AVO")
      effn_fsh  <- round(mean(x$EffN_fsh[28:dim(x$EffN_fsh)[1],2]),2); names(effn_fsh) <- paste0("Eff. N Fishery")
      effn_bts  <- round(mean(x$EffN_bts[,2]),2); names(effn_bts) <- paste0("Eff. N BTS")
      effn_ats  <- round(mean(x$EffN_ats[,2]),2); names(effn_ats) <- paste0("Eff. N ATS")
      bts_like  <- round(x$surv_like[1],2); names(bts_like) <- paste0("BTS NLL")
      ats_like  <- round(x$surv_like[2],2); names(ats_like) <- paste0("ATS NLL")
      avo_like  <- round(x$surv_like[3],2); names(avo_like) <- paste0("AVO NLL")
      cop_like  <- round(x$cope_like  ,2); names(cop_like) <- paste0("Copepod NLL")
      fac_like  <- round(x$age_like[1],2); names(fac_like) <- paste0("Fish Age NLL")
      bac_like  <- round(x$age_like[2],2); names(bac_like) <- paste0("BTS Age NLL")
      aac_like  <- round(x$age_like[3],2); names(aac_like) <- paste0("ATS Age NLL")
       #wt_like  <- round(x$wt_like   ,2); names(wt_like) <- paste0("Weight NLL")
      dat_like  <- round(x$dat_like-x$wt_like   ,2); names(dat_like) <- paste0("Data NLL")
      tot_like  <- round(x$tot_like-x$wt_like   ,2); names(tot_like) <- paste0("Total NLL")
      v      <- c( rmse_bts, rmse_ats, rmse_avo, rmse_cpue, sdnr_bts, sdnr_ats, sdnr_avo,
                   effn_fsh, effn_bts, effn_ats, bts_like, ats_like, avo_like,
                   cop_like,fac_like, bac_like, aac_like,dat_like,tot_like)
      df     <- cbind(df, v)
  }
  df <- data.frame(rownames(df), df, row.names = NULL)
  names(df) <- c("Component",names(M[mod_scen]))
  return(df)
}

t1 <- tab_fit(modlst)
write.csv(t1,"tabfit.csv")

df <- NULL
mod_scen <- c(1,2,5,6)
for (ii in mod_scen) {
    x       <- modlst[[ii]]
    abcbiom <- paste0(x$ABC_biom1s,",000");
    names(abcbiom)    <- paste0(nextyr," fishable biomass (GM)")
    msybiom           <- paste0(x$bmsyrs,",000");
    names(msybiom)    <- paste0("Equilibrium fishable biomass at MSY")
    msyr        <- round(x$harmeanF,3);
    names(msyr) <- ("MSY R (HM)")
    tier1abc        <- x$maxabc1s;
    names(tier1abc) <- paste(nextyr,"Tier 1 ABC")
    fofl            <- x$arithmeanF;
    names(fofl)     <- paste(nextyr,"Tier 1 $F_{OFL}$")
    ofl        <- x$ofl1s;
    names(ofl) <- paste(nextyr,"Tier 1 OFL")
    fabc        <- round(0.85*x$harmeanF,3);
    names(fabc) <- ("MSY R (HM)")
    recabc         <- x$abc1s;
    names(recabc)  <- "Recommended ABC"
    v      <- c(abcbiom,msybiom,msyr,tier1abc,fofl,ofl,fabc,recabc)
    df     <- cbind(df, v)
}
df <- data.frame(rownames(df), df, row.names = NULL)
names(df) <- c("Component",mod_names[mod_scen])
df
tab <- xtable(df, caption = "stuff", label = paste0("tab:","stuff"), digits = 3,align=paste0("ll",strrep("r",length(mod_scen))) )
tab <- xtable(df, caption = tabcap[28], label = paste0("tab:",tablab[28]), digits = 3,align=paste0("ll",strrep("r",length(mod_scen))) )
print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x})

df <- NULL
mod_scen <-c(2,3)
for (ii in mod_scen) {
    x       <- modlst[[ii]]
    ssb    <- x$nextyrssbs;         names(ssb)            <- paste0("${B}_{", nextyr ,"}$")
    ssbcv  <- round(x$nextyrssb.cv,2);  names(ssbcv)      <- paste0("$CV_{B_{", nextyr ,"}}$")
    Bmsy   <- x$bmsys;         names(Bmsy)                <- "$B_{MSY}$"
    Bmsycv <- round(x$bmsy.cv,2); names(Bmsycv)           <- "$CV_{B_{MSY}}$"
    spr    <- paste0(round(x$sprmsy*100,0),"\\%");names(spr) <- "SPR rate at $F_{MSY}$"
    b35    <- x$b35s ;                 names(b35)         <- paste0("$B_{35\\%}$")
    pbmsy  <- paste0(round(100*x$ssb1/x$bmsy,0),"\\%");    names(pbmsy)<- paste0("${B}_{", nextyr ,"}/B_{MSY}$")
    bzero  <- x$b0s ;                 names(bzero)        <- paste0("$B_0$")
    dynb0  <- x$dynb0s;      names(dynb0)                 <- "Est. $B_{2020} / B_{2020,no fishing}$"
    b_bmsy <- paste0(round(x$curssb/x$bmsy*100,0),"\\%");      names(b_bmsy) <- "$B_{2020} / B_{MSY}$"
    steep  <- round(x$steep,2);               names(steep) <- "Steepness"
    v      <- c(ssb, ssbcv, Bmsy, Bmsycv, pbmsy, bzero,b35, spr ,steep, dynb0,b_bmsy)
    df     <- cbind(df, v)
 }
df <- data.frame(rownames(df), df, row.names = NULL)
names(df) <- c("Component",mod_names[mod_scen])
tab <- xtable(df, caption = "Summary of model results and the stock condition for EBS pollock. Biomass units are thousands of t.", label = "tab:res_summ", digits = 3)
print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x})
df

df<-rbind(data.frame(modlst[[1]]$SSB,case=names(modlst[1])), data.frame(modlst[[2]]$SSB,case=names(modlst[2])) )
names(df)<- (c("Year","SSB","SE","lb","ub","case"))
head(df)
df %>% ggplot(aes(y=SSB,x=Year,ymin=lb,ymax=ub,fill=case,col=case)) + geom_line() + geom_ribbon(alpha=.4) + theme_few() + ggtitle("SSB (kt)") + xlim(c(1980,2020))
df %>% mutate(CV=SE/SSB) %>% ggplot(aes(y=CV,x=Year,fill=case,col=case)) + geom_line(size=1.2) + theme_few(base_size=18) + ylim(c(0,.15)) + xlim(c(1980,2020))+ ggtitle("SSB Coefficient of variation")
M

if (doplots) {

  do_data_plots <- FALSE

if(do_data_plots){
#--Fishery--------------------

#---Fishery stuff----------------------
wed <- read.csv("~/OneDrive/sampler/cases/ebswpSAM/imported/akfin_cat.csv",as.is=TRUE)
tac <- read.csv("~/_mymods/ebswp/doc/data/tac_abc.csv",as.is=TRUE)
tac
wed  %>% filter(FMP.Area=="BSAI") %>% group_by(Year) %>% summarize(sum(Weight.Posted..Sum.)) %>% tail()
df   <- wed %>% filter(FMP.Area=="BSAI",Species.Group.Name=="Pollock") %>% transmute(Year,ret=Retained.Discarded,wed=WED..mmdd.,
                target = Trip.Target.Name, season=ifelse(wed>610,"B","A"), area=Reporting.Area.Code,
                mgt    =ifelse(area == 518,"Bogoslof",ifelse(area>539,"Aleutians",ifelse(area>519,"NW","SE"))),
                strata =ifelse(season == "A","1",ifelse(area>519,2,ifelse(area<520,3,NA))), Catch=Weight.Posted..Sum.)
tsum <- (df) %>% group_by(ret,mgt,Year) %>% summarize(Catch=sum(Catch)) %>% pivot_wider(names_from=c(mgt,ret),values_from=Catch)
p1 <- df %>% filter(!is.na(strata)) %>% mutate(strata=ifelse(strata==1,"A-season",ifelse(strata==2,"NW B-season","SE B-season"))) %>% group_by(Year,strata) %>% summarize(Catch=sum(Catch)) %>%
      ggplot(aes(x=Year,y=Catch,fill=strata)) + geom_area(color="white") + theme_few()
      p1
# flextable(tsum)
    #---Roe data------------------

    #df <- tibble(read.csv("../doc/data/product.csv",header=T))
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

      rd <- data.table(read.csv("../doc/data/roe.csv",header=T))
      #rd.s <- rd %>% select(Year, Prod, t)%>% group_by(Year,Prod) %>% summarise(t=sum(t)) %>% spread(Prod,t)
      #rd.s<-rd.s[,2:10]
      #rd.s
      #ggpairs(rd.s[,c(7,8,2,5,1)],aes(fill="lemonchiffon",alpha=.5)) + .THEME
      #names(rd)
      rd %>% gather(Season,Year) %>% head
      rd <- select(rd,Year, Season, Prod,t) %>% group_by(Year,Season,Prod) %>% summarize(t=sum(t))
      #df <-data.frame(Year=M$Yr,M$F); names(df) <- c("Year",1:15); df.g <- gather(df,age,F,2:16,-Year)
      .THEME <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank() )
      .THEME <- .THEME + theme(text=element_text(size=12)) + theme(axis.title.x=element_text(size=14) ,axis.title.y=element_text(size=14))
      .THEME <- .THEME + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
      #p1 <- rd %>% ggplot(aes(x=Year,y=t,shape=Season,col=Prod)) + geom_point(size=2) + geom_line(size=1.0) + .THEME + ylab("Tons of roe produced") + expand_limits(y=0) + scale_x_continuous(breaks=seq(1982,2018,1))
      p1 <- rd %>% filter(Prod=="ROE") %>% ggplot(aes(x=Year,y=t,shape=Season,col=Season)) + geom_point(size=2) + geom_line(size=1.0) + .THEME + ylab("Tons of roe produced") + expand_limits(y=0) +
           scale_x_continuous(breaks=seq(2000,2020,2))
            #  + geom_hline(yintercept=mst,linetype="dashed") + geom_hline(yintercept=mbt,linetype="dashed")
      ggsave("figs/roe.pdf",plot=p1,width=7.5,height=4.5,units="in")


      #--- Catch-age estimates for sex catch age --------------------------
      # Updated
      i=2019
      edt <- (read.table(paste0("~/OneDrive/sampler/cases/ebswpSAM/results/Est_",i,".dat"),header=T))
      for (i in 2018:1991){
        tdt <- (read.table(paste0("~/OneDrive/sampler/cases/ebswpSAM/results/Est_",i,".dat"),header=T))
        edt <- rbind(edt,tdt)
      }
      tot <- edt %>% filter(type=="N",sex<3,stratum<5) %>% mutate(season=ifelse(stratum==1,"A","B"),sex=ifelse(sex==1,"Male",ifelse(sex==2,"Female","Total"))) %>%
              group_by(year,sex) %>% summarize(Catch=sum(value))
      tot$season <-"all"
      p1 <- edt %>% filter(type=="N",sex<3,stratum<5) %>% mutate(season=ifelse(stratum==1,"A","B"),sex=ifelse(sex==1,"Male",ifelse(sex==2,"Female","Total"))) %>%
              group_by(year,sex,season) %>% summarize(Catch=sum(value)) %>% rbind(tot) %>%
              ggplot(aes(x=year,y=Catch,color=season,shape=sex,linetype=season)) + .THEME + geom_point(size=3.5) + geom_line(size=1.2) + expand_limits(y=0) +
              scale_x_continuous(breaks=seq(1990,2020,2)) + ylab("Catch (thousands)") + xlab("Year")
              p1
        ggsave("figs/catch_sex.pdf",plot=p1,width=7.5,height=4.5,units="in")
      #df <- tibble(read.csv("../doc/data/product.csv",header=T))
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

      rd <- data.table(read.csv("../doc/data/roe.csv",header=T))
      #rd.s <- rd %>% select(Year, Prod, t)%>% group_by(Year,Prod) %>% summarise(t=sum(t)) %>% spread(Prod,t)
      #rd.s<-rd.s[,2:10]
      #rd.s
      #ggpairs(rd.s[,c(7,8,2,5,1)],aes(fill="lemonchiffon",alpha=.5)) + .THEME
      #names(rd)
      rd %>% gather(Season,Year) %>% head
      rd <- select(rd,Year, Season, Prod,t) %>% group_by(Year,Season,Prod) %>% summarize(t=sum(t))
      #df <-data.frame(Year=M$Yr,M$F); names(df) <- c("Year",1:15); df.g <- gather(df,age,F,2:16,-Year)
      .THEME <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank() )
      .THEME <- .THEME + theme(text=element_text(size=12)) + theme(axis.title.x=element_text(size=14) ,axis.title.y=element_text(size=14))
      .THEME <- .THEME + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
      #p1 <- rd %>% ggplot(aes(x=Year,y=t,shape=Season,col=Prod)) + geom_point(size=2) + geom_line(size=1.0) + .THEME + ylab("Tons of roe produced") + expand_limits(y=0) + scale_x_continuous(breaks=seq(1982,2018,1))
      p1 <- rd %>% filter(Prod=="ROE") %>% ggplot(aes(x=Year,y=t,shape=Season,col=Season)) + geom_point(size=2) + geom_line(size=1.0) + .THEME + ylab("Tons of roe produced") + expand_limits(y=0) +
         scale_x_continuous(breaks=seq(2000,2020,2))
          #  + geom_hline(yintercept=mst,linetype="dashed") + geom_hline(yintercept=mbt,linetype="dashed")
      ggsave("figs/roe.pdf",plot=p1,width=7.5,height=4.5,units="in")


  #--- Catch-age estimates for sex catch age --------------------------
  # Updated
  i=2019
  edt <- (read.table(paste0("~/OneDrive/sampler/cases/ebswpSAM/results/Est_",i,".dat"),header=T))
  for (i in 2018:1991){
    tdt <- (read.table(paste0("~/OneDrive/sampler/cases/ebswpSAM/results/Est_",i,".dat"),header=T))
    edt <- rbind(edt,tdt)
  }
  tot <- edt %>% filter(type=="N",sex<3,stratum<5) %>% mutate(season=ifelse(stratum==1,"A","B"),sex=ifelse(sex==1,"Male",ifelse(sex==2,"Female","Total"))) %>%
          group_by(year,sex) %>% summarize(Catch=sum(value))
  tot$season <-"all"
  p1 <- edt %>% filter(type=="N",sex<3,stratum<5) %>% mutate(season=ifelse(stratum==1,"A","B"),sex=ifelse(sex==1,"Male",ifelse(sex==2,"Female","Total"))) %>%
          group_by(year,sex,season) %>% summarize(Catch=sum(value)) %>% rbind(tot) %>%
          ggplot(aes(x=year,y=Catch,color=season,shape=sex,linetype=season)) + .THEME + geom_point(size=3.5) + geom_line(size=1.2) + expand_limits(y=0) +
          scale_x_continuous(breaks=seq(1990,2020,2)) + ylab("Catch (thousands)") + xlab("Year")
          p1
  ggsave("figs/catch_sex.pdf",plot=p1,width=7.5,height=4.5,units="in")
  }

#---Compare selectivity for base w/ vast
df <- data.frame(sel=Alt$sel_fut,Age=1:15,Model="VAST")
df <- rbind(df,data.frame(sel=M$sel_fut,Age=1:15,Model="16.1"))
#df %>% group_by(Model) %>% summarize(mean(sel))
p1 <- df %>% ggplot(aes(x=Age,y=sel,color=Model)) + geom_line(size=1.5) + theme_few() + ylab("Selectivity") + scale_x_continuous(breaks=1:15)
ggsave("figs/sel_comp_vast.pdf",plot=p1,width=8,height=4.0,units="in")
#---Age diversity
  df <- data.frame(Year=M$Yr,Age=M$H,Measure="Population Age\n diversity")
  df <- rbind(df,data.frame(Year=M$Yr,Age=M$avg_age_mature,Measure="SSB Age\n diversity"))
  p1 <- df %>% filter(Year>1979) %>% ggplot(aes(x=Year,y=Age,color=Measure)) + geom_line(size=2) + theme_few() + scale_x_continuous(limits=c(1980,2020), breaks=seq(1980,2020,5));p1
  ggsave("figs/age_diversity.pdf",plot=p1,width=8,height=3.0,units="in")
#---
  #p1 <- plot_recruitment(modlst,xlim=c(2008.5,2019.5));p1
  #p1 <- plot_ssb(modlst,xlim=c(2008.5,2019.5));p1

  p1 <- plot_bts(modlst,xlim=c(1981.5,2019.5));p1
  p1 <- plot_recruitment(modlst[c(1,3,4)],xlim=c(2007.5,2020.5));p1
  p2 <- plot_ssb(modlst[c(1,3,4)],xlim=c(2008.5,2020.5),breaks=seq(2008,2021,by=2),alpha=.2); p2
  # Comparing base with 2 vast configurations
  p3 <- p1/p2; p3
  ggsave("figs/mod_eval0a.pdf",plot=p3,width=8,height=5.0,units="in")
  # Comparing base with 2 vast configurations
  #p1 <- plot_recruitment(modlst[c(2,4,5)],xlim=c(2010.8,2019.5));p1
  p1 <- plot_bts(modlst[c(thismod)],xlim=c(1981.5,2020.5),ylim=c(0,20000)) ;p1
  ggsave("figs/mod_eval0b.pdf",plot=p1,width=8,height=4.0,units="in")
  #p1 <- plot_ssb(modlst[c(3,4)],xlim=c(2000.5,2020.5),alpha=.2); p1
  #plot_recruitment(modlst,xlim=c(2004.5,2018.5))
  #plot_ssb(modlst,xlim=c(2004.5,2020.5),alpha=.1)
  #plot_ssb(modlst[c(2,3)],xlim=c(2004.5,2020.5),alpha=.1)
  #plot_bts(modlst,xlim=c(1981.5,2019.5),ylim=c(0,35000))
  #ggsave("figs/mod_eval0a.pdf",plot=p1,width=6,height=4,units="in")
  p1 <- plot_bts(modlst[c(3,5)],xlim=c(2010,2019.5),ylim=c(0,15000)) ;p1
  plot_bts(modlst[c(3)],xlim=c(1982,2019.5),ylim=c(0,15000))
  plot_bts(modlst[c(2)],xlim=c(1982,2019.5),ylim=c(0,15000))
  ggsave("figs/mod_eval0c.pdf",plot=p1,width=8,height=4,units="in")
  #p1 <- plot_sel();p1
  #i=5; M <- modlst[[i]] <- read_admb(fn[i]);modlst[[i]] <- c(modlst[[i]],get_vars(modlst[[i]]));M <- modlst[[i]]
  #M$maxabc2s
  yr=c(M$Yr,2021);sel<-rbind(M$sel_fsh,M$sel_fut)
  p1 <- plot_sel(Year=yr,sel=sel)
  dtmp <- p1$data %>% filter(Year==2021)
  p1 <- p1 + geom_density_ridges(data=dtmp, stat="identity",fill="gold") ;p1

  #plot_sel(sel=Alt$sel_fsh)
  ggsave("figs/mod_fsh_sel.pdf",plot=p1,width=4,height=8,units="in")

  p1 <- plot_sel(sel=M$sel_bts,styr=1982,fill="darkblue")
  #plot_sel(sel=M$sel_eit,styr=1994,fill="darkblue")
  ggsave("figs/mod_bts_sel.pdf",plot=p1,width=4,height=8,units="in")
 # p1 <- plot_mnage(modlst[c(2,3)])
  #p1 <- plot_mnage(modlst[thismod]) ;p1
  p1 <- plot_mnage(modlst[1]) ;p1 # Note used model 1 for figure...because of kludge for age compos
  ggsave("figs/mod_mean_age.pdf",plot=p1,width=5.8,height=8,units="in")
  p1 <- plot_bts(modlst[thismod])
  ggsave("figs/mod_bts_biom.pdf",plot=p1,width=5.2,height=3.7,units="in")

  p1 <- plot_ats(modlst[c(1,thismod)]) ;p1
  p1 <- plot_ats(modlst[c(1,3,4,thismod)]) ;p1
  p1 <- plot_ats(modlst[c(1,thismod)]) ;p1
  p1 <- plot_ats(modlst[c(4,thismod)]) ;p1
  p1 <- plot_bts(modlst)

#  p1 <- p1+ geom_vline(xintercept=2006.5,color="grey",size=1)
  #p1 <- p1+scale_y_log10()
  p1 <- plot_ats(modlst[c(1,3,4)]) +theme_few(base_size=11) ;p1
  ggsave("figs/mod_ats_biom.pdf",plot=p1,width=9.2,height=3.7,units="in");
  p1 <- plot_avo(modlst[thismod])
  ggsave("figs/mod_avo_fit.pdf",plot=p1,width=5.2,height=3.7,units="in")
  p1 <- plot_cpue(modlst[[thismod]])
  ggsave("figs/mod_cpue_fit.pdf",plot=p1,width=5.2,height=3.7,units="in")
  p1 <- plot_recruitment(modlst[thismod],xlim=c(1963.5,2020.5),fill="yellow");p1
  ggsave("figs/mod_rec.pdf",plot=p1,width=9,height=4,units="in")

  p1 <- plot_srr(modlst[c(3,4)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000));p1
  ggsave("figs/mod_srr_sq_a.pdf",plot=p1,width=9,height=4,units="in")

  srr_dir  = c("../runs/sr0/","../runs/sr1/", "../runs/sr2/","../runs/sr3/")
  srr_names  = c("Standard","Ignore 1978 YC","Diffuse prior","FMSY=F35%")
  fn       <- paste0(srr_dir,"pm")
  srrlst   <- lapply(fn, read_admb)
  names(srrlst) <- c(srr_names)
  nsrrmods <- length(srr_names)
  #for (i in 1:nmods) {
  p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000)                    );p1
  p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=1978,sizeout=1,sizein=5);p1
  p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),sizeout=3,sizein=3);p1
  p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),sizeout=3,sizein=1);p1
  p1 <- plot_srr(srrlst[c(1)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),sizeout=1,sizein=3);p1
  p1 <- plot_srr(srrlst[c(2)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  p1 <- plot_srr(srrlst[c(1,3)],alpha=.2,xlim=c(0,5200),ylim=c(0,95000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  p1 <- plot_srr(srrlst[c(1,4)],alpha=.2,xlim=c(0,5200),ylim=c(0,70000),yrsin=c(1977,1979:2018),sizeout=1,sizein=3);p1
  p1 <- plot_srr(srrlst[c(1,2)],alpha=.2,xlim=c(0,5200),ylim=c(0,100000));p1

  p1 <- plot_srr(modlst[c(4,7)],alpha=.2,xlim=c(0,5200),ylim=c(0,100000));p1
  ggsave("figs/mod_srr_a_b.pdf",plot=p1,width=9,height=4,units="in")
  p1 <- plot_srr(modlst[c(3,5)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000));p1
  p1 <- plot_srr(modlst[c(3,6)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000));p1
  p1 <- plot_srr(modlst[c(3,5,6)],alpha=.2,xlim=c(0,5200),ylim=c(0,80000));p1
  ggsave("figs/mod_srr_sq_c_d.pdf",plot=p1,width=9,height=4,units="in")
  #names(modlst) modlst[[3]]$abc1s modlst[[4]]$abc1s modlst[[3]]$maxabc1s
  #p1 <- p1 + theme_few(base_size=16) p1
  p1 <- plot_srr(modlst[thismod],alpha=.2,xlim=c(0,5200),ylim=c(0,80000),ebar=TRUE);p1
  ggsave("figs/mod_srr.pdf",plot=p1,width=9.4,height=5.9,units="in")
  #p1 <- plot_srr(modlst[c(2,4)],alpha=.2,xlim=c(0,5200),ylim=c(0,75000))
  #ggsave("figs/bholt_ricker.pdf",plot=p1,width=7.4,height=3.9,units="in")
  pdf("../doc/figs/mod_fsh_age.pdf",width=6,height=8)
  plot_agefit(M,type="fishery", case_label="2019 Assessment",gear="fsh")
  dev.off()
  pdf("../doc/figs/mod_srv_age.pdf",width=6,height=8)
  plot_agefit(M,type="survey", case_label="2019 Assessment",gear="bts")
  dev.off()

  #---Data influence------------
  #XXXXXX
  #CAB_names <- factor(c("Model 16.1 \nlast year", "Catch added", "Add ATS", "Add BTS", "Add AVO"),levels=c("Model 16.1 \nlast year", "Catch added", "Add ATS", "Add BTS", "Add AVO"))
  #CAB_names <- c("Model 16.1 \nlast year", "Catch added","C")
  #factor(sizes, levels = c("small", "medium", "large"))
  #.CABMODELDIR = c( "../runs/lastyr/", "../runs/C/","../runs/CA/","../runs/CAB/","../runs/CABA/")
  CAB_names <- (c("Model 16.2 \nlast year", "Catch added", "Add Catch-age", "Add DB USV", "VAST USV"))
  #CAB_names <- (c("Model 16.2 \nlast year", "Catch added", "Add Catch-age", "Add DB USV", "VAST USV")) ,levels=c("Model 16.2 \nlast year", "Catch added", "Add Catch-age", "Add DB USV", "VAST USV"))
  .CABMODELDIR = c( "../runs/last_year/", "../runs/C/","../runs/CA/","../runs/usv/","../runs/usv_vast/")

  # Read report file and make list
  fn       <- paste0(.CABMODELDIR, "pm")
  CABmodlst   <- lapply(fn, read_admb)
  #CAB_names <- c("last year", "Catch added", "+Catch-age", "+BTS", "+AVO")
#  CAB_names <- c("last year", "Catch added","Agin")
  names(CABmodlst) <- CAB_names
  nmods <- length(CAB_names)
  for (i in 1:nmods) {
    #print(i)k
    CABmodlst[[i]] <- c(CABmodlst[[i]],get_vars(CABmodlst[[i]]))
  }
  #p1 <-  plot_ssb(CABmodlst[c(1,3,5)],xlim=c(2009.5,2019.5),alpha=.1,ylim=c(0,5200)); p1
  names(CABmodlst[[1]])
  plot_ssb(CABmodlst)
  A <- .get_ssb_df(CABmodlst)
  names(A)
  A$Model <- factor(A$Model ,levels=c("Model 16.2 \nlast year", "Catch added", "Add Catch-age", "Add DB USV", "VAST USV"))
  p1 <- ggplot(A,aes(x=year,y=ssb,ymin=lb,ymax=ub,fill=Model)) + labs(x = "Year", y = "Spawning biomass") + .THEME +
        expand_limits(y = 0) + geom_line(aes(color=Model),size=1.2) +
        scale_x_continuous(limits=c(2009,2020), breaks=2009:2020)  +
        geom_ribbon(alpha = 0.1)  ;p1
  ggsave("figs/mod_data.pdf",plot=p1,width=8,height=4,units="in")
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
#ggsave("figs/q_sens_ssb.pdf",plot=p3,width=5.2,height=7.5,units="in")
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
#ggsave("figs/q_sens.pdf",plot=p3,width=8.2,height=3.5,units="in")

#--CV sensitivity----------
.MODELFN  = c("../runs/usv/","../runs/usv_vast/","../runs/estcvdb/","../runs/estcvvast/")
prof_names  = c("DB CV20%","VAST CV20%","DB Sampling CV","VAST est. CV")
fn       <- paste0(.MODELFN,"pm")
cvlst   <- lapply(fn, read_admb)
#proflst[[6]] <- M
names(cvlst) <- c(prof_names)
nmods <- length(prof_names)
for (i in 1:nmods) {
  cvlst[[i]] <- c(cvlst[[i]],get_vars(cvlst[[i]]))
}
p1 <- plot_ssb(cvlst, ylim=c(0,6500),breaks=seq(1990,2020,2), xlim=c(1990.5,2020.5),alpha=.1) ;p1

p1 <- plot_ats(cvlst[c(1:2)]) +theme_few(base_size=11) ;p1
p2 <- plot_ats(cvlst[c(3:4)]) +theme_few(base_size=11) ;p2
p5 <- p1/p2
p5
ggsave("figs/mod_ats_eval1.pdf",plot=p5,height=7,width=6.0,units="in");
p3 <- plot_ssb(cvlst[c(1,3)] , ylim=c(0,6000),breaks=seq(1990,2020,5), xlim=c(1990.5,2020.5),alpha=.1) ;p3
p4 <- plot_ssb(cvlst[c(2,4)] , ylim=c(0,6000),breaks=seq(1990,2020,5), xlim=c(1990.5,2020.5),alpha=.1) ;p4
p5 <- p3/p4
ggsave("figs/mod_ats_eval2.pdf",plot=p5,height=7,width=6.0,units="in");




 #---SSB figure----------------------------
t(M$future_SSB[1,2:6])
df <- rbind(data.frame(Year= M$SSB[,1], SSB=M$SSB[,2], lb=M$SSB[,4], ub=M$SSB[,5]),
data.frame(Year= nextyr:(nextyr+4), SSB=M$future_SSB[4,2:6], lb = M$future_SSB[4,2:6] -2*M$future_SSB.sd[4,2:6], ub = M$future_SSB[4,2:6] +2*M$future_SSB.sd[4,2:6]))
p1 <- ggplot(df,aes(x=Year,y=SSB,ymax=ub,ymin=lb)) + geom_ribbon(fill="salmon",alpha=.6) + geom_line() +  theme_few() +
  scale_x_continuous(limits=c(2000,2024),breaks=seq(2000,2024,2)) +
  ylab("Female spawning biomass (kt)") +
  geom_vline(xintercept=2020,col="grey"); p1
  ggsave("figs/proj_ssb.pdf",plot=p1,width=7.4,height=4.5,units="in")

  #---temperature------------------
  td <- as.data.frame(read.csv("../doc/data/Temps_82to19.csv",header=T))
  mbt <- mean(td$Bottom)
  mst <- mean(td$Surface)
  td.g <- gather(td,Source,temp,-YEAR)
  .THEME <- theme(panel.grid.major.x = element_blank(), panel.grid.minor.y = element_blank(), panel.grid.major.y = element_blank() )
  .THEME <- .THEME + theme(text=element_text(size=12)) + theme(axis.title.x=element_text(size=14) ,axis.title.y=element_text(size=14))
  .THEME <- .THEME + theme( panel.background = element_rect(fill="white"), panel.border = element_rect(colour="black", fill=NA, size=1))
  p1 <- ggplot(td.g,aes(x=YEAR,y=temp,col=Source,shape=Source)) + geom_point(size=2) + geom_line(size=1.0) + .THEME + ylab("Degrees C") + expand_limits(y=0) +
       scale_x_continuous(breaks=seq(1982,2019,3)) + geom_hline(yintercept=mst,linetype="dashed") + geom_hline(yintercept=mbt,linetype="dashed")
  ggsave("figs/bts_temp.pdf",plot=p1,width=7.5,height=4.5,units="in")

  #---R/S------------------
  nyrs=length(M$SSB[,1])
  dt <- data.table(yr=M$SSB[1:nyrs,1],ssb= M$SSB[1:nyrs,2], r=M$R[2:(nyrs-1),2] )
  dt <- dt %>% mutate(Year=substr(as.character(yr),3,4),rs= log(dt$r/dt$ssb))
  head(dt)
  p1 <- ggplot(dt,aes(x=yr,y=rs)) + geom_point(size=4,col="red") + geom_line() +geom_smooth() + .THEME + ylab("ln(Recruits/spawning biomass)") + xlab("Year")
  #ggplot(dt,aes(x=ssb,y=rs)) + geom_point(size=4,col="red") + geom_path() +geom_smooth(method="lm") + .THEME + ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)")
  p2 <- ggplot(dt,aes(x=ssb,y=rs,label=Year)) + geom_text() + geom_path(size=.5,alpha=.4) +geom_smooth(method="lm") + .THEME +
       ylab("ln(Recruits/spawning biomass)") + xlab("Spawning biomass (kt)") +  guides(size=FALSE,shape=FALSE,alpha=FALSE,col=FALSE)
  p3 <- p1 / p2
  ggsave("figs/mod_rs.pdf",plot=p3,width=5.2,height=7.5,units="in")

  p1 <- plot_ser(modlst[thismod],xlim=c(1964,thisyr+1),alpha=.7) + scale_x_continuous(breaks=seq(1965,thisyr+1,5))
  ggsave("figs/mod_ser.pdf",plot=p1,width=9.2,height=7.0,units="in")

  #---fishing mortality mod_F.pdf-----------------------------------------------------------------
  df <-data.frame(Year=M$Yr,M$F); names(df) <- c("Year",1:15); df.g <- gather(df,age,F,2:16,-Year)
  p1 <- df.g %>% mutate(age=as.numeric(age)) %>% filter(age<11)%>% ggplot(aes(y=age,x=Year,fill=F)) + geom_tile() + .THEME + ylab("Age")+ geom_contour(aes(z=F),color="darkgrey",size=.5,alpha=.4) +
            scale_fill_gradient(low = "white", high = "red") + scale_x_continuous(breaks=seq(1965,thisyr,5)) + geom_line(data=df.g[df.g$age=="6",],aes(x=Year,y=F*10)) +
            annotate("text", label = "Age 6 F (x10)" , x = 2015, y = 1.2, size = 5, colour = "black") + scale_y_continuous(breaks=seq(0,10,1))
  ggsave("figs/mod_F.pdf",plot=p1,width=9.2,height=6.0,units="in")

  #---Fits to bts age mod_bts_age.pdf-------------------------------------------------------------
  pdf("../doc/figs/mod_bts_age.pdf",width=6,height=8)
  plot_agefit(M,case_label="2020 Assessment",gear="bts",type="survey")
  #plot_agefit(modlst[[3]],case_label="VAST Assessment",gear="bts",type="survey")
  dev.off()

  #---Historical assessment retrospectives--------------------------------------------------------
  dd <- as.data.frame(read.csv("doc/data/Age3history.csv",header=T))
  names(dd) <- c("Year",2019:2006,2001:1998)
  dd.g <- pivot_longer(dd,cols=2:18,names_to="Assessment",values_to="Biomass")
  head(dd.g)
  # this line to add current year estimate!!
  t <- data.frame(Year=1964:(thisyr+1), Assessment=thisyr,Biomass=c(M$age3plus,M$age3plus1)  )
  dd.g <- rbind(dd.g,t)
  tmp <- dd.g %>% filter(Year==1+as.numeric(Assessment)) # %>% summarise(max(Year))
  p1 <- ggplot(dd.g,aes(x=Year,y=Biomass,color=Assessment)) + geom_line(alpha=.8,size=.75) + .THEME +
    scale_x_continuous(breaks=seq(1980,thisyr+1,5),limits=c(1980,thisyr+1))  +  xlab("Year") + ylim(0,14000) + ylab("Age 3+ biomass (kt)") +
    guides(size=FALSE,shape=FALSE,alpha=FALSE,col=FALSE)
  p1 <- p1  + geom_point(data=tmp,size=2)
    p1
  ggsave("figs/mod_hist.pdf",plot=p1,width=9.2,height=4.0,units="in")

  #---Fits to ats age mod_ats_age.pdf-------------------------------------------------------------
  pdf("../doc/figs/mod_ats_age.pdf",width=6,height=8)
  plot_agefit(M,case_label=paste(thisyr,"Assessment"),gear="ats")
  dev.off()

  #----Read in retro results-----------------
  j='16.2'
  i=0
  #read_rep("../runs/16.0/retro/r_1.rep")
  retouts <- list()
  for (i in 0:20) {
      rn=paste0("../runs/base/retro/r_",i,".rep")
      mn=paste0("r_",i)
      assign(mn,read_rep(rn))
      retouts[[mn]] <- (get(mn))
    }
  p1 <- plot_ssb(retouts,xlim=c(1990,2020),legend=F);p1
  p2 <- plot_ssb_rel(retouts,xlim=c(1990,2020),ylim=c(0.5,1.5),legend=F,alpha=.2)
  p3 <- p1/p2
  print(p3)
  ggsave("figs/mod_retro.pdf",plot=p3,width=7.2,height=9.0,units="in")
  p1 <- plot_R_rel(retouts,xlim=c(1990,2020),legend=F,rel=FALSE)
  p2 <- plot_R_rel(retouts,xlim=c(1990,2020),ylim=c(0.,3.5),legend=FALSE,alpha=.2)
  p3 <- p1/p2
  ggsave("figs/mod_retroR.pdf",plot=p3,width=7.2,height=9.0,units="in")
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

  rc = retouts[[1]]$SSB[,2]
  ntmp=0
  rho=0
  df <- data.frame(peel=1:21,rho=1:21)
  for (i in 1:21) {
    rn <- names(retouts[i])
    dtmp = (get(paste0(rn))$SSB )
    lr   = length(dtmp[,1])
    rho  = rho +(dtmp[lr,2] -rc[lr])/rc[lr]
    df$peel[i] <- i-1
    df$rho[i] <- rho/i
    print(paste(i,rho/i))
  }
  write.csv(df,"data/mohnrho.csv")
  #--------new catch/biomass figure-------------
  #M$SSB
  #df <- data.table(Year=M$SSB[,1],SSB=2*M$SSB[,2],Catch=M$obs_catch,U=M$obs_catch/(2*M$SSB[,2]))
  #ggplot(df,aes(x=Year,y=U)) + geom_line(size=2,color="red") + .THEME + xlim(c(1990,2020)) + ylab("Catch / spawning biomass")
  #--------phase plane figure-------------------

  #df2 <- rbind(data.frame(Year= M$SSB[,1], SSB=M$SSB[,2], lb=M$SSB[,4], ub=M$SSB[,5]),
#    ), lb = M$future_SSB[4,2:6] -2*M$future_SSB.sd[4,2:6], ub = M$future_SSB[4,2:6] +2*M$future_SSB.sd[4,2:6]))


  df <- read.table(paste0(.MODELDIR[thismod],"F40_t.rep"),header=T)
  pt <- df %>% filter(Year>thisyr) %>% transmute(F.Fmsy=meanF/Fmsy,Bmsy=Bmsy,Year=substr(as.character(Year),3,4))
  df <- df %>%filter(Year<=thisyr,Year>1977)  %>%transmute(F.Fmsy=meanF/Fmsy,B.Bmsy=SSB/Bmsy,Bmsy=Bmsy,Year=substr(as.character(Year),3,4))
  df2 <- data.frame(SSB=M$future_SSB[1,2:3])
  pt2 <- cbind(df2,pt)
  pt2  <- pt2 %>% transmute(F.Fmsy,B.Bmsy=SSB/Bmsy,Bmsy,Year)
  head(df)
         #mutate(F.Fmsy=meanF/Fmsy,B.Bmsy=SSB/Bmsy,Year=substr(as.character(Year),3,4)) %>%
  ggplot(df,aes(x=B.Bmsy,y=F.Fmsy,label=Year)) +
         geom_text(aes(color=as.factor(Year)),size=4,col="blue")+ .THEME + xlim(c(0,2.0))+ ylim(c(0,1.1)) + xlab("B/Bmsy") + ylab("F/Fmsy") +
         geom_label(data=pt2,size=2,fill="yellow",color="red",alpha=.4) +
         geom_line(data=pt2,color="red",alpha=.4) +
         geom_hline(size=.5,yintercept=1) + geom_vline(size=0.5,linetype="dashed",xintercept=.2) + geom_vline(size=.5,xintercept=1) + geom_path(size=.4) +
          guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE)
         p1
  ggsave("figs/mod_phase.pdf",plot=p1,width=7.2,height=5.7,units="in")

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
  ggsave("figs/future_F.pdf",plot=p1,width=7.4,height=5,units="in")

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
  idxOut <- read.csv("data/vast.csv",header=TRUE)
  df  <- mutate(idxOut, CV = sd/Biomass, sd=sd/1e6, Biomass=Biomass / 1e6, ll=Biomass-2*sd,ul=2*sd+Biomass) %>%
      select(Model, Area, Year,Biomass, CV,ul,ll)
  p1 <- ggplot(df,aes(x=Year,y=Biomass,color=Model)) + geom_point(position=position_dodge(width=0.5)) + geom_smooth(span=.1,se=F) +
      geom_errorbar(aes(ymin=ll,ymax=ul),width=.5,position=position_dodge(width=0.5)) + theme_few(base_size=19) +
      scale_x_continuous(breaks=seq(1982,2020,by=4))  + geom_hline(yintercept=0) + facet_grid(Area~.,scales="free") + ylab("Biomass (millions of t)")
  ggsave("figs/vast_idx.pdf",plot=p1,width=9.4,height=5,units="in")

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
#   ggsave("figs/mod_F",plot=p1,width=9.2,height=7.0,units="in")
}
