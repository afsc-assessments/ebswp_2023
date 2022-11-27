#' Extract spawning stock biomass (ssb) from gmacs run
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M list object created by read_admb function
#' @return dataframe of spawning biomass
#' @export
#' 
.get_ats_df <- function(M,biomass=TRUE)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(year = A$yr_ats)
        df$Model <- names(M)[i]
        if (biomass)
        {
          df$obs  <- A$ob_ats
          df$pre  <- A$eb_ats
          df$lb   <- A$ob_ats/exp(2.*sqrt(log(1+(A$sd_ob_ats)^2/(A$ob_ats)^2)))
          df$ub   <- A$ob_ats*exp(2.*sqrt(log(1+(A$sd_ob_ats)^2/(A$ob_ats)^2)))
          #df$lb   <- A$ob_ats-1.96*A$sd_ob_ats
          #df$ub   <- A$ob_ats+1.96*A$sd_ob_ats
        }
        else{
          df$obs  <- A$ot_ats
          df$pre  <- A$et_ats
          df$lb   <- A$ot_ats/exp(2.*sqrt(log(1+(A$sd_ot_ats)^2/(A$ot_ats)^2)))
          df$ub   <- A$ot_ats*exp(2.*sqrt(log(1+(A$sd_ot_ats)^2/(A$ot_ats)^2)))
          #df$lb   <- A$ot_ats-1.96*A$sd_ot_ats
          #df$ub   <- A$ot_ats+1.96*A$sd_ot_ats
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
plot_ats <- function(M, xlab = "Year", ylab = "Acoustic trawl survey biomass", ylim = NULL, alpha = 0.1,biomass=TRUE,color="red")
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_ats_df(M,biomass=biomass)

    p <- ggplot(mdf) + labs(x = xlab, y = ylab)
    
    #if (!is.null(xlim))
    #    p <- p + xlim(xlim[1], xlim[2])        
    if (is.null(ylim))
    {
        p <- p + expand_limits(y = 0)
    } else {
        p <- p + ylim(ylim[1], ylim[2])        
    }
    if (length(M) == 1)
    {
        p <- p + geom_line(aes(x = year, y = pre)) +geom_point(aes(x=year, y=obs),size=2,color=color) + 
            geom_errorbar(aes(x = year, ymax = ub, ymin = lb),width=.5)
    } else {
        dw <- 0.5 
        p <- p + geom_line(aes(x = year, y = pre, col = Model),size=0.8,position=position_dodge(width=dw)) + geom_point(aes(x=year, y=obs,col=Model,fill=Model),position = position_dodge(width=dw)) + 
           geom_pointrange(aes(year, obs, ymax = ub, ymin = lb, color = Model,fill=Model), shape = 1, linetype = "solid", position = position_dodge(width = dw))
            #geom_errorbar(aes(x = year, ymax = ub, ymin = lb),width=0.5,position=position_dodge(width=0.9))
    }
    
    if(!.OVERLAY) 
      p <- p + guides(colour=FALSE)
    return(p + .THEME)
}

