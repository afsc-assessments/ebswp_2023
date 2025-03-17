# R/model_settings.R

#' Model Settings List
#'
#' A named list containing parameters and settings that control the behavior of a model.
#' This list includes options for stock recruitment, selectivity, natural mortality, and more.
#'
#' @format A list with the following components:
#' \describe{
#'   \item{DoCovBTS}{stan's covariance matrix option.}
#'   \item{SrType}{Stock Recruitment Type (1 = Ricker, 2 = Beverton-Holt, 3 = Constant, 4 = Old Ricker).}
#'   \item{Do_Combined}{Do combined surveys (0 = No, 1 = Yes).}
#'   \item{use_age_err}{Use ageing error matrix (0 = No, 1 = Yes).}
#'   \item{use_age1_ATS}{Use Age1 ATS Index (0 = No, 1 = Yes).}
#'   \item{age1_sigma_ATS}{Age1 ATS Index Sigma (log-normal distribution).}
#'   \item{use_endyr_len}{Use end-year length data (0 = No, 1 = Yes).}
#'   \item{use_popwts_ssb}{Use population weights for spawning (otherwise fishery weights) (0 = No, 1 = Yes).}
#'   \item{natmortprior}{Natural mortality prior.}
#'   \item{cvnatmortprior}{CV of natural mortality prior.}
#'   \item{natmort_in}{Natural mortality at age (vector for ages 1 to 15).}
#'   \item{q_all_prior}{Prior for all q values.}
#'   \item{q_all_sigma}{Sigma for all q values (ignored if greater than 1).}
#'   \item{q_bts_prior}{Prior for BTS q values.}
#'   \item{q_bts_sigma}{Sigma for BTS q values (ignored if greater than 1).}
#'   \item{sigrprior}{Prior for sigma R (based on 1978 onwards).}
#'   \item{cvsigrprior}{CV of sigma R prior.}
#'   \item{phase_sigr}{Phase for estimating sigma R.}
#'   \item{steepnessprior}{Prior for steepness.}
#'   \item{cvsteepnessprior}{CV of steepness prior.}
#'   \item{phase_steepness}{Phase for estimating steepness.}
#'   \item{use_spr_msy_pen}{Use prior as SPRF35 = Fmsy (0 = No, 1 = Yes).}
#'   \item{sigma_spr_msy}{Sigma for SPRF35 = Fmsy.}
#'   \item{use_last_ATS_ac}{Use last ATS age composition (0 = No, >0 = Yes).}
#'   \item{nyrs_sel_avg}{Number of years to average recent selectivity.}
#'   \item{do_bts_bio}{Use BTS Biomass (0 = Numbers, 1 = Biomass).}
#'   \item{do_ATS_bio}{Use ATS Biomass (0 = Numbers, 1 = Biomass).}
#'   \item{srprior_a}{Stock-Recruitment Prior Beta distribution alpha.}
#'   \item{srprior_b}{Stock-Recruitment Prior Beta distribution beta.}
#'   \item{nyrs_future}{Number of future years.}
#'   \item{next_yrs_catch}{Next year's catch.}
#'   \item{nscen}{Number of scenarios.}
#'   \item{fixed_catch_fut2}{Fixed catch in future scenario 2.}
#'   \item{fixed_catch_fut3}{Fixed catch in future scenario 3.}
#'   \item{phase_F40}{Phase to calculate F40%.}
#'   \item{robust_phase}{Phase to start robustness.}
#'   \item{ATS_robust_phase}{Phase for ATS robustness.}
#'   \item{ATS_like_type}{Likelihood for ATS (0 = standard, 1 = log-normal for each age).}
#'   \item{phase_logist_fsh}{Phase for fishery logistic selectivity.}
#'   \item{phase_logist_bts}{Phase for BTS logistic selectivity.}
#'   \item{phase_seldevs_fsh}{Phase for fishery selectivity deviations.}
#'   \item{phase_seldevs_bts}{Phase for BTS selectivity deviations.}
#'   \item{phase_age1devs_bts}{Phase for BTS Age1 deviations.}
#'   \item{phase_selcoffs_ATS}{Phase for ATS survey selectivity coefficients.}
#'   \item{phase_selcoffs_ATS_dev}{Phase for ATS survey selectivity deviations.}
#'   \item{phase_natmort}{Phase for natural mortality estimation.}
#'   \item{phase_q_bts}{Phase for BTS q estimation.}
#'   \item{phase_q_std_area}{Phase for standard BTS area q estimation.}
#'   \item{phase_q_ATS}{Phase for ATS q estimation.}
#'   \item{phase_bt}{Phase for bottom temperature effect on q.}
#'   \item{phase_rec_devs}{Phase for regular recruitment deviations.}
#'   \item{phase_larv}{Phase for larval recruitment deviations.}
#'   \item{phase_sr}{Phase to estimate stock-recruitment parameters (negative means constant recruitment).}
#'   \item{wt_fut_phase}{Phase of future weight uncertainty.}
#'   \item{last_age_sel_group_fsh}{Fishery: Number of oldest age groups to have the same selectivity.}
#'   \item{last_age_sel_group_bts}{BTS: Number of oldest age groups to have the same selectivity.}
#'   \item{last_age_sel_group_ATS}{ATS: Number of oldest age groups to have the same selectivity.}
#'   \item{ctrl_flag}{A numeric vector of control flags, where each element corresponds to a specific setting:
#'     \describe{
#'       \item{1}{Catch Biomass.}
#'       \item{2}{Survey Emphasis.}
#'       \item{3}{Recruitment Deviations.}
#'       \item{4}{Fishing mortality deviations (F_devs).}
#'       \item{5}{Lambda on ATS survey.}
#'       \item{6}{AVO (Acoustic Visual Observation) data.}
#'       \item{7}{Age Composition.}
#'       \item{8}{Age Composition Fishery.}
#'       \item{9}{Age Composition Survey Fishery.}
#'       \item{10}{Selectivity Trend (Fishery).}
#'       \item{11}{Selectivity Curvature (Fishery).}
#'       \item{12}{CPUE Data.}
#'       \item{13}{Fishery Selectivity Dome-shapedness.}
#'       \item{14}{Bottom Trawl Survey Dome-shapedness.}
#'       \item{15}{Non-Increasing Selectivity Penalty for Hydraulic Survey.}
#'       \item{16}{Number of years selectivity fishery stays the same.}
#'       \item{17}{Number of years selectivity stays the same in the survey.}
#'       \item{18}{Reserved.}
#'       \item{19}{Selectivity Deviation Surveys Curvature (Surveys).}
#'       \item{20}{BTS Time Variability.}
#'       \item{21}{BTS Smoothness (if nonparametric).}
#'       \item{22}{ATS Second-Difference.}
#'       \item{23}{Lambda on larval recruitment deviations.}
#'       \item{24}{Recruits from 1978 onwards only.}
#'       \item{25}{Ignore 1978 year class in estimation.}
#'       \item{26}{Reserved.}
#'       \item{27}{Third differencing in space (negative means no smoothing, positive = lambda).}
#'       \item{28}{Retrospective year.}
#'       \item{29}{Omit recent years from stock-recruitment estimation.}
#'       \item{30}{SRR Prior only (0 = use prior and data, otherwise weight on prior).}
#'     }
#'   \item{sel_dev_shift}{Selectivity block shift.}
#'   \item{phase_coheff}{Phase for cohort effect.}
#'   \item{phase_yreff}{Phase for year effect.}
#'   \item{switch_temp_recruitment}{Switch for temperature-dependent recruitment (0 = No, 1 = Yes).}
#'   \item{phase_temp_recruitment}{Phase for temperature-dependent recruitment.}
#'   \item{switch_pred_mort}{Switch for predator mortality (0 = No, 1 = Yes).}
#'   \item{phase_pred_mort}{Phase for predator mortality.}
#'   \item{switch_multispecies_functional_response}{Switch for multispecies functional response (0 = No, 1 = Yes).}
#' }
#'
#' @examples
#' model_settings <- list(
#'   DoCovBTS = 1,
#'   SrType = 1,
#'   Do_Combined = 0,
#'   use_age_err = 1,
#'   use_age1_ATS = 1,
#'   age1_sigma_ATS = 1,
#'   use_endyr_len = 0,
#'   use_popwts_ssb = 0,
#'   natmortprior = 0.3,
#'   cvnatmortprior = 0.1,
#'   natmort_in = c(0.9, 0.45, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3),
#'   q_all_prior = 0,
#'   q_all_sigma = 2,
#'   q_bts_prior = 0,
#'   q_bts_sigma = 2,
#'   sigrprior = 1,
#'   cvsigrprior = 0.2,
#'   phase_sigr = -6,
#'   steepnessprior = 0.6,
#'   cvsteepnessprior = 0.12,
#'   phase_steepness = 5,
#'   use_spr_msy_pen = 0,
#'   sigma_spr_msy = 0.20,
#'   use_last_ATS_ac = 1,
#'   nyrs_sel_avg = 2,
#'   do_bts_bio = 1,
#'   do_ATS_bio = 1,
#'   srprior_a = 14.93209877,
#'   srprior_b = 14.93209877,
#'   nyrs_future = 5,
#'   next_yrs_catch = 1350,
#'   nscen = 8,
#'   fixed_catch_fut2 = 1400,
#'   fixed_catch_fut3 = 1200,
#'   phase_F40 = 6,
#'   robust_phase = 1350,
#'   ATS_robust_phase = 1350,
#'   ATS_like_type = 0,
#'   phase_logist_fsh = -1,
#'   phase_logist_bts = 2,
#'   phase_seldevs_fsh = 4,
#'   phase_seldevs_bts = 5,
#'   phase_age1devs_bts = 3,
#'   phase_selcoffs_ATS = 3,
#'   phase_selcoffs_ATS_dev = -5,
#'   phase_natmort = -6,
#'   phase_q_bts = 3,
#'   phase_q_std_area = -4,
#'   phase_q_ATS = 4,
#'   phase_bt = -6,
#'   phase_rec_devs = 3,
#'   phase_larv = -3,
#'   phase_sr = 5,
#'   wt_fut_phase = 6,
#'   last_age_sel_group_fsh = 4,
#'   last_age_sel_group_bts = 8,
#'   last_age_sel_group_ATS = 8,
#'   ctrl_flag = c(200, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 12.5, 1, 1, 1, 1, 1, 1, 3.125, 5, 0.1, 5, 1, 1, 2, 1, 0, 2, 1),
#'   sel_dev_shift = 0,
#'   phase_coheff = 1,
#'   phase_yreff = 1,
#'   switch_temp_recruitment = 0,
#'   phase_temp_recruitment = 6,
#'   switch_pred_mort = 0,
#'   phase_pred_mort = 1,
#'   switch_multispecies_functional_response = 1
#' )
#'
#' @export
model_settings <- list(
  DoCovBTS = 1,
  SrType = 1,
  Do_Combined = 0,
  use_age_err = 1,
  use_age1_ATS = 1,
  age1_sigma_ATS = 1,
  use_endyr_len = 0,
  use_popwts_ssb = 0,
  natmortprior = 0.3,
  cvnatmortprior = 0.1,
  natmort_in = c(0.9, 0.45, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3),
  q_all_prior = 0,
  q_all_sigma = 2,
  q_bts_prior = 0,
  q_bts_sigma = 2,
  sigrprior = 1,
  cvsigrprior = 0.2,
  phase_sigr = -6,
  steepnessprior = 0.6,
  cvsteepnessprior = 0.12,
  phase_steepness = 5,
  use_spr_msy_pen = 0,
  sigma_spr_msy = 0.20,
  use_last_ATS_ac = 1,
  nyrs_sel_avg = 2,
  do_bts_bio = 1,
  do_ATS_bio = 1,
  srprior_a = 14.93209877,
  srprior_b = 14.93209877,
  nyrs_future = 5,
  next_yrs_catch = 1350,
  nscen = 8,
  fixed_catch_fut2 = 1400,
  fixed_catch_fut3 = 1200,
  phase_F40 = 6,
  robust_phase = 1350,
  ATS_robust_phase = 1350,
  ATS_like_type = 0,
  phase_logist_fsh = -1,
  phase_logist_bts = 2,
  phase_seldevs_fsh = 4,
  phase_seldevs_bts = 5,
  phase_age1devs_bts = 3,
  phase_selcoffs_ATS = 3,
  phase_selcoffs_ATS_dev = -5,
  phase_natmort = -6,
  phase_q_bts = 3,
  phase_q_std_area = -4,
  phase_q_ATS = 4,
  phase_bt = -6,
  phase_rec_devs = 3,
  phase_larv = -3,
  phase_sr = 5,
  wt_fut_phase = 6,
  last_age_sel_group_fsh = 4,
  last_age_sel_group_bts = 8,
  last_age_sel_group_ATS = 8,
  ctrl_flag = c(200, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 12.5, 1, 1, 1, 1, 1, 1, 3.125, 5, 0.1, 5, 1, 1, 2, 1, 0, 2, 1),
  sel_dev_shift = 0,
  phase_coheff = 1,
  phase_yreff = 1,
  switch_temp_recruitment = 0,
  phase_temp_recruitment = 6,
  switch_pred_mort = 0,
  phase_pred_mort = 1,
  switch_multispecies_functional_response = 1
)

