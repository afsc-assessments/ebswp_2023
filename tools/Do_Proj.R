if(doproj)
{
  .projdir <- paste0(.MODELDIR[thismod],"proj/")
  system(paste0("cd ",.projdir,"; spm "))
  bf <- data.frame(read_csv(paste0(.projdir,"spm_detail.csv"))) %>% mutate(Alt=as.factor(Alternative))
  # Stock Alt Sim Yr  SSB Rec Tot_biom SPR_Implied F Ntot Catch ABC OFL AvgAge AvgAgeTot SexRatio FABC FOFL
  bfsum <- bf %>% select(Alt,Yr,SSB,F,ABC ,Catch) %>% group_by(Alt,Yr) %>% summarise(Catch=mean(Catch),SSB=mean(SSB),F=mean(F),ABC=mean(ABC))
  t1 <- bfsum %>% select(Alt,Yr,Catch) %>% spread(Alt,Catch)
  names(t1) <- c("Catch","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
  write.csv(t1,"data/tier3_proj_C.csv",row.names=F)
  t1 <- bfsum %>% select(Alt,Yr,SSB) %>% spread(Alt,SSB)
  names(t1) <- c("SSB","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
  write.csv(t1,"data/tier3_proj_SSB.csv",row.names=F)
  t1 <- bfsum %>% select(Alt,Yr,F) %>% spread(Alt,F)
  names(t1) <- c("F","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
  write.csv(t1,"data/tier3_proj_F.csv",row.names=F)
  t1 <- bfsum %>% select(Alt,Yr,ABC) %>% spread(Alt,ABC)
  names(t1) <- c("ABC","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
  write.csv(t1,"data/tier3_proj_ABC.csv",row.names=F)


  # write some sims out for easy use later...
  bfs <- bf %>% filter(Sim<=30)
  head(bfs)
  write.csv(bfs,"data/proj.csv")
  title=c("gah","Alternative 1", "Alt 3, mean F")
 # head(bfs)
  alt=2
  for (alt in 2:3){
    bfss <- bfs %>% filter(Alt==alt) %>% select(Alt,Yr,Catch,SSB,Sim)
    pf <- data.frame(read.table(paste0(.projdir,"percentdb.out"),header=F) )
    names(pf) <- c("stock","Alt","Yr","variable","value")
    p1 <- pf %>% filter(substr(variable,1,1)=="C",variable!="CStdn",Alt==alt) %>% select(Yr,variable,value) %>% spread(variable,value) %>%
      ggplot(aes(x=Yr,y=CMean),width=1.2) + geom_ribbon(aes(ymax=CUCI,ymin=CLCI),fill="goldenrod",alpha=.5) + theme_few() + geom_line() +
      scale_x_continuous(breaks=seq(thisyr,thisyr+14,2))  +  xlab("Year") + coord_cartesian(ylim=c(0,3000)) + ylab("Tier 3 ABC (kt)") + geom_point() +
      geom_line(aes(y=Cabc)) + geom_line(aes(y=Cofl),linetype="dashed") + geom_line(data=bfss,aes(x=Yr,y=Catch,col=as.factor(Sim)))+ guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE)
    p2 <- pf %>% filter(substr(variable,1,1)=="S",variable!="SSBStdn",Alt==alt) %>% select(Yr,variable,value) %>% spread(variable,value) %>%
      ggplot(aes(x=Yr,y=SSBMean),width=1.2) + geom_ribbon(aes(ymax=SSBUCI,ymin=SSBLCI),fill="coral",alpha=.5) + theme_few() + geom_line() +
      scale_x_continuous(breaks=seq(thisyr,thisyr+14,2))  +  xlab("Year") + coord_cartesian(ylim=c(0,5000)) + ylab("Tier 3 Spawning biomass (kt)") + geom_point() +
      geom_line(aes(y=SSBFabc)) + geom_line(aes(y=SSBFofl),linetype="dashed")+ geom_line(data=bfss,aes(x=Yr,y=SSB,col=as.factor(Sim)))+ guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE)
    #t3 <- grid.arrange(p1, p2, nrow=2)
    t3 <- p1/ p2 + plot_annotation(title = title[alt] )
    if(alt==2) ggsave("doc/figs/tier3_proj.pdf",plot=t3,width=5.4,height=7,units="in")
    else ggsave("doc/figs/tier3_proj_alt3.pdf",plot=t3,width=5.4,height=7,units="in")
  }
}
