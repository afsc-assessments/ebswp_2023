#' Get recruitment data
#' 
#' Extracts predicted recruitment and approximate asymptotic error-bars
#'
#' @param M list object(s) created by read_admb function
#' @return dataframe of recruitment
#' @author SJD Martell, DN Webber
#' @export
#' 
.get_recruitment_df <- function(M)
{
  #M=scset
  #i=1
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A  <- M[[i]]
        df <- data.frame(Model   = names(M)[i], rec = A$R[,2])
        df$year <- A$R[,1]
        df$lb <- A$R[,4]
        df$ub <- A$R[,5]
        df
        mdf <- rbind(mdf, df)
    }
    return(mdf)
}


#' Plot predicted recruitment and approximate asymptotic error-bars
#'
#' @param M list object created by read_admb function
#' @param xlab the x-axis label for the plot
#' @param ylab the y-axis label for the plot
#' @return Plot of predicted recruitment
#' @author SJD Martell, DN Webber
#' @export
#' 
plot_recruitment <- function(M, xlab = "Year", ylab = "Recruitment (millions of individuals)",xlim=c(1990,2016))
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    mdf <- .get_recruitment_df(M)
    if (length(M) == 1)
    {
        p <- ggplot(mdf, aes(x = year, y = rec)) +
            geom_bar(stat = "identity", alpha = 0.4, position = "dodge", col="grey60", fill="salmon") + xlim(xlim) +
            geom_pointrange(aes(ymax = ub, ymin = lb) ) #, position = position_dodge(width = 1.9))
    } else {
        p <- ggplot(mdf, aes(x = year, y = rec, col = Model, group = Model)) +
            #geom_hline(aes(yintercept = mean(rec), col = Model)) +
            geom_bar(stat = "identity", alpha = 0.4, aes(fill = Model), position = "dodge") + xlim(xlim) +
            geom_pointrange(aes(year, rec, col = Model, ymax = ub, ymin = lb), position = position_dodge(width = 0.9))
    }
    p <- p + labs(x = xlab, y = ylab) + .THEME
    if (!.OVERLAY) p <- p + facet_wrap(~Model)
    return(p)
}

