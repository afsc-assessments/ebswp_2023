#' run pollock model
#'
#' @param m directory where pollock model should be run
#' @param RRead results into list directory where pollock model should be run
#' @return
#' @export
#'
.run_mod <- function(moddir=.MODELDIR){
  rn <-  paste0("cd ",moddir,"; pm -nox -iprint 500")
	system(rn)
}
run_model <- function(m="base22", mod_names.=mod_names, Output=FALSE, use_make=FALSE){
  modlst <- NULL
  nmods <- length(mod_names.)
  num_cores<-detectCores()-1
  registerDoParallel(cores=num_cores)
  cl<-makeCluster(num_cores)
  clusterExport(cl, c(".run_mod","read_fit", "read_admb","read_rep"), envir=environment())
  system.time(modlst <- parLapply(clust <-cl,.fn,read_admb))
  names(modlst) <- mod_names.
  for (i in 1:nmods) {
    proj_file<- paste0(.MODELDIR[i],"proj/spm_detail.csv")
    modlst[[i]] <- c(modlst[[i]],get_vars(modlst[[i]]))
  }
  return(modlst)
  if (use_make)
	  system(paste0("cd ../runs/",m,"/; pm -nox -iprint 500"))
  else
	  system(paste0("cd ../runs/",m,"/; make"))
  if (Output)
    out<-get_results()

	return(out)
}
