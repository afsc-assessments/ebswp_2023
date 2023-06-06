#V3.30.xx.yy;_safe;_compile_date:_Apr 20 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.3
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#C 2022 ebspollock control file
#_data_and_control_files: ebswp_data.ss // ebswp_control.ss
1  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns (Growth Patterns, Morphs, Bio Patterns, GP are terms used interchangeably in SS3)
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Platoon_within/between_stdev_ratio (no read if N_platoons=1)
#_Cond  1 #vector_platoon_dist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
0 #_Nblock_Patterns
#_Cond 0 #_blocks_per_pattern 
# begin and end years of blocks
#
# controls for all timevary parameters 
1 #_time-vary parm bound check (1=warn relative to base parm bounds; 3=no bound check); Also see env (3) and dev (5) options to constrain with base bounds
#
# AUTOGEN
 1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen time-varying parms of this category; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: P(y)=f(TVP,env_Zscore) w/ logit to stay in min-max;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  5: like 4 with logit transform to stay in base min-max
#_DevLinks(more):  21-25 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, wt-len, maturity, fecundity, (hermaphro), recr_distr, cohort_grow, (movement), (age error), (catch_mult), sex ratio 
#_NATMORT
3 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=BETA:_Maunder_link_to_maturity
0.9 0.6 0.45 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3 0.3
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
15 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
5 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Age_Fecundity by growth pattern from wt-at-age.ss now invoked by read bodywt flag
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach for M, G, CV_G:  1- direct, no offset**; 2- male=fem_parm*exp(male_parm); 3: male=female*exp(parm) then old=young*exp(parm)
#_** in option 1, any male parameter with value = 0.0 and phase <0 is set equal to female parameter
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
# 0.05 0.6 0.275552 -1.2 0.1 3 4 0 0 0 0 0 0 0 # NatM_uniform_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 2 15 5 32 99 0 -5 0 0 0 0 0 0 0 # L_at_Amin_Fem_GP_1
 45 60 53.2 50 99 0 -3 0 0 0 0 0 0 0 # L_at_Amax_Fem_GP_1
 0.2 0.4 0.3 0.3 99 0 -3 0 0 0 0 0 0 0 # VonBert_K_Fem_GP_1
 0.03 0.16 0.066 0.1 99 0 -5 0 0 0 0 0 0 0 # CV_young_Fem_GP_1
 0.03 0.16 0.062 0.1 99 0 -5 0 0 0 0 0 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 7e-06 7e-06 99 0 -50 0 0 0 0 0 0 0 # Wtlen_1_Fem_GP_1
 -3 3 2.9624 2.9624 99 0 -50 0 0 0 0 0 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 -3 43 36.89 36.89 99 0 -50 0 0 0 0 0 0 0 # Mat50%_Fem_GP_1
 -3 3 -0.48 -0.48 99 0 -50 0 0 0 0 0 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 1 99 0 -50 0 0 0 0 0 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 0 99 0 -50 0 0 0 0 0 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Hermaphroditism
#  Recruitment Distribution  
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_GP_1
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_Area_1
 0 2 1 1 99 0 -50 0 0 0 0 0 0 0 # RecrDist_month_1
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 0 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-05 0.99999 0.5 0.5 0.5 0 -99 0 0 0 0 0 0 0 # FracFemale_GP_1
#  M2 parameter for each predator fleet
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 1=NA; 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
            8            17       14.0963            12            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1      0.820323         0.777         0.113             2          4          0          0          0          0          0          0          0 # SR_BH_steep
             1           1.6           1.4           1.1            99             0         -6          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -50          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            99             0        -50          0          0          0          0          0          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1970 # first year of main recr_devs; early devs can preceed this era
2022 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1949 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 3 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1965 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1971 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2019 #_last_yr_fullbias_adj_in_MPD
 2021 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS3 sets bias_adj to 0.0 for fcast yrs)
 -1 #_max_bias_adj_in_MPD (typical ~0.8; -3 sets all years to 0.0; -2 sets all non-forecast yrs w/ estimated recdevs to 1.0; -1 sets biasadj=1.0 for all yrs w/ recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -6 #min rec_dev
 6 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019R 2020R 2021R 2022R 2023F 2024F 2025F 2026F
