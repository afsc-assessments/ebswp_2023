#' run projection model DOESN"T WORK...dunno why
#'
#' @param moddir directory where pollock model should be run
#' @export
#'
.run_proj <- function(moddir=mod_dir){
  rn        <- paste0("cd ",moddir,"/proj; spm; ")
	system(rn)
}
#' Run Multiple projection models in Parallel
#'
#' This function uses parallel processing to run multiple ADMB models and
#' gather their outputs. After running the models, it also fetches certain variables
#' from a 'proj/spm_detail.csv' file associated with each model.
#'
#' @param rundir Character string. The base run directory path for the models, default is `runs`.
#' @param moddir Character vector. The directory paths for the models, default is `mod_dir`.
#' @param modnames Character vector. The names of the models, default is `mod_names`.
#'   progress, etc.), default is `FALSE`.
#' @export
run_proj <- function(moddir=mod_dir, rundir="runs",modnames=mod_names){
  modlst <- NULL
  nmods <- length(mod_dir)
  num_cores <- min(nmods,parallel::detectCores() - 1)
  cl <- parallel::makeCluster(num_cores)
  on.exit(parallel::stopCluster(cl))  # Ensure the cluster stops after function execution
	moddir <- paste0(rundir,"/",moddir)

  # Export necessary functions and objects to the cluster
  parallel::clusterExport(cl, c(".run_proj","read_fit", "read_admb", "read_rep"), envir=environment())

}
