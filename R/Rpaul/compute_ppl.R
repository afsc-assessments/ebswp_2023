# compute the posterior predictive loss

tmp <- sum((obs_fac[,-1] - eac_fsh_repl_mean_ce[,-1])^2)

ppl_results <- as.data.frame(matrix(nrow=11, ncol=3))
names(ppl_results) <- c('data_type','ce','not_ce')
ppl_results[,1] <- c('trawl_srv_bio','eit_srv_bio','eit_a1_biomass','fac','sac','eit_ac','catch','cpue','avo','srv_wgt','fsh_wgt')

# get the PPL for the trawl survey biomass

ppl_results[1,2]  <- sum(eb_bts_repl_mean_and_var_ce$var) +  sum(( obs_srv_biomass$biom - eb_bts_repl_mean_and_var_ce$mean)^2)
ppl_results[1,3]  <- sum(eb_bts_repl_mean_and_var_not_ce$var) +  sum(( obs_srv_biomass$biom - eb_bts_repl_mean_and_var_not_ce$mean)^2)


# get the PPL for the eit survey biomass

ppl_results[2,2]  <- sum(eit_biomass_repl_mean_and_var_ce$var) +  sum(( obs_eit_biomass$biom - eit_biomass_repl_mean_and_var_ce$mean)^2)
ppl_results[2,3]  <- sum(eit_biomass_repl_mean_and_var_not_ce$var) +  sum(( obs_eit_biomass$biom - eit_biomass_repl_mean_and_var_not_ce$mean)^2)

# get the PPL for the eit age 1 survey 

ppl_results[3,2]  <- sum(ea1_eit_repl_mean_and_var_ce$var) +  sum(( obs_eit_a1$eit_a1 - ea1_eit_repl_mean_and_var_ce$mean)^2)
ppl_results[3,3]  <- sum(ea1_eit_repl_mean_and_var_not_ce$var) +  sum(( obs_eit_a1$eit_a1 - ea1_eit_repl_mean_and_var_not_ce$mean)^2)

# get the PPL for the fishery age comps

ppl_results[4,2] <- sum(eac_fsh_repl_var_ce[,-1]) + sum((obs_fac[,-1] - eac_fsh_repl_mean_ce[,-1])^2)
ppl_results[4,3] <- sum(eac_fsh_repl_var_not_ce[,-1]) + sum((obs_fac[,-1] - eac_fsh_repl_mean_not_ce[,-1])^2)

# get the PPL for the survey age comps

ppl_results[5,2] <- sum(eac_bts_repl_var_ce[,-1]) + sum((obs_sac[,-1] - eac_bts_repl_mean_ce[,-1])^2)
ppl_results[5,3] <- sum(eac_bts_repl_var_not_ce[,-1]) + sum((obs_sac[,-1] - eac_bts_repl_mean_not_ce[,-1])^2)

# get the PPL for the eit age comps

ppl_results[6,2] <- sum(eac_eit_repl_var_ce[,-1]) + sum((obs_eit_ac[,-1] - eac_eit_repl_mean_ce[,-1])^2)
ppl_results[6,3] <- sum(eac_eit_repl_var_not_ce[,-1]) + sum((obs_eit_ac[,-1] - eac_eit_repl_mean_not_ce[,-1])^2)

# get the PPL for the catch

ppl_results[7,2]  <- sum(catch_repl_mean_and_var_ce$var) +  sum(( obs_catch$catch - catch_repl_mean_and_var_ce$mean)^2)
ppl_results[7,3]  <- sum(catch_repl_mean_and_var_not_ce$var) +  sum(( obs_catch$catch - catch_repl_mean_and_var_not_ce$mean)^2)

# get the PPL for the cpue

ppl_results[8,2]  <- sum(cpue_repl_mean_and_var_ce$var) +  sum(( obs_cpue$cpue - cpue_repl_mean_and_var_ce$mean)^2)
ppl_results[8,3]  <- sum(cpue_repl_mean_and_var_not_ce$var) +  sum(( obs_cpue$cpue - cpue_repl_mean_and_var_not_ce$mean)^2)

# get the PPL for the avo

ppl_results[9,2]  <- sum(avo_repl_mean_and_var_ce$var) +  sum(( obs_avo$avo - avo_repl_mean_and_var_ce$mean)^2)
ppl_results[9,3]  <- sum(avo_repl_mean_and_var_not_ce$var) +  sum(( obs_avo$avo - avo_repl_mean_and_var_not_ce$mean)^2)


#sum(eb_bts_repl_mean_and_var_ce$var) +  sum((eb_bts_repl_mean_and_var_ce$mean - obs_srv_biomass$biom)^2)

#sum(ea1_eit_repl_mean_and_var_ce$var) +  sum((ea1_eit_repl_mean_and_var_ce$mean - obs_eit_a1$eit_a1)^2)

