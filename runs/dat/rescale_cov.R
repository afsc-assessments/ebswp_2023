radian
1
install.packages("MBESS")
install.packages("GGally")
library(MBESS)
library(GGally)
#c1 <- as.matrix(read.table("dat/cov_biom.dat",header=F,as.is=T))
#c1 <- as.matrix(read.table("cov22_orig.dat",header=F,as.is=T))
#c1 <- as.matrix(read.csv("stan_cov_matrix_2022_db.csv",header=F,as.is=T))
#c1 <- as.matrix(read.table("stan22.dat",header=F,as.is=T))
c1 <- as.matrix(read.table("stan_2022_cov.dat",header=F,as.is=T))
#c1 <- as.matrix(read.table("stan_cov_21.dat",header=F,as.is=T))
#c1 <- as.matrix(read.table("stan_cov_21.dat",header=F,as.is=T))
#c1 <- as.matrix(read.csv("varcov.csv",header=F,as.is=T))
#c1 <- as.matrix(read.table("dat/cov_biom.dat",header=F,as.is=T))
#c1 <- as.matrix(read.table("dat/rescaled_cov_2018.dat",header=F,as.is=T))
#c1 <- as.matrix(read.table("dat/rescaled_cov_2018_fitsrv.dat",header=F,as.is=T))
#c1 <- as.matrix(read.table("dat/thorCov.dat",header=F,as.is=T))

##########################
#c1 <- as.matrix(read.table("cov_biom19.dat",header=F,as.is=T))
c1
d1 <- sqrt(diag(c1))
#d2 <- as.vector(d1/1e6) #kg
d2 <- as.vector(d1/1e3)
#d2 <- as.vector(d1)
c2 <- cov2cor(c1)
c3 <- sweep(sweep(c2, 1L, d2, "*"), 2L, d2, "*")
all.equal(c3,c1)
?write.table
q
c3[1:4,1:4 ]

write.table(c3,file="cov_2022.dat",row.names=F,col.names=F)
##########################

 set up a model with recruitment set to 1, to generate yield per recruit and spawning biomass per recruit (spr).  That just uses selectivity, 
 fishing rate, size-at-age, and maturity at age
- Calculate equilibrium recruitment using 

spr = 9.197e-7
- based on that, I can get total yield (ypr times rinf) spawning biomss (spr * rinf), etc.
alpha = exp(-4.43) 
beta = exp(-6.42)
ssb = seq(0,1000,100)
plot(ssb,alpha*ssb*exp(-beta*ssb))

# note here the 1e^ 6 is to reflect that the stock recruit function predicts millions of recruits.  I could have easily folded that into alpha.
rinf = log(alpha * spr * 1E6) / (beta * spr)  
rinf


c1 <- as.matrix(read.table("dat/thorCov.dat",header=F))
df <- as.numeric(read.table("dat/vast_biom.dat",header=F,as.is=T))
names(c1)= 1:38
names(df)= 1:37
m <- as.data.frame(mvrnorm(n = 1000, df, c1, tol = 1e-6, empirical = FALSE, EISPACK = FALSE))
colnames(m) <- 1982:2018
ggpairs(m,columns=3:7)
ggpairs(m,columns=33:37)
pm <- ggpairs(tips, 2:3)
data(tips, package = "reshape")
pm <- ggpairs(tips[, 1:3])
p_(pm)
pm <- ggpairs(tips, 1:3, columnLabels = c("Total Bill", "Tip", "Sex"))
p_(pm)
d1 <- sqrt(diag(c1))
d2 <- as.vector(d1/1000)
c2 <- cov2cor(c1)
c3 <- sweep(sweep(c2, 1L, d2, "*"), 2L, d2, "*")
all.equal(c3,c1)
write.table(c3,file="rescaled_cov_2019.dat")

c1 <- as.matrix(read.csv("dat/thorCov_In.csv",header=F,as.is=T))
c1 <- as.matrix(read.csv("Cov_Index.csv",header=F,as.is=T))
d1 <- sqrt(diag(c1))
d2 <- as.vector(d1/1000)
c2 <- cov2cor(c1)
c3 <- sweep(sweep(c2, 1L, d2, "*"), 2L, d2, "*")
all.equal(c3,c1)
write.table(c3,file="dat/thorCov.dat",row.names=F,col.names=F)
d2 <- as.vector(d1/1000)
n <- length(d2)
d2[n] <- d2[n]*.5

c2 <- cov2cor(c1)
c3 <- sweep(sweep(c2, 1L, d2, "*"), 2L, d2, "*")
all.equal(c3,c1)
write.table(c3,file="dat/rescaled_cov_2018_fitsrv.dat")

c1 <- as.matrix(read.csv("varcov.csv",header=F,as.is=T))
d1 <- sqrt(diag(c1))
d2 <- as.vector(d1/1000)
n <- length(d2)
d2[n] <- d2[n]*.5
c2 <- cov2cor(c1)
c3 <- sweep(sweep(c2, 1L, d2, "*"), 2L, d2, "*")
all.equal(c3,c1)
write.table(c3,file="dat/rescaled_cov_2018_fitsrv.dat")

q()
n