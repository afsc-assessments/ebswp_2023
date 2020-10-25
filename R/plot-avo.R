#' Get avo data into frame
#'
#' @param M list object created by read_admb function
#' @return dataframe of  avo
#' @export
#' 
.get_avo_df <- function(M)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(year = A$yrs_avo)
        df$Model <- names(M)[i]
        {
          df$obs  <- A$obs_avo
          df$pre  <- A$pred_avo
          #df$lb   <- A$obs_avo-1.96*A$obs_avo_std
          #df$ub   <- A$obs_avo+1.96*A$obs_avo_std
          df$lb   <- A$obs_avo/exp(2.*sqrt(log(1+(A$obs_avo_std)^2/(A$obs_avo)^2)))
          df$ub   <- A$obs_avo*exp(2.*sqrt(log(1+(A$obs_avo_std)^2/(A$obs_avo)^2)))
        }
        mdf     <- rbind(mdf, df)
    }
    return(mdf)
}


#' Plot avo data
#'
#' @param M List object(s) created by read_admb function
#' @param xlab the x-label of the figure
#' @param ylab the y-label of the figure
#' @param ylim is the upper limit of the figure
#' @return Plot of AVO estimates 
#' @export
#' 
plot_avo <- function(M, xlab = "Year", ylab = "Acoustic return (Sa from AVO) ", ylim = NULL)
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_avo_df(M)
    p <- ggplot(mdf) + labs(x = xlab, y = ylab)
    
    if (is.null(ylim))
    {
        p <- p + expand_limits(y = 0)
    } else {
        p <- p + ylim(ylim[1], ylim[2])        
    }
    
    if (length(M) == 1)
    {
      #p <- p + geom_line(avo,aes(x=yr,y=obs)) + geom_errorbar(width=.2,ymin=avo$obs-avo$obs*.25,ymax=avo$obs+avo$obs*.25) + 
             #geom_line(aes(x=avo$yr,y=avo$pred)) + .THEME + geom_point(size=4,col="red") + xlab("Year") + 
             #scale_x_continuous(breaks=seq(2006,2016,1)) + ylab("AVO index") + ylim(c(0,1.5))
        p <- p + geom_line(aes(x = year, y = pre)) +geom_point(aes(x=year, y=obs)) + 
            geom_errorbar(aes(x = year, ymax = ub, ymin = lb),width=0.5)
    } else {
        p <- p + geom_line(aes(x = year, y = pre, colour = Model),size=2) + geom_point(aes(x=year, y=obs),size=2) + 
            geom_errorbar(aes(x = year, ymax = ub, ymin = lb),width=0.5)
    }
    p <- p +scale_x_continuous(breaks=seq(2006,2020,1)) 
    #if(!.OVERLAY) 
    #p <- p + facet_wrap(~Model) + guides(colour=FALSE)
    return(p + .THEME)
}
