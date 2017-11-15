#' Extract spawning stock biomass (ssb) from gmacs run
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M list object created by read_admb function
#' @return dataframe of spawning biomass
#' @export
#' 
.get_ser_df <- function(M)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(year = A$SER[,1])
        df$Model <- names(M)[i]
        df$year <- A$SER[,1]
        df$SER  <- A$SER[,2]
        df$lb   <- A$SER[,4]
        df$ub   <- A$SER[,5]
        mdf     <- rbind(mdf, df)
    }
    return(mdf)
}


#' Plot predicted spawning stock biomass (SER)
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M List object(s) created by read_admb function
#' @param xlab the x-label of the figure
#' @param ylab the y-label of the figure
#' @param ylim is the upper limit of the figure
#' @param alpha the opacity of the ribbon
#' @return Plot of model estimates of spawning stock biomass 
#' @export
#' 
plot_ser <- function(M, xlab = "Year", ylab = "Spawning Exploitation rate", ylim = NULL, xlim=NULL,breaks=seq(1960,2017,5), alpha = 0.1,legend=TRUE)
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_ser_df(M)
    
    p <- ggplot(mdf) + labs(x = xlab, y = ylab) + .THEME
    
    if (!is.null(xlim))
      p <- p + scale_x_continuous(limits=xlim,breaks=breaks)  
    else
      p <- p + scale_x_continuous(breaks=breaks)  

    if (is.null(ylim))
    {
        p <- p + expand_limits(y = 0)
    } else {
        p <- p + ylim(ylim[1], ylim[2])        
    }
    
    if (length(M) == 1)
    {
        p <- p + geom_line(aes(x = year, y = SER)) +
            geom_ribbon(aes(x = year, ymax = ub, ymin = lb), alpha = alpha,fill="salmon")
    } else {
        p <- p + geom_line(aes(x = year, y = SER, col = Model),size=1.2) +
            geom_ribbon(aes(x = year, ymax = ub, ymin = lb, fill = Model), alpha = alpha)
    }
    
    if (!legend)
        p <- p + theme(legend.position="none")

    if(!.OVERLAY) p <- p + facet_wrap(~Model) 
    return(p)
}