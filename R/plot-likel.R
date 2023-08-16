#' Extract Likelihood Data Frame
#'
#' This function extracts likelihood values from a list of models and 
#' formats them into a structured data frame.
#'
#' @param M A list of models where each model contains likelihood components.
#'
#' @return A data frame containing the likelihood components, model name, 
#' natural mortality value (M), and negative log likelihood (NLL) for each model in the list.
#'
#' @examples
#' # Assuming 'model_list' is a list of models with the appropriate structure
#' # likelihood_df <- .get_like_df(model_list)
.get_like_df <- function(M) {
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(type = as.factor(1:21))
        df$Model <- names(M)[i]
        df$M     <- as.numeric(substr(names(M)[i],2,3))/100
        df$NLL   <- c(A$surv_like, A$cpue_like, A$avo_like, A$sel_like, A$sel_like_dev, A$age_like, A$rec_like)
        A <-M[[1]]
        print(A$surv_like)
        print( A$cpue_like)
        print( A$avo_like)
        print( A$sel_like)
        print( A$sel_like_dev)
        print( A$age_like)
        print( A$rec_like)
        mdf     <- rbind(mdf, df)
    }
    return(mdf)
}

#' Plot Likelihood Values
#'
#' This function plots the negative log likelihood values for different 
#' components against a specified predictor (e.g., natural mortality). 
#' The function uses `ggplot2` for visualization.
#'
#' @param M A list of models from which likelihood values will be extracted.
#' @param xlab Label for the x-axis. Default is "Natural Mortality".
#' @param ylab Label for the y-axis. Default is "relative -ln Likelihood".
#' @param ylim Limits for the y-axis. Default is NULL.
#' @param xlim Limits for the x-axis. Default is NULL.
#' @param alpha Alpha transparency level for the plotted lines. Default is 0.1.
#' @param legend Logical indicating whether to display a legend. Default is TRUE.
#'
#' @return A ggplot object displaying the negative log likelihood values.
#'
#' @export
#' @examples
#' # Assuming 'model_list' is a list of models with the appropriate structure
#' # plot_likes(model_list)
#'
#' @import ggplot2
plot_likes <- function(M, xlab = "Natural Mortality", ylab = "relative -ln Likelihood", ylim = NULL, xlim=NULL, alpha = 0.1,legend=TRUE) {
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_like_df(M)
    
    p <- ggplot(mdf) + labs(x = xlab, y = ylab)
    
    if (!is.null(xlim))
        p <- p + xlim(xlim[1], xlim[2])        

    if (is.null(ylim))
    {
        p <- p + expand_limits(y = 0)
    } else {
        p <- p + ylim(ylim[1], ylim[2])        
    }
    if (!legend)
        p <- p + theme(legend.position="none")
    
    p <- p + geom_line(aes(x = M, y = NLL, col=type)) 
    
    print(p + .THEME)
}
