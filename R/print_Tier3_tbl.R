#' Generate and Print Tier 3 Summary Tables
#'
#' This function generates and prints summary tables for a specified model configuration.
#' It calculates mean values for various metrics across different scenarios and displays
#' formatted tables for Catch, Spawning Stock Biomass (SSB), Fishing Mortality (F), and Allowable Biological Catch (ABC).
#'
#' @param mod_number Integer. Specifies the model configuration number.
#' @param run Logical. If `TRUE`, runs the projection model for the specified configuration. Default is `FALSE`.
#'
#' @details
#' The function reads projection results from a CSV file, groups data by alternative and year,
#' calculates mean values for specific metrics, and formats these into tables for each metric.
#' The tables are printed with captions based on the model configuration name.
#'
#' @return Prints formatted tables for Catch, SSB, F, and ABC. Does not return a value.
#'
#' @importFrom dplyr select group_by summarise spread
#' @importFrom xtable xtable
#'
#' @examples
#' # Example usage
#' print_Tier3_tbl(mod_number = 1, run = TRUE)
#'
#' @export
print_Tier3_tbl <- function(mod_number, run=FALSE) {
  .projdir <- paste0(.MODELDIR[mod_number], "proj/")
  if (run) system(paste0("cd ", .projdir, "; main "))

  bf <- data.frame(read.csv(paste0(.projdir, "spm_detail.csv")))

  bfsum <- bf %>%
    select(Alt, Year, SSB, F, ABC, Catch) %>%
    group_by(Alt, Year) %>%
    summarise(Catch = mean(Catch), SSB = mean(SSB), F = mean(F), ABC = mean(ABC), .groups = 'drop')

  tC <- bfsum %>% select(Alt, Year, Catch) %>% spread(Alt, Catch)
  names(tC) <- c("Catch", "Scenario 1", "Scenario 2", "Scenario 3", "Scenario 4", "Scenario 5", "Scenario 6", "Scenario 7")

  tB <- bfsum %>% select(Alt, Year, SSB) %>% spread(Alt, SSB)
  names(tB) <- c("SSB", "Scenario 1", "Scenario 2", "Scenario 3", "Scenario 4", "Scenario 5", "Scenario 6", "Scenario 7")

  tF <- bfsum %>% select(Alt, Year, F) %>% spread(Alt, F)
  names(tF) <- c("F", "Scenario 1", "Scenario 2", "Scenario 3", "Scenario 4", "Scenario 5", "Scenario 6", "Scenario 7")

  tA <- bfsum %>% select(Alt, Year, ABC) %>% spread(Alt, ABC)
  names(tA) <- c("ABC", "Scenario 1", "Scenario 2", "Scenario 3", "Scenario 4", "Scenario 5", "Scenario 6", "Scenario 7")

  tab <- (data.frame(tC))
  rownames(tab) <- c()
  cap <- paste0("For the configuration named ", mod_names[mod_number], ", ", tabcap[40])
  for (i in 2:length(tab[1,]) )
    tab[, i] <- formatC((tab[, i]), format = "d", big.mark = ",")
  tab <- xtable(tab, caption = cap, label = paste0("tbl:", tablab[40]), digits = 0, auto = TRUE, align = rep("r", (length(tab[1,]) + 1)))
  print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x) { x }, scalebox = .95, comment = FALSE)

  tab <- (data.frame(tA))
  cap <- paste0("For the configuration named ", mod_names[mod_number], ", ", tabcap[41])
  for (i in 2:length(tab[1,]) )
    tab[, i] <- formatC(as.numeric(tab[, i]), format = "d", big.mark = ",")
  tab <- xtable(tab, caption = cap, label = paste0("tbl:", tablab[41]), digits = 0, auto = TRUE, align = rep("r", (length(tab[1,]) + 1)))
  print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x) { x }, scalebox = .95, comment = FALSE)

  tab <- (data.frame(tF))
  cap <- paste0("For the configuration named ", mod_names[mod_number], ", ", tabcap[42])
  for (i in 2:length(tab[1,]) )
    tab[, i] <- formatC(as.numeric(tab[, i]), format = "f", digits = 3)
  tab <- xtable(tab, caption = cap, label = paste0("tbl:", tablab[42]), digits = c(0, rep(3, (length(tab[1,])))), auto = TRUE, align = rep("r", (length(tab[1,]) + 1)))
  print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x) { x }, scalebox = .95, comment = FALSE)

  tab <- (data.frame(tB))
  cap <- paste0("For the configuration named ", mod_names[mod_number], ", ", tabcap[43])
  for (i in 2:length(tab[1,]) )
    tab[, i] <- formatC(as.numeric(tab[, i]), format = "d", big.mark = ",")
  tab <- xtable(tab, caption = cap, label = paste0("tbl:", tablab[43]), digits = 0, auto = TRUE, align = rep("r", (length(tab[1,]) + 1)))
  print(tab, caption.placement = "top", include.rownames = FALSE, sanitize.text.function = function(x) { x }, scalebox = .95, comment = FALSE)
}
