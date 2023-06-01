#V3.30.xx.yy;_safe;_compile_date:_Nov 24 2022;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_13.0
#_Stock_Synthesis_is_a_work_of_the_U.S._Government_and_is_not_subject_to_copyright_protection_in_the_United_States.
#_Foreign_copyrights_may_apply._See_copyright.txt_for_more_information.
#_User_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_User_info_available_at:https://vlab.noaa.gov/group/stock-synthesis
#_Source_code_at:_https://github.com/nmfs-stock-synthesis/stock-synthesis

#C 2022 ebspollock control file
1  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
2 # recr_dist_method for parameters:  2=main effects for GP, Settle timing, Area; 3=each Settle entity; 4=none when N_GP*Nsettle*pop==1
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1        1      1     0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
0 #_Nblock_Patterns
#
# controls for all timevary parameters
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#  autogen
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K; 4=not implemented
1 #_Age(post-settlement)_for_L1;linear growth below this
15 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (fixed at 0.2 in 3.24; value should approx initial Z; -999 replicates 3.24)
0  #_placeholder for future growth feature
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
5 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
#_Age_Fecundity by growth pattern from wt-at-age.ss now invoked by read bodywt flag
2 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO    HI      INIT    PRIOR   PR_SD   PR_type PHASE   env_var devlink devminyr devmaxyr dev_PH Block  Block_Fxn
0.05    0.6     0.3     -1.200  0.1     3       4       0       0       0       0       0       0       0       #       NatM_p_1_Fem_GP_1
2       15      5       32      99      0       -5      0       0       0       0       0       0       0       #       L_at_Amin_Fem_GP_1
45      60      53.2    50      99      0       -3      0       0       0       0       0       0       0       #       L_at_Amax_Fem_GP_1
0.2     0.4     0.3     0.3     99      0       -3      0       0       0       0       0       0       0       #       VonBert_K_Fem_GP_1
0.03    0.16    0.066   0.1     99      0       -5      0       0       0       0       0       0       0       #       CV_young_Fem_GP_1
0.03    0.16    0.062   0.1     99      0       -5      0       0       0       0       0       0       0       #       CV_old_Fem_GP_1
-3      3       7E-06   7E-06   99      0       -50     0       0       0       0       0       0       0       #       Wtlen_1_Fem
-3      3       2.9624  2.9624  99      0       -50     0       0       0       0       0       0       0       #       Wtlen_2_Fem
-3      43      36.89   36.89   99      0       -50     0       0       0       0       0       0       0       #       Mat50%_Fem
-3      3       -0.48   -0.48   99      0       -50     0       0       0       0       0       0       0       #       Mat_slope_Fem
-3      3       1       1       99      0       -50     0       0       0       0       0       0       0       #       Eggs/kg_inter_Fem
-3      3       0       0       99      0       -50     0       0       0       0       0       0       0       #       Eggs/kg_slope_wt_Fem
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       RecrDist_GP_1
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       RecrDist_Area_1
0       2       1       1       99      0       -50     0       0       0       0       0       0       0       #       RecrDist_timing_1
1       1       1       1       1       0       -1      0       0       0       0       0       0       0       #       CohortGrowDev
0.00001 0.99999 0.5     0.5     0.5     0       -99     0       0       0       0       0       0       0       #       FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
#_Spawner-Recruitment
3 #_SR_function: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepard_3Parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
            10            17          12.9            12            99             0          1          0          0          0          0          0          0          0 # SR_LN(R0)
           0.2             1          0.88         0.777         0.113             2          4          0          0          0          0          0          0          0 # SR_BH_steep
             1           1.6           1.4           1.1            99             0         -6          0          0          0          0          0          0          0 # SR_sigmaR
            -5             5             0             0            99             0        -50          0          0          0          0          0          0          0 # SR_regime
             0             2             0             1            99             0        -50          0          0          0          0          0          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector; 2=simple deviations
