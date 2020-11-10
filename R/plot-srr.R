#' Extract spawning stock biomass (ssb) from gmacs run
#'
#' Spawning biomass may be defined as all males or some combination of males and
#' females
#'
#' @param M list object created by read_admb function
#' @return dataframe of spawning biomass
#' @export
#' 
.get_srr_df <- function(M)
{
    n <- length(M)
    mdf <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        df <- data.frame(ssb = A$SRR_SSB)
        df$Model <- names(M)[i]
        #df$ssb  <- A$SRR_SSB
        df$rhat <- A$rechat
        df$rhat.sd <- A$rechat.sd
        df$lb   <- df$rhat/exp(2*sqrt(log(1+df$rhat.sd^2/df$rhat^2)))
        df$ub   <- df$rhat*exp(2*sqrt(log(1+df$rhat.sd^2/df$rhat^2)))
        mdf     <- rbind(mdf, df)
    }
    return(mdf)
}
.get_sr_est_df <- function(M)
{
    # Return SSB and Recruits 
    n <- length(M)
    mdf2 <- NULL
    for (i in 1:n)
    {
        A <- M[[i]]
        ts_len   <- 2:(length(A$SSB[,2]))

        df <- data.frame(ssb = A$SSB[ts_len-1,2])
        df$Year  <- A$SSB[ts_len-1,1]
        df$rhat <- A$R[ts_len,2]
        df$lb   <- A$R[ts_len,4]
        df$ub   <- A$R[ts_len,5]
        df$Model <- names(M)[i]
        mdf2    <- rbind(mdf2, df)
    }
    return(mdf2)
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
plot_srr <- function(M, ylab = "Recruits (age 1, millions)", xlab = "Female spawning biomass (kt)", 
                     ylim = NULL, xlim=NULL, alpha = 0.05,ebar="FALSE",leglabs=NULL,coverlap=FALSE, sizein=3,sizeout=2,yrsin=1977:2019)
{
    xlab <- paste0("\n", xlab)
    ylab <- paste0(ylab, "\n")
    
    mdf <- .get_srr_df(M)
    
    p <- ggplot(mdf) + labs(x = xlab, y = ylab)
    
    if (!is.null(xlim))
        p <- p + xlim(xlim)        

    if (is.null(ylim))
    {
        p <- p + expand_limits(y = 0)
    } else {
        p <- p + ylim(ylim[1], ylim[2])        
    }
    
    if (length(M) == 1)
    {
        p <- p + geom_line(aes(x = ssb, y = rhat)) +
            geom_ribbon(aes(x = ssb, ymax = ub, ymin = lb), fill="coral",alpha = alpha) +
            geom_ribbon(aes(x = ssb, ymax = rhat+.5*(ub-rhat), ymin = rhat-.5*(rhat-lb) ), fill="coral",alpha = 1.5*alpha)
    } else {
        p <- p + geom_line(aes(x = ssb, y = rhat, col = Model),size=1.2) +
            geom_ribbon(aes(x = ssb, ymax = ub, ymin = lb, fill = Model), alpha = alpha)
    }
    #if (!is.null(xlim)) #p <- scale_x_continuous(expand=c(0,0)) + p <- coord_cartesian(xlim=xlim) 
    #if (!is.null(ylim)) p <-  coord_cartesian(ylim=ylim) #p <- scale_y_continuous(expand=c(0,0), limits=c(-50,ylim[2]*1.1)) + coord_cartesian(ylim=ylim) 

    mdf2<- .get_sr_est_df(M) 
		mdf3<- mdf2 %>% filter(!(Year %in% yrsin))
		mdf2<- mdf2 %>% filter(Year %in% yrsin)
		
    if (length(M) == 1)
    {
        p <- p + geom_text(data=mdf2, aes(x = ssb, y = rhat, label=Year),size=sizein,check_overlap=coverlap) 
        p <- p + geom_text(data=mdf3, aes(x = ssb, y = rhat, label=Year),size=sizeout,check_overlap=coverlap) 
        if (ebar) p <- p + geom_errorbar(data=mdf2, aes(x = ssb, ymax = ub, ymin = lb))
    } else {
        p <- p + geom_text(data=mdf2, aes(x = ssb, y = rhat, label=Year, col = Model), size=sizein, check_overlap=coverlap) 
        p <- p + geom_text(data=mdf3, aes(x = ssb, y = rhat, label=Year, col = Model), size=sizeout,check_overlap=coverlap) 
        if (ebar) p <- p +  geom_errorbar(data=mdf2, aes(x = ssb, ymax = ub, ymin = lb ,colour=Model))
    }
    
    if (!is.null(leglabs)) p = p + scale_color_discrete(labels=leglabs)

    if(!.OVERLAY) p <- p + facet_wrap(~Model)
    return(p + .THEME + guides(fill=FALSE))
}
