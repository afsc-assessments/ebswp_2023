#source("D:\\shelton\\pop\\output\\mcmcplot.r")
#mcmc.plots(data=aaa,type="dens")
mcmc.plots <- function(data=aa,type="trace",Segs=TRUE, Numbs=TRUE)
{
# FUNCTION FOR SETTING UP PAR PARAMS TO DISPLAY PLOTS ON ONE PAGE
# types = trace, autocorr or dens
mar <- c(5.1, 4.1, 4.1, 2.1)
nvars <- ncol(data)
a <- varnames(data)
  par(oma=c(0,0,0,0),las=1,mar=c(3,2,2,2))

  if (nvars>9) {
    par(mfrow=c(6,2))
  } else
  if (nvars<4) { 
    par(mfrow=c(3,1))
  } else 	
	{
    par(mfrow=c(4,2))
  }

b <- summary(data)
data.mean <- b$statistics[,1]
data.median <- b$quantiles[,3]

#browser()
	if (type=="trace") {
	traceplot2(data)
	} else
	if (type=="dens")  {
	densplot2(data,meanvar=data.mean,medvar=data.median,segs=Segs,numbs=Numbs)
	} else
	{
	autocorr.plot(data,lag.max=50)
	} 

return(invisible())
}