1970 # first year of main recr_devs; early devs can preceed this era
2022 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase
1 # (0/1) to read 13 advanced options
 1946 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 3 #_recdev_early_phase
 5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1965 #_last_early_yr_nobias_adj_in_MPD
 1971 #_first_yr_fullbias_adj_in_MPD
 2019 #_last_yr_fullbias_adj_in_MPD
 2021 #_first_recent_yr_nobias_adj_in_MPD
 -1 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
#  1946E 1947E 1948E 1949E 1950E 1951E 1952E 1953E 1954E 1955E 1956E 1957E 1958E 1959E 1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970R 1971R 1972R 1973R 1974R 1975R 1976R 1977R 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015F 2016F 2017F 2018F 2019F
#  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info
0.1 # F ballpark
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
1.5 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5 # iterations for hybrid F
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2019 2037
# F rates by fleet
# Yr:  1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Fishery 0.00933897 0.0146642 0.00853273 0.012888 0.0174513 0.0121336 0.00976528 0.0143888 0.0200448 0.0140502 0.0147779 0.00984755 0.00884188 0.0123284 0.010776 0.0189597 0.01714 0.0176621 0.020617 0.0190307 0.0328569 0.0448643 0.046737 0.0665674 0.0490229 0.0548243 0.0667206 0.0519506 0.0926444 0.0606975 0.0759137 0.0805482 0.086194 0.0869669 0.0517765 0.0478408 0.0356577 0.0466746 0.0834855 0.0900341 0.0883171 0.0785301 0.0810821 0.0455776 0.0573031 0.074574 0.0532697 0.0685086 0.0705113 0.0503989 0.0892282 0.159745 0.163071 0.167658
#
#_Q_setup for fleets with cpue or survey data
#_1:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm)
#_2:  extra input for link, i.e. mirror fleet
#_3:  0/1 to select extra sd parameter
#_4:  0/1 for biasadj or not
#_5:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         2         1         0         1         0         1  #  Acoustic_Survey
         3         1         0         1         0         1  #  Bottom_Survey
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#NOTE: the first parameter lines below (for LnQ_base_Acoustic_Survey(2)), is
#      automatically replaced by an analytical estimate since float=1 in Q_setup above
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15       -0.0376             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Acoustic_Survey(2)
          0.01           1.2        0.0755        0.0755           0.8             0          4          0          0          0          0          0          0          0  #  Q_extraSD_Acoustic_Survey(2)
           -15            15       -0.0376             0             1             0         -1          0          0          0          0          0          0          0  #  LnQ_base_Bottomic_Survey(2)
          0.01           1.2        0.0755        0.0755           0.8             0          4          0          0          0          0          0          0          0  #  Q_extraSD_Bottomic_Survey(2)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 0 0 0 0 # 1 Fishery
 0 0 0 0 # 2 Acoustic_Survey
 0 0 0 0 # 3 bottom_Survey
#
#_age_selex_types
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+nages+1; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 17 0 0 20 # 1 Fishery
 17 0 0 20 # 2 Acoustic_Survey
 17 0 0 20 # 3 Bottom_trawl_survey
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
         -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P1_Fishery(1)
            -1             1             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P2_Fishery(1)
            -5             9           2.8            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P3_Fishery(1)
            -5             9           0.1            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P4_Fishery(1)
            -5             9           0.1            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P5_Fishery(1)
            -5             9           0.1            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P6_Fishery(1)
            -5             9             0            -1          0.01             0          2          0          2       1991       2018          5          0          0  #  AgeSel_P7_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P8_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P9_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P10_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P11_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P12_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P13_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P14_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P15_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P16_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P17_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P18_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P19_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P20_Fishery(1)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P21_Fishery(1)
         -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P1_Acoustic_Survey(2)
         -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P2_Acoustic_Survey(2)
            -1             1             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P3_Acoustic_Survey(2)
            -5             9           0.1            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P4_Acoustic_Survey(2)
            -5             9           0.1            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P5_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P6_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P7_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P8_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P9_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P10_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P11_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P12_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P13_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P14_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P15_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P16_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P17_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P18_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P19_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P20_Acoustic_Survey(2)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P21_Acoustic_Survey(2)
				 -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P1_Acoustic_Survey(3)
         -1002             3         -1000            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P2_Acoustic_Survey(3)
            -1             1             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P3_Acoustic_Survey(3)
            -5             9           0.1            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P4_Acoustic_Survey(3)
            -5             9           0.1            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P5_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P6_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0          2          0          0          0          0          0          0          0  #  AgeSel_P7_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P8_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P9_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P10_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P11_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P12_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P13_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P14_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P15_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P16_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P17_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P18_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P19_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P20_Acoustic_Survey(3)
            -5             9             0            -1          0.01             0         -2          0          0          0          0          0          0          0  #  AgeSel_P21_Acoustic_Survey(3)
