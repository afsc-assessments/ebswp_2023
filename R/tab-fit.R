#' Tabulate fits from models using extended metrics.
#'
#' This function takes a list of model outputs and compiles a dataframe with a broader set of fit metrics.
#'
#' @param M List containing model outputs.
#' @param mod_scen Optional vector of integers indicating which models in M to use. Default is all models.
#'
#' @return Returns a dataframe with extended fit metrics.
#' @export
tab_fit <- function(M, mod_scen=NULL){
  df <- NULL
  if (is.null(mod_scen)) mod_scen=1:length(M)

  for (ii in mod_scen) {
    x <- M[[ii]]
    metrics <- c("rmse_bts", "rmse_ats", "rmse_avo", "rmse_cpue", "sdnr_bts", "sdnr_ats", "sdnr_avo",
                 "EffN_fsh", "EffN_bts", "EffN_ats", "cat_like", "surv_like", "age_like",
                 "sel_like", "Priors", "dat_like", "tot_like")
    v <- c()
    for (metric in metrics){
      if(metric == "EffN_fsh"){
        tmp <- round(mean(x[[metric]][28:dim(x[[metric]])[1], 2]), 2)
      } else {
        if(metric %in% c("EffN_bts", "EffN_ats"))
          tmp <- round(mean(x[[metric]][, 2]), 2)
        else
          tmp <- round(x[[metric]], 2)
      }
      names(tmp) <- paste0(upperCaseFirst(metric))
      v <- c(v, tmp)
    }
    df <- cbind(df, v)
  }
  df <- data.frame(rownames(df), df, row.names = NULL)
  names(df) <- c("Component", names(M[mod_scen]))

  return(df)
}

#' Helper function to convert the first character of a string to uppercase.
#'
#' @param s The input string.
#'
#' @return Returns the input string with the first character capitalized.
upperCaseFirst <- function(s) {
  paste0(toupper(substring(s, 1, 1)), substring(s, 2))
}

