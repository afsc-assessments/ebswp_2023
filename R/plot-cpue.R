#' Extract spawning stock biomass (ssb) from gmacs run
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M list object created by read_admb function
#' @return dataframe of spawning biomass
#' @export
#' 
.get_cpue_df <- function(M)
{
    A <- M
    df <- data.frame(year = A$yrs_cpue)
    df$obs  <- A$obs_cpue
    df$pre  <- A$pred_cpue
    df$lb   <- A$obs_cpue/exp(2.*sqrt(log(1+(A$obs_cpue_std)^2/(A$obs_cpue)^2)))
    df$ub   <- A$obs_cpue*exp(2.*sqrt(log(1+(A$obs_cpue_std)^2/(A$obs_cpue)^2)))
    return(df)
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
#' @return Plot of model estimates of spawning stock biomass 
#' @export
#' 
plot_cpue <- function(M, xlab = "Year", ylab = "Early trawl fishery CPUE", ylim = NULL, color="red")
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_cpue_df(M)
    
    p <- ggplot(mdf) + labs(x = xlab, y = ylab)
    
    if (is.null(ylim))
    {
        p <- p + expand_limits(y = 0)
    } else {
        p <- p + ylim(ylim[1], ylim[2])        
    }
    
   p <- p + geom_line(aes(x = year, y = pre)) +geom_point(aes(x=year, y=obs),size=3,color=color) + 
            geom_errorbar(aes(x = year, ymax = ub, ymin = lb),width=0.5)
    
    p <- p + guides(colour=FALSE)
    return(p + .THEME)
}
