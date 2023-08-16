#' Fetch Model Results in Parallel
#'
#' This function fetches model results based on specified model names and directories.
#'
#' @param mod_names. A character vector of model names. Default is 'mod_names'.
#' @param moddir The main directory path for the models. Default is 'mod_dir'
#' @return A list containing model results.
#' @export
get_results <- function(mod_names.=mod_names, moddir=mod_dir) {
  fn        <- paste0("runs/",moddir,"/pm")
  nmods <- length(mod_names.)
  num_cores <- parallel::detectCores() - 1
  cl <- parallel::makeCluster(num_cores)
  on.exit(parallel::stopCluster(cl))  # Ensure the cluster stops after function execution

  # Export necessary functions and objects to the cluster
  parallel::clusterExport(cl, c("read_fit", "read_admb", "read_rep"), envir=environment())

  # Fetch model results in parallel
  system.time(modlst <- parallel::parLapply(cl=cl, X=fn, fun=read_admb))
  names(modlst) <- mod_names.

  # Additional processing for each model result
  for (i in 1:nmods) {
    # Note this assumes fn has "pm" at the end...
    proj_file <- paste0(substr(fn[i], start=1, stop=nchar(fn[i])-2), "proj/spm_detail.csv")
    modlst[[i]] <- c(modlst[[i]], get_vars(modlst[[i]],proj_file=proj_file))
  }

  return(modlst)
}
