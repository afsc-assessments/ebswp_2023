library(jjmR)
library(tidyverse)
theme_set(theme_jjm(base_size = 15))
?jjmR
# mod0.00 <- runit(geth("0.00"),pdf=TRUE,portrait=F,est=TRUE,exec="../src/jjms")
getwd()
rm(m1)
geth <- function(mod,h=hyp) paste0(h,"_", mod) # Package? Or keep?
hyp="ebswp"
# read in results from Chosam from doc ---

m0 <- runit(geth("1.00") ,pdf=TRUE,portrait=F,est=TRUE,exec="~/_mymods/sprfmo/jjm/src/jjm")
m1 <- runit(geth("1.01") ,pdf=TRUE,portrait=F,est=TRUE,exec="~/_mymods/sprfmo/jjm/src/jjm")
m2 <- runit(geth("1.02") ,pdf=TRUE,portrait=F,est=TRUE,exec="~/_mymods/sprfmo/jjm/src/jjm")
m3 <- runit(geth("1.03") ,pdf=TRUE,portrait=F,est=TRUE,exec="~/_mymods/sprfmo/jjm/src/jjm")
m4 <- runit(geth("1.04") ,pdf=TRUE,portrait=F,est=TRUE,exec="~/_mymods/sprfmo/jjm/src/jjm")
mods <- combineModels(m0,m1,m2,m3,m4,m5)
names(mods)
m0 <- readJJM(geth("1.00"), path = "config", input = "input")
m1 <- readJJM(geth("1.01"), path = "config", input = "input")
m2 <- readJJM(geth("1.02"), path = "config", input = "input")

plot_selectivities(get_selectivities(m4) |> mutate(age=age-2),fleet="ind")

mods <- combineModels(m0,m1,m2,m3,m4,m5)
tidy_mods <- tidy_JJM(c(m0,m1,m2,m3))
tidy_mods <- tidy_JJM(c(m2))
tidy_mods <- tidy_JJM(c(m3,m4))

names(m2[[1]][[5]][[1]])
# Check on natural mortality rate:
(m2[[1]][[5]][[1]][[7]])

names(tidy_mods$totals)
# <- <-
# <- option-"minus"
tmp <- as_tibble(m$R) 
tmp <- rbind(as_tibble(m$R) |> mutate(model="base"),
       as_tibble(diag$R) |> mutate(model="diag") )
names(tmp) <- c("year","value","stdev","lowerbound","upperbound","model")
rec <- get_recruits(m2)[,c(1,3:7)]
names(rec) <- c("model", "year","value","stdev","lowerbound","upperbound")
rec
rbind(rec, tmp ) |> 
  filter(year>1980) |> 
ggplot(aes(x=year,ymin=lowerbound,ymax=upperbound,fill=model)) + ylim(0,NA) + 
  ggthemes::theme_few(base_size = 18)+
  geom_ribbon(alpha=.3)


tmp <- rbind(as_tibble(m$SSB) |> mutate(model="base"),
       as_tibble(diag$SSB) |> mutate(model="diag") )
names(tmp) <- c("year","value","stdev","lowerbound","upperbound","model")

tt<-get_totals(m2) |>  filter(metric=="SSB") |> select(-stock,-metric) ; tt   
  rbind(tt |> mutate(lowerbound=lowerbound/2,upperbound=upperbound/2), tmp ) |> 
  filter(year>1980,model!="diag") |> 
ggplot(aes(x=year,ymin=lowerbound,ymax=upperbound,fill=model)) + ylim(0,6000) + 
  ggthemes::theme_few(base_size = 18)+
  geom_ribbon(alpha=.3)

glimpse(tmp)
tidy_mods$totals |> filter(metric=="SSB") |> 
ggplot(aes(x=year,ymin=lowerbound,ymax=upperbound,fill=model)) + ylim(0,16000) + 
  ggthemes::theme_few(base_size = 18)+
  geom_ribbon(alpha=.3)

glimpse(tidy_mods)
# Load in assessment results from 2022 object "m"
load("~/_mymods/ebswp/doc/base.rdata")
load("~/_mymods/ebswp/doc/diag.rdata")
names(m$SSB)
(m$SSB)

index_fits <- tidy_mods$index_fits #|> filter(model=="model_1.02")
unique(index_fits$fleet_name)

