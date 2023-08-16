#' run pollock model
#'
#' @param m directory where pollock model should be run
#' @param RRead results into list directory where pollock model should be run
#' @return
#'
.run_mod <- function(moddir=mod_dir){
  rn        <- paste0("cd runs/",moddir,"; pm")
	system(rn)
}
run_model <- function(moddir=mod_dir, modnames=mod_names, Output=FALSE, use_make=FALSE){
  modlst <- NULL
  nmods <- length(modnames)
  num_cores<-detectCores()-1
  registerDoParallel(cores=num_cores)
  cl<-makeCluster(num_cores)
  clusterExport(cl, c(".run_mod","read_fit", "read_admb","read_rep"), envir=environment())
  system.time(modlst <- parLapply(clust <-cl,mod_dir,read_admb))
  names(modlst) <- modnames
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

mod_dir
