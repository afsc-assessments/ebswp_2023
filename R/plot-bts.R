#' Extract bottom trawl survey data from a list of models
#'
#' This function iterates through a list of models and extracts year and associated measurements.
#'
#' @param M A list of models where each model has the needed attributes.
#' @param biomass Logical indicating if biomass data should be used. If FALSE, other measurements are used.
#'
#' @return A data frame with columns for year, model, observed values, predicted values, lower bounds, and upper bounds.
.get_bts_df <- function(M, biomass = TRUE) {
  n <- length(M)
  mdf <- NULL

  for (i in 1:n) {
    A <- M[[i]]
    df <- data.frame(year = A$yr_bts)
    df$Model <- names(M)[i]

    if (biomass) {
      df$obs <- A$ob_bts
      df$pre <- A$eb_bts
      df$lb <- A$ob_bts / exp(2 * sqrt(log(1 + (A$sd_ob_bts)^2 / (A$ob_bts)^2)))
      df$ub <- A$ob_bts * exp(2 * sqrt(log(1 + (A$sd_ob_bts)^2 / (A$ob_bts)^2)))
    } else {
      df$obs <- A$ot_bts
      df$pre <- A$et_bts
      df$lb <- A$ot_bts / exp(2 * sqrt(log(1 + (A$sd_ot_bts)^2 / (A$ot_bts)^2)))
      df$ub <- A$ot_bts * exp(2 * sqrt(log(1 + (A$sd_ot_bts)^2 / (A$ot_bts)^2)))
    }

    mdf <- rbind(mdf, df)
  }

  return(mdf)
}

#' Plot bottom trawl survey data
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
plot_bts <- function(M,
                     xlab = "Year",
                     ylab = "Bottom trawl survey biomass",
                     xlim = NULL,
                     ylim = NULL,
                     color = "purple",
                     biomass = TRUE) {

  mdf <- .get_bts_df(M, biomass = biomass)

  p <- ggplot(mdf) + labs(x = paste0("\n", xlab), y = paste0(ylab, "\n"))

  if (!is.null(xlim)) p <- p + xlim(xlim[1], xlim[2])
  if (is.null(ylim)) {
    p <- p + expand_limits(y = 0)
  } else {
    p <- p + ylim(ylim[1], ylim[2])
  }

  if (length(M) == 1) {
    p <- p + geom_line(aes(x = year, y = pre)) +
      geom_point(aes(x = year, y = obs), size = 2, color = color) +
      geom_errorbar(aes(x = year, ymax = ub, ymin = lb), width = 0.5)
  } else {
    dw <- 0.5
    p <- p + geom_line(aes(x = year, y = pre, col = Model), width = 1, position = position_dodge(width = dw)) +
      geom_point(aes(x = year, y = obs, col = Model, fill = Model), position = position_dodge(width = dw)) +
      geom_pointrange(aes(year, obs, ymax = ub, ymin = lb, color = Model, fill = Model), shape = 1, linetype = "solid", position = position_dodge(width = dw))
  }

  if (!.OVERLAY) p <- p + guides(colour = FALSE)
  return(p + .THEME)
}
