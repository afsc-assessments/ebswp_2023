source("R/prelims.R")
#Use all data from 2019 assessment
a1 <- (as.data.frame(read.table("doc/data/age1.dat",header=T)))
a1w <-  a1 %>% pivot_wider(names_from = Source, values_from = Estimate)
ggplot(a1w, aes(x=Survey,y=Model,label=substr(Year-1,3,4))) + geom_text() + theme_few() + xlim(c(0,4)) + ylim(c(0,4)) + geom_smooth(method=lm) + geom_abline(intercept=0,slope=1,lty=2)

#Use data from 2019 assessment from 2001-2019 only
a1_r <- (as.data.frame(read.table("doc/data/age1_rec.dat",header=T)))
a1w_r <-  a1_r %>% pivot_wider(names_from = Source, values_from = Estimate)
a1w_r %>% filter(Year>2000) %>% ggplot(aes(x=Survey,y=Model,label=substr(Year-1,3,4))) + geom_text() + theme_few() + xlim(c(0,3)) + ylim(c(0,3)) + geom_smooth(method=lm)+ geom_abline(intercept=0,slope=1,lty=2)