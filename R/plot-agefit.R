#' Age Composition Data Plotter
#'t(t()
#' This function generates a series of plots visualizing the age composition data
#' from fisheries assessment. It compares observed and predicted data across different years.
#'
#' @param dat A data frame, default is `mod1`. The structure must contain age composition data, and the names used to create the temporary variables `tmp1`, `tmp2`, and `tmp3`.
#' @param main Title of the main plot. Default is an empty string.
#' @param case_label Label for the specific case or dataset being visualized. Default is "2011 assessment".
#' @param f An integer representing the fishery index. Default is 1.
#' @param rec_age An integer denoting the recruitment age. Default is 2.
#'
#' @details The function plots observed fishery age composition data using a bar plot,
#' overlaying predicted data with points. It organizes the plots in a multi-panel figure,
#' with each panel representing a year. Age classes are represented on the x-axis.
#'
#' @note The function uses the `rainbow` color palette, and the colors loop around for
#' each cohort. The function expects certain naming conventions in the input dataset `dat`.
#'
#' @return A multi-panel plot where each panel visualizes age composition data for a
#' specific year.
#'
#' @examples
#' # Example usage (ensure you have an appropriate dataset 'mod1'):
#' # AgeFits(dat=mod1, main="Fishery Age Composition", case_label="Sample Assessment")
#'
#' @export
plot_agefit <- function( x, case_label="2021 assessment",gear="bts",type="survey",styr=NULL,ageplus=NULL) {
   #x=modlst[[thismod]];case_label=af_title;gear="ats";type="survey";styr=1982;ageplus=10

  subtle.color <- "gray40"
  if (gear=="bts"){
    fage <- 1
    ages <- c(fage,length(x$pobs_bts[1,-1]) ) #age range
    ncols<- length(x$pobs_bts[1,])
    obs.data  <- data.frame(rbind(x$pobs_bts,(matrix(c(2020,rep(0,ncols-1) ), ncol=ncols)) )) |> dplyr::arrange(V1)
    pred.data <- data.frame(rbind(x$phat_bts,(matrix(c(2020,rep(0,ncols-1) ), ncol=ncols)) )) |> dplyr::arrange(V1)
    years     <- obs.data[,1]
    obs.data  <- as.matrix(obs.data[,-1])
    pred.data <- as.matrix(pred.data[,-1])
    #obs.data  <- x$pobs_bts[,-1]
    #pred.data <- x$phat_bts[,-1]
  }
  if (gear=="fsh"){
    fage <- 1
    ages <- c(fage,length(x$pobs_fsh[1,-1]) ) #age range
    obs.data  <- x$pobs_fsh[,-1]
    pred.data <- x$phat_fsh[,-1]
    years     <- x$pobs_fsh[,1]
  }
  if (gear=="ats"){
    fage <- 2
    ages <- c(fage,length(x$pobs_ats[1,-1]) ) #age range
    years     <- x$pobs_ats[,1]
    # No age data from drone
    yr_inc <- years!= 2020
    obs.data  <- x$pobs_ats[yr_inc,c(-1,-2)]
    pred.data <- x$phat_ats[yr_inc,c(-1,-2)]
    years     <- x$pobs_ats[yr_inc,1]
    #obs.data
  }
  if (!is.null(styr)){
    ss <-years>=styr
    years <- years[ss]
    obs.data  <- obs.data[ss,]
    pred.data <- pred.data[ss,]
  }
  nyears <- length(years)
  if (!is.null(ageplus)){
    obs.data[,ageplus]  <- rowSums(obs.data[,ageplus:ages[2]])
    pred.data[,ageplus]  <- rowSums(pred.data[,ageplus:ages[2]])
  pred.data <- pred.data[,1:ageplus]
    obs.data  <- obs.data[,1:ageplus]
    ages[2]   <- ageplus
  }
  ages.list <- ages[1]:ages[2]
  nages <- length(ages.list)

  mfcol <- c(ceiling(nyears/3),3)
  par(mfcol=mfcol,oma=c(3.5,4.5,3.5,1),mar=c(0,0,0,0))
  cohort.color <- rainbow(mfcol[1]+2)[-c(1:2)]   #use hideous rainbow colors because they loop more gracefully than rich.colors
  ncolors <- length(cohort.color)

  #axis(2,las=1,at=c(0,0.5),col=subtle.color,col.axis=subtle.color,lwd=0.5)
  #With
  #axis(2,las=1,at=c(0,0.25,0.5),col=subtle.color,col.axis=subtle.color,lwd=0.5)
  ylim <- c(0,1.05*max(obs.data,pred.data))
  for (yr in 1:nyears) {
    names.arg <- rep("",nages)
    x <- barplot(obs.data[yr,],space=0.2,ylim=ylim,las=1,names.arg=names.arg,
                 cex.names=0.5, xaxs="i",yaxs="i",border=subtle.color,
                 col=cohort.color[1:nages],axes=F,ylab="",xlab="")
    cohort.color <- c(cohort.color[ncolors],cohort.color[-1*ncolors])  #loop around colors
    if (yr %% mfcol[1] == 0) {
      axis(side=1,at=x,lab=ages.list, line=-0.1,col.axis=subtle.color,
           col=subtle.color,lwd=0,lwd.ticks=0)  #just use for the labels, to allow more control than names.arg
    }
    if (yr <= mfcol[1]) {
      axis(2,las=1,at=c(0,0.2,0.4),col=subtle.color,col.axis=subtle.color,lwd=0.5)
    }
    par(new=T)
    par(xpd=NA)
    plot(x=x,y=pred.data[yr,],ylim=ylim, xlim=par("usr")[1:2],
      las=1,xaxs="i",yaxs="i",bg="white",col="brown",typ="b",lty=1,
      pch=19,cex=0.8,axes=F,ylab="",xlab="")
    box(col=subtle.color,lwd=0.5)
    x.pos <- par("usr")[1] + 0.85*diff(par("usr")[1:2])   #par("usr") spits out the current coordinates of the plot window
    y.pos <- par("usr")[3] + 0.75*diff(par("usr")[3:4])   #par("usr") spits out the current coordinates of the plot window
    text(x=x.pos,y=y.pos,years[yr],cex=1.2, col=subtle.color)
    par(xpd=T)
  }
  mtext(side=1,outer=T,"Age",line=2)
  mtext(side=2,outer=T,"Proportion",line=3.2)
  mtext(side=3,outer=T,line=1.2,paste0("EBS pollock ",type," age composition data"))
  mtext(side=3,outer=T,line=0.2,paste("(",case_label,")",sep=""),cex=0.6)
}
