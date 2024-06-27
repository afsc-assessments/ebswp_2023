#' run projection model DOESN"T WORK...dunno why
#'
#' @param moddir directory where pollock model should be run
#' @export
#'
.run_proj <- function(moddir=mod_dir){
  rn        <- paste0("cd ",moddir,"/proj; spm; ")
	system(rn)
}

#' run projection model for windows
#'
#' @param moddir directory where pollock model should be run
#' @export
#'
.run_proj_windows <- function(moddir=mod_dir){
  #make a batch file and run it
  #parallel function below only takes one arg from .run_mod_windows, so runs folder is hardwired here- not ideal
  #there is some way to make a dataframe or list input that Carey did not get working yet
  #run_name<-stringr::str_split_i(moddir, fixed("\\"),2) #this was an attempt to enter the runs folder and mod_dir in the same argument. It worked for a single run, but not within the parallel processing
  #my_file<-paste0("run_pm_carey_",run_name,".bat")
  my_file<-paste0("run_proj_carey_",moddir,".bat")
  write(paste0("cd ","C:\\GitProjects\\EBSpollock\\2023_runs\\",moddir,"\\proj "),my_file)
  #write(paste0("cd ","C:\\GitProjects\\EBSpollock\\",moddir," "),my_file)

  write(paste0("spm"),my_file,append = TRUE)
  system(my_file)
  file.remove(my_file)
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
run_proj <- function(moddir=mod_dir, rundir="runs",modnames=mod_names,run_on_mac=TRUE) {
  modlst <- NULL
  nmods <- length(mod_dir)
  num_cores <- min(nmods,parallel::detectCores() - 1)
  cl <- parallel::makeCluster(num_cores)
  on.exit(parallel::stopCluster(cl))  # Ensure the cluster stops after function execution

  if (run_on_mac) {
	moddir <- paste0(rundir,"/",moddir)
  # Export necessary functions and objects to the cluster
  parallel::clusterExport(cl, c(".run_proj","read_fit", "read_admb", "read_rep"), envir=environment())
  system.time(modlst <- parallel::parLapply(cl=cl, X=moddir, fun=.run_proj))
    } else {
    #run on windows
      #run on windows
      parallel::clusterExport(cl, c(".run_proj_windows","read_fit", "read_admb", "read_rep"), envir=environment())
      #moddir <- paste0(rundir,"\\",moddir)
      # Fetch model results in parallel
      system.time(modlst <- parallel::parLapply(cl=cl, X=moddir, fun=.run_proj_windows))
  }
}



