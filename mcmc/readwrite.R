source("../R/read-admb.R")
din <- read_dat("../runs/dat/pm2018.dat")
names(din)

# This doesn't work right yet. can't seem to remove commas and "c(31, 2123)" propoerty...
write_dat <- function(data,fn)
{
  sink(fn)
  for (i in 1:length(data)){
    cat(paste0("#",names(data[i]),"\n",(data[i]),"\n"))
  }
}

write_dat(din,"shit.dat")