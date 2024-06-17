#' Tabulate fits from models using extended metrics.
#'
#' This function takes a list of model outputs and compiles a dataframe with a broader set of fit metrics.
#'
#' @param M List containing model outputs.
#' @param mod_scen Optional vector of integers indicating which models in M to use. Default is all models.
#' @export
#'
#' @return Returns a dataframe with extended fit metrics.
tab_ref <- function(M, mod_scen=NULL){
  df <- NULL
  if (is.null(mod_scen)) mod_scen=1:length(M)

  for (ii in mod_scen) {
    x       <- M[[ii]]
    ssb    <- x$nextyrssbs;         names(ssb)            <- paste0("${B}_{", nextyr ,"}$")
    ssbcv  <- round(x$nextyrssb.cv,2);  names(ssbcv)      <- paste0("$CV_{B_{", nextyr ,"}}$")
    Bmsy   <- x$bmsys;         names(Bmsy)                <- "$B_{MSY}$"
    Bmsycv <- round(x$bmsy.cv,2); names(Bmsycv)           <- "$CV_{B_{MSY}}$"
    spr    <- paste0(round(x$sprmsy*100,0),"\\%");names(spr) <- "SPR rate at $F_{MSY}$"
    b35    <- x$b35s ;                 names(b35)         <- paste0("$B_{35\\%}$")
    pbmsy  <- paste0(round(100*x$ssb1/x$bmsy,0),"\\%");    names(pbmsy)<- paste0("${B}_{", nextyr ,"}/B_{MSY}$")
    bzero  <- x$b0s ;                 names(bzero)        <- paste0("$B_0$")
    dynb0  <- x$dynb0s;      names(dynb0)                 <- paste0("Est. $B_{",thisyr,"} / B_{",thisyr,",no fishing}$")
    b_bmsy <- paste0(round(x$curssb/x$bmsy*100,0),"\\%");      names(b_bmsy) <- paste0("$B_{",thisyr,"} / B_{MSY}$")
    steep  <- round(x$steep,2);               names(steep) <- "Steepness"
    v      <- c(ssb, ssbcv, Bmsy, Bmsycv, pbmsy, bzero,b35, spr ,steep, dynb0,b_bmsy)
    df     <- cbind(df, v)
  }
  df <- data.frame(rownames(df), df, row.names = NULL)
  names(df) <- c("Component",names(M[mod_scen]))
  return(df)
}
