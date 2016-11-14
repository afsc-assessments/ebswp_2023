#mycov <- read.delim(pipe('pbpaste'),header=FALSE))
getwd()
library(Matrix)
#cov_B <- read.table("dat/rescaledcovB2016.dat",header=FALSE)
#cov_N_2015 <- read.table("dat/covN2015.dat",header=FALSE)

idx_N <- read.table("dat/ddc_abund.dat",header=FALSE)
idx_B <- read.table("dat/ddc_biom.dat",header=FALSE)
cov_N <- as.matrix(read.table("dat/covN2016.dat",header=FALSE))
cov_B <- as.matrix(read.table("dat/covB2016.dat",header=FALSE))

isSymmetric(cov_N)
cov_N[lower.tri(cov_N)]<-t(cov_N)[lower.tri(cov_N)]
cov_N <-forceSymmetric((cov_N))
isSymmetric(cov_N)
#plot(cov_N[lower.tri(cov_N)], t(cov_N)[lower.tri(cov_N)])
cor_N <- cov2cor(cov_N)
isSymmetric(cor_N)
# Look at CVs...
sqrt(diag(cov_N))/idx_N

isSymmetric(cov_B)
# Try setting lower and upper equal...
cov_B[lower.tri(cov_B)]<-t(cov_B)[lower.tri(cov_B)]
isSymmetric(cov_B)
# Force to be symmetric...
cov_B <-forceSymmetric((cov_B))
#write.table(as.matrix(cov_B),"dat/covB2016forced.dat",row.names=F,col.names=F)
isSymmetric(cov_B)
cor_B <- cov2cor(cov_B)
isSymmetric(cor_B)
sqrt(diag(cov_B))/idx_B
std_B <- sqrt(diag(cov_B))/1000
std_B/idx_B

# Create a rescaled covariance matrix given 
sc_B <- as.matrix(sweep(sweep(cor_B, 1L, std_B, "*"), 2L, std_B, "*"))
sc_B
write.table(sc_B,"dat/rescaledcovB2016.dat",row.names=F,col.names=F)