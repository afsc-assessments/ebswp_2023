source("../R/prelims.R")

  p1 <- plot_avo(modlst[c(1,4,5)]);p1 
  p1
  plot_avo
  L
df <- NULL
mod_scen <-c(4,5) 
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
    dynb0  <- x$dynb0s;      names(dynb0)                 <- "Est. $B_{2019} / B_{2019,no fishing}$"
    b_bmsy <- paste0(round(x$curssb/x$bmsy*100,0),"\\%");      names(b_bmsy) <- "$B_{2019} / B_{MSY}$"
    steep  <- round(x$steep,2);               names(steep) <- "Steepness"
    v      <- c(ssb, ssbcv, Bmsy, Bmsycv, pbmsy, bzero,b35, spr ,steep, dynb0,b_bmsy)
    df     <- cbind(df, v)
 }
df <- data.frame(rownames(df), df, row.names = NULL)
names(df) <- c("Component",mod_names[mod_scen])
tab <- xtable(df, caption = "Summary of model 16.1 results and the stock condition for EBS pollock. Biomass units are thousands of t.", label = "tab:res_summ", digits = 3)
print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x})
```

df <- NULL
mod_scen <- c(4,5)
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
tab <- xtable(df, caption = tabcap[28], label = paste0("tab:",tablab[28]), digits = 3,align=paste0("ll",strrep("r",length(mod_scen))) )
print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x})
```

 bfs <- bf %>% filter(Alternative==2) #%>% sample_n(30)
bfs$Sim <- rep(1:1000,each=14) 
bfs <- bfs %>% filter(Sim<=30) %>% mutate(Sim=as.factor(Sim))
 dim(bf)
  head(bfs)
  write.csv(bfs,"data/proj.csv")
 # head(bfs)
  bfss <- bfs %>% filter(Alternative==2) %>% transmute(Alt=Alternative,Yr,Catch,SSB,Sim) 
  pf <- data.frame(read.table(paste0(.projdir,"percentdb.out"),header=F) )
  names(pf) <- c("stock","Alt","Yr","variable","value") 
  p1 <- pf %>% filter(substr(variable,1,1)=="C",variable!="CStdn",Alt==2) %>% select(Yr,variable,value) %>% spread(variable,value) %>%
    ggplot(aes(x=Yr,y=CMean),width=1.2) + geom_ribbon(aes(ymax=CUCI,ymin=CLCI),fill="goldenrod",alpha=.5) + theme_few() + geom_line() +
    scale_x_continuous(breaks=seq(thisyr,thisyr+14,2))  +  xlab("Year")  + ylab("Tier 3 ABC (kt)") + geom_point() + 
    geom_line(aes(y=Cabc)) + geom_line(aes(y=Cofl),linetype="dashed") + geom_line(data=bfss,aes(x=Yr,y=Catch, group=Sim, col="grey"))+ 
    scale_y_continuous(labels = scales::comma, limits=c(0,150000))  +
    guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE) ;p1
library(scales)
  p2 <- pf %>% filter(substr(variable,1,1)=="S",variable!="SSBStdn",Alt==2) %>% select(Yr,variable,value) %>% spread(variable,value) %>%
    ggplot(aes(x=Yr,y=SSBMean),width=1.2) + geom_ribbon(aes(ymax=SSBUCI,ymin=SSBLCI),fill="coral",alpha=.5) + theme_few() + geom_line() +
    scale_x_continuous(breaks=seq(thisyr,thisyr+14,2))  +  xlab("Year") + ylab("Tier 3 Spawning biomass (kt)") + geom_point() + 
    scale_y_continuous(labels = scales::comma, limits=c(0,210000))  +
    geom_line(aes(y=SSBFabc)) + geom_line(aes(y=SSBFofl),linetype="dashed")+ geom_line(data=bfss,aes(x=Yr,y=SSB, col="grey", group=Sim))+ 
    guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE) ;p2
  t3 <- grid.arrange(p1, p2, nrow=2)
  ggsave("tier3_proj.pdf",plot=t3,width=5.4,height=7,units="in")


