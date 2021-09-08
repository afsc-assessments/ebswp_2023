radian
load("data/Density.Rdata")

library(tidyverse)
library(ggplot2)
library(ggthemes)

names(out$Density_dataframe)
df<-(out$Density_dataframe) %>% filter(as.numeric(Category)<4)
dim(df)
unique(df$Category)
length(df$Grid)
df %>% group_by(Year,Category) %>% summarise(mean=mean(Density))%>%
ggplot(aes(x=Year,y=mean,color=Category)) + geom_point() + theme_few()
names(out$Density_dataframe)