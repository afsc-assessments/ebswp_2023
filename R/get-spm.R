#' Fetch standard projection model Results
#'
#' This function fetches model results based on specified model names and directories.
#'
#' @param modlst to add projection results to
#' @param rundir The main sub directory path for the models. Default is 'runs'
#' @param moddir The main directory path for the models. Default is 'mod_dir'
#' @return A list containing model results.
#' @export
get_spm <- function(modlst, rundir="runs",moddir=mod_dir,run_on_mac=TRUE) {
 if (run_on_mac) {
  fn        <- paste0(rundir,"/",moddir,"/proj/spm_detail.csv")
 } else {
   #run on windows
   fn <- paste0(rundir,"\\",moddir,"\\proj\\spm_detail.csv") #rundir is "C:\\GitProjects\\EBSpollock\\2023_runs\\"
 }
  nmods <- length(mod_names.)
  # Additional processing for each model result
  for (i in 1:nmods) {
    # Note this assumes fn has "pm" at the end...
    modlst[[i]] <- c(modlst[[i]], get_vars(modlst[[i]],proj_file=fn[i]))
  }
}
