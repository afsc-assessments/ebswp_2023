#' Extract spawning stock biomass (ssb) from gmacs run
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M list object created by read_admb function
#' @return dataframe of spawning biomass
#' @export
#' 
.get_bts_df <- function(M,biomass=TRUE)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(year = A$yr_bts)
        df$Model <- names(M)[i]
        if (biomass)
        {
          df$obs  <- A$ob_bts
          df$pre  <- A$eb_bts
          df$lb   <- A$ob_bts-1.96*A$sd_ob_bts
          df$ub   <- A$ob_bts+1.96*A$sd_ob_bts
        }
        else{
          df$obs  <- A$ot_bts
          df$pre  <- A$et_bts
          df$lb   <- A$ot_bts-1.96*A$sd_ot_bts
          df$ub   <- A$ot_bts+1.96*A$sd_ot_bts
        }
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
plot_bts <- function(M, xlab = "Year", ylab = "Bottom trawl survey biomass", ylim = NULL, alpha = 0.1,biomass=TRUE)
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_bts_df(M,biomass=biomass)
    
    p <- ggplot(mdf) + labs(x = xlab, y = ylab)
    
    if (is.null(ylim))
    {
        p <- p + expand_limits(y = 0)
    } else {
        p <- p + ylim(ylim[1], ylim[2])        
    }
    
    if (length(M) == 1)
    {
        p <- p + geom_line(aes(x = year, y = pre)) +geom_point(aes(x=year, y=obs)) + 
            geom_ribbon(aes(x = year, ymax = ub, ymin = lb), alpha = alpha)
    } else {
        p <- p + geom_line(aes(x = year, y = pre, col = Model),size=1.2) + geom_point(aes(x=year, y=obs)) + 
            geom_errorbar(aes(x = year, ymax = ub, ymin = lb))
    }
    
    #if(!.OVERLAY) 
        p <- p + facet_wrap(~Model) + guides(colour=FALSE)
    print(p + .THEME)
}
