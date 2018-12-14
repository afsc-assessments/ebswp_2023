R
# install.packages("MBESS")
library(MBESS)
#c1 <- as.matrix(read.table("dat/cov_biom.dat",header=F,as.is=T))
c1 <- as.matrix(read.csv("varcov.csv",header=F,as.is=T))
d1 <- sqrt(diag(c1))
d2 <- as.vector(d1/1000)
c2 <- cov2cor(c1)
c3 <- sweep(sweep(c2, 1L, d2, "*"), 2L, d2, "*")
all.equal(c3,c1)
write.table(c3,file="dat/rescaled_cov_2018.dat")

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