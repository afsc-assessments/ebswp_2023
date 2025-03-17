#' Input Data for Model Configuration
#'
#' A function that returns a list containing various parameters, settings, and data inputs required for model configuration.
#' This includes start years, recruitment ages, maturity proportions, weights, catch data, survey data, and more.
#'
#' @return A list with the following components:
#' \describe{
#'   \item{styr}{Start year for the model (e.g., 1964).}
#'   \item{styr_bts}{Start year for the bottom trawl survey (e.g., 1982).}
#'   \item{styr_ats}{Start year for the acoustic trawl survey (e.g., 1994).}
#'   \item{endyr}{End year for the model (e.g., 2024).}
#'   \item{recage}{Age at recruitment (e.g., 1).}
#'   \item{nages}{Number of ages in the model (e.g., 15).}
#'   \item{p_mature}{Proportion mature at age (vector of length `nages`).}
#'   \item{ew_ind}{End-weight index (vector of length `nages`).}
#'   \item{wt_fsh}{Fishery weight-at-age matrix (rows = years, columns = ages).}
#'   \item{wt_ssb}{Spawning stock biomass weight-at-age matrix (rows = years, columns = ages).}
#'   \item{obs_catch}{Observed catch data (vector of length `n_fsh`).}
#'   \item{obs_effort}{Observed effort data (vector of length `n_fsh`).}
#'   \item{n_cpue}{Number of CPUE data points.}
#'   \item{yrs_cpue}{Years for CPUE data (vector of length `n_cpue`).}
#'   \item{obs_cpue}{Observed CPUE data (vector of length `n_cpue`).}
#'   \item{obs_cpue_std}{Standard deviation for CPUE data (vector of length `n_cpue`).}
#'   \item{n_avo}{Number of acoustic survey data points.}
#'   \item{yrs_avo}{Years for acoustic survey data (vector of length `n_avo`).}
#'   \item{ob_avo}{Observed acoustic survey data (vector of length `n_avo`).}
#'   \item{ob_avo_std}{Standard deviation for acoustic survey data (vector of length `n_avo`).}
#'   \item{wt_avo}{Weight-at-age matrix for acoustic survey (rows = years, columns = ages).}
#'   \item{ngears}{Number of gears.}
#'   \item{minind}{Minimum index for each gear (vector of length `ngears`).}
#'   \item{n_fsh}{Number of fishery years.}
#'   \item{n_bts}{Number of bottom trawl survey years.}
#'   \item{n_ats}{Number of acoustic trawl survey years.}
#'   \item{yrs_fsh_data}{Years for fishery data (vector of length `n_fsh`).}
#'   \item{yrs_bts_data}{Years for bottom trawl survey data (vector of length `n_bts`).}
#'   \item{yrs_ats_data}{Years for acoustic trawl survey data (vector of length `n_ats`).}
#'   \item{sam_fsh}{Sample size for fishery data (vector of length `n_fsh`).}
#'   \item{sam_bts}{Sample size for bottom trawl survey data (vector of length `n_bts`).}
#'   \item{sam_ats}{Sample size for acoustic trawl survey data (vector of length `n_ats`).}
#'   \item{err_fsh}{Error for fishery data (vector of length `n_fsh`).}
#'   \item{err_bts}{Error for bottom trawl survey data (vector of length `n_bts`).}
#'   \item{err_ats}{Error for acoustic trawl survey data (vector of length `n_ats`).}
#'   \item{oac_fsh_data}{Observed age composition for fishery data (matrix of size `n_fsh` x `nages`).}
#'   \item{ob_bts}{Observed bottom trawl survey biomass (vector of length `n_bts`).}
#'   \item{ob_bts_std}{Standard deviation for bottom trawl survey biomass (vector of length `n_bts`).}
#'   \item{wt_bts}{Weight-at-age matrix for bottom trawl survey (rows = years, columns = ages).}
#'   \item{ot_bts}{Observed bottom trawl survey numbers-at-age (matrix of size `n_bts` x `nages`).}
#'   \item{oac_bts}{Observed age composition for bottom trawl survey (matrix of size `n_bts` x `nages`).}
#'   \item{ot_ats_std}{Standard deviation for acoustic trawl survey numbers-at-age (vector of length `n_ats`).}
#'   \item{oac_ats}{Observed age composition for acoustic trawl survey (matrix of size `n_ats` x `nages`).}
#'   \item{ob_ats}{Observed acoustic trawl survey biomass (vector of length `n_ats`).}
#'   \item{ob_ats_std}{Standard deviation for acoustic trawl survey biomass (vector of length `n_ats`).}
#'   \item{wt_ats}{Weight-at-age matrix for acoustic trawl survey (rows = years, columns = ages).}
#'   \item{bottom_temp}{Bottom temperature data (vector of length `n_fsh`).}
#'   \item{n_age_err}{Number of ageing error matrices.}
#'   \item{age_err}{Ageing error matrix (matrix of size `nages` x `nages`).}
#'   \item{nlbins}{Number of length bins.}
#'   \item{olc_fsh}{Observed length composition for fishery data (vector of length `nlbins`).}
#'   \item{age_len}{Age-length transition matrix (matrix of size `nages` x `nlbins`).}
#'   \item{test}{Test value (e.g., 1234567).}
#' }
#'
#' @examples
#' input_data <- get_input_data()
#'
#' @export
get_input_data <- function() {
  list(
    styr = 1964,
    styr_bts = 1982,
    styr_ats = 1994,
    endyr = 2024,
    recage = 1,
    nages = 15,
    p_mature = c(0, 0.008, 0.289, 0.641, 0.842, 0.901, 0.947, 0.963, 0.97, 1, 1, 1, 1, 1, 1),
    ew_ind = c(8, 7, 2, 9, 7, 7, 7, 7, 8, 6, 5, 7, 8, 8, 7, 5, 4, 6, 7, 8, 3, 7, 7, 7, 7, 8, 4, 6, 2, 1, 6, 6, 4, 4, 10, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4),
    wt_fsh = matrix(c(0.0066, 0.17, 0.303, 0.447, 0.589, 0.722, 0.84, 0.942, 1.029, 1.102, 1.163, 1.212, 1.253, 1.286, 1.312), nrow = 60, ncol = 15, byrow = TRUE),
    wt_ssb = matrix(c(0.084881666, 0.195868126, 0.313762788, 0.459295544, 0.588623602, 0.697818331, 0.796798739, 0.914861263, 1.056957011, 1.147231476, 1.290106451, 1.387917889, 1.43166676, 1.407002719, 1.522866931), nrow = 60, ncol = 15, byrow = TRUE),
    obs_catch = c(174.792, 230.551, 261.678, 550.362, 702.181, 862.789, 1256.565, 1743.763, 1874.534, 1758.919, 1588.39, 1356.736, 1177.822, 978.37, 979.431, 935.714, 958.28, 973.502, 955.964, 981.45, 1092.055, 1139.676, 1141.993, 859.416, 1228.721, 1229.6, 1455.193, 1195.66393, 1390.30916, 1326.60896, 1329.37306, 1264.24689, 1192.78109, 1124.43305, 1102.15914, 989.68031, 1132.70985, 1387.19702, 1480.77611, 1490.779227, 1480.551669, 1483.021809, 1488.031045, 1354.501789, 990.578068, 810.784346, 810.1859078, 1199.040625, 1205.221865, 1270.770468, 1297.422339, 1321.583785, 1352.680796, 1359.182092, 1379.287269, 1409.337138, 1367.22904, 1376.257582, 1105.418688, 1310.7156, 1300),
    obs_effort = c(0.56385, 0.38425, 0.35362, 0.67946, 0.62695, 0.60335, 1.03848, 1.55693, 1.5365, 1.72443, 1.57266, 1.49092, 1.28024, 1.526946667, 1.521949444, 1.519524352, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.48537341, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.4, 1.4),
    n_cpue,
    yrs_cpue,
    obs_cpue,
    obs_cpue_std,
    n_avo,
    yrs_avo,
    ob_avo,
    ob_avo_std,
    wt_avo,
    ngears,
    minind,
    n_fsh,
    n_bts,
    n_ats,
    yrs_fsh_data,
    yrs_bts_data,
    yrs_ats_data,
    sam_fsh,
    sam_bts,
    sam_ats,
    err_fsh,
    err_bts,
    err_ats,
    oac_fsh_data,
    ob_bts,
    ob_bts_std,
    wt_bts,
    ot_bts,
    oac_bts,
    ot_ats_std,
    oac_ats,
    ob_ats,
    ob_ats_std,
    wt_ats,
    bottom_temp,
    n_age_err,
    age_err,
    nlbins,
    olc_fsh,
    age_len,
    test
#' }
#'
  )
}
