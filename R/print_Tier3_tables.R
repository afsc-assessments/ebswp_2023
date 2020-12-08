print_Tier3_tables <- function(mod_number,run=FALSE) {
  .projdir <- paste0(.MODELDIR[mod_number],"proj/")
  if (run) system(paste0("cd ",.projdir,"; main "))

  bf <- data.frame(read.table(paste0(.projdir,"bigfile.out"),header=TRUE,as.is=TRUE))
  # Stock Alt Sim Yr  SSB Rec Tot_biom SPR_Implied F Ntot Catch ABC OFL AvgAge AvgAgeTot SexRatio FABC FOFL
  bfsum <- bf %>% select(Alt,Yr,SSB,F,ABC ,Catch) %>% group_by(Alt,Yr) %>% summarise(Catch=mean(Catch),SSB=mean(SSB),F=mean(F),ABC=mean(ABC))

  tC <- bfsum %>% select(Alt,Yr,Catch) %>% spread(Alt,Catch) 
  names(tC) <- c("Catch","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")

  tB <- bfsum %>% select(Alt,Yr,SSB) %>% spread(Alt,SSB) 
  names(tB) <- c("SSB","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")

  tF <- bfsum %>% select(Alt,Yr,F) %>% spread(Alt,F) 
  names(tF) <- c("F","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
  
  tA <- bfsum %>% select(Alt,Yr,ABC) %>% spread(Alt,ABC) 
  names(tA) <- c("ABC","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")

  tab <- (data.frame(tC))
  rownames(tab)<-c()
  cap <- paste0("For the configuration named ",mod_names[mod_number],", ",tabcap[40])
  for (i in 2:length(tab[1,]) ) 
    tab[,i] <- formatC((tab[,i]), format="d", big.mark=",") 
  tab <- xtable(tab, caption = cap, label=paste0("tab:",tablab[40]),digits=0, auto=TRUE, align=rep("r",(length(tab[1,])+1)) )
  print(tab, caption.placement = "top",include.rownames = FALSE, sanitize.text.function = function(x){x}, scalebox=.85)

  tab <- (data.frame(tA))
  cap <- paste0("For the configuration named ",mod_names[mod_number],", ",tabcap[41])
  for (i in 2:length(tab[1,]) ) 
    tab[,i] <- formatC(as.numeric(tab[,i]), format="d", big.mark=",") 
  tab <- xtable(tab, caption = cap, label=paste0("tab:",tablab[41]),digits=0, auto=TRUE, align=rep("r",(length(tab[1,])+1)) )
  print(tab, caption.placement = "top",include.rownames = FALSE, sanitize.text.function = function(x){x}, scalebox=.85)

  tab <- (data.frame(tF))
  cap <- paste0("For the configuration named ",mod_names[mod_number],", ",tabcap[42])
  for (i in 2:length(tab[1,]) ) 
    tab[,i] <- formatC(as.numeric(tab[,i]), format="f",digits=3) 
  tab <- xtable(tab, caption = cap, label=paste0("tab:",tablab[42]), digits=3, align=rep("r",(length(tab[1,])+1)) )
  print(tab, caption.placement = "top",include.rownames = FALSE, sanitize.text.function = function(x){x}, scalebox=.85)

  tab <- (data.frame(tB))
  cap <- paste0("For the configuration named ",mod_names[mod_number],", ",tabcap[43])
  for (i in 2:length(tab[1,]) ) 
    tab[,i] <- formatC(as.numeric(tab[,i]), format="d", big.mark=",") 
  tab <- xtable(tab, caption = cap, label=paste0("tab:",tablab[43]),digits=0, auto=TRUE, align=rep("r",(length(tab[1,])+1)) )
  print(tab, caption.placement = "top",include.rownames = FALSE, sanitize.text.function = function(x){x}, scalebox=.85)
  
#.projdir <- paste0(.MODELDIR[thismod],"proj/")
#  system(paste0("cd ",.projdir,"; main "))
#  bf <- data.frame(read.table(paste0(.projdir,"bigfile.out"),header=TRUE,as.is=TRUE))
#  # Stock Alt Sim Yr  SSB Rec Tot_biom SPR_Implied F Ntot Catch ABC OFL AvgAge AvgAgeTot SexRatio FABC FOFL
#  bfsum <- bf %>% select(Alt,Yr,SSB,F,ABC ,Catch) %>% group_by(Alt,Yr) %>% summarise(Catch=mean(Catch),SSB=mean(SSB),F=mean(F),ABC=mean(ABC))
#  t1 <- bfsum %>% select(Alt,Yr,Catch) %>% spread(Alt,Catch) 
#  names(t1) <- c("Catch","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
#  write.csv(t1,"data/tier3_proj_C.csv",row.names=F)
#  t1 <- bfsum %>% select(Alt,Yr,SSB) %>% spread(Alt,SSB) 
#  names(t1) <- c("SSB","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
#  write.csv(t1,"data/tier3_proj_SSB.csv",row.names=F)
#  t1 <- bfsum %>% select(Alt,Yr,F) %>% spread(Alt,F) 
#  names(t1) <- c("F","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
#  write.csv(t1,"data/tier3_proj_F.csv",row.names=F)
#  t1 <- bfsum %>% select(Alt,Yr,ABC) %>% spread(Alt,ABC) 
#  names(t1) <- c("ABC","Scenario 1","Scenario 2","Scenario 3","Scenario 4","Scenario 5","Scenario 6","Scenario 7")
#  write.csv(t1,"data/tier3_proj_ABC.csv",row.names=F)
}
  