index_fits %>% 
  ggplot() + 
  geom_pointrange(aes(year, observed_ind, ymin = observed_ind - 1.96 * observed_se, ymax =  observed_ind + 1.96 * observed_se), alpha = 0.5) +
  geom_path(aes(year, pred_ind, color = model)) + 
  facet_wrap(~ fleet_name, scales = "free_y") + 
  scale_x_continuous(name = "Year", guide = guide_axis(n.dodge = 2)) + 
  scale_y_continuous(name = "Index Values") + ylim(c(0,NA))
index_fits %>% 
  mutate(residual = pred_ind - observed_ind ) %>% 
  group_by(fleet_name, model) %>% 
  mutate(standardized_residual = residual / sd(residual)) %>% 
  filter(!is.na(standardized_residual)) %>% 
  ggplot() + 
  geom_hline(yintercept = 0,linetype = 2) +
  geom_col(aes(x = year, y =standardized_residual, fill =model), position = position_dodge(width = 0.5)) +
  facet_wrap(~ fleet_name, scales = "free_x") + 
  scale_x_continuous(name = "Year", guide = guide_axis(n.dodge = 2)) + 
  scale_y_continuous(name = "Standardized Residuals")

get_age_fits(tidy_mods)
names(m1$model$output$Stock_1)

totals <- get_totals(c(m0,m1,m2))
totals %>% 
  ggplot(aes(year, value, ymin=lowerbound, ymax=upperbound,fill = model, linetype = model)) + 
  geom_ribbon(alpha=.3) + expand_limits(y = 0) +
  facet_grid(metric ~., scales = "free_y")

age_fits <- get_age_fits(c(m2))
glimpse(age_fits)

age_fits %>% mutate(age=ifelse(age>9,10,age)) |> group_by(stock,year,fleet_type,age,fleet_name) |> 
  summarise(predicted=sum(predicted),observed=sum(observed)) |> 
  filter(stock == "Stock_1", year>2000) %>% 
  pivot_longer(predicted:observed) %>% 
  ggplot() + scale_y_continuous(breaks = c(.3,.60)) +
  scale_x_continuous(breaks = 1:10) +
  geom_density(aes(age, value, linetype=name,fill = name),stat = "identity", alpha = 0.3) + 
  facet_grid(year~fleet_name)


selectivities <- get_selectivities(c(m2)) |> mutate(age=age-2)
glimpse(selectivities)
plot_selectivities(get_selectivities(m3) |> mutate(age=age-2),fleet="ind")
plot_selectivities(get_selectivities(m2),fleet="ind")
plot_selectivities(selectivities)
plot_selectivities(get_selectivities(c(m1)))
?plot_selectivities


msy_my_results = get_msy_mt(m0)
kobe(m0, engine = "ggplot")
plot(m0,var="Recruit") # all plots

# Retro try ----
ret0 <- retro(model = m0, n= 8, output = "results", exec="../src/jjm",parallel=TRUE)
modnm <- "model_1.03"
ret3 <- retro(model = m3, n= 8, output = "results", exec="../../src/jjms",parallel=TRUE)

ret4 <- retro(model = m4, n= 8, output = "results", exec="../../src/jjms",parallel=TRUE)
ret5 <- retro(model = m5, n= 8, output = "results", exec="../../src/jjms",parallel=TRUE)

load(paste0("results/",modnm,"_retrospective.RData"))
ret<-output
pdf(paste0("results/",modnm,"_Retro.pdf"))
plot(ret0,title="Moodel 0") # all plots
plot(ret3) # all plots
plot(ret3,type="SSB") # all plots
plot(ret5,type="SSB") # all plots
dev.off()
names(ret1$Stock_1)
ret_df <-tidy_JJM(ret1$Stock_1)
plot(m0, var="SSB") # only SSB
#Calculation of Mohn's Rho courtesy of Arni Magnusson
icesAdvice::mohn(ret$Stock_1$SSB$var[,1,1:6],peel=5,details=T)


plot(mods, var="SSB") # only SSB

tidy_jjm <- tidy_JJM(mods)
names(mods[1:2])
selectivities <- get_selectivities(mods[c(1,4)])
selectivities
plot_selectivities(selectivities)
plot_selectivities(selectivities |> filter(year>2000),fleet="ind") 
?plot_selectivities

