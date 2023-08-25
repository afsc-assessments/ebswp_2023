mcmc.pairs <- function(file = "c:\\t.dat", 
		type="thin",samples=400)
{
# READS IN DATA AND CREATES AN MCMC OBJECT
# FILE - ITERATIONS IN COL 1 AND NAMES IN ROW 1

dud <- read.table(file,header=T,as.is=T)
dud1 <- as.matrix(dud)
a <- nrow(dud1)
b <- round(a/samples,0)

index <- c()

if (type=="start") {
	index <- seq(1,samples,1)
	dud2 <- dud1[index,]
	} else
if (type=="end") {
	index <- seq(a-samples,a,1)
	dud2 <- dud1[index,]
	} else {
	index <- seq(1,a,b)
	dud2 <- dud1[index,]
	}

#browser()
panel.hist <- function(x, ...)
     {
         usr <- par("usr"); on.exit(par(usr))
         par(usr = c(usr[1:2], 0, 1.5) )
         h <- hist(x, plot = FALSE)
         breaks <- h$breaks; nB <- length(breaks)
         y <- h$counts; y <- y/max(y)
         rect(breaks[-nB], 0, breaks[-1], y, col="cyan", ...)
     }

 panel.cor <- function(x, y, digits=2, prefix="", cex.cor)
     {
         usr <- par("usr"); on.exit(par(usr))
         par(usr = c(0, 1, 0, 1))
         r <- abs(cor(x, y))
         txt <- format(c(r, 0.123456789), digits=digits)[1]
         txt <- paste(prefix, txt, sep="")
         if(missing(cex.cor)) cex <- 0.8/strwidth(txt)
         text(0.5, 0.5, txt, cex = cex * r)
     }

#pairs(dud2,pch=16,cex=0.2)
 pairs(dud2,diag.panel=panel.hist, upper.panel=panel.smooth,pch=20,cex=.5)
 #pairs(dud2, upper.panel=panel.smooth,pch=20,cex=.5)
 #pairs(dud2,pch="*",cex=0.2,diag.panel=panel.hist )
return(invisible())
}
