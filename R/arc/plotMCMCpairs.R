# Steven Martell
# Rob Kronlund
# Sean Cox
# Jaclyn Cleary

.plotMCMCpairs	<- function( admbObj )
{
	## pairs plot of mcmc samples for theta
	## code kindly stolen from ARK.
	panel.mcmc <- function( x,y,z=modes )
  {
	xMean <- mean( x,na.rm=T )
    yMean <- mean( y,na.rm=T )
	points( x,y,pch=16,cex=0.5,col=colr("black", 0.15) )
	abline( h=yMean,v=xMean,col="blue",lty=3 )
	points( xMean,yMean, bg="cyan", pch=21,cex=1.25 )
	if ( !is.null(modes) )
   	{
      # This is logic to figure out what "pair" is being plotted.
      # The modal estimates are the first row of the mcmcObj.
      # The par()$mfg calls finds the current row and column indices of
      # the panel being plotted.

		xMode <- z[ par()$mfg[2] ]
    	yMode <- z[ par()$mfg[1] ]
		points( xMode,yMode, bg="red", pch=22, cex=1.25 )
    }
  }

  panel.hist <- function( x,... )
  {
    # Histograms for diagonal of pairs plot (from PBS Modelling CCA).
	  usr <- par("usr")
      on.exit( par(usr) )
	  h <- hist( x, breaks="Sturges", plot=FALSE )
	  breaks <- h$breaks
      nB <- length(breaks)
	  y <- h$counts
      y <- y / sum(y)
	  par( usr = c(usr[1:2], 0, max(y)*1.5) )
	  rect( breaks[-nB], 0, breaks[-1], y, col="#FFD18F" )
      box()
  }

  # Find the active parameters.  If the chain is all equal, then the parameter
  # was fixed in the model configuration.  This gets a Boolean vector that
  # indicates which columns have fixed values.
  mcmcObj <- admbObj$mcmc[, 1:11]
  iPars <- apply( mcmcObj,2,function(x) { sum(diff(x))!=0.0 } )
  nPars <- sum( iPars )     # Number of active parameters in mcmc output.

  tmp <- mcmcObj[ ,iPars ]
  tmpNames <- names( tmp )

  modes <- mcmcObj[1,]
  pairs( tmp, panel=panel.mcmc, diag.panel=panel.hist, gap=0 )
  mtext(admbObj$stock, side=3, outer=T, line=-1.5)
  
}