#  -0.414329 -0.149949 -0.162548 -0.195192 -0.265676 -0.37382 -0.459774 -0.407185 -0.196429 -0.0998988 -0.35902 -0.337866 0.378203 0.385726 -0.0264099 1.05603 0.468075 1.11204 0.835226 0.687676 0.659766 0.00285636 0.1263 0.220207 0.234315 0.0647412 0.263609 -0.382114 -0.697429 1.93497 -0.331217 1.04906 0.569695 0.824642 0.666387 0.945771 0.118081 -0.505208 -0.795078 -0.793608 1.41498 0.401247 -0.368467 1.45407 -0.800112 -0.74144 0.551277 1.01587 -0.138825 -0.364757 0.709731 0.969966 0.611484 -0.0260119 -0.82402 -1.55498 0.0162588 0.504335 -0.755664 1.39904 0.338764 -0.552699 -1.08705 0.941414 1.38565 -1.42765 -1.57478 -1.58849 -1.18169 0.693835 -0.996564 -2.02081 0.0404393 0.039679 0 0 0 0
#
#Fishing Mortality info 
0.1 # F ballpark value in units of annual_F
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope midseason rate; 2=F as parameter; 3=F as hybrid; 4=fleet-specific parm/hybrid (#4 is superset of #2 and #3 and is recommended)
1.5 # max F (methods 2-4) or harvest fraction (method 1)
5  # N iterations for tuning in hybrid mode; recommend 3 (faster) to 5 (more precise if many fleets)
#
#_initial_F_parms; for each fleet x season that has init_catch; nest season in fleet; count = 0
#_for unconstrained init_F, use an arbitrary initial catch and set lambda=0 for its logL
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#
# F rates by fleet x season
# Yr:  1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Fishery 0.0281714 0 0.0376476 0.0717569 0.0876973 0.0976948 0.134319 0.184139 0.204366 0.211428 0.214536 0.209487 0.205298 0.185378 0.196092 0.204657 0.222865 0.180298 0.159498 0.123876 0.123169 0.124673 0.121703 0.0883911 0.127319 0.135471 0.185982 0.198905 0.250428 0.169432 0.207175 0.184847 0.231317 0.225851 0.176557 0.158488 0.180207 0.202752 0.242505 0.321077 0.275218 0.387607 0.29085 0.300319 0.289418 0.209805 0.167305 0.52366 0.306235 0.253428 0.291258 0.325455 0.290868 0.551743 0.311699 0.334621 0.537189 0.733421 0.761567 7.30196e-05 0.263958 0.462739 0.74944
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         2         1         0         1         0         1  #  Acoustic_Survey
         3         1         0         1         0         1  #  bottom_Survey
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15     -0.440746             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Acoustic_Survey(2)
          0.01           1.2     0.0100279        0.0755           0.8             0         -4          0          0          0          0          0          0          0  #  Q_extraSD_Acoustic_Survey(2)
           -15            15      0.254831             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_bottom_Survey(3)
          0.01           1.2     0.0100115        0.0755           0.8             0         -4          0          0          0          0          0          0          0  #  Q_extraSD_bottom_Survey(3)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0;  parm=0; selex=1.0 for all sizes
#Pattern:_1;  parm=2; logistic; with 95% width specification
#Pattern:_5;  parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_11; parm=2; selex=1.0  for specified min-max population length bin range
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6;  parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8;  parm=8; double_logistic with smooth transitions and constant above Linf option
#Pattern:_9;  parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_2;  parm=6; double_normal with sel(minL) and sel(maxL), using joiners, back compatibile version of 24 with 3.30.18 and older
#Pattern:_25; parm=3; exponential-logistic in length
#Pattern:_27; parm=special+3; cubic spline in length; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=special+3+2; cubic spline; like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 0 0 0 0 # 1 Fishery
 0 0 0 0 # 2 Acoustic_Survey
 0 0 0 0 # 3 bottom_Survey
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic. Recommend using pattern 18 instead.
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age; parm1==1 resets knots; parm1==2 resets all 
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#Age patterns entered with value >100 create Min_selage from first digit and pattern from remainder
#_Pattern Discard Male Special
 17 0 0 15 # 1 Fishery
 17 0 0 15 # 2 Acoustic_Survey
 17 0 0 15 # 3 bottom_Survey
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Fishery LenSelex
# 2   Acoustic_Survey LenSelex
# 3   bottom_Survey LenSelex
# 1   Fishery AgeSelex
         -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P1_Fishery(1)
            -1             1             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P2_Fishery(1)
            -5             9       2.24478            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P3_Fishery(1)
            -5             9       1.83032            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P4_Fishery(1)
            -5             9      0.353077            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P5_Fishery(1)
            -5             9       0.52205            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P6_Fishery(1)
            -5             9      0.241826            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P7_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P8_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P9_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P10_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P11_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P12_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P13_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P14_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P15_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P21_Fishery(1)
# 2   Acoustic_Survey AgeSelex
         -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P1_Acoustic_Survey(2)
         -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P2_Acoustic_Survey(2)
            -1             1             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P3_Acoustic_Survey(2)
            -5             9      -1.23985            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P4_Acoustic_Survey(2)
            -5             9      0.962462            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P5_Acoustic_Survey(2)
            -5             9     -0.488382            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P6_Acoustic_Survey(2)
            -5             9       0.36517            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P7_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P8_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P9_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P10_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P11_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P12_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P13_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P14_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P15_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P21_Acoustic_Survey(2)
# 3   bottom_Survey AgeSelex
         -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P1_bottom_Survey(3)
         -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P2_bottom_Survey(3)
            -1             1             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P3_bottom_Survey(3)
            -5             9      -2.07961            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P4_bottom_Survey(3)
            -5             9       2.47224            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P5_bottom_Survey(3)
            -5             9      0.968252            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P6_bottom_Survey(3)
            -5             9      0.366646            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P7_bottom_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P8_bottom_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P9_bottom_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P10_bottom_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P11_bottom_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P12_bottom_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P13_bottom_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P14_bottom_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P15_bottom_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P21_bottom_Survey(3)
#_Dirichlet parameters
#_multiple_fleets_can_refer_to_same_parm;_but_list_cannot_have_gaps
            -5            20      -1.17674             0            99             0          2          0          0          0          0          0          0          0  #  ln(DM_theta)_1
            -5            20      0.784171             0            99             0          2          0          0          0          0          0          0          0  #  ln(DM_theta)_2
            -5            20     -0.570902             0            99             0          2          0          0          0          0          0          0          0  #  ln(DM_theta)_3
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
        0.0001             2           1.4           0.5           0.5            -1      -5  # AgeSel_P3_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P3_Fishery(1)_dev_autocorr
        0.0001             2           1.4           0.5           0.5            -1      -5  # AgeSel_P4_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P4_Fishery(1)_dev_autocorr
        0.0001             2           1.4           0.5           0.5            -1      -5  # AgeSel_P5_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P5_Fishery(1)_dev_autocorr
        0.0001             2           1.4           0.5           0.5            -1      -5  # AgeSel_P6_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P6_Fishery(1)_dev_autocorr
        0.0001             2           1.4           0.5           0.5            -1      -5  # AgeSel_P7_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P7_Fishery(1)_dev_autocorr
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1)
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read and autogen if tag data exist; 1=read
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     3     1     0     0     0     0     1     2  1991  2018     5 0.100042 0.0348566 0.0484686 0.00416437 -0.0436799 -0.0499556 0.170434 0.0362291 0.0426584 0.0345691 0.0225373 0.118929 0.057172 -0.0147977 -0.0234009 0.045204 0.178206 0.0572243 0.210742 0.0287144 0.0182129 -0.0172855 -0.102048 0.362703 0.0191 -0.00660069 -0.0415596 -0.086805
#      5     4     3     0     0     0     0     2     2  1991  2018     5 0.140722 0.327257 0.183417 0.13605 -0.0823376 -0.307644 -0.0688281 0.233954 0.458808 0.131618 0.235952 0.498246 0.744609 0.154779 -0.079749 0.0929091 0.474153 0.480774 0.482223 0.468335 0.365221 0.0173392 0.0240731 0.281164 1.67044 0.0272065 -0.0753431 -0.194982
#      5     5     5     0     0     0     0     3     2  1991  2018     5 0.145599 -0.0420661 0.737461 0.380639 0.694497 -0.557271 -0.23043 0.0558318 0.654503 1.02515 0.467195 0.653883 0.905222 1.86126 0.500312 0.131109 0.115603 0.579309 1.43493 1.55678 0.671897 1.30543 0.640793 0.283206 0.566055 2.85032 0.286484 0.239139
#      5     6     7     0     0     0     0     4     2  1991  2018     5 0.112487 0.061962 -0.294343 0.686397 0.739283 0.594425 -0.0931224 0.081737 -0.343281 0.0908348 1.18731 0.348657 0.318052 0.26881 1.58238 0.743192 0.510551 0.521443 -0.241051 -0.336855 1.41528 0.3491 0.819587 0.490564 -0.427919 -0.639719 1.90427 1.04313
#      5     7     9     0     0     0     0     5     2  1991  2018     5 0.0963559 0.305776 0.0439525 -0.604147 -0.0614061 0.822462 0.755679 0.460548 0.225978 -0.0459032 -0.144447 -0.116702 -0.376669 -0.364562 -0.760408 -0.287006 -0.289463 -0.263534 -0.0239967 -0.152691 -0.828873 -0.181179 -0.120089 0.167167 0.160309 0.116388 -0.6916 0.0410203
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
 -9999   1    0  # terminator
#
1 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  1 #_CPUE/survey:_2
#  1 #_CPUE/survey:_3
#  1 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_agecomp:_3
#  1 #_init_equ_catch1
#  1 #_init_equ_catch2
#  1 #_init_equ_catch3
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
2 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
2 2 -1 3 # Selectivity: (1) 0 to skip or fleet, (2) 1=len/2=age/3=combined, (3) year, (4) N selex bins; NOTE: combined reports in age bins
0 0 # Growth: (1) 0 to skip or growth pattern, (2) growth ages; NOTE: does each sex
1 -1 1 # Numbers-at-age: (1) 0 or area(-1 for all), (2) year, (3) N ages;  NOTE: sums across morphs
0 0 # Mortality: (1) 0 to skip or growth pattern, (2) N ages for mortality; NOTE: does each sex
2 # Dyn Bzero: 0 to skip, 1 to include, or 2 to add recr
0 # SmryBio: 0 to skip, 1 to include
  3 4 5 # vector with selex std bins (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
15 # vector with NatAge std ages (-1 in first bin to self-generate)
 # -1 # list of ages for NatM std (-1 in first bin to self-generate)
999
