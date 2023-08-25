#' Best F
#'
#'  Use this year's model to recalculate the F for the previous year that would have produced the specified OFL for the previous year
#'
#'
#' @param data data.frame in form (age, naa, waa, saa)
#' @param m natural mortality (for both sexes(\code{type=1}) or for sex 1 (\code{type=2} or \code{type=3} estimates))
#' @param last_ofl OFL from the previous assessment
#' @param type 1 = 1 sex - 1 gear; 2 = 1 sex - 2 gear; 3 = 2 sex - 1 gear - 2m; 4 = 2 sex - 2 gear - 2m
#' @param f_ratio  is the final ratio of catch between gears in the previous year, as estimated by this year's model - only needed if using multiple gear types
#' @param m2 is the second estimate of natural mortality
#'
#' @return The estimated F_OFL
#' @export
#'
#' @examples
#'
#' oneone <- data.frame(age = 1:9,
#' naa = c(15.27, 10.85, 0.24, 8.72, 2.49, 10.66, 3.92, 3.71, 2.6),
#' waa = c(0.69, 1.11, 1.54, 1.95, 2.32, 2.64, 2.91, 3.41, 3.33),
#' saa = c(0.01,	0.1	, 0.57, 0.94, 0.99, 1, 1,	1, 1))
#'
#'
#' onetwo <- data.frame(age = 1:9,
#'                     naa = c(15.27, 10.85, 0.24, 8.72, 2.49, 10.66, 3.92, 3.71, 2.6),
#'                     waa = c(0.69, 1.11, 1.54, 1.95, 2.32, 2.64, 2.91, 3.41, 3.33),
#'                     saa01 = c(0.01,	0.1	, 0.57, 0.94, 0.99, 1, 1,	1, 1),
#'                     saa01 = c(0.01, 0.06, 0.34, 0.82, 0.97, 1, 1, 1, 1))
#'
#' twotwo = structure(list(age = 2:10,
#'                        naa1 = c(7.64, 5.43, 0.12, 4.36, 1.24,5.33, 1.96, 1.85, 1.3),
#'                        naa2 = c(7.64, 5.42, 0.12, 4.4, 1.27,5.44, 2, 1.89, 1.32),
#'                        waa1 = c(0.97, 1.46, 1.88, 2.22, 2.48, 2.67, 2.81, 2.91, 2.99),
#'                        waa2 = c(0.92, 1.48, 2.05, 2.6, 3.09, 3.52, 3.89, 4.19, 4.44),
#'                        saa11 = c(0.01, 0.1, 0.57, 0.94, 0.99, 1, 1, 1, 1),
#'                        saa21 = c(0.01, 0.06, 0.34, 0.82, 0.97, 1, 1, 1, 1),
#'                        saa12 = c(0.12, 0.37, 0.62, 0.82, 0.94, 1, 1, 0.96, 0.89),
#'                        saa22 = c(0.01, 0.13, 0.38, 0.66, 0.89, 1, 1, 0.92, 0.79)),
#'                   class = "data.frame", row.names = c(NA, -9L))
#'
#' type 1
#' best_f(m = 0.1, last_ofl = 15, data = oneone, type = 1)
#' type 2
#' best_f(m = 0.1, last_ofl = 15, data = onetwo, type = 2, f_ratio = 0.1)
#' type 3
#' best_f(m = 0.12, last_ofl = 15, data = twotwo, type = 3, f_ratio = 0.1, m2 = 0.08)
#' type 4
#' best_f(m = 0.12, last_ofl = 15, data = twotwo, type = 4, f_ratio = 0.1, m2 = 0.08)

#'
best_f <- function(data, m, last_ofl, type = 1, f_ratio = NULL, m2 = NULL){

  # helper function
  catch = function(naa, waa, saa, m, f_ofl, f_ratio = NULL){

    if(!is.null(f_ratio)){
      naa * waa * saa * f_ofl * (1 - f_ratio) /
        (f_ofl * (1 - f_ratio) * saa + m) * (1 - exp(-f_ofl * (1 - f_ratio) * saa - m))
    } else {
      naa * waa * saa * f_ofl /
        (f_ofl * saa + m) * (1 - exp(-f_ofl * saa - m))
    }
  }


  if(type == 1){
    # 1 sex - 1 gear
    names(data) <- c("age", "naa", "waa", "saa")

    naa = data$naa
    waa = data$waa
    saa = data$saa

    g = function(f_ofl){
      (last_ofl - sum(catch(naa, waa, saa, m, f_ofl)))^2
    }
  }

  if(type == 2){
    # 1 sex - 2 gear

    if(is.null(f_ratio)){
      stop("you must provide the final ratio of catch between gears in the
             previous year, as estimated by this year's model ")
    }

    names(data) <- c("age", "naa", "waa", "saa_01", "saa_02")

    naa = data$naa
    waa = data$waa
    saa_01 = data$saa_01
    saa_02 = data$saa_02

    g = function(f_ofl){
      (last_ofl - sum(catch(naa, waa, saa_01, m, f_ofl, f_ratio),
                      catch(naa, waa, saa_02, m, f_ofl, f_ratio)))^2
    }
  }

  if(type == 3){
    # 2 sex - 1 gear - 2 M

    if(is.null(m2)){
      stop("you must provide two natural mortality values")
    }

    names(data) <- c("age", "naa_1", "naa_2", "waa_1", "waa_2", "saa_1", "saa_2")

    naa_1 = data$naa_1
    naa_2 = data$naa_2
    waa_1 = data$waa_1
    waa_2 = data$waa_2
    saa_1 = data$saa_1
    saa_2 = data$saa_2



    g = function(f_ofl){
      (last_ofl - sum(catch(naa_1, waa_1, saa_1, m, f_ofl),
                      catch(naa_2, waa_2, saa_2, m2, f_ofl)))^2
    }
  }

  if(type == 4){
    # 2 sex - 2 gear - 2 M

    if(is.null(f_ratio)){
      stop("you must provide the final ratio of catch between gears in the
             previous year, as estimated by this year's model ")
    }

    if(is.null(m2)){
      stop("you must provide two natural mortality values")
    }

    names(data) <- c("age", "naa_1", "naa_2", "waa_1", "waa_2", "saa_11", "saa_21", "saa_12", "saa_22")

    naa_1 = data$naa_1
    naa_2 = data$naa_2
    waa_1 = data$waa_1
    waa_2 = data$waa_2
    saa_11 = data$saa_11
    saa_21 = data$saa_21
    saa_12 = data$saa_12
    saa_22 = data$saa_22


    g = function(f_ofl){
      (last_ofl - sum(catch(naa_1, waa_1, saa_11, m, f_ofl, f_ratio),
                      catch(naa_2, waa_2, saa_21, m2, f_ofl, f_ratio),
                      catch(naa_1, waa_1, saa_12, m, f_ofl, f_ratio),
                      catch(naa_2, waa_2, saa_22, m2, f_ofl, f_ratio)))^2
    }
  }


  paste0("Type ", type, " corresponding F_OFL = ", optimize(g, c(0, 1))$minimum)

