#' Extract Tier 3 Results
#'
#' Extracts results relevant to Tier 3 analyses.
#'
#' @param proj_file A file path to the projection file.
#'
#' @return A list or vector of results relevant to Tier 3 analyses.
#'
#' @importFrom utils read.csv
#'
#' @examples
#' \dontrun{
#' proj_file_path <- "path/to/proj.csv"
#' tier3_results <- get_tier3_res(proj_file_path)
#' }
get_tier3_res <- function(proj_file) {
  X<-list()
  X$bfs        <- read_csv(proj_file,show_col_types = FALSE) |> mutate(Alt=Alternative)
  X$Tier3_ABC1 <- X$bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(ABC),0))
  X$Tier3_ABC1s<- format(round(1e3*X$Tier3_ABC1,-3),big.mark=",",scientific=F,digits=1)
  X$Tier3_OFL1 <- X$bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(OFL),0))
  X$Tier3_OFL1s<- format(round(1e3*X$Tier3_OFL1,-3),big.mark=",",scientific=F,digits=1)
  X$Tier3_SSB1 <- X$bfs %>% filter(Alt==2,Yr==nextyr)   %>% summarize(round(mean(SSB),0))
  X$Tier3_fabc1<- X$Tier3_ABC1 / X$ABC_biom1
  X$Tier3_fofl1<- X$Tier3_OFL1 / X$ABC_biom1
  X$Tier3_ABC2 <- X$bfs %>% filter(Alt==2,Yr==1+nextyr) %>% summarize(round(mean(ABC),0))
  X$Tier3_ABC2s<- format(round(1e3*X$Tier3_ABC2,-3),big.mark=",",scientific=F,digits=1)
  X$Tier3_OFL2 <- X$bfs %>% filter(Alt==2,Yr==1+nextyr) %>% summarize(round(mean(OFL),0))
  X$Tier3_OFL2s<- format(round(1e3*X$Tier3_OFL2,-3),big.mark=",",scientific=F,digits=1)
  X$Tier3_SSB2 <- X$bfs %>% filter(Alt==2,Yr==1+nextyr) %>% summarize(round(mean(SSB),0))
  X$Tier3_fabc2<- X$Tier3_ABC2 /X$ABC_biom2
  X$Tier3_fofl2<- X$Tier3_OFL2 /X$ABC_biom2
  return(X)
}
