
#' Extract Numbers at age 3 
#'
#' @param M list object created by read_admb function
#' @return dataframe of age3+ biomass
#' 
.get_Nage_3_df <- function(M)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(year = A$Nage_3[,1])
        df$Model   <- names(M)[i]
        df$year    <- A$Nage_3[,1]
        df$Nage_3  <- A$Nage_3[,2]
        df$lb      <- A$Nage_3[,4]
        df$ub      <- A$Nage_3[,5]
        mdf        <- rbind(mdf, df)
    }
    return(mdf)
}

#' Plot predicted Numbers at age 3 
#'
#'
#' @param M List object(s) created by read_admb function
#' @param xlab the x-label of the figure
#' @param ylab the y-label of the figure
#' @param ylim is the upper limit of the figure
#' @param alpha the opacity of the ribbon
#' @return Plot of model estimates of age3+ stock biomass 
#' @export
plot_Nage_3 <- function(M, xlab = "Year", ylab = "Numbers at age 3", 
    ylim = NULL, xlim=c(1990,2020),breaks=seq(1990,2022,2), alpha = 0.8,legend=TRUE,
    order=NULL) {
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_Nage_3_df(M)
    
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
        p <- ggplot(mdf, aes(x = year, y = Nage_3)) +
            geom_bar(stat = "identity", alpha = 0.4, position = "dodge", col="grey60", fill=fill) + 
            scale_x_continuous(limits=xlim, breaks = seq(round(xlim[1],0),round(xlim[2],0), by = 5) ) +
            geom_pointrange(aes(ymax = ub, ymin = lb),size=.3 ) #, position = position_dodge(width = 1.9))
    } else {
        p <- ggplot(mdf, aes(x = year, y = Nage_3, col = Model, group = Model)) +
            scale_x_continuous(limits=xlim, breaks = seq(round(xlim[1],0),round(xlim[2],0), by = 2) ) +
            geom_bar(stat = "identity", alpha = alpha, aes(fill = Model), limits=xlim, position = "dodge") + 
            geom_pointrange(aes(year, Nage_3, ymax = ub, ymin = lb),col = "grey",  size=.6,position = position_dodge(width = 0.9))
    }
    p <- p + labs(x = xlab, y = ylab) + .THEME
    if (!.OVERLAY) p <- p + facet_wrap(~Model)
    return(p)
}