df <- data.frame(sel=Alt$sel_fsh[56,],Age=1:15,Model="VAST")
df <- rbind(df,data.frame(sel=M$sel_fsh[56,],Age=1:15,Model="16.1"))
df %>% group_by(Model) %>% summarize(mean(sel))
df %>% ggplot(aes(x=Age,y=sel,color=Model)) + geom_line(size=1.5) + theme_few()

#---Compare selectivity for base w/ vast
df <- data.frame(sel=Alt$sel_fut,Age=1:15,Model="VAST")
df <- rbind(df,data.frame(sel=M$sel_fut,Age=1:15,Model="16.1"))
df %>% group_by(Model) %>% summarize(mean(sel))
df %>% ggplot(aes(x=Age,y=sel,color=Model)) + geom_line(size=1.5) + theme_few() + ylab("Selectivity") + scale_x_continuous(breaks=1:15)

df <- data.frame(sel=Alt$wt_fsh[56,],Age=1:15,Model="VAST")
df <- rbind(df,data.frame(sel=M$wt_fsh[56,],Age=1:15,Model="16.1"))
df %>% ggplot(aes(x=Age,y=sel,color=Model)) + geom_line(size=1.5) + theme_few()

df <- data.frame(sel=Alt$C[55,],Age=1:15,Model="VAST")
df <- rbind(df,data.frame(sel=M$C[55,],Age=1:15,Model="16.1"))
df %>% ggplot(aes(x=Age,y=sel,color=Model)) + geom_line(size=1.5) + theme_few()
M$wt_fsh

mod_names <- c("base","Const BTS Sel","redVarq")
mod_names <- c("base","M")
.MODELDIR = c( "../runs/base/", "../runs/M/")
.MODELDIR = c( "../prof/")
.MODELFN  = c("r_1.rep","r_2.rep","r_3.rep","r_4.rep","r_5.rep")
fn       <- paste0(.MODELDIR, "pm")
modlst   <- lapply(fn, read_admb)
names(modlst) <- mod_names
mod_names
T<-modlst[[2]]
bind(M$SSB, T$SSB)
bind(M$rec, T$rec)

plot_ssb(modlst,xlim=c(1990,2020))   
plot_recruitment(modlst,xlim=c(1990,2020))   
plot_srr(modlst)   
plot_srr(modlst[c(1,2)],alpha=.2,xlim=c(0,5200),ylim=c(0,75000))

