source("R/prelims.R")
#Use all data from 2019 assessment
m1 <- (as.data.frame(read.csv("doc/data/abts.csv",header=T)))
names(m1) <- c("Sim",2007:2018) 
limitRange <-function(data,mapping,...){
	ggplot(data=data,mapping=mapping,...) +
	geom_point(alpha=0.3,size=0.1,...) +
	geom_smooth(method="lm" ,se=FALSE) +
	scale_y_continuous(limits=c(0,1.),breaks=c(0,.5,1)) +
	scale_x_continuous(limits=c(0,1.),breaks=c(0,.5,1)) 
}
 m1 %>% select("2007","2008","2009","2010","2012","2014","2016","2018") %>% 
       ggpairs(aes(fill="red",alpha=.2),lower = list( continuous = 
       	wrap("points", alpha = 0.3,size=0.1)) ) +
         theme_few() #.THEME

       ggpairs(aes(fill="red",alpha=.2),lower = list( continuous = limitRange )) +
  p1
  ggsave("figs/mcmc_pairs.pdf",plot=p1,width=7,height=7,units="in")
  #head(mc)
a1w <-  a1 %>% pivot_wider(names_from = Source, values_from = Estimate)
ggplot(a1w, aes(x=Survey,y=Model,label=substr(Year-1,3,4))) + geom_text() + theme_few() + xlim(c(0,4)) + ylim(c(0,4)) + geom_smooth(method=lm) + geom_abline(intercept=0,slope=1,lty=2)

#Use data from 2019 assessment from 2001-2019 only
a1_r <- (as.data.frame(read.table("doc/data/age1_rec.dat",header=T)))
a1w_r <-  a1_r %>% pivot_wider(names_from = Source, values_from = Estimate)
a1w_r %>% filter(Year>2000) %>% ggplot(aes(x=Survey,y=Model,label=substr(Year-1,3,4))) + geom_text() + theme_few() + xlim(c(0,3)) + ylim(c(0,3)) + geom_smooth(method=lm)+ geom_abline(intercept=0,slope=1,lty=2)