# Dirichlet-Multinomial parameters controlling age-comp weights
            -5            20            .5             0            99             0          2          0          0          0          0          0          0          0  #  ln(EffN_mult)_1
            -5            20            .5             0            99             0          2          0          0          0          0          0          0          0  #  ln(EffN_mult)_2
            -5            20            .5             0            99             0          2          0          0          0          0          0          0          0  #  ln(EffN_mult)_2
# timevary selex parameters
# value of 1.40 for "dev_se" parameters (a.k.a phi) is converted from 0.20
# in 2017 hake assessment using slope of parameter transformation
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
        0.0001             2          1.40           0.5           0.5            -1      -5  # AgeSel_P3_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P3_Fishery(1)_dev_autocorr
        0.0001             2          1.40           0.5           0.5            -1      -5  # AgeSel_P4_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P4_Fishery(1)_dev_autocorr
        0.0001             2          1.40           0.5           0.5            -1      -5  # AgeSel_P5_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P5_Fishery(1)_dev_autocorr
        0.0001             2          1.40           0.5           0.5            -1      -5  # AgeSel_P6_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P6_Fishery(1)_dev_autocorr
        0.0001             2          1.40           0.5           0.5            -1      -5  # AgeSel_P7_Fishery(1)_dev_se
         -0.99          0.99             0             0           0.5            -1      -6  # AgeSel_P7_Fishery(1)_dev_autocorr
# info on dev vectors created for selex parms are reported with other devs after tag parameter section
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     3     1     0     0     2     0     1     2  1991  2018     4      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0	0
#      5     4     3     0     0     2     0     2     2  1991  2018     4      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0	0
#      5     5     5     0     0     2     0     3     2  1991  2018     4      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0	0
#      5     6     7     0     0     2     0     4     2  1991  2018     4      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0	0
#      5     7     9     0     0     2     0     5     2  1991  2018     4      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0      0	0
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
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 #_CPUE/survey:_1
#  1 #_CPUE/survey:_2
#  1 #_agecomp:_1
#  1 #_agecomp:_2
#  1 #_init_equ_catch
#  1 #_recruitments
#  1 #_parameter-priors
#  1 #_parameter-dev-vectors
#  1 #_crashPenLambda
#  0 # F_ballpark_lambda
2 # (0/1/2) read specs for more stddev reporting: 0 = skip, 1 = read specs for reporting stdev for selectivity, size, and numbers, 2 = add options for M,Dyn. Bzero, SmryBio
 2 2 -1 4 # Selectivity: (1) 0 to skip or fleet, (2) 1=len/2=age/3=combined, (3) year, (4) N selex bins; NOTE: combined reports in age bins
 0 0 # Growth: (1) 0 to skip or growth pattern, (2) growth ages; NOTE: does each sex
 1 -1 1 # Numbers-at-age: (1) 0 or area(-1 for all), (2) year, (3) N ages;  NOTE: sums across morphs
 0 0 # Mortality: (1) 0 to skip or growth pattern, (2) N ages for mortality; NOTE: does each sex
2 # Dyn Bzero: 0 to skip, 1 to include, or 2 to add recr
0 # SmryBio: 0 to skip, 1 to include
 2 3 4 5 # vector with selex std bins (-1 in first bin to self-generate)
 # -1 # list of ages for growth std (-1 in first bin to self-generate)
 20 # vector with NatAge std ages (-1 in first bin to self-generate)
 # -1 # list of ages for NatM std (-1 in first bin to self-generate)
999
