if(domcmc){
  #source("../R/plotMCMCpairs.R")
  #.plotMCMCpairs(tt)
  library(GGally)
  mc <- data.frame(read.table(paste0(.MODELDIR[thismod],"mcmc/mceval.rep")))
  #mc <- data.frame(read.table("mceval.rep"))
  #mc <- mc[,c(1:11,37)]
  names(mc) <- c("ObjFun","Steepness","lnR0","Fmsyr","SPR_msy","SER_msy","B0","Bmsy","B100","B20","B21","B/mean(B)","B22/B20%","DynB0","q") #,"x","y")
  dim(mc)
  1/mean(1/mc$Fmsyr)
  mc$Chain=1
  mc$Iteration=1:length(mc$Chain)
  mct <- mc %>% filter(lnR0<11,Bmsy>500,Bmsy<6000)
  hist(mct$Bmsy)

  p1 <- mct %>% select(Steepness,lnR0,DynB0,B20,Bmsy,Fmsyr) %>% 
       ggpairs(aes(fill="lemonchiffon",alpha=.5),lower = list(continuous = wrap("points", alpha = 0.3,size=0.1)) ) +  theme_classic() #.THEME
  p1
  ggsave("figs/mcmc_pairs.pdf",plot=p1,width=7,height=7,units="in")
  #head(mc)
  #mc.t <- select(mc,Iteration,ObjFun,q,Steepness,lnR0,B18,"B/mean(B)") %>% gather(Parameter,value,-Iteration) #%>% head
  #ggplot(mc.t,aes(x=Iteration,y=value)) + geom_line() + .THEME + facet_wrap(~Parameter,scales="free")
  #summary(mc)

  # table of Means and CVs
  #for (i in 2:17) print(c(names(mc)[i],round(median(mc[,i]),3), round(mean(mc[,i]),3), paste0(round(100*sqrt(var(mc[,i]))/mean(mc[,i]),0),"%") ))
  #ggplot(mc.t,aes(x=Iteration,y=value)) + geom_line() + .THEME + facet_wrap(~Parameter,scales="free")
  p1 <- mc %>% select(B20) %>% ggplot(aes(B20))+ geom_density(fill="lemonchiffon",alpha=.5 ) + theme_few() + 
            xlab("2020 Female spawning biomass") + 
            geom_vline(xintercept=M$SSB[dim(M$SSB)[1],2],col="grey") +
            geom_vline(xintercept=mean(mc$B19),size=2,col="red",linetype="dashed") 
  p1
  ggsave("figs/mcmc_marg.pdf",plot=p1,width=7,height=4,units="in")
  #head(mc.t)
  #q  
}