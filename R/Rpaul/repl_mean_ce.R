# get the means and variances of the replicates

###   the bottom trawl survey biomass
eb_bts_repl_mean_and_var_ce <- as.data.frame(matrix(nrow=dim(obs_srv_biomass)[1], ncol=3))
names(eb_bts_repl_mean_and_var_ce) <- c("year","mean","var")
eb_bts_repl_mean_and_var_ce$year = obs_srv_biomass$year
n <- dim(eb_bts_repl_ce)[1]

for (i in 1:length(eb_bts_repl_mean_and_var_ce$year))
  {
     eb_bts_repl_mean_and_var_ce$mean[i] <-mean(eb_bts_repl_ce[,i+2])
     eb_bts_repl_mean_and_var_ce$var[i] <- var((eb_bts_repl_ce[,i+2]))*((n-1)/n)
  }


 ###   the eit biomass
 eit_biomass_repl_mean_and_var_ce <- as.data.frame(matrix(nrow=dim(obs_eit_biomass)[1], ncol=3))
 names(eit_biomass_repl_mean_and_var_ce) <- c("year","mean","var")
 eit_biomass_repl_mean_and_var_ce$year = obs_eit_biomass$year
 n <- dim(eb_eit_repl_ce)[1]
 
 for (i in 1:length(eit_biomass_repl_mean_and_var_ce$year))
 {
   eit_biomass_repl_mean_and_var_ce$mean[i] <-mean(eb_eit_repl_ce[,i+2])
   eit_biomass_repl_mean_and_var_ce$var[i] <- var((eb_eit_repl_ce[,i+2]))*((n-1)/n)
 }

###   the a1 eit index
ea1_eit_repl_mean_and_var_ce <- as.data.frame(matrix(nrow=dim(obs_eit_a1)[1], ncol=3))
names(ea1_eit_repl_mean_and_var_ce) <- c("year","mean","var")
ea1_eit_repl_mean_and_var_ce$year = obs_eit_a1$year
n <- dim(ea1_eit_repl_ce)[1]

for (i in 1:length(ea1_eit_repl_mean_and_var_ce$year))
{
  ea1_eit_repl_mean_and_var_ce$mean[i] <-mean(ea1_eit_repl_ce[,i+2])
  ea1_eit_repl_mean_and_var_ce$var[i] <- var((ea1_eit_repl_ce[,i+2]))*((n-1)/n)
}

###   the catch 
catch_repl_mean_and_var_ce <- as.data.frame(matrix(nrow=dim(obs_catch)[1], ncol=3))
names(catch_repl_mean_and_var_ce) <- c("year","mean","var")
catch_repl_mean_and_var_ce$year = obs_catch$year
n <- dim(catch_repl_ce)[1]

for (i in 1:length(catch_repl_mean_and_var_ce$year))
{
  catch_repl_mean_and_var_ce$mean[i] <-mean(catch_repl_ce[,i+2])
  catch_repl_mean_and_var_ce$var[i] <- var((catch_repl_ce[,i+2]))*((n-1)/n)
}


###   the cpue 
cpue_repl_mean_and_var_ce <- as.data.frame(matrix(nrow=dim(obs_cpue)[1], ncol=3))
names(cpue_repl_mean_and_var_ce) <- c("year","mean","var")
cpue_repl_mean_and_var_ce$year = obs_cpue$year
n <- dim(cpue_repl_ce)[1]

for (i in 1:length(cpue_repl_mean_and_var_ce$year))
{
  cpue_repl_mean_and_var_ce$mean[i] <-mean(cpue_repl_ce[,i+2])
  cpue_repl_mean_and_var_ce$var[i] <- var((cpue_repl_ce[,i+2]))*((n-1)/n)
}

### the avo
avo_repl_mean_and_var_ce <- as.data.frame(matrix(nrow=dim(obs_avo)[1], ncol=3))
names(avo_repl_mean_and_var_ce) <- c("year","mean","var")
avo_repl_mean_and_var_ce$year = obs_avo$year
n <- dim(avo_repl_ce)[1]