# Comparison among variance constraints for RW in survey selectivity/q
proflst   <- lapply(fn, read_admb)
names(proflst) <- prof_names
nmods <- length(prof_names)
for (i in 1:nmods) {
  proflst[[i]] <- c(proflst[[i]],get_vars(proflst[[i]]))
}
df <- tab_fit(M=proflst,1:nmods)
tab <- xtable(df, caption = "Goodness of fit to primary data used for assessment model parameter estimation profiling over different constraints on the extent bottom-trawl survey selectivity/availability is allowed to change;  EBS pollock.", label = "tab:mod_prof_fits")#, digits = 3,align="llrrrrr")
print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x){x})

  plot_ssb(modlst[c(1,2)])
  plot_ssb(modlst)
  plot_bts(modlst)
  plot_sel(sel=modlst[[2]]$sel_bts,styr=1982,fill="darkblue",alpha=.4) 
  ############################################
  #
  # Compute average N over past 20 years
  #
  # where have we been and where are we headed...
  #
  #
  ############################################
  p1 <- ggplot(...
  p2 <- ggplot(... 
  p3 <- arrangeGrob(p1,p2,nrow=2)
  ggsave("figs/xxx.pdf",plot=p3,width=5.2,height=7.5,units="in")

  mnN <-(M$N[35,1:10])
  for (i in 36:55) mnN <- mnN + M$N[i,1:10]
  mnN <- mnN/20
  # get a z for current year to get 2020 Ns...
  z <- M$F[56,] + c(0.9, 0.6, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3)
  # 2020 Ns
  N20 <- c(22e3, M$N[56,1:9]*exp(-z[1:9]))

  m <-         data.frame(N=M$N[56,1:10],age=1:10,Method="2019 Estimates")
  m <- rbind(m,data.frame(N=mnN,age=1:10,Method="Mean"))
 p1 <- ggplot(m,aes(y=N,x=age,fill=Method)) + theme_few(base_size=12) + geom_bar(stat="identity",position="dodge") + scale_x_continuous(breaks=seq(1:10))  ;p1
  m <-         data.frame(N=N20,age=1:10,Method="2020 Estimates")
  m <- rbind(m,data.frame(N=mnN,age=1:10,Method="Mean"))
 p2 <- ggplot(m,aes(y=N,x=age,fill=Method)) + theme_few(base_size=12) + geom_bar(stat="identity",position="dodge") + scale_x_continuous(breaks=seq(1:10))  ;p2
  # Now show for biomass-at-age...
  wtage <- M$wt_next[1:10]
  m <-         data.frame(Biomass=N20*wtage,age=1:10,Method="2020 Estimates")
  m <- rbind(m,data.frame(Biomass=mnN*wtage,age=1:10,Method="Mean")) %>% filter(age>=3) 
p3 <-      ggplot(m,aes(y=Biomass,x=age,fill=Method)) + theme_few(base_size=12) + geom_bar(stat="identity",position="dodge") + scale_x_continuous(breaks=seq(1:10))  ;p3

  wt18 <- cumsum( wtage[3:10]*M$N[55,3:10]);m <-         data.frame(N=wt18,age=3:10,Method="2018 estimate")
  wt19 <- cumsum( wtage[3:10]*M$N[56,3:10]);m <-         data.frame(N=wt19,age=3:10,Method="2019 estimate")
  wt20 <- cumsum( wtage[3:10]*N20[3:10]);m <-         data.frame(N=wt20,age=3:10,Method="Projected to 2020 ")
  wtmn <- cumsum( wtage[3:10]*mnN[3:10])
  m <- rbind(m,data.frame(N=wtmn,age=3:10,Method="Mean"))
p4 <- ggplot(m,aes(y=N,x=age,fill=Method)) + theme_few(base_size=12) + geom_bar(stat="identity",position="dodge") + scale_x_continuous(breaks=seq(1:10))  + xlab("Age") + ylab("Cumulative biomass")
p4
  wt20[9]/wtmn[9]
wdf <- as.matrix(M$N[,3:10]*wtage[3:10])
wdf <- rbind(wdf,c(N20[3:10]*wtage[3:10])) # add on 2020
mwdf<- (mnN[3:10]*wtage[3:10]) 
anom<- t(t(wdf) / mwdf) - 1

t1 <- data.frame(wdf)
#for (i in 1:57) t1[i,] <- cumsum(as.vector(wdf[i,]))
  tail(t1)
#t2 <- cumsum(mwdf)
t2 <- (mwdf)
anom<- t(t(t1) / t2) -1
  df <- data.frame(cbind(1964:2020,anom)) 
  names(df) <- c("Year",3:10)
  sdf <- pivot_longer(df,2:9,names_to="Age",values_to="Anomaly") %>% mutate(age=as.numeric(Age))
xdf <-sdf %>% filter(Year>=2017)%>% mutate(pos = ifelse(Anomaly>0,"Above","Below"))
  ggplot(xdf,aes(x=age,y=Anomaly,fill=pos,group=Year)) + geom_bar(stat="identity") + 
      theme_few() + facet_grid(Year~.) + xlab("Age") +
      scale_x_continuous(breaks=3:10) +
      scale_fill_manual(values=c("darkgreen","red"), guide=FALSE) + scale_y_continuous(breaks=c(-2.5,0,2.5),limits=c(-2.5,2.5))

#Look at selectivity and wt-age
      sel1 <-         M$sel_fsh[56,1:10]
      sel2 <- modlst[[1]]$sel_fsh[55,1:10]
      sel1 <- sel1/max(sel1)
      sel2 <- sel2/max(sel2)
  m <-         data.frame(N=sel1, age=1:10,Method="2019 estimate")
  m <- rbind(m,data.frame(N=sel2, age=1:10,Method="2018 estimate"))
  #geom_bar(stat="identity",position="dodge") + 
  ggplot(m,aes(y=N,x=age,col=Method,fill=Method)) + theme_few(base_size=12) + geom_line(size=2) + ylab("Selectivity") +
    ggtitle("Selectivity at age ") + scale_x_continuous(breaks=1:10)
    m
  wt1 <-         M$wt_fut[3:15]
  wt2 <- modlst[[1]]$wt_fut[1:10]
  wt3 <-         M$wt_fsh[55,3:15]
  wt4 <-         M$wt_fsh[54,3:15]
  wt5 <-         M$wt_cur[1:13]
  wt6 <-         M$wt_next[1:13]
  m <-         data.frame(N=wt1, age=3:15,Method="2019 future wt estimate")
  m <- rbind(m,data.frame(N=wt3, age=3:15,Method="2018 estimate in 2019")) 
  m <- rbind(m,data.frame(N=wt4, age=3:15,Method="2017 estimate in 2019")) 
  m <- rbind(m,data.frame(N=wt5, age=3:15,Method="2019 estimate in 2019")) 
  m <- rbind(m,data.frame(N=wt6, age=3:15,Method="2020 estimate in 2019")) 
  m <- rbind(m,data.frame(N=wt2, age=3:15,Method="2018 future wt estimate"))
  ggplot(m,aes(y=N,x=age,col=Method,fill=Method)) + theme_few(base_size=12) + geom_line(size=2) + ylab("Body mass (kg)") +
    ggtitle("Weight at age ") + scale_x_continuous(breaks=3:15)

  df <- data.frame(cbind(1964:2020,t1),Source="Model") 
 for (i in 1964:2020)  df <- rbind(df,c(i, t2, "Mean"))
  df <- rbind(df, data.frame(cbind(1964:2020,t2),Source="Mean") )
  data.frame(cbind(1964:2020,t2),Source="Mean") 
  names(df) <- c("Year",3:10,"Source")
  sdf <- pivot_longer(df,2:9,names_to="Age",values_to="Anomaly") %>% mutate(age=as.numeric(Age))
tail(sdf)
xdf <-sdf %>% filter(Year>=2018)%>% mutate(pos = ifelse(Anomaly>0,"Above","Below"))
  ggplot(xdf,aes(x=age,y=Anomaly,color=Source,group=Year)) + geom_line() + 
      theme_few() + facet_grid(Year~.) + xlab("Age") +
      scale_x_continuous(breaks=3:10) +
      scale_fill_manual(values=c("darkgreen","red"), guide=FALSE)# +
      scale_y_continuous(breaks=c(-3,3))
  geom_bar(stat="identity") + 
  ggplot(xdf,aes(x=age,y=Year,fill=pos,group=Year)) + geom_bar(stat="identity") + theme_few() + facet_grid(Year~.) + scale_fill_manual(values=c("darkgreen","red"), guide=FALSE)
        geom_density_ridges(stat = "identity",scale = 4, alpha = .3,color="black") + .THEME  +
         xlim(c(3,10))+ ylab("Year") + xlab("Age (years)") + scale_y_discrete(limits=rev(levels(as.factor(sdf$Year))))
  return(p1)
  m <-         data.frame(N=M$N[55,1:10],age=1:10,Method="Base case")
  m <- rbind(m,data.frame(N=modlst[[3]]$N[55,1:10],age=1:10,Method="VAST"))
  m <- rbind(m,data.frame(N=P$N[55,1:10],age=1:10,Method="Last year"))
  ggplot(m,aes(y=N,x=age,fill=Method)) + theme_few(base_size=12) + geom_bar(stat="identity",position="dodge") + 
    ggtitle("Numbers at age in 2018")
    m
  