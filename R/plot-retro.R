plot_retro <- function(M,main=""){
	#M <- retouts
	length(M)
	df <- data.table(M[[1]]$SSB,case=0)
	for (i in 1:length(M))
		df <- rbind(df,data.table(M[[i]]$SSB,case=i))
	names(df) <- c("yr","SSB","SE","lb","ub","case")
	df$case <- as.factor(df$case)
	#df$SSB
	df <- filter(df,yr>1977,yr<=2017)
	p1<- ggplot(df,aes(x=yr,y=SSB,fill=case)) +
         geom_ribbon(aes(ymin=lb,ymax=ub),alpha=.2)  + 
         geom_line(size=0.7,aes(col=case)) + scale_x_continuous(limits=c(1990,2017),breaks= seq(1990,2017,2))  + 
         scale_y_continuous(limits=c(0,5.4e3)) + 
	       ylab("Spawning biomass (kt)") + xlab("Year") +  .THEME   + theme(legend.position="none") +
         guides(fill=FALSE,alpha=FALSE,col=FALSE) 
	ggsave("figs/mod_retro1.pdf",plot=p1,width=6,height=4,units="in")
	# Recruits
	df <- data.table(M[[1]]$R,case=0)
	for (i in 1:length(M))
		df <- rbind(df,data.table(M[[i]]$R,case=i))
	names(df) <- c("yr","R","SE","lb","ub","case")
	df <- filter(df,yr>1977,yr<=2017)
  df$coh <- df$yr-1
  df$termyr <- 2017-df$case
	df$case <- as.factor(df$case)
  # Pick out selected cohorts for squidding...
	dt_dc <- dcast(df, yr ~ case, value.var = c("R"))
	dt_dc <-data.frame(dt_dc)
	dt_dc
  names(dt_dc) <- c("Year",0:20)
	head(dt_dc)
	dim(dt_dc)
	bdft <- dt_dc %>% transmute(Year=yr,dt_dc[,2:22]/dt_dc[,2]))
	df.m <- gather(bdft,peel,2:12)
	tail(df,30 )
	p1<- ggplot(df,aes(x=yr,y=R,fill=case)) +
         geom_ribbon(aes(ymin=lb,ymax=ub),alpha=.2)  + 
         geom_line(size=0.7,aes(col=case)) + scale_x_continuous(limits=c(1990,2017),breaks=seq(1990,2017,2))  + 
         #scale_y_continuous(limits=c(0,5.4e3)) + 
	       ylab("Age-1 Recruitment (millions)") + xlab("Year") +  .THEME   + theme(legend.position="none") +
         guides(fill=FALSE,alpha=FALSE,col=FALSE) 
	ggsave("figs/mod_retro2.pdf",plot=p1,width=6,height=4,units="in")
	df
	p1 <- ggplot(df.m,aes(x=yr,y=SSB,col=case)) +geom_line(size=1.3) + scale_x_continuous(limits=c(1990,2017)) + scale_y_continuous(limits=c(0,5e3)) + ylab("Spawning biomass (kt)") + xlab("Year") +  .THEME   + theme(legend.position="none")
	p1
	p2 <- ggplot(df,aes(x=yr,y=RSSB,col=case)) +geom_line(size=1.3) + scale_x_continuous(limits=c(1990,2017)) + scale_y_continuous(limits=c(0,2)) + ylab("Relative spawning biomass ") + xlab("Year") +  .THEME   + theme(legend.position="none")
	p2
df
	for (i in 1:10) {
	  tdf <- data.frame(cbind(bdft[1],SSB=bdft[5+i]))[1:(40-i),]
	  names(tdf) <- c("yr", "SSB")
	  p2 <- p2 + geom_line(data=tdf, aes(x=yr,y=SSB),col=i,size=1.5)
	  tdf <- tdf[dim(tdf)[1],]
	  p2 <- p2 + geom_point(data=tdf,aes(x=yr,y=SSB),size=4,col=i)
	}    
	p2 <-p2 +geom_hline(aes(yintercept=1),size=3,linetype="dotted")
	p2 <-p2 +geom_hline(aes(yintercept=1),size=1,col="grey")
	# Mohn's rho
	rc = retouts[[0]]$SSB[,2]
	ntmp=0
	rho=0
	rn
	for (i in 1:20) {
		rn <- names(retouts[i])
	  dtmp = (get(paste0(rn))$SSB )
	  lr   = length(dtmp[,1])
	  ntmp = ntmp+(dtmp[lr,2] -rc[lr])/rc[lr]
	  #rho = rho + (-(ALL[i,2]-ALL[*tsyrs-i,2+i]))/ALL[(j)*tsyrs-i,2]
	  rho  = rho + (-(dtmp[i,2]-rc[i]))/rc[lr]
	  print(paste(i,ntmp/i,rho))
	}    
	if (main=="") p2 = p2+ggtitle(rn)
	if (main!="") p2 = p2+ggtitle(main)
	return(p2)
}