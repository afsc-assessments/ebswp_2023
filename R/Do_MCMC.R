if(domcmc){
  #source("../R/plotMCMCpairs.R")
  #.plotMCMCpairs(tt)
  library(GGally)
  mc <- data.frame(read.table(paste0(.MODELDIR[thismod],"mcmc/mceval.rep")))
  mclen <- length(mc[,1])
  #mc <- data.frame(read.table("mceval.rep"))
  #mc <- mc[,c(1:11,37)]
  names(mc) <- c("ObjFun","Steepness","lnR0","Fmsyr","SPR_msy","SER_msy","B0","Bmsy","B100","B20","B2021","B/mean(B)","B22/B20%","DynB0","q") #,"x","y")
  dim(mc)
  mc$Chain=1
  mc$Iteration=1:length(mc$Chain)
  mct <- mc %>% filter(lnR0<11,Bmsy>500,Bmsy<6000)

  p1 <- mct %>% select(Steepness,lnR0,DynB0,B2021,Bmsy,Fmsyr) %>% 
       ggpairs(aes(fill="lemonchiffon",alpha=.5),upper=NULL,lower = list(continuous = wrap("points", alpha = 0.1,size=0.1)) ) +  theme_classic() #.THEME
  p1
  ggsave("figs/mcmc_pairs.pdf",plot=p1,width=7,height=7,units="in")
  #head(mc)
  #mc.t <- select(mc,Iteration,ObjFun,q,Steepness,lnR0,B18,"B/mean(B)") %>% gather(Parameter,value,-Iteration) #%>% head
  #ggplot(mc.t,aes(x=Iteration,y=value)) + geom_line() + .THEME + facet_wrap(~Parameter,scales="free")
  #summary(mc)

  # table of Means and CVs
  #for (i in 2:17) print(c(names(mc)[i],round(median(mc[,i]),3), round(mean(mc[,i]),3), paste0(round(100*sqrt(var(mc[,i]))/mean(mc[,i]),0),"%") ))
  #ggplot(mc.t,aes(x=Iteration,y=value)) + geom_line() + .THEME + facet_wrap(~Parameter,scales="free")

  p1 <- mc %>% select(B2021) %>% 
       ggplot(aes(B2021))+ geom_density(fill="lemonchiffon",alpha=.5 ) + theme_few() + 
            xlab(paste(thisyr,"Female spawning biomass")) + 
            geom_vline(xintercept=M$SSB[dim(M$SSB)[1],2],col="grey") +
            geom_vline(xintercept=mean(mc$B2021),size=1,col="red",linetype="dashed") 
  p1
  ggsave("figs/mcmc_marg.pdf",plot=p1,width=7,height=4,units="in")
# Fmsyr 
Fmsy2= M$fit$est[M$fit$names=="Fmsy2"]
  p1 <- mc %>% select(Fmsyr) %>% ggplot(aes(Fmsyr))+ geom_density(fill="lemonchiffon",alpha=.5 ) + theme_few() + 
            xlab("Fmsy rate") + xlim(c(0,.9)) +
             geom_vline(aes(xintercept=median( mc$Fmsyr ), color="median"), linetype="dotted", size=1) +
             geom_vline(aes(xintercept=mean( mc$Fmsyr ),   color="mean"), linetype="dashed", size=1) +
             geom_vline(aes(xintercept=mean( mclen/sum(1/mc$Fmsyr) ), color="harmonic_mean"), linetype="solid", size=1) +
             scale_color_manual(name = "Statistics", values = c(median = "blue", mean = "red", harmonic_mean="darkgreen"))+
             scale_linetype_manual( name="Statistics",values = c(median = "dotted", mean = "dashed", harmonic_mean="solid"))
             p1
  ggsave("figs/mcmc_marg_fmsy.pdf",plot=p1,width=7,height=4,units="in")
            #geom_vline(xintercept=median(mc$Fmsyr),size=1,col="darkgreen",linetype=4)  +
            geom_vline(xintercept=Fmsy2,col="grey", ) +
            #geom_vline(xintercept=mean(mc$Fmsyr),size=1,col="blue",linetype="dotted")  +
            #geom_vline(xintercept=mclen/sum(1/mc$Fmsyr) ,size=1,col="red",linetype="dashed") ;p1
  # Get P B2021 < 20% Bzero
  mc %>% filter(B2021<(.2*M$Bzero)) %>% summarise(n()/mclen*100)
  prob_less_50_Bmsy <- mc %>% filter((B2021/Bmsy)<.5) %>% summarise(n()/mclen*100)
  #head(mc.t)
  #q  
  mcppl <- read_csv(paste0(.MODELDIR[thismod],"mcmc/mceval_ppl.csv"),col_names=FALSE)
  head(mcppl)
  names(mcppl) <- c("Index","Pd","draw","Year","Obs","Exp","Sim","VarObs")
  idx="ATS"
  idx="AVO"
  idx=c("ATS","AVO")
  obs <- mcppl %>% filter(Index==idx,draw==1) %>% transmute(Year,Obs,type="Obs")
  tmpdf <- mcppl %>% filter(Index==idx) %>% select(Year,Exp,Sim) %>% sample_frac(.5) #%>% pivot_longer(cols=2:3,names_to="type",values_to="Biomass") 
  ggplot(data=tmpdf) + geom_point(aes(x=jitter(Year),y=Sim),color="grey",alpha=.2) + 
  geom_point(aes(x=jitter(Year,.3),y=Exp),color="yellow",alpha=.2,size=.8) + theme_few() + ylab("Index") +xlab("Year") +
  geom_line(data=obs,aes(x=Year,y=Obs))

  dd.g <- pivot_longer(dd,cols=2:20,names_to="Assessment",values_to="Biomass")

}