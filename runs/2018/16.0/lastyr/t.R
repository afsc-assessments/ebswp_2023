# If error on library, uncomment this
R
require(MASS)
# Read binary
hesfile <- file("admodel.hes", "rb")
nparams <- readBin(hesfile,"integer",n=1)
hes <- matrix(readBin(hesfile, "numeric", n = nparams * nparams), ncol = nparams, byrow = TRUE)
close(hesfile)

# Specify subset
idx <- c(1:10,33:44,64:80)
subhes <- hes[idx,idx]

hes[1:5,1:5]
subhes[1:5,1:5]

cov <- ginv(hes)
cor <- cov2cor(cov)
cor[1:5,1:5]
subcov <- ginv(subhes)

subcor <- cov2cor(subcov)
subcor[1:5,1:5]

# now write file
subhesfile <- file("sub.hes", "wb")
writeBin(as.vector(subhes),subhesfile)
close(subhesfile)