str(m1)
index_fits <- tidy_jjm$index_fits
index_fits
index_fits %>% 
  ggplot() + 
  geom_pointrange(aes(year, observed_ind, ymin = observed_ind - 1.96 * observed_se, ymax =  observed_ind + 1.96 * observed_se), alpha = 0.5) +
  geom_path(aes(year, pred_ind, color = model)) + 
  facet_grid( fleet_name~., scales = "free_y") + 
  scale_x_continuous(name = "Year", guide = guide_axis(n.dodge = 2)) + 
  scale_y_continuous(name = "Index Values") + ggthemes::theme_few(base_size=16)

summary(m1)
plot(mods,combine=TRUE,what='ssb',stack=F)
plot(mods,combine=TRUE,what='recruitment',stack=F)

df1<-as_tibble(m0[[1]][[5]][[1]]$df1)

names(df1)<-c("type","year","est","std","lb","ub")
df<-rbind(df1 |> mutate(model="base"))

df <- df %>% mutate(
  year=as.numeric(year),
  est=as.numeric(est),
  std=as.numeric(std),
  lb =as.numeric(lb),
  ub =as.numeric(ub)
)
unique(df$type)
blim <- df |> filter(type=="SSB0_Dynamic") |>  group_by(model) |> summarise(min(est))
blim
df %>% 
  ggplot(aes(x=year,y=est,ymin=lb,ymax=ub,color=model,fill=model)) + 
  geom_ribbon(alpha=.4)+ geom_line(size=.5,alpha=.5) + expand_limits(y=0) + ggthemes::theme_few() + ylab("Estimates") +
  facet_wrap(type~.,scales="free")

#df %>% filter(type=="Total_Biom") %>%

df |> filter(type=="SSB0_Dynamic") |> 
  ggplot(aes(x=year,y=est,ymax=ub,ymin=lb)) + geom_ribbon()

plot(m1,combine=TRUE,what="selectivity",stack=F,fleet="fsh")

plot(mods,what="Recruitment")

mod_diag <- diagnostics(mods,plot=T)
mod_diag

rm(weights.table, Ws)
fw_table <-function(mod=m1) {
  W_labels <- names(mod[[1]][c(3:8)])
  for(i in 1:length(W_labels)){
    if(i==1){ Ws <- as.numeric(mod[[1]][c(i+2)])}
    else {Ws <- rbind(Ws, as.numeric(mod[[1]][c(i+2)]))}
  }
rownames(weights.table)  <- W_labels; colnames(weights.table) <- 'FWs'
return(weights.table)
}
fw_table(mod=mods)
plot(mod_diag,var="catchResidualsByFleet")
plot(mod_diag,var="absoluteResidualCatchByFleet")
plot(diagnostics(mod1.03,plot=F),var="residualsCatchAtAgeByFleet")
plot(diagnostics(mod1.08,plot=F),var="residualsCatchAtAgeByFleet")
plot(mod_diag,var="residualsCatchAtLengthByFleet")
plot(mod_diag,var="ageFitsCatch")
plot(diagnostics(mod1.07,plot=F),var="ageFitsCatch")
plot(diagnostics(mod1.07,plot=F),var="fisheryMeanAge")
plot(diagnostics(mod1.08,plot=F),var="fisheryMeanAge")
plot(diagnostics(mod1.08,plot=F),var="ageFitsCatch")
plot(diagnostics(mod1.08,plot=F),var="ageFitsCatch$SC_Chile_PS")

plot(diagnostics(mod1.07,plot=F),var="predictedObservedIndices")
plot(diagnostics(mod1.08,plot=F),var="predictedObservedIndices")

  library(jjmR)
  library(ggthemes)
  library(ggridges)
  library(tidyverse)
  library(PBSadmb)
  source("../R/read.admb.R")
  source("../R/read-admb.R")
p2<-readList("newAge/For_R_1.rep")

library(jjmR)

          mods2compare <- c("1.01","1.04")
          obj <- compareModels(geth(mods2compare,"h1"))
          plot(obj,combine=T,what="biomass",stack=F,main="Biomass")
          
