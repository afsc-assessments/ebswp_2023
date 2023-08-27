#' Get avo data into frame
#'
#' This function iterates through a list of models and extracts year and associated measurements.
#'
#' @param M A list of models where each model has the needed attributes.
#' @param biomass Logical indicating if biomass data should be used. If FALSE, other measurements are used.
#'
#' @return A data frame with columns for year, model, observed values, predicted values, lower bounds, and upper bounds.
.get_avo_df <- function(M) {
  n <- length(M)
  mdf <- NULL

  for (i in 1:n) {
    A <- M[[i]]
    df <- data.frame(year = A$yrs_avo)
    df$Model <- names(M)[i]
    {
      df$obs  <- A$obs_avo
      df$pre  <- A$pred_avo
      df$lb   <- A$obs_avo/exp(2.*sqrt(log(1+(A$obs_avo_std)^2/(A$obs_avo)^2)))
      df$ub   <- A$obs_avo*exp(2.*sqrt(log(1+(A$obs_avo_std)^2/(A$obs_avo)^2)))
    }

    mdf     <- rbind(mdf, df)
  }

  return(mdf)
}

#' Plot avo data
#'
#' This function takes a list of models and plots the observed, predicted and confidence intervals for the bottom trawl survey data.
#'
#' @param M A list of models where each model has the needed attributes.
#' @param xlab Label for the x-axis.
#' @param ylab Label for the y-axis.
#' @param xlim Limits for the x-axis.
#' @param ylim Limits for the y-axis.
#' @param color Color for the points.
#' @param biomass Logical indicating if biomass data should be used. If FALSE, other measurements are used.
#'
#' @export
#'
#' @return A ggplot object with the plotted data.
plot_avo <- function(M, xlab = "Year", ylab = "Acoustic return (Sa from AVO) ", ylim = NULL)
{
  xlab <- paste0("\n", xlab)
  ylab <- paste0(ylab, "\n")
  
  mdf <- .get_avo_df(M)
  p <- ggplot(mdf) + labs(x = xlab, y = ylab)
  if (is.null(ylim)) {
    p <- p + expand_limits(y = 0)
  } else {
    p <- p + ylim(ylim[1], ylim[2])        
  }

  if (length(M) == 1) {
    p <- p + geom_line(aes(x = year, y = pre)) +
						geom_point(aes(x=year, y=obs)) + 
      geom_errorbar(aes(x = year, ymax = ub, ymin = lb),width=0.5)
    } else {
    dw <- 0.5
    p <- p + geom_line(aes(x = year, y = pre, colour = Model), width=1) + geom_point(aes(x=year, y=obs),size=2) + 
      geom_point(aes(x = year, y = obs, col = Model, fill = Model), position = position_dodge(width = dw)) +
      geom_pointrange(aes(year, obs, ymax = ub, ymin = lb, color = Model, fill = Model), shape = 1, linetype = "solid", position = position_dodge(width = dw))
            #geom_errorbar(aes(x = year, ymax = ub, ymin = lb),width=0.5)
    }
    p <- p +scale_x_continuous(limits=c(2005,2022),breaks=seq(2006,2023,2)) 
    return(p + .THEME)
}
