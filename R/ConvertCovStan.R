#mycov <- read.delim(pipe('pbpaste'),header=FALSE))
mycov <- read.table("dat/orig_cov2016.dat",header=FALSE)
dim(mycov)
mycov <-as.matrix(mycov)
mystd <- sqrt(diag(mycov))/1000
mycor <- cov2cor(mycov)
b <- (mystd) %*% (t(mystd))
sc <- b %*% mycor
write.table(sc,"dat/cov2016.dat",row.names=F,col.names=F)