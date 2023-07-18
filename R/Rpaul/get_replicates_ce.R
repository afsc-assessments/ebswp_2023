#  generate samples from posterior values

library(MASS)
set.seed(1)

### trawl survey biomass (use mvrnorm)

eb_bts_repl_ce <- as.data.frame(matrix(nrow=dim(eb_bts_post_ce)[1], ncol=dim(eb_bts_post_ce)[2]))
names(eb_bts_repl_ce) <- names(eb_bts_post_ce)
eb_bts_repl_ce[,1:2] <- eb_bts_post_ce[,1:2]

for (i in 1:dim(eb_bts_repl_ce)[1])
{
  eb_bts_repl_ce[i,3:40] <- mvrnorm(1,unlist(eb_bts_post_ce[i,3:40]),as.matrix(srv_cov))
}
  eb_bts_repl_ce[,3:40][eb_bts_repl_ce[,3:40]<0] <- 100
  
  
## eit survey biomass  (use rnorm on log scale)
  
   eb_eit_repl_ce <- as.data.frame(matrix(nrow=dim(eb_eit_post_ce)[1], ncol=dim(eb_eit_post_ce)[2]))
   names(eb_eit_repl_ce) <- names(eb_eit_post_ce)
   eb_eit_repl_ce[,1:2] <- eb_eit_post_ce[,1:2]
 
 for (i in 1:dim(eb_eit_repl_ce)[1])
   {
     eb_eit_repl_ce[i,3:19] <- exp(rnorm(unlist(eb_eit_post_ce[i,3:19]),log(unlist(eb_eit_post_ce[i,3:19])),eit_bio_sd$ls_sd))
   }  
  
  
### eit age 1 survey biomass  (use rnorm on log scale, constant sd of 1)
  
  ea1_eit_repl_ce <- as.data.frame(matrix(nrow=dim(ea1_eit_post_ce)[1], ncol=dim(ea1_eit_post_ce)[2]))
  names(ea1_eit_repl_ce) <- names(ea1_eit_post_ce)
  ea1_eit_repl_ce[,1:2] <- ea1_eit_post_ce[,1:2]
  
  for (i in 1:dim(ea1_eit_repl_ce)[1])
  {
    ea1_eit_repl_ce[i,3:19] <- exp(rnorm(unlist(ea1_eit_post_ce[i,3:19]),log(unlist(ea1_eit_post_ce[i,3:19])),1))
  }
  
### fishery age comps  (multinomial distribution)
  
  eac_fsh_repl_ce <- as.data.frame(matrix(nrow=dim(eac_fsh_post_ce)[1], ncol=dim(eac_fsh_post_ce)[2]))
  names(eac_fsh_repl_ce) <- names(eac_fsh_post_ce)
  eac_fsh_repl_ce[,1:3] <- eac_fsh_post_ce[,1:3]
  for (i in 1:dim(eac_fsh_repl_ce)[1])
  {
   prob <- unlist(eac_fsh_post_ce[i,4:18])
   year <- unlist(eac_fsh_post_ce[i,3])
   sam <- unlist(eac_fsh_sam$fsh_sam[eac_fsh_sam$year==year])
   tmp <- rmultinom(1,sam,prob)
   tmp <- tmp/sum(tmp)
   eac_fsh_repl_ce[i,4:18] <- tmp 
  }  
  
### survey age comps  (multinomial distribution)
  
  eac_bts_repl_ce <- as.data.frame(matrix(nrow=dim(eac_bts_post_ce)[1], ncol=dim(eac_bts_post_ce)[2]))
  names(eac_bts_repl_ce) <- names(eac_bts_post_ce)
  eac_bts_repl_ce[,1:3] <- eac_bts_post_ce[,1:3]
  for (i in 1:dim(eac_bts_repl_ce)[1])
  {
    prob <- unlist(eac_bts_post_ce[i,4:18])
    year <- unlist(eac_bts_post_ce[i,3])
    sam <- unlist(eac_bts_sam$sam[eac_bts_sam$year==year])
    tmp <- rmultinom(1,sam,prob)
    tmp <- tmp/sum(tmp)
    eac_bts_repl_ce[i,4:18] <- tmp 
  }   

