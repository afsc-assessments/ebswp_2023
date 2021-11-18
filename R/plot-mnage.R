#' Extract spawning stock biomass (ssb) from gmacs run
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M list object created by read_admb function
#' @return dataframe of spawning biomass
#' @export
#' 
.get_mnage_df <- function(M)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(year = A$EffN_fsh[,1])
        df$Model <- names(M)[i]
        df$type <- "Fishery"
        df$year <- A$EffN_fsh[,1]
        df$obs  <- A$EffN_fsh[,4]
        df$pre  <- A$EffN_fsh[,5]
        df$lb   <- A$EffN_fsh[,7]
        df$ub   <- A$EffN_fsh[,8]
        mdf     <- rbind(mdf, df)

        df <- data.frame(year = A$EffN_bts[,1])
        df$Model <- names(M)[i]
        df$type <- "Bottom trawl survey"
        df$year <- A$EffN_bts[,1]
        df$obs  <- A$EffN_bts[,4]
        df$pre  <- A$EffN_bts[,5]
        df$lb   <- A$EffN_bts[,7]
        df$ub   <- A$EffN_bts[,8]
        mdf     <- rbind(mdf, df)

        # NOTE excluded the last year as downweighted (non-existent for sail drone data)
        df <- data.frame(year = A$EffN_ats[1:16,1])
        df$Model <- names(M)[i]
        df$type <- "Acoustic trawl survey"
        df$year <- A$EffN_ats[1:16,1]
        df$obs  <- A$EffN_ats[1:16,4]
        df$pre  <- A$EffN_ats[1:16,5]
        df$lb   <- A$EffN_ats[1:16,7]
        df$ub   <- A$EffN_ats[1:16,8]
        mdf     <- rbind(mdf, df)
    }
    return(mdf)
}


#' Plot predicted mean age by gear type
#'
#'
#' @param M List object(s) created by read_admb function
#' @param xlab the x-label of the figure
#' @param ylab the y-label of the figure
#' @param xlim is the year range to plot of the figure
#' @param ylim is the upper limit of the figure
#' @return Plot of model estimates of mean age against observed (and implied confidence bounds) 
#' @export
#' 
plot_mnage <- function(M, xlab = "Year", ylab = "Mean age", xlim=NULL, ylim = NULL )
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_mnage_df(M)
    
    p <- ggplot(mdf) + labs(x = xlab, y = ylab)
    
    if (is.null(ylim))
    {
        p <- p + expand_limits(y = 0)
    } else {
        p <- p + ylim(ylim[1], ylim[2])        
    }
    if (!is.null(xlim))
        p <- p + xlim(xlim[1], xlim[2])        
    
    
    if (length(M) == 1)
    {
        p <- p + geom_line(aes(x = year, y = pre)) +geom_point(aes(x=year, y=obs)) + 
            geom_errorbar(aes(x = year, ymax = ub, ymin = lb),size=.5)
    } else {
        p <- p + geom_line(aes(x = year, y = pre, col = Model),size=1.2) + geom_point(aes(x=year, y=obs)) + 
            geom_errorbar(aes(x = year, ymax = ub, ymin = lb),size=.5)
    }
    p <- p + facet_grid(type ~ .) #+ guides(colour=FALSE)
    return(p + .THEME)
}