for (i in 1:length(avo_repl_mean_and_var_ce$year))
{
  avo_repl_mean_and_var_ce$mean[i] <-mean(avo_repl_ce[,i+2])
  avo_repl_mean_and_var_ce$var[i] <- var((avo_repl_ce[,i+2]))*((n-1)/n)
}


### the fishery age comps
eac_fsh_repl_mean_ce <- as.data.frame(matrix(nrow=dim(obs_fac)[1], ncol=dim(obs_fac)[2]))
eac_fsh_repl_var_ce  <- as.data.frame(matrix(nrow=dim(obs_fac)[1], ncol=dim(obs_fac)[2]))
names(eac_fsh_repl_mean_ce) <- names(obs_fac)
names(eac_fsh_repl_var_ce) <- names(obs_fac)
eac_fsh_repl_mean_ce$year = obs_fac$year
eac_fsh_repl_var_ce$year = obs_fac$year
n <- dim(eac_fsh_repl_ce)[1]/(length(obs_fac$year))

for (i in 1:length(eac_fsh_repl_mean_ce$year))
{
  year <- eac_fsh_repl_mean_ce$year[i] 
  tmp <- eac_fsh_repl_ce[eac_fsh_repl_ce$year==year,]
  eac_fsh_repl_mean_ce[i,2:16] <- apply(tmp[,4:18],2,mean)
  eac_fsh_repl_var_ce[i,2:16] <- apply(tmp[,4:18],2,var)*((n-1)/n)
}

### the survey age comps  
eac_bts_repl_mean_ce <- as.data.frame(matrix(nrow=dim(obs_sac)[1], ncol=dim(obs_sac)[2]))
eac_bts_repl_var_ce  <- as.data.frame(matrix(nrow=dim(obs_sac)[1], ncol=dim(obs_sac)[2]))
names(eac_bts_repl_mean_ce) <- names(obs_sac)
names(eac_bts_repl_var_ce) <- names(obs_sac)
eac_bts_repl_mean_ce$year = obs_sac$year
eac_bts_repl_var_ce$year = obs_sac$year
n <- dim(eac_bts_repl_ce)[1]/(length(obs_sac$year))

for (i in 1:length(eac_bts_repl_mean_ce$year))
{
  year <- eac_bts_repl_mean_ce$year[i] 
  tmp <- eac_bts_repl_ce[eac_bts_repl_ce$year==year,]
  eac_bts_repl_mean_ce[i,2:16] <- apply(tmp[,4:18],2,mean)
  eac_bts_repl_var_ce[i,2:16] <- apply(tmp[,4:18],2,var)*((n-1)/n)
}


### the eit age comps
eac_eit_repl_mean_ce <- as.data.frame(matrix(nrow=dim(obs_eit_ac)[1], ncol=dim(obs_eit_ac)[2]))
eac_eit_repl_var_ce  <- as.data.frame(matrix(nrow=dim(obs_eit_ac)[1], ncol=dim(obs_eit_ac)[2]))
names(eac_eit_repl_mean_ce) <- names(obs_eit_ac)
names(eac_eit_repl_var_ce) <- names(obs_eit_ac)
eac_eit_repl_mean_ce$year = obs_eit_ac$year
eac_eit_repl_var_ce$year = obs_eit_ac$year
n <- dim(eac_eit_repl_ce)[1]/(length(obs_eit_ac$year))

for (i in 1:length(eac_eit_repl_mean_ce$year))
{
  year <- eac_eit_repl_mean_ce$year[i] 
  tmp <- eac_eit_repl_ce[eac_eit_repl_ce$year==year,]
  eac_eit_repl_mean_ce[i,2:15] <- apply(tmp[,5:18],2,mean)
  eac_eit_repl_var_ce[i,2:15] <- apply(tmp[,5:18],2,var)*((n-1)/n)
}




