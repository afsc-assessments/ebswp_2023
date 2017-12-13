#' Extract Recruits (R) from pollock run
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M list object created by read_admb function
#' @return dataframe of spawning biomass
#' @export
#' 
.get_R_rel_df <- function(M,rel=TRUE)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(year = A$R[,1])
        df$Model <- names(M)[i]
        df$year <- A$R[,1]
        if (rel){
          df$R  <- A$R[,2] / M[[1]]$R[1:length(A$R[,2]),2]
          df$lb   <- A$R[,4] / M[[1]]$R[1:length(A$R[,2]),4]
          df$ub   <- A$R[,5] / M[[1]]$R[1:length(A$R[,2]),5]
        } else {
          df$R  <- A$R[,2] 
          df$lb   <- A$R[,4] 
          df$ub   <- A$R[,5] 

        }
        mdf     <- rbind(mdf, df)
    }
    return(mdf)
}


#' Plot predicted spawning stock biomass (R)
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
plot_R_rel <- function(M, xlab = "Year", ylab = "Relative age-1 recruits", ylim = NULL, xlim=NULL, alpha = 0.1,legend=TRUE,rel=TRUE)
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_R_rel_df(M,rel=rel)
    
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
        p <- p + geom_line(aes(x = year, y = R)) +
            geom_ribbon(aes(x = year, ymax = ub, ymin = lb), alpha = alpha,fill="salmon")
    } else {
        p <- p + geom_line(aes(x = year, y = R, col = Model),size=1.2) +
            geom_ribbon(aes(x = year, ymax = ub, ymin = lb, fill = Model), alpha = alpha)
    }
    if (!legend)
        p <- p + theme(legend.position="none") + guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE) 
    
    if(!.OVERLAY) p <- p + facet_wrap(~Model)
    return(p + .THEME)
}