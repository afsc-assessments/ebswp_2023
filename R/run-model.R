#' run pollock model
#'
#' @param moddir directory where pollock model should be run
#' @export
#'
.run_mod <- function(moddir=mod_dir){
  rn        <- paste0("cd ",moddir,"; pm -nox -iprint 500")
	system(rn)
}
#' Run Multiple ADMB Models in Parallel
#'
#' This function uses parallel processing to run multiple ADMB models and
#' gather their outputs. After running the models, it also fetches certain variables
#' from a 'proj/spm_detail.csv' file associated with each model.
#'
#' @param rundir Character string. The base run directory path for the models, default is `runs`.
#' @param moddir Character vector. The directory paths for the models, default is `mod_dir`.
#' @param modnames Character vector. The names of the models, default is `mod_names`.
#' @param Output Logical. A flag indicating if any output should be displayed (e.g., messages,
#'   progress, etc.), default is `FALSE`.
#' @return A list containing the outputs of the ADMB models and the fetched variables.
#' @export
run_model <- function(moddir=mod_dir, rundir="runs",modnames=mod_names,Output=TRUE){
  modlst <- NULL
  nmods <- length(mod_dir)
  num_cores <- min(nmods,parallel::detectCores() - 1)
  cl <- parallel::makeCluster(num_cores)
  on.exit(parallel::stopCluster(cl))  # Ensure the cluster stops after function execution

  # Export necessary functions and objects to the cluster
  parallel::clusterExport(cl, c(".run_mod","read_fit", "read_admb", "read_rep"), envir=environment())

	moddir <- paste0(rundir,"/",moddir)
  # Fetch model results in parallel
  system.time(modlst <- parallel::parLapply(cl=cl, X=moddir, fun=.run_mod))
  if (Output)
    modlst <- get_results(rundir=rundir,mod_names.=modnames,moddir=moddir)
  return(modlst)
}