hyp <- "h2"
mod0.03 <- runit(geth("0.03"),pdf=TRUE,portrait=F,est=TRUE,exec="../src/jjms")
mod0.04 <- runit(geth("0.04"),pdf=TRUE,portrait=F,est=TRUE,exec="../src/jjms")
mod0.03 <- readJJM("choki",exec="../../src/jjms")
mod0.04 <- readJJM(geth("0.04"),pdf=TRUE,portrait=F,exec="../src/jjms")
h4.mod <- readJJM(h1nm, path = "config", input = "input")
h3.diag <- diagnostics(mod0.03,plot=F)
h4.diag <- diagnostics(mod0.04,plot=F)
h4.diag


p4<-readList("sel4/For_R_1.rep")
p2<-readList("For_R_2.rep")

p1<-readList("For_R_1.rep")
sf1<-as_tibble(rbind(p1$sel_fsh_1,
p1$sel_fsh_2,
p1$sel_fsh_3,
p1$sel_fsh_4))

sf2<-as_tibble(rbind(p2$sel_fsh_1,
p2$sel_fsh_2,
p2$sel_fsh_3,
p2$sel_fsh_4))

sf2<-as_tibble(rbind(p4$sel_fsh_1,
sf2<-as_tibble(rbind(p3$sel_fsh_1,
p3$sel_fsh_2,
p3$sel_fsh_3,
p3$sel_fsh_4))
sf2<-as_tibble(rbind(p4$sel_fsh_1,
p4$sel_fsh_2,
p4$sel_fsh_3,
p4$sel_fsh_4))
names(sf1) <- c("idx","year",1:12)
names(sf2) <- c("idx","year",0:12)
bind_rows(sf1,sf2)%>% arrange_col()
sf1 %>% pivot_longer() 
selfsh <- rbind(sf1%>%mutate(model="base"),sf2%>%mutate(model="newAge")) %>% mutate(idx=ifelse(idx==4,3,idx))

selfsh <- rbind(sf1%>%mutate(model="base"),sf2%>%mutate(model="3param_sel")) %>% mutate(idx=ifelse(idx==4,3,idx))

selfsh <- rbind(sf1%>%mutate(model="base"),sf2%>%mutate(model="3param_sel")) %>% mutate(idx=ifelse(idx==4,3,idx))
selfsh$idx <- p1$Fshry_names[selfsh$idx]

selfsh %>%
  gather(age,selectivity,3:14)  %>% filter(year>=1980) %>% mutate(age=as.numeric(age),idx=as.factor(idx))  %>%
  ggplot(aes(x=age,y=fct_rev(as.factor(year)),height = selectivity,fill=model,color=model,alpha=.3)) +
     geom_density_ridges(stat = "identity",scale=3,alpha = .3) + ylab("Year")+ theme_few() + 
     theme(legend.position="none")+facet_grid(model~idx) 

######################################
## ADNUTS try
library(adnuts)
runMCMC<-function(mod="../../src/jjms",dir="mcmc",runfile="config/atka.ctl",datafile="input/atka.dat",
chains=8,iter=1000,do_mceval=TRUE){
#mod="../../src/jjms";mcdir="mcmc";runfile="config/atka.ctl";datafile="input/atka.dat"
#chains=8;iter=1000
  require(adnuts)
  newdir<-"runs"
  dir.create(newdir,recursive=TRUE)
  file.copy(runfile, paste0(newdir,"/jjms.dat"),overwrite=TRUE)
  file.copy(mod, newdir,overwrite=TRUE)
  file.copy(datafile, newdir,overwrite=TRUE)
  m="jjms"
  d="runs"
  setwd(d)
  system(paste(m, '-hbf 1'))
  setwd('..')
  fit.mle <- sample_nuts(model=m, path=d, iter=iter, warmup=iter/4, 
                   chains=chains, cores=chains, control=list(metric='mle'))
  summary(fit.mle)
  if (do_mceval){
    setwd(d)
      system(paste(m, '-mceval '))
    setwd('..')
  }
  return(fit.mle)
}
# Model name
m <- './jjms'
# Directory  
d <- 'choki'
# Assumes a converged MLE model has already been run....
setwd(d)
system(paste(m, '-nox -binp jjms.bar -phase 22 -mcmc 10 -hbf 1'))
setwd('..')

## Two different ways to gets NUTS working. First is to use the
## Hessian (metric) just like with the RMW. Note the control argument.
## Two different ways to gets NUTS working. First is to use the
## Hessian (metric) just like with the RMW. Note the control argument.
iter <- 2000 # maybe too many...depends are number cores...I used 8...
chains=8
fit.mle <- sample_nuts(model=m3, path=d, iter=iter, warmup=iter/4, 
                   chains=chains, cores=chains, control=list(metric='mle'))
summary(fit.mle)
#saveRDS(fit.mle,"fit.mle.RDS")
# now test for 3-parameter logistic
d <- 'test/sel3'
iter <- 1000 # maybe too many...depends are number cores...I used 8...
chains<-8

fit.3par <- sample_nuts(model=m, path=d, iter=iter, warmup=iter/4,
                   chains=chains, cores=chains, control=list(metric='mle'))
saveRDS(fit.3par,"fit.3par.RDS")
d <- 'test/sel4'
fit.3par.sel4 <- sample_nuts(model=m, path=d, iter=iter, warmup=iter/4,
                   chains=chains, cores=chains, control=list(metric='mle'))
######################################
library(tidyverse)
library(ggthemes)
mcldf <- read_csv("runs/mclike.csv")
unique(mcldf$type
mnssb <- mcldf %>% filter(stock==1,type!="ind_len",type!="priors") %>% group_by(type) %>% summarise(mean_SSB=mean(SSB)) 
mnssb
bin <- seq(5000,12000,by=500); bin
mcldf %>% filter(stock==1,type!="ind_len",type!="priors") %>% mutate(bin=cut(SSB, breaks=bin, labels=FALSE)) %>% group_by(type) %>% mutate(NLL=value-mean(value)) %>%
ungroup() %>% group_by(type,bin) %>% summarise(NLL=mean(NLL))%>%
ggplot(aes(x=bin,y=NLL,color=type)) + theme_few()+ geom_line() #+ facet_wrap(type~.) 

mcldf %>% filter(stock==1,type!="ind_len",type!="fpen",type!="fish_len",  type!="q_prior",type!="priors") %>% group_by(type) %>% mutate(NLL=value-mean(value)) %>%
ggplot(aes(x=SSB,y=NLL,color=type)) + theme_few()+ geom_point(alpha=.2,size=.2) + facet_wrap(type~.,scales="free") + stat_smooth()

#mcldf %>% filter(stock==1,type!="ind_len",type!="priors") %>% mutate(bin=cut(SSB, breaks=bin, labels=FALSE)) %>% group_by(type) %>% mutate(NLL=value-min(value)) %>%
tmp <- mcldf %>% filter(stock==1,type!="ind_len",type!="priors") #%>% mutate(SSB=arules::discretize(SSB, breaks = 3, labels = c("Low","Medium","High"))
tmp$SSB <- arules::discretize(tmp$SSB, breaks = 5, labels = c("Low","Med-low","Medium","Med-high","High"))
tmp %>% group_by(type) %>% mutate(NLL=value-min(value)) %>% group_by(type,SSB) %>% summarise(NLL=mean(NLL)) %>%
ggplot(aes(x=SSB,y=NLL,color=type)) + theme_few()+ geom_point(size=2) + facet_wrap(type~.) 
# mutate(bin=cut(SSB, breaks=bin, labels=FALSE)) 

pairs_admb(fit.mle, pars=1:6, order='slow')
pairs_admb(fit.3par, pars=1:6, order='slow')
pairs_admb(fit.3par.sel4, pars=1:6, order='slow')
pairs_admb(fit.mle, pars=1:6, order='fast')
print(fit.mle)
plot_sampler_params(fit.mle)
launch_shinyadmb(fit.mle)
launch_shinyadmb(fit.3par)
library(tidyverse)
mcdf <- read.table("test/mceval.rep",header=TRUE)
mcdf <- as.tibble(mcdf)
glimpse(mcdf)
unique(mcdf$type)
unique(mcdf$Age)
mcdf %>% filter(Year>1990,type=="SSB", Age=="all_stock_1") %>% mutate(Year=as.factor(Year) ) %>%
  ggplot(aes(x=Year,y=value)) + geom_violin(color="salmon",fill="salmon") + ggthemes::theme_few() 

mcdf %>% filter(Year>1990,type=="Recruits", Age=="Age_1_stock_1") %>% mutate(Year=as.factor(Year) ) %>%
  ggplot(aes(x=Year,y=value)) + geom_violin(color="salmon",fill="salmon") + ggthemes::theme_few() 

mcdf %>% filter(Year>1990,type=="Depletion", Age=="all_stock_1") %>% mutate(Year=as.factor(Year) ) %>%
  ggplot(aes(x=Year,y=value)) + geom_violin(color="salmon",fill="salmon") + ggthemes::theme_few() 
  
 # + xlim(c(0,8000))

mon <- monitor(fit.mle$samples, warmup=fit.mle$warmup, print=FALSE)


r

df <-rbind( data.frame(
    Year=p1$SSB[,1],
    SSB=p1$SSB[,2],
    lb=p1$SSB[,4],
    ub=p1$SSB[,5],
    model="Peru (Dec)"),
  data.frame(
    Year=p2$SSB[,1],
    SSB=p2$SSB[,2],
    lb=p2$SSB[,4],
    ub=p2$SSB[,5],
    model="SPRFMO SC08")
  )
df <-rbind( data.frame(
    Year=p1$R[,1],
    Recruits=p1$R[,2],
    lb=p1$R[,4],
    ub=p1$R[,5],
    model="Peru (Dec)"),
  data.frame(
    Year=p2$R[,1],
    Recruits=p2$R[,2],
    lb=p2$R[,4],
    ub=p2$R[,5],
    model="SPRFMO SC08")
  )
glimpse(df)
df %>% ggplot(aes(x=Year,y=SSB,ymin=lb,ymax=ub,color=model,fill=model)) + geom_ribbon(alpha=.3) +
geom_line(size=2)+ theme_few()
df %>% ggplot(aes(x=Year,y=Recruits,ymin=lb,ymax=ub,color=model,fill=model)) + geom_ribbon(alpha=.3) +
geom_line(size=2)+ theme_few()
read.admb <- function(ifile) { 
  ret=read.fit(ifile)
  
  fn=paste(ifile,'.rep', sep='')
  A=read.rep(fn)
  A$fit=ret
  
  pfn=paste(ifile,'.psv',sep='')
  if(file.exists(pfn))
    A$post.samp=read.psv(pfn)
  
  return(A)
}

read.fit <- function(ifile) {
  # __Example:             
  # file <-("~/admb/simple")
  # A <- reptoRlist(file)
  # Note there is no extension on the file name.
  
  ## The following is a contribution from:
  ## Anders Nielsen that reads the par & cor files.
  ret<-list() 
  parfile<-as.numeric(scan(paste(ifile,'.par', sep=''),   
   what='', n=16, quiet=TRUE)[c(6,11,16)]) 
  ret$nopar<-as.integer(parfile[1]) 
  ret$nlogl<-parfile[2] 
  ret$maxgrad<-parfile[3] 
  file<-paste(ifile,'.cor', sep='') 
  lin<-readLines(file) 
  ret$npar<-length(lin)-2 
  ret$logDetHess<-as.numeric(strsplit(lin[1], '=')[[1]][2]) 
  sublin<-lapply(strsplit(lin[1:ret$npar+2], ' '),function(x)x[x!='']) 
  ret$names<-unlist(lapply(sublin,function(x)x[2])) 
  ret$est<-as.numeric(unlist(lapply(sublin,function(x)x[3]))) 
  ret$std<-as.numeric(unlist(lapply(sublin,function(x)x[4]))) 
  ret$cor<-matrix(NA, ret$npar, ret$npar) 
  corvec<-unlist(sapply(1:length(sublin), function(i)sublin[[i]][5:(4+i)])) 
  ret$cor[upper.tri(ret$cor, diag=TRUE)]<-as.numeric(corvec) 
  ret$cor[lower.tri(ret$cor)] <- t(ret$cor)[lower.tri(ret$cor)] 
  ret$cov<-ret$cor*(ret$std%o%ret$std)
  return(ret)
}

read.rep <- function(fn) {
  # The following reads a report file
  # Then the 'A' object contains a list structure
  # with all the elemements in the report file.
  # In the REPORT_SECTION of the AMDB template use 
  # the following format to output objects:
  #   report<<"object \n"<<object<<endl;
  #
  # The part in quotations becomes the list name.
  # Created By Steven Martell
  options(warn=-1)  #Suppress the NA message in the coercion to double
  
  
  ifile=scan(fn,what="character",flush=TRUE,blank.lines.skip=FALSE,quiet=TRUE)
  idx=sapply(as.double(ifile),is.na)
  vnam=ifile[idx] #list names
  nv=length(vnam) #number of objects
  A=list()
  ir=0
  for(i in 1:nv)
  {
    ir=match(vnam[i],ifile)
    if(i!=nv) irr=match(vnam[i+1],ifile) else irr=length(ifile)+1 #next row
    dum=NA
    if(irr-ir==2) dum=as.double(scan(fn,skip=ir,nlines=1,quiet=TRUE,what=""))
    if(irr-ir>2) dum=as.matrix(read.table(fn,skip=ir,nrow=irr-ir-1,fill=TRUE))

    if(is.numeric(dum))#Logical test to ensure dealing with numbers
    {
      A[[vnam[i]]]=dum
    }
  }
  options(warn=0)
  
  return(A)
}

read.psv <- function(fn, nsamples=10000) {
  #This function reads the binary output from ADMB
  #-mcsave command line option.
  #fn = paste(ifile,'.psv',sep='')
  filen <- file(fn, "rb")
  nopar <- readBin(filen, what = integer(), n = 1)
  mcmc <- readBin(filen, what = numeric(), n = nopar * nsamples)
  mcmc <- matrix(mcmc, byrow = TRUE, ncol = nopar)
  close(filen)
  return(mcmc)
}

# A simple function for creating transparent colors
# Author: Nathan Stephens (hacks package)
colr <- function(col.pal=1,a=1) {
    col.rgb<-col2rgb(col.pal)/255
    rgb(t(col.rgb),alpha=a)
}

# Profile----

library(jjmR)
library(foreach)
library(doParallel)

### User-specific inputs ---------------------

#setwd("C:/Users/leeqi/Documents/Github/jjm")
dir.base <- getwd()

registerDoParallel(5) # Number of logical processors you want to use for parallel processes

names(m0)
modname <- "1.00"
file.exe <- "jjms"

Nreps <- 9
par2change <- "N_Mort"

file.ctl <- paste(modname, ".ctl", sep = "")
file.dat <- paste(modname, ".dat", sep = "")
dir.ast <- "assessment"
dir.src <- "src"

### Running models in parallel ---------------------------

foreach(i = 1:Nreps) %dopar% {
  library(jjmR)
  setwd(file.path(dir.base, dir.ast))
  
  new.mod <- paste(modname, i, sep =".")
  runJJM(new.mod, path="config", input="input", exec="../src/jjms")
}

### Getting likelihoods and final year SSB from report files ---------------------------------------------------------
setwd(file.path(dir.base, dir.ast))

modres <- NULL
parvec <- NULL
Bend <- NULL
setwd(file.path(dir.base,dir.ast))
Nreps=5
modres<- mods
i=1
for(i in 0:Nreps) {
  dir.mod <- paste(modname, i, sep =".")
  modres[[i]] <- readJJM(dir.mod, path="config", input="input")
  
  if(i == 1) {
    modlike <- matrix(ncol = Nreps, nrow = nrow(summary(modres[[i]])$like))
  }
  
  modlike[,i] <- summary(modres[[i]])$like
  
  Biomat <- modres[[i]][[1]]$output$Stock_1$TotBiom
  Bend[i] <- Biomat[nrow(Biomat), 2]
  
  parex <- paste("modres[[i]][[1]]$parameters$", par2change, sep = "")
  parvec[i] <- eval(parse(text = parex))
}

### Making change-in-likelihood table ----------------------------------
deltmat <- matrix(ncol = ncol(modlike), nrow = nrow(modlike))
for(i in 1:nrow(modlike)) {
  deltmat[i,] <- modlike[i,] - min(modlike[i,])
}

## Plotting the likelihood profiles ---------------------------------

plot(0, type = "n", xlim = range(par2change), ylim = range(deltmat)*1.1, 
     ylab = "Change in Likelihood", xlab = "Natural Mortality")
cls <- rainbow(13)
cls <- c(cls, "black")

for(i in 1:nrow(modlike)) {
  lines(x = parvec, y = deltmat[i,], col = cls[i], lwd = 2, type = "o")
}
abline(h = 0, col = "grey")

legend("topright",legend = rownames(summary(modres[[1]])$like), col = cls, lty = 1, pch = 1, lwd = 2)

### Plotting the SSB profiles --------------------------
dev.new()
plot(x = parvec, y = Bend, col = "black", lwd = 2, type = "o", ylab = "Final Year SSB", xlab = "Natural Mortality")
