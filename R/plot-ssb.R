#' Extract spawning stock biomass (ssb) 
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M list object created by read_admb function
#' @return dataframe of spawning biomass
#' 
.get_ssb_df <- function(M)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(year = A$SSB[,1])
        df$Model <- names(M)[i]
        df$year <- A$SSB[,1]
        df$ssb  <- A$SSB[,2]
        df$lb   <- A$SSB[,4]
        df$ub   <- A$SSB[,5]
        mdf     <- rbind(mdf, df)
    }
    return(mdf)
}

#' Plot predicted spawning stock biomass (ssb)
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
plot_ssb <- function(M, xlab = "Year", ylab = "Female spawning biomass (kt)", 
    ylim = NULL, xlim=NULL,breaks=seq(1990,2022,2), alpha = 0.1,legend=TRUE,
    order=NULL) {
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_ssb_df(M)
    
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
        p <- p + geom_line(aes(x = year, y = ssb)) +
            geom_ribbon(aes(x = year, ymax = ub, ymin = lb), alpha = alpha,fill="salmon")
    } else {
        p <- p + geom_line(aes(x = year, y = ssb, col = Model), size=1.2 ) +
            geom_ribbon(aes(x = year, ymax = ub, ymin = lb, fill = Model), alpha = alpha) 
            scale_x_continuous(limits=xlim, breaks = seq(round(xlim[1],0),round(xlim[2],0), by = 5) ) 
    }
    
    if (!legend)
        p <- p + theme(legend.position="none")
    #if (!is.null(order))
        p <- p + guides(fill=guide_legend(reverse=TRUE),color=guide_legend(reverse=TRUE))

    if(!.OVERLAY) p <- p + facet_wrap(~Model) 
    return(p)
}
