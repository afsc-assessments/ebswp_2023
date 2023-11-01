df <- read_table(paste0(.MODELDIR[thismod],"F40_t.rep")) #,header=TRUE)
  names(df)
  fmsy<-df$Fmsy[df$Year==thisyr]
  fmsy
  idx=grep("Bmsy",M$fit$name)
  df$Bmsy[df$Year==thisyr]
  bmsy <- M$fit$est[idx[3]]
  bmsy

  names(df)
  names(M)
  pt <- df %>% filter(Year>thisyr) %>% transmute(F=meanF,Fmsy,F.Fmsy=meanF/Fmsy,Bmsy=Bmsy,Yr=substr(as.character(Year),3,4))
  df <- df %>%filter(Year<=thisyr,Year>1977)  %>%
  transmute(F=meanF,Fmsy,Bmsy,SSB=SSB,F.Fmsy=meanF/Fmsy,B.Bmsy=SSB/Bmsy,Bmsy=Bmsy,Yr=substr(as.character(Year),3,4))
  tail(df)
  #df$`F/Fmsy`
  # Note that row 4 has catch of 1.15 Mt, closest to expectatoin in 2022
  M$future_catch #[4,2:3],
  M$future_F#[4,2:3],
  df2 <- data.frame(Year=(thisyr+1):(thisyr+2),
                     C=M$future_catch[5,1:2],
                     SSB=M$future_SSB[5,2:3],
                     B.Bmsy= M$future_SSB[5,2:3]/bmsy)
                     #%>%
               mutate(Yr=substr(as.character(Year),3,4),
                     Fmsy=c(fmsy,fmsy)) #,
                     Fmsy=rep(fmsy,2),
                     F.Fmsy=F/Fmsy,
                     Bmsy=rep(bmsy,2),
  df2
  pt
  pt2
  #pt2  <- pt2 %>% transmute(F.Fmsy,B.Bmsy=SSB/Bmsy,Bmsy,Year,Yr)
  pt2 <- cbind(df2,pt)
  head(df)
         #mutate(F.Fmsy=meanF/Fmsy,B.Bmsy=SSB/Bmsy,Year=substr(as.character(Year),3,4)) %>%
  p1 <- ggplot(df,aes(x=B.Bmsy,y=F.Fmsy,label=Yr)) +
         geom_text(aes(color=as.factor(Year)),size=4,col="blue")+ .THEME + xlim(c(0,2.0))+ ylim(c(0,1.1)) + xlab("B/Bmsy") + ylab("F/Fmsy") +
         geom_label(data=pt2,size=5,fill="yellow",color="red",alpha=.4) +
         geom_line(data=pt2,color="red",alpha=.4) +
         geom_hline(size=.5,yintercept=1) + geom_vline(size=0.5,linetype="dashed",xintercept=.2) + geom_vline(size=.5,xintercept=1) + geom_path(size=.4) +
          guides(size=FALSE,fill=FALSE,alpha=FALSE,col=FALSE) ;p1
  ggsave("doc/figs/mod_phase.pdf",plot=p1,width=7.2,height=5.7,units="in")

sdf <- tibble(data.frame(year=1964:2024,rbind(M$sel_fsh,M$sel_fut)))
tail(sdf)
names(sdf) <- c("Year",1:15)
wtdf <- tibble(data.frame(year=1964:2023,rbind(M$wt_fsh,M$wt_fut)))
names(wtdf) <- c("Year",1:15)
#sdf[,2:16] <- wtdf[,2:16]*sdf[,2:16]
  sdfm <- sdf %>%  pivot_longer(cols=2:16,names_to="age",values_to="Selectivity") %>%
                  mutate(
                    age=as.numeric(age),
                    Selectivity=as.numeric(Selectivity)
                    )

df <- read_table(paste0(.MODELDIR[thismod],"F40_t.rep")) #,header=TRUE)
df %>% filter(Year>2000) %>% summarise(hm=n()/sum(1/AM_fmsyr),am=mean(AM_fmsyr),1-hm/am)
df %>% filter(Year>1977) %>% summarise(hm=n()/sum(1/Fmsy),am=mean(Fmsy),1-hm/am)
df %>% filter(Year>1977) %>% ggplot(aes(x=SSB,y=Fmsy,label=Year)) + geom_text() + theme_few() + geom_path(color="grey") +
     geom_smooth(method='lm')
tail(df)
names(df)
#
wtdf
  # plot of selected age vs Fmsy
  p1 <- df %>% select(Year,Fmsy,AM_fmsyr,F35) %>% left_join(sdfm) %>%
  filter(age<11,Year>2000)%>% mutate( Year=substr(as.character(Year),3,4)) %>% group_by(Year) %>%
 summarise(Fmsy=mean(Fmsy),mnage=sum(Selectivity*age)/sum(Selectivity)) %>%
 ggplot(aes(y=Fmsy,x=mnage,label=Year)) + geom_text() +
 theme_few() + geom_path(size=.2,color="grey") + xlab( "Mean age selected") #+ geom_smooth();p1
 p1
  ggsave("doc/figs/fmsy_sel.pdf",plot=p1,width=5.2,height=4.0,units="in")
ndf <- tibble(data.frame(year=1964:2023,rbind(M$N)))
names(ndf) <- c("Year",1:15)
  ndfm <- ndf %>%  pivot_longer(cols=2:16,names_to="age",values_to="Numbers") %>%
                  mutate( age=as.numeric(age),
                    Numbers=as.numeric(Numbers) )

sdfm

  p1 <- sdfm %>% left_join(ndfm) %>%
  filter(age<16,Year<1999)%>% mutate( Year=substr(as.character(Year),3,4)) %>% group_by(Year) %>%
 summarise(
  mnagesel=sum(Selectivity*age)/sum(Selectivity),
 mnage=sum(Numbers*age)/sum(Numbers)) %>%
 ggplot(aes(y=mnagesel,x=mnage,label=Year)) + geom_text() + ylab("Mean age selected") +
 theme_few() + geom_path(size=.2,color="grey") + xlab( "Mean age in stock") + geom_smooth(method='lm');p1

  ggsave("figs/xxxfmsy_sel.pdf",plot=p1,width=7.2,height=5.7,units="in")

  nrows=dim(M$sel_fsh)[1]
  yr=2001:2023;sel<-M$sel_fsh[(nrows-22):nrows,1:12]
  p1 <- plot_sel(Year=yr,sel=sel,scale=3);
  p1 + geom_vline(xintercept=3.5,color="grey")
      #scale_x_continuous(breaks=seq(2010,2022,by=2))
p1
