
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(ggridges)

df <- data.frame(read.table("agew.dat"))
names(df) <- 1:15
df$Year <- (1982:2018)
df.l <- gather(df,"Age","N",-Year) %>% mutate(Source="DB")
df2 <- data.frame(read.table("age1.dat",header=TRUE))
# put the two in one dataframe
df <- rbind(df2,df.l) 

# Compute proportions
dfp <- df %>% group_by(Year,Source)  %>% mutate(Age=as.numeric(Age),Proportion=N/sum(N)) %>% filter(Year<=1999)

# Plot
ggplot(dfp,aes(x=Age,y=as.factor(Year),height = Proportion, fill=Source,color=Source)) + 
     geom_density_ridges2(stat = "identity",scale = 3, alpha = .1)+
     xlim(c(1,15)) + ylab("Year") + xlab("Age (years)") + scale_y_discrete(limits=rev(levels(as.factor(dfp$Year)))) + theme_few() 
     geom_density_ridges(stat = "binline", bins=10,  scale = 0.95)+

