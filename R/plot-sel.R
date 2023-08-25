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
#M<-modtune[[1]]
#fage=2;lage=10;Year=M$Yr;sel=M$sel_ats; styr=1994; alpha=0.2;scale=3.8;fill="purple"
plot_sel <- function(Year=M$Yr,sel=M$sel_fsh, styr=1977, fage=NULL, lage=NULL, alpha=0.2,scale=3.8,fill="purple")
{
  df        <- data.frame(Year=Year,sel=sel );
  if (is.null(fage)) fage      <- 1
  if (is.null(lage)) lage      <- length(sel[1,])
  df <- df |> select(1:(lage-fage+2))
  names(df) <- c("Year",fage:lage)
  nages     <- length(fage:lage)
  names(df)
  sdf       <-  pivot_longer(df,names_to="age",values_to="sel",cols=2:(nages+1)) %>% filter(Year>=styr) %>% mutate(age=as.numeric(age)) #+ arrange(age,yr)
  p1  <- ggplot(sdf,aes(x=age,y=as.factor(Year),height = sel)) + geom_density_ridges(stat = "identity",scale = scale, alpha = alpha,
  	     fill=fill,color="black") + ggthemes::theme_few() +
         ylab("Year") + xlab("Age (years)") +
         scale_x_continuous(limits=c(fage,lage),breaks=fage:lage) +
         scale_y_discrete(limits=rev(levels(as.factor(sdf$Year))))
  return(p1)
}
