tab_fit <- function(M,mod_scen=NULL){
df <- NULL
if (is.null(mod_scen)) mod_scen=1:length(M)
  for (ii in mod_scen) {
      x         <- M[[ii]]
      rmse_bts  <- round(x$rmse_bts,2); names(rmse_bts)   <- paste0("RMSE BTS")
      rmse_ats  <- round(x$rmse_ats,2); names(rmse_ats)   <- paste0("RMSE ATS")
      rmse_avo  <- round(x$rmse_avo,2); names(rmse_avo)   <- paste0("RMSE AVO")
      rmse_cpue <- round(x$rmse_cpue,2); names(rmse_cpue) <- paste0("RMSE CPUE")
      sdnr_bts  <- round(x$sdnr_bts,2); names(sdnr_bts)   <- paste0("SDNR BTS")
      sdnr_ats  <- round(x$sdnr_ats,2); names(sdnr_ats)   <- paste0("SDNR ATS")
      sdnr_avo  <- round(x$sdnr_avo,2); names(sdnr_avo)   <- paste0("SDNR AVO")
      effn_fsh  <- round(mean(x$EffN_fsh[28:dim(x$EffN_fsh)[1],2]),2); names(effn_fsh) <- paste0("Eff. N Fishery")
      effn_bts  <- round(mean(x$EffN_bts[,2]),2); names(effn_bts) <- paste0("Eff. N BTS")
      effn_ats  <- round(mean(x$EffN_ats[,2]),2); names(effn_ats) <- paste0("Eff. N ATS")
      bts_like  <- round(x$surv_like[1],2); names(bts_like) <- paste0("BTS NLL")
      ats_like  <- round(x$surv_like[2],2); names(ats_like) <- paste0("ATS NLL")
      avo_like  <- round(x$surv_like[3],2); names(avo_like) <- paste0("AVO NLL")
      fac_like  <- round(x$age_like[1],2); names(fac_like) <- paste0("Fish Age NLL")
      bac_like  <- round(x$age_like[2],2); names(bac_like) <- paste0("BTS Age NLL")
      aac_like  <- round(x$age_like[3],2); names(aac_like) <- paste0("ATS Age NLL")
      v      <- c( rmse_bts, rmse_ats, rmse_avo, rmse_cpue, sdnr_bts, sdnr_ats, sdnr_avo, 
      	           effn_fsh, effn_bts, effn_ats, bts_like, ats_like, avo_like, fac_like, bac_like, aac_like)
      df     <- cbind(df, v)
  }
  df <- data.frame(rownames(df), df, row.names = NULL)
  names(df) <- c("Component",names(M[mod_scen]))
  return(df)
}