### eit age comps  (multinomial distribution)
  
  eac_eit_repl_ce <- as.data.frame(matrix(nrow=dim(eac_eit_post_ce)[1], ncol=dim(eac_eit_post_ce)[2]))
  names(eac_eit_repl_ce) <- names(eac_eit_post_ce)
  eac_eit_repl_ce[,1:4] <- eac_eit_post_ce[,1:4]
  for (i in 1:dim(eac_eit_repl_ce)[1])
  {
    prob <- unlist(eac_eit_post_ce[i,5:18])
    year <- unlist(eac_eit_post_ce[i,3])
    sam <- unlist(eac_eit_sam$sam[eac_eit_sam$year==year])
    tmp <- rmultinom(1,sam,prob)
    tmp <- tmp/sum(tmp)
    eac_eit_repl_ce[i,5:18] <- tmp 
  }
  
### predicted catch (use rnorm on log scale, constant sd of 0.05)

  catch_repl_ce <- as.data.frame(matrix(nrow=dim(catch_post_ce)[1], ncol=dim(catch_post_ce)[2]))
  names(catch_repl_ce) <- names(catch_post_ce)
  catch_repl_ce[,1:2] <- catch_post_ce[,1:2]
  
  for (i in 1:dim(catch_repl_ce)[1])
  {
    catch_repl_ce[i,3:59] <- exp(rnorm(unlist(catch_post_ce[i,3:59]),log(unlist(catch_post_ce[i,3:59])),0.05))
  }
  
### predicted cpue  (use rnorm)
  
  cpue_repl_ce <- as.data.frame(matrix(nrow=dim(cpue_post_ce)[1], ncol=dim(cpue_post_ce)[2]))
  names(cpue_repl_ce) <- names(cpue_post_ce)
  cpue_repl_ce[,1:2] <- cpue_post_ce[,1:2]
  
  for (i in 1:dim(cpue_repl_ce)[1])
  {
    cpue_repl_ce[i,3:14] <- rnorm(unlist(cpue_post_ce[i,3:14]),unlist(cpue_post_ce[i,3:14]),cpue_std$std)
  }
  cpue_repl_ce[,3:14][cpue_repl_ce[,3:14]<0] <- 100
 
### predicted avo  (use rnorm)
  
  avo_repl_ce <- as.data.frame(matrix(nrow=dim(avo_post_ce)[1], ncol=dim(avo_post_ce)[2]))
  names(avo_repl_ce) <- names(avo_post_ce)
  avo_repl_ce[,1:2] <- avo_post_ce[,1:2]
  
  for (i in 1:dim(avo_repl_ce)[1])
  {
    avo_repl_ce[i,3:16] <- rnorm(unlist(avo_post_ce[i,3:16]),unlist(avo_post_ce[i,3:16]),avo_std$std)
  }
  avo_repl_ce[,3:16][avo_repl_ce[,3:16]<0] <- 0.05
  
### predicted survey weight  (use rnorm. Standard deviation varies by data year and age)
  
  srv_wt_ce <- as.data.frame(matrix(nrow=dim(srv_wt_post_ce)[1], ncol=dim(srv_wt_post_ce)[2]))
  names(srv_wt_ce) <- names(srv_wt_post_ce)
  srv_wt_ce[,1:3] <- srv_wt_post_ce[,1:3]
  
  for (i in 1:dim(srv_wt_ce)[1])
  {
    year <- srv_wt_ce$year[i]
    srv_wt_ce[i,4:16] <- rnorm(unlist(srv_wt_post_ce[i,4:16]),unlist(srv_wt_post_ce[i,4:16]),unlist(srv_wt_std[srv_wt_std$year==year,2:14]))
  }
  srv_wt_ce[,4:16][srv_wt_ce[,4:16]<0] <- 0.05

### predicted fishery weight  (use rnorm. Standard deviation varies by data year and age)
  
  fsh_wt_ce <- as.data.frame(matrix(nrow=dim(fsh_wt_post_ce)[1], ncol=dim(fsh_wt_post_ce)[2]))
  names(fsh_wt_ce) <- names(fsh_wt_post_ce)
  fsh_wt_ce[,1:3] <- fsh_wt_post_ce[,1:3]
  
  for (i in 1:dim(fsh_wt_ce)[1])
  {
    year <- fsh_wt_ce$year[i]
    fsh_wt_ce[i,4:16] <- rnorm(unlist(fsh_wt_post_ce[i,4:16]),unlist(fsh_wt_post_ce[i,4:16]),unlist(fsh_wt_std[fsh_wt_std$year==year,2:14]))
  }
  fsh_wt_ce[,4:16][fsh_wt_ce[,4:16]<0] <- 0.05 
  
  rm(prob,year,sam,tmp)
  

