

#' Plot selectivity
#'
#' @param M List object(s) created by read_admb function
#' @param xlab the x-label of the figure
#' @param ylab the y-label of the figure
#' @param ylim is the upper limit of the figure
#' @param alpha the opacity of the ribbon
#' @return Plot of model estimates of spawning stock biomass 
#' @export
#' 
plot_sel <- function(Year=M$Yr,sel=M$sel_fsh, styr=1977, alpha=0.2,scale=3.8,fill="purple")
{
  df        <- data.frame(Year=Year,sel=sel ); 
  lage      <- length(sel[1,])
  names(df) <- c("Year",1:lage)
  sdf       <- gather(df,age,sel,2:(lage+1),-Year) %>% filter(Year>=styr) %>% mutate(age=as.numeric(age)) #+ arrange(age,yr)
  p1  <- ggplot(sdf,aes(x=age,y=as.factor(Year),height = sel)) + geom_density_ridges(stat = "identity",scale = scale, alpha = alpha,
  	     fill=fill,color="black") + .THEME +
            xlim(c(1,lage))+ ylab("Year") + xlab("Age (years)") + scale_y_discrete(limits=rev(levels(as.factor(sdf$Year))))
  return(p1)
}