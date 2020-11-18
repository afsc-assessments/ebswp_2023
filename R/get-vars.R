get_vars <- function(M){
  B <- list()
  A <- read.table("data/intro_table.dat",header = TRUE)
  A$a1 <- format(A[1,4] ,big.mark               = ",",scientific=F,digits=0)
  A$a2 <- format(A[2,4] ,big.mark               = ",",scientific=F,digits=0)
  A$b1 <- format(A[1,5] ,big.mark               = ",",scientific=F,digits=0)
  A$b2 <- format(A[2,5] ,big.mark               = ",",scientific=F,digits=0)
  A$c1 <- format(A[1,6] ,big.mark               = ",",scientific=F,digits=0)
  A$c2 <- format(A[2,6] ,big.mark               = ",",scientific=F,digits=0)
  A$d1 <- format(A[1,7] ,big.mark               = ",",scientific=F,digits=0)
  A$d2 <- format(A[2,7] ,big.mark               = ",",scientific=F,digits=0)
  A$e1 <- format(A[1,11] ,big.mark              = ",",scientific=F,digits=0)
  A$e2 <- format(A[2,11] ,big.mark              = ",",scientific=F,digits=0)
  A$f1 <- format(A[1,12] ,big.mark              = ",",scientific=F,digits=0)
  A$f2 <- format(A[2,12] ,big.mark              = ",",scientific=F,digits=0)
  A$g1 <- format(A[1,13] ,big.mark              = ",",scientific=F,digits=0)
  A$g2 <- format(A[2,13] ,big.mark              = ",",scientific=F,digits=0)
	B$it <- A #format(A[1,2],  big.mark=",",scientific=F,digits=0)
	B$npar <- M$fit$nopar
	# String versions of these values
	B$age3plus<-M$fit$est[M$fit$names=="age_3_plus_biom"][1:length(M$R[,1])]  
	B$age3plus.sd<-M$fit$std[M$fit$names=="age_3_plus_biom"][1:length(M$R[,1])]  
	B$age3plus.cv<- M$age3plus.sd/M$age3plus 
	B$bmsy    <- M$fit$est[M$fit$names=="Bmsy"];       B$bmsys      <- format(B$bmsy,big.mark=",",scientific=F,digits=0)
	B$bmsyr   <- M$fit$est[M$fit$names=="Bmsy2"];      B$bmsyrs      <- format(B$bmsyr,big.mark=",",scientific=F,digits=0)
	B$bmsy.sd <- M$fit$std[M$fit$names=="Bmsy"]; 
	B$bmsy.cv <- B$bmsy.sd/B$bmsy 
	B$sprmsy  <- M$fit$est[M$fit$names=="SPR_OFL"]; 
	B$sprmsy.sd <- M$fit$std[M$fit$names=="SPR_OFL"]; 
	B$sprmsy.cv <- B$sprmsy.sd/B$sprmsy 
	B$steep   <- M$fit$est[M$fit$names=="steepness"];  
	B$b0      <- M$fit$est[M$fit$names=="Bzero"];      B$b0s        <- format(B$b0,  big.mark=",",scientific=F,digits=0)
	B$b100    <- M$fit$est[M$fit$names=="SB100"];      B$b100s      <- format(B$b100,big.mark=",",scientific=F,digits=0)
	B$dynb0   <- M$fit$est[M$fit$names=="B_Bnofsh"];   B$dynb0s     <- format(B$dynb0,big.mark=",",scientific=F,digits=2)
	B$repl_yld<- M$repl_yld;                           B$repl_ylds  <- format(round(B$repl_yld,-1),big.mark=",",scientific=F,digits=0)
	B$curssb   <- M$SSB[length(M$SSB[,1]),2];          B$curssbs    <- format(round(B$curssb,-1),big.mark=",",scientific=F,digits=0)
	B$curssb.sd<- M$SSB[length(M$SSB[,1]),3];          B$curssb.sds <- format(round(B$curssb.sd,-1),big.mark=",",scientific=F,digits=0)
	B$curssb.cv <- B$curssb.sd/B$curssb
	B$nextyrssb<- as.numeric(M$future_SSB[1,2]);      B$nextyrssbs <- format(round(B$nextyrssb,-2) ,big.mark=",",scientific=F)
	B$nextyrssb.sd <- as.numeric(M$future_SSB.sd[1,2])
	B$nextyrssb.cv <- B$nextyrssb.sd/B$nextyrssb
	B$avgrec <- mean(M$R[14:54,2]);     B$avgrecs <- format(round(B$avgrec,-1),big.mark=",",scientific=F)
	B$yc2000 <- (M$R[M$R[,1]==2001,2]); B$yc2000s <- format(round(B$yc2000,-2),big.mark=",",scientific=F)
	B$yc2006 <- (M$R[M$R[,1]==2007,2]); B$yc2006s <- format(round(B$yc2006,-2),big.mark=",",scientific=F)
	B$yc2008 <- (M$R[M$R[,1]==2009,2]); B$yc2008s <- format(round(B$yc2008,-2),big.mark=",",scientific=F)
	B$yc2012 <- (M$R[M$R[,1]==2013,2]); B$yc2012s <- format(round(B$yc2012,-2),big.mark=",",scientific=F)
	B$yc2013 <- (M$R[M$R[,1]==2014,2]); B$yc2013s <- format(round(B$yc2013,-2),big.mark=",",scientific=F)
	B$rmse_bts <- mean((log(M$ob_bts)-log(M$eb_bts))^2)^.5
	B$rmse_ats <- mean((log(M$ob_eit)-log(M$eb_eit))^2)^.5
	B$rmse_avo <- mean((log(M$obs_avo)-log(M$pred_avo))^2)^.5
	B$rmse_cpue<- mean((log(M$obs_cpue)-log(M$pred_cpue))^2)^.5
	B$sdnr_bts <- M$sdnr_bts
	B$sdnr_ats <- M$sdnr_eit
	B$sdnr_avo <- M$sdnr_avo

	B$msyr <- M$fit$est[M$fit$names=="Fmsy2"]
	B$b40  <- .40*B$b100; B$b40s  <- format(B$b40,big.mark=",",scientific=F,digits=0)
	B$b35  <- .35*B$b100; B$b35s  <- format(B$b35,big.mark=",",scientific=F,digits=0)

	pdf     <- as.data.frame(M$T1)
	names(pdf) <- c("Year","ABC","OFL", "SSB","age3plus","CatchFut","harmeanF","arithmeanF","geomB","SPRABC","SPROFL")
	B$arithmeanF <-  round(pdf$arithmeanF[1],3)
	B$harmeanF   <-  round(pdf$harmeanF[1],3)
	B$maxFabc    <-  B$harmeanF
	B$age3plus1  <-  pdf$age3plus[1]
	B$age3plus1s <-  format(round(1e3*pdf$age3plus[1],-3),big.mark=",",scientific=F,digits=0)
	B$age3plus2  <-  pdf$age3plus[2]
	B$age3plus2s <-  format(round(1e3*pdf$age3plus[2],-3),big.mark=",",scientific=F,digits=0)
	B$ssb1       <-  pdf$SSB[1]
	B$ssb2       <-  pdf$SSB[2]
	B$ssb1s      <-  format(round(1e3*pdf$SSB[1],-3),big.mark=",",scientific=F,digits=0)
	B$ssb2s      <-  format(round(1e3*pdf$SSB[2],-3),big.mark=",",scientific=F,digits=0)
	B$ABC_biom1  <-  pdf$geomB[1];  B$ABC_biom1s  <- format(round(B$ABC_biom1,0),big.mark=",",scientific=F,digits=0)
	B$ABC_biom2  <-  pdf$geomB[2];  B$ABC_biom2s  <- format(round(B$ABC_biom2,0),big.mark=",",scientific=F,digits=0)
	B$maxabc1    <-  pdf$ABC[1]
	B$maxabc2    <-  pdf$ABC[2]
	B$maxabc1s   <-  format(round(1e3*pdf$ABC[1],-3),big.mark=",",scientific=F,digits=0)
	B$maxabc2s   <-  format(round(1e3*pdf$ABC[2],-3),big.mark=",",scientific=F,digits=0)
	B$ofl1       <-  pdf$OFL[1]
	B$ofl2       <-  pdf$OFL[2]
	B$ofl1s      <-  format(round(1e3*pdf$OFL[1],-3),big.mark=",",scientific=F,digits=0)
	B$ofl2s      <-  format(round(1e3*pdf$OFL[2],-3),big.mark=",",scientific=F,digits=0)
	#B$bfs        <- read.csv("../doc/data/proj.csv",header=T)
	B$bfs        <- read.table(proj_file,header=TRUE)
	B$Tier3_ABC1 <- B$bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(ABC),0))
	B$Tier3_ABC1s<- format(round(1e3*B$Tier3_ABC1,-3),big.mark=",",scientific=F,digits=0)
	B$Tier3_OFL1 <- B$bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(OFL),0))
	B$Tier3_OFL1s<- format(round(1e3*B$Tier3_OFL1,-3),big.mark=",",scientific=F,digits=0)
	B$Tier3_SSB1 <- B$bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(SSB),0))
	B$Tier3_fabc1<- B$Tier3_ABC1 / B$ABC_biom1
	B$Tier3_fofl1<- B$Tier3_OFL1 / B$ABC_biom1
	B$Tier3_ABC2 <- B$bfs %>% filter(Alt==2,Yr==1+nextyr) %>% summarize(round(mean(ABC),0))
	B$Tier3_ABC2s<- format(round(1e3*B$Tier3_ABC2,-3),big.mark=",",scientific=F,digits=0)
	B$Tier3_OFL2 <- B$bfs %>% filter(Alt==2,Yr==1+nextyr) %>% summarize(round(mean(OFL),0))
	B$Tier3_OFL2s<- format(round(1e3*B$Tier3_OFL2,-3),big.mark=",",scientific=F,digits=0)
	B$Tier3_SSB2 <- B$bfs %>% filter(Alt==2,Yr==1+nextyr) %>% summarize(round(mean(SSB),0))
	B$Tier3_fabc2<- B$Tier3_ABC2 /B$ABC_biom2
	B$Tier3_fofl2<- B$Tier3_OFL2 /B$ABC_biom2
	#B$abc1       <- 0.85*B$maxabc1 #B$Tier3_ABC1
	#B$abc2       <- 0.85*B$maxabc2 #B$Tier3_ABC2
	# Mean F
	if (dim(M$future_catch)[1]>8) {
		B$abc1constF <- M$future_catch[12,1]
		B$abc2constF <- M$future_catch[12,2]
	} else{
		B$abc1constF <- M$future_catch[5,1]
		B$abc2constF <- M$future_catch[5,2]
  }

	# Set recommended ABC here--Tier 3
	B$abc1       <- (B$Tier3_ABC1)
	B$abc2       <- (B$Tier3_ABC2)

	B$abc1constFs<- format(round(1e3*B$abc1constF,-3),big.mark=",",scientific=F,digits=0)
	B$abc2constFs<- format(round(1e3*B$abc2constF,-3),big.mark=",",scientific=F,digits=0)

	B$abc1s      <- format(round(1e3*B$abc1,-3),big.mark=",",scientific=F,digits=0)
	B$abc2s      <- format(round(1e3*B$abc2,-3),big.mark=",",scientific=F,digits=0)
	B$fabc1      <- round(B$Tier3_ABC1 /B$ABC_biom1,3)
	B$fabc2      <- round(B$Tier3_ABC2 /B$ABC_biom2,3)
	B$fabc1s     <- B$Tier3_ABC1 /B$ABC_biom1
	# Decision table stuff
	ord <- c(8,2:4,1,5:7)
  B$catch_dec_tab <- M$dec_tab_catch[ord]
  B$pfcur_fmsy    <- 1- pnorm(1,M$Fcur_Fmsy[ord] ,    M$Fcur_Fmsy.sd[ord]  )
  B$pbcur_bmsy    <- pnorm(1, M$Bcur_Bmsy[ord]   ,  M$Bcur_Bmsy.sd[ord]   )
  B$pbcur_bmean   <- pnorm(1, M$Bcur_Bmean[ord]  ,  M$Bcur_Bmean.sd[ord] )
  B$pbcur2_bmsy   <- pnorm(1, M$Bcur2_Bmsy[ord]  ,  M$Bcur2_Bmsy.sd[ord]  )
  B$pbcur2_b20    <- pnorm(1, M$Bcur2_B20[ord]   ,  M$Bcur2_B20.sd[ord]  )
  B$pbcur3_bcur   <- pnorm(1, M$Bcur3_Bcur[ord]  ,  M$Bcur3_Bcur.sd[ord]  )
  B$pbcur3_bmean  <- pnorm(1, M$Bcur3_Bmean[ord] ,  M$Bcur3_Bmean.sd[ord])
  B$plta1_5r      <- 1-pnorm(1, M$LTA1_5R[ord]     ,  M$LTA1_5R.sd[ord]    )
  B$pmatdiv1      <- pnorm(1, M$MatAgeDiv1[ord]  ,  M$MatAgeDiv1.sd[ord] )
  B$pmatdiv2      <- pnorm(1, M$MatAgeDiv2[ord]  ,  M$MatAgeDiv2.sd[ord] )
  B$prel_effort   <- 1-pnorm(1, M$RelEffort[ord]   ,  M$RelEffort.sd[ord]  )
  B$plta1_5       <- 1-pnorm(1, M$LTA1_5[ord]      ,  M$LTA1_5.sd[ord]    )


  return(B)
}