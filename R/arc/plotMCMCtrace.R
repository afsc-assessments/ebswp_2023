# Steven Martell
# Sept 16,  2012

.plotMCMCtrace	<- function( admbObj, label=NULL )
{
	## this function examines the trace plots for the
	## estimated leading parameters
	print("	.mcmcTrace")
	op=par(no.readonly=T)
	# guiInfo <- getWinVal(scope="L")
	# 	if ( !autoLayout )
	# 	{
	# 		winCols <- ncols
	# 		winRows <- nrows
	# 	}
	# 	else
	# 	{
	# 		winCols <- 3
	# 		winRows <- 4
	# 	}
	# 	
	# 	## set graphical parameters
	# 	if ( plotbyrow )
	# 		par( oma=.VIEWOMA, mar=.VIEWMAR, mfrow=c(winRows,winCols) )
	# 	else
	# 		par( oma=.VIEWOMA, mar=.VIEWMAR, mfcol=c(winRows,winCols) )
	# 	
	par(las=1,mar=c(5.1, 4.1, 4.1, 2.1)*0.5, oma=c(1, 1, 1, 1)*3, mfcol=c(4, 3))
	plotTrace <- function( obj )
	{
	  # Input "obj" is a VECTOR of MCMC samples.
	  # Produces one panel trace plot.

	  nSample <- length( obj )
	  plot( c(1:nSample), obj, type="n", axes=FALSE, xlab="", ylab="" )
	  points( c(1:nSample),obj, cex=0.5, pch=20, col="darkgray" )

	  lines( lowess( c(1:nSample),obj,f=1/4), lty=1, lwd=1 )
	  abline( h=mean(obj), lty=2 )

	  # Plot MPD point (1st element).
	  points( 1,obj[1], cex=1.0, pch=16, col="green" )
	  points( 1,obj[1], cex=1.0, pch=1 )    

	  axis( side=1 )
	  axis( side=2 )
	  box()
	}
  
	with(admbObj, {
	  # Find the active parameters.  If the chain is all equal, then the parameter
	  # was fixed in the model configuration.  This gets a Boolean vector that
	  # indicates which columns have fixed values.
	  mcmcObj=mcmc[, 1:12]
	  iPars <- apply( mcmcObj,2,function(x) { sum(diff(x))!=0.0 } )
	  nPars <- sum( iPars )     # Number of active parameters in mcmc output.

	  tmp <- mcmcObj[ ,iPars ]
	  tmpNames <- names( tmp )
	
	  for ( i in 1:ncol(tmp) )
	  {
	    plotTrace( tmp[,i] )
		title(main=tmpNames[i], line=0.5, font.main=1)
		print(tmpNames[i])
	  }

	  mtext(c("Sample", "Parameter",paste(stock)), c(1, 2, 3), 
			outer=T, line=c(1,0.5, -1), las=0)
	  
	})
	par(op)
}
