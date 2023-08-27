#' Extract Acoustic Trawl Survey Data
#'
#' Extracts data for either biomass or some other metric based on the given  models in the list `M`.
#' The function formats the data into a consistent structure for further processing.
#'
#' @param M A list of  model outputs. Each item should contain at least
#'        the elements `yr_ats`, `ob_ats`, `eb_ats`, `sd_ob_ats`, `ot_ats`, `et_ats`, and `sd_ot_ats`.
#' @param biomass A logical flag. If `TRUE`, data extracted is for biomass;
#'        if `FALSE`, data for another metric is extracted. Default is `TRUE`.
#'
#' @return A dataframe with columns: year, Model, obs, pre, lb, and ub.
#'
.get_ats_df <- function(M, biomass=TRUE) {
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


#' Plot Acoustic Trawl Survey Biomass Data
#'
#' This function visualizes the acoustic trawl survey data, either biomass or
#' another metric, depending on the choice. It provides options for customization
#' of the resulting plot.
#'
#' @param M List of  model outputs. A list object like the one accepted
#'        by `.get_ats_df`.
#' @param xlab Label for the x-axis. Default is "Year".
#' @param ylab Label for the y-axis. Default is "Acoustic trawl survey biomass".
#' @param xlim Optional range for the x-axis.
#' @param ylim Optional range for the y-axis.
#' @param alpha Opacity for the ribbon, if used. Default is 0.1.
#' @param biomass Logical flag. If `TRUE`, plots data related to biomass;
#'        if `FALSE`, plots data related to another metric. Default is `TRUE`.
#' @param color Color for the data points. Default is "red".
#'
#' @export
#'
#' @return A ggplot2 plot object visualizing the acoustic trawl survey data.
#'
#' @importFrom ggplot2 ggplot labs geom_line geom_point expand_limits geom_errorbar
#'            geom_pointrange guides
#'
plot_ats <- function(M, xlab = "Year", ylab = "Acoustic trawl survey biomass",
                     xlim = NULL, ylim = NULL, alpha = 0.1, biomass = TRUE, color = "red") {
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")

    mdf <- .get_ats_df(M,biomass=biomass)

    p <- ggplot(mdf) + labs(x = xlab, y = ylab)

    if (!is.null(xlim))
        p <- p + xlim(xlim[1], xlim[2])
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
        p <- p + geom_line(aes(x = year, y = pre, col = Model), width=1, position=position_dodge(width=dw)) + geom_point(aes(x=year, y=obs,col=Model,fill=Model),position = position_dodge(width=dw)) +
           geom_pointrange(aes(year, obs, ymax = ub, ymin = lb, color = Model,fill=Model), shape = 1, linetype = "solid", position = position_dodge(width = dw))
            #geom_errorbar(aes(x = year, ymax = ub, ymin = lb),width=0.5,position=position_dodge(width=0.9))
    }

    if(!.OVERLAY)
      p <- p + guides(colour=FALSE)
    return(p )
}
