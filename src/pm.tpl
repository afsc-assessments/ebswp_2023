///////////////////////////////////////////////////////////// 
//  Conventions:                                         // 
//     fsh   - refers to fshery                         //
//     bts   - refers to trawl survey                  //
//     eit   - refers to hydroacoustic survey         //
//     eac    - refers to expected age composition   //
//     oac    - refers to observed age composition  //
//     et     - refers to expected total numbers   //
//     ot     - refers to observed total numbers  //
/////////////////////////////////////////////////// 
//   ngears   - number of gear types (including srv \\
//   n_       - refers to the number of observations \\
//   styr     - first calendar year of model          \\
//   endyr    - last calendar year of model            \\
//   styr_    - first year of data (suffix)             \\
//   endyr_r  - last year for retrospective run          \\
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// Aug 25 2009 add projection to next year to get survey biomass estimates
//
DATA_SECTION
 !!  *(ad_comm::global_datafile) >>  model_name; 
 !!  *(ad_comm::global_datafile) >>  datafile_name; 
 !!  *(ad_comm::global_datafile) >>  selchng_filename; 
 !!  *(ad_comm::global_datafile) >>  control_filename; 
 !!  *(ad_comm::global_datafile) >> Alt_MSY_File;
 !!  *(ad_comm::global_datafile) >> Cov_Filename;
 !!  *(ad_comm::global_datafile) >> Wtage_file;
 !!  *(ad_comm::global_datafile) >> RawSurveyCPUE_file;
 // !!  *(ad_comm::global_datafile) >> endyrn_file;
 !! write_log(model_name);
 !! write_log(datafile_name);
 !! write_log(selchng_filename);
 !! write_log(control_filename);
 !! write_log(Alt_MSY_File);
 !! write_log(Cov_Filename);
 !! write_log(Wtage_file);
 !! write_log(RawSurveyCPUE_file);
 // !! write_log(endyrn_file);
  int count_Ffail;
  int count_mcmc;
  int count_mcsave;
  !! count_mcmc=0;
  !! count_mcsave=0;
  int pflag;
  int do_EIT1;
  int q_amin
  int q_amax
  !! q_amin = 3; q_amax= 15; // age range overwhich q applies (for prior specifications)
  vector selages(1,15)
  !! selages=1.0;selages(1)=0;selages(2)=0;
  vector avo_sel(1,15)
  !! avo_sel(1)=0.0;	avo_sel(2)=1;	avo_sel(3)=1;	avo_sel(4)=0.85;	avo_sel(5)=0.7;	avo_sel(6)=0.55;	avo_sel(7)=0.3;	avo_sel(8)=0.15;	avo_sel(9)=0.05;	avo_sel(10)=0.01;	avo_sel(11)=0.01;	avo_sel(12)=0.01;	avo_sel(13)=0.01;	avo_sel(14)=0.01;	avo_sel(15)=0.01;
  vector Cat_Fut(1,10);
  !! do_EIT1=1; // flag to carry EIT out in future year (for simulations only)
  !! pflag=0;
  !!CLASS ofstream srecout("srec_Ass_out.rep")
  !!CLASS ofstream projout("pm.prj")
  !!CLASS ofstream nofish("nofish.rep")
  !!CLASS ofstream projout2("pmsr.prj")
  // writes when -mceval invoked (which uses pm.psv file from -mcmc 10000000 -mcsave 200)
  !!CLASS ofstream eval("pm_eval.rep")     
  // Control file read from here--------------------------------------
 !! ad_comm::change_datafile_name(control_filename);
  init_int DoCovBTS           // Flag to use covariance for bottom trawl survey
  init_int SrType             // SRR 1=ricker, 2 bholt, 3 avg
  init_int Do_Combined        // Flag to try experimental combined-surveys method (not used yet)
  init_int use_age_err        // Flag to use ageing error matrix
  init_int use_age1_eit       // This flag (2007) converts EIT age data to 2+ and uses 1yr olds as an index
  init_number age1_sigma_eit  // Input sigma for EIT age 1 data
  int mina_eit
  int mina_bts
 LOCAL_CALCS
  mina_bts=2;
  if (use_age1_eit) mina_eit=2; else mina_eit=1;
  write_log(DoCovBTS);
  write_log(SrType);
  write_log(Do_Combined);
  write_log(use_age_err);
  write_log(use_age1_eit);
  write_log(age1_sigma_eit);
  write_log(mina_eit);
  cout<<" Minimum age for EIT is: "<<mina_eit<<endl;// exit(1);
 END_CALCS
  init_int use_endyr_len   // Flag (2008 assmnt) added to use fishery length frequency in terminal year
  init_int use_popwts_ssb  // Flag (2007 assmnt) to switch spawning wt-age
  init_number natmortprior
  init_number cvnatmortprior
  init_vector natmort_in(1,15)
  init_number q_all_prior  // This is the combined eit and bts catchability for ages 3-6
  init_number q_all_sigma
  init_number q_bts_prior
  init_number q_bts_sigma
  init_number sigrprior
  init_number cvsigrprior
  init_int    phase_sigr
  init_number steepnessprior
  init_number cvsteepnessprior
  init_int    phase_steepness 
  init_int use_spr_msy_pen  // Option to use (old) spr penalty instead of just solving for it
  init_number sigma_spr_msy // Research option for using SPR as a prior for S-R instead of steepness
  number lambda_spr_msy
  vector dec_tab_catch(1,8)
 LOC_CALCS
  lambda_spr_msy = .5/(sigma_spr_msy*sigma_spr_msy);
  write_log(use_endyr_len);
  write_log(use_popwts_ssb);
  write_log(natmortprior);
  write_log(cvnatmortprior);
  write_log(natmort_in);
  write_log(q_all_prior);
  write_log(q_all_sigma);
  write_log(q_bts_prior);
  write_log(q_bts_sigma);
  write_log(sigrprior);
  write_log(cvsigrprior);
  write_log(phase_sigr);
  write_log(steepnessprior);
  write_log(cvsteepnessprior);
  write_log(phase_steepness);
  write_log(use_spr_msy_pen);
  write_log(sigma_spr_msy);
  write_log(lambda_spr_msy);
 END_CALCS

  init_int use_last_eit_ac  // Flag to use most recent EIT age data (typically derived from BTS ages and EIT lengths)
  init_int nyrs_sel_avg     // Added 10/22/98 to adjust the avg fsh selectivity used in future harvests
  number Steepness_UB
  init_number do_bts_bio    // 
  init_number do_eit_bio    // 
  init_number srprior_a     // Beta prior alpha parameter
  init_number srprior_b     // Beta prior beta parameter
  init_int    nyrs_future;
  init_number next_yrs_catch; // Used to grid / interpolate...when below target.
  // init_number fixed_catch_fut1;
	init_int nscen; // !! nscen=7 or 22; // 10 scenarios above and 10 below, number 11 target, (stranger things ref) and 22 is level catch
  init_number fixed_catch_fut2;
  init_number fixed_catch_fut3;
  init_int phase_F40;
  init_int robust_phase
  init_int eit_robust_phase 
  init_int eit_like_type  // 0=standard, 1=log-normal each age 

  init_int phase_logist_fsh  // Asymptotic or not...
  init_int phase_logist_bts  // Asymptotic or not...
 LOC_CALCS
   write_log(nyrs_future);
   write_log(next_yrs_catch);
   write_log(nscen);
   write_log(fixed_catch_fut2);
   write_log(fixed_catch_fut3);
   write_log(nyrs_sel_avg);
   write_log(phase_F40);
   write_log(robust_phase);
   write_log(eit_robust_phase); 
   write_log(eit_like_type)   ;
   write_log(phase_logist_fsh);
   write_log(phase_logist_bts);
 END_CALCS

  int phase_selcoffs_fsh
  int phase_selcoffs_bts

  int phase_selcoffs_fsh_dev
  int phase_selcoffs_bts_dev

  int phase_logist_fsh_dev
  int phase_logist_bts_dev
  !! phase_selcoffs_bts   = 2;
  !! phase_selcoffs_fsh   = 2;

  init_int phase_seldevs_fsh   // To determine generically if selectivity to be time varying...
  init_int phase_seldevs_bts   // To determine generically if selectivity to be time varying...
  init_int phase_age1devs_bts  // To determine generically if selectivity to be time varying...
 !! write_log(phase_seldevs_bts);

  // Set correct deviations to selectivity forms---
 LOCAL_CALCS
  // Fishery selectivity................
  if (phase_logist_fsh>0) // Use logistic selectivity
  {
    phase_selcoffs_fsh = -2; 
    if(phase_seldevs_fsh>0) 
      phase_selcoffs_fsh_dev = -phase_seldevs_fsh; 
    else
      phase_selcoffs_fsh_dev =  phase_seldevs_fsh; 

    phase_logist_fsh_dev   =  phase_seldevs_fsh; 
  }
  else                    // Use coefficient selectivities...
  {
    if(phase_seldevs_fsh>0) 
      phase_logist_fsh_dev   = -phase_seldevs_fsh; 

    phase_selcoffs_fsh_dev =  phase_seldevs_fsh; 
  }
  // Trawl Survey selectivity................
  if (phase_logist_bts>0) // Use logistic selectivites...
  {
    phase_selcoffs_bts = -2; 
    if(phase_seldevs_bts>0) 
      phase_selcoffs_bts_dev = -phase_seldevs_bts; 
    else
      phase_selcoffs_bts_dev = phase_seldevs_bts; 

    phase_logist_bts_dev   =  phase_seldevs_bts; 
  }
  else                     // Use coefficient selectivites...
  {
    if(phase_seldevs_bts>0) 
      phase_logist_bts_dev   = -phase_seldevs_bts; 

    phase_selcoffs_bts_dev =  phase_seldevs_bts; 
  }

 END_CALCS
  init_int phase_selcoffs_eit
  init_int phase_selcoffs_eit_dev
  !! cout <<"Phase fsh coef: "<<phase_selcoffs_fsh<<" "<<phase_selcoffs_fsh_dev<<endl;
  !! cout <<"Phase bts coef: "<<phase_selcoffs_bts<<" "<<phase_selcoffs_bts_dev<<endl;
  !! cout <<"Phase eit coef: "<<phase_selcoffs_eit<<" "<<phase_selcoffs_eit_dev<<endl;

  !! cout <<"Phase fsh logist: "<<phase_logist_fsh<<" "<<phase_logist_fsh_dev<<endl;
  !! cout <<"Phase bts logist: "<<phase_logist_bts<<" "<<phase_logist_bts_dev<<endl;

  init_int phase_natmort
  init_int phase_q_bts    // phase for estimating survey q for bottom trawl survey
  init_int phase_q_std_area
  init_int phase_q_eit    // phase for estimating survey q for echo-integration trawl survey
  !! if (DoCovBTS) phase_q_bts = -1;
  init_int phase_bt       // Phase for bottom temperature parameter
  init_int phase_rec_devs // Phase for estimating recruits (not from SR curve, but as N age 1)
  init_int phase_larv     // Phase to use advective larval dispersal (as a predictive aid) Eq. 8
  init_int phase_sr       // Phase for estimating sr curve
  init_int wt_fut_phase   // Phase for estimating future mean weight-at-age (Eq. 21)
  init_int last_age_sel_group_fsh
  init_int last_age_sel_group_bts
  init_int last_age_sel_group_eit
  init_vector ctrl_flag(1,30)
  !! cout<<ctrl_flag<<endl;
  // Following was used for getting selectivity blocks to end with the correct pattern (i.e., last block ends in last yr of data)
  init_int sel_dev_shift // Sets the year for selectivity changes, 0 = first change in 1966, -1 = first change in 65...
  init_int phase_coheff // 
  init_int phase_yreff // 

  !! write_log(phase_natmort);
  !! write_log(phase_q_bts);
  !! write_log(phase_q_std_area);
  !! write_log(phase_q_eit);
  !! write_log(phase_bt);
  !! write_log(phase_rec_devs);
  !! write_log(phase_larv);
  !! write_log(phase_sr);
  !! write_log(wt_fut_phase);
  !! write_log(last_age_sel_group_fsh);
  !! write_log(last_age_sel_group_bts);
  !! write_log(last_age_sel_group_eit);
  !! write_log(ctrl_flag);
  !! write_log(sel_dev_shift);

  // init_int Sim_status   //Simulation flag 0=none, 1=1-yr ahead, 2=full simulation (all data)
  // init_int iseed_junk   //rng seed in
  // modify endyr numbers at age to test alternative future "truths" in a simulation
  //   used for specifying "what-ifs" directly for simulations
  // init_vector YC_mult(1,15) 
  // !! cout << "Simulation status = "<<Sim_status<<endl;
  // !! cout << "iseed             = "<<iseed_junk<<endl;
  // !! cout << "YC                = "<<YC_mult<<endl;exit(1);

  // Read in datafile now...
  // !! global_datafile= new cifstream(datafile_name);
 !! ad_comm::change_datafile_name(datafile_name);
  init_int styr
  init_int styr_bts
  init_int styr_eit
  init_int endyr
  !! cout <<datafile_name<<" "<<styr<<" "<<endyr<<endl;;
  init_int recage
  init_int nages
  !! write_log(nages);write_log(recage);write_log(endyr);

  init_vector p_mature(1,nages)
  !!p_mature *= 0.5;
  init_ivector ewindex(styr,endyr)
  init_ivector nsindex(styr,endyr)
  init_matrix wt_fsh(styr,endyr,1,nages)
  init_matrix wt_ssb(styr,endyr,1,nages)     // Added in 2007, for constant or alternate time-varying SSB calculation
  !! if(use_popwts_ssb==0)  wt_ssb = wt_fsh; // this is the historical default (and continued use) Eq. 9
       matrix wt_tmp(1,nages,1991,endyr-1)
       vector wt_mn(1,nages)
       vector wt_sigma(1,nages)
  init_vector obs_catch(styr,endyr)
  !! write_log(p_mature);write_log(obs_catch);write_log(wt_fsh);
  // Effort vector input (but never used...placeholder)
  init_vector obs_effort(styr,endyr)
  // Historical CPUE (foreign) for early trend information 
  init_int n_cpue
  init_ivector yrs_cpue(1,n_cpue)
  init_vector obs_cpue(1,n_cpue) // pred_cpue(i)  = natage(iyr)*sel_fsh(iyr) * q_cpue;  Eq. 18
  init_vector obs_cpue_std(1,n_cpue)
  vector obs_cpue_var(1,n_cpue)
  !! obs_cpue_var = square(obs_cpue_std);
  // Acoustic index from BTS data 
  init_int n_avo
  init_ivector yrs_avo(1,n_avo)
  init_vector obs_avo(1,n_avo) // pred_cpue(i)  = natage(iyr)*sel_fsh(iyr) * q_cpue;  Eq. 18
  init_vector obs_avo_std(1,n_avo)
  init_matrix wt_avo(1,n_avo,1,nages)
  vector obs_avo_var(1,n_avo)
  !! obs_avo_var = square(obs_avo_std); 
  !! write_log(obs_effort);write_log(n_cpue);write_log(obs_cpue);
  !! write_log(obs_cpue_std);write_log(n_avo);
  !! write_log(yrs_avo);write_log(obs_avo);write_log(wt_avo);

  // Non-elegant way of dealing with observations from multiple sources...
  init_number ngears
  init_vector minind(1,ngears)
  init_int n_fsh
  init_int n_bts
  init_int n_eit
  vector nagecomp(1,ngears)
  init_ivector yrs_fsh_data(1,n_fsh)
  init_ivector yrs_bts_data(1,n_bts)
  init_ivector yrs_eit_data(1,n_eit)
  !! write_log(yrs_fsh_data);write_log(yrs_bts_data);write_log(yrs_eit_data);
  init_ivector      sam_fsh(1,n_fsh)
  init_ivector      sam_bts(1,n_bts)
  init_ivector      sam_eit(1,n_eit)
  init_matrix     oac_fsh_data(1,n_fsh,1,nages)
  !! cout<< " Index min and max for age comp data: "<<endl <<oac_fsh_data.indexmin()<<" Max "<<oac_fsh_data.indexmax()<<endl;
  init_vector     obs_bts_data(1,n_bts)
  init_vector std_ob_bts_data(1,n_bts)
  // init_vector obs_avo_std(1,n_avo)
  init_matrix  wt_bts(1,n_bts,1,nages)
  init_vector std_ot_bts(1,n_bts)
  !! write_log(sam_fsh);write_log(sam_bts);write_log(sam_eit);
  !! write_log(oac_fsh_data);write_log(yrs_bts_data);write_log(yrs_eit_data);
  !! write_log(obs_bts_data);
  !! write_log(std_ob_bts_data);
  !! write_log(wt_bts);
  !! write_log(std_ot_bts);
  vector           var_ob_bts(1,n_bts)
  !! var_ob_bts = elem_prod(std_ob_bts_data,std_ob_bts_data);

  // init_vector  ot_bts(1,n_bts)
  // !! write_log(wt_bts);write_log(ot_bts);
  vector      var_ot_bts(1,n_bts)
  !! var_ot_bts = elem_prod(std_ot_bts,std_ot_bts);
  init_matrix oac_bts_data(1,n_bts,1,nages)
  init_vector std_ot_eit(1,n_eit)
  !! write_log(oac_bts_data); write_log(std_ot_eit);
  vector var_ot_eit(1,n_eit)
  !! var_ot_eit = elem_prod(std_ot_eit,std_ot_eit);

  init_matrix oac_eit_data(1,n_eit,1,nages)
  matrix ln_oac_eit(1,n_eit,mina_eit,nages)
  !! for (i=1;i<=n_eit;i++) ln_oac_eit(i) = log(oac_eit_data(i)(mina_eit,nages));
  !! write_log(oac_eit_data); write_log(std_ot_eit);
  init_vector obs_eit_data(1,n_eit)
  init_vector std_ob_eit_data(1,n_eit)
  //init_vector std_ob_bts_data(1,n_bts)
  // init_vector obs_avo_std(1,n_avo)
  !! write_log(obs_eit_data); write_log(std_ob_eit_data);
  vector var_ob_eit(1,n_eit)

  init_matrix wt_eit(1,n_eit,1,nages)

  init_vector bottom_temp(1,n_bts)
  !! cout<<"BottomTemp:"<<endl<<bottom_temp<<endl;
  !! write_log(wt_eit); write_log(bottom_temp);
  init_matrix age_err(1,nages,1,nages)
  !! write_log(age_err); 
  init_int nlbins;
  init_vector olc_fsh(1,nlbins)
  vector lens(1,nlbins);
 LOC_CALCS
   write_log(nlbins); 
   write_log(olc_fsh);
   olc_fsh /= sum(olc_fsh);
   for (j=1;j<=nlbins;j++)
      lens(j) = double(j)+25;
      lens(2,5) += 1;
      lens(3,5) += 1;
      lens(4,5) += 1;
      lens(5) += 1;
      lens(6,16) += 4.5;
      lens(17,nlbins) += 5;
      lens(18,nlbins) += 1.0;
      lens(19,nlbins) += 1.0;
      lens(20,nlbins) += 1.0;
      lens(21,nlbins) += 1.0;
      lens(22,nlbins) += 1.0;
      lens(23,nlbins) += 1.0;
      lens(24,nlbins) += 1.0;
 END_CALCS
  init_matrix age_len(1,nages,1,nlbins)
  init_number test
  !! if(test!=1234567){ cout<<"Failed on data read "<<test<<endl;exit(1);}
  // ____________________________________________________________________________________
  // Bit to simulate from covariance matrix on numbers at age in terminal year
  // 
 //  !! global_datafile= new cifstream("endyrn_est.dat");
 // !! ad_comm::change_datafile_name(endyrn_file);
  // init_vector N_endyr_est(1,nages)
  // init_vector s_endyr_est(1,nages)
  // init_matrix c_endyr_est(1,nages,1,nages)
  // matrix v_endyr_est(1,nages,1,nages)
  // matrix chol(1,nages,1,nages)
  int j
  // !! for (i=1;i<=nages;i++) for (j=1;j<=nages;j++) v_endyr_est(i,j)=c_endyr_est(i,j)*s_endyr_est(i)*s_endyr_est(j); 
  // !! chol = (choleski_decomp(v_endyr_est));  

  int dim_sel_fsh
  int dim_sel_bts
  int dim_sel_eit
  int group_num_fsh
  int group_num_bts
  int group_num_eit
  int n_selages_fsh
  int n_selages_bts
  int n_selages_eit
  int nbins
  int n_fsh_r
  int n_bts_r
  int n_eit_r
  int n_avo_r
  int endyr_r

  number spawnmo
  !! spawnmo = 4.;
  number yrfrac        // Fraction of year prior to spawning 
  !! yrfrac= (spawnmo-1.)/12; 

  // settings from control file
  int phase_nosr
  int i
  int Use_78_on_only
  vector age_vector(1,nages);
  !! for (j=1;j<=nages;j++) age_vector(j) = double(j)+.5;

  int iyr
  int endyr_fut;
  int styr_fut;
  int nFs;
  int phase_Rzero;

  int styr_est;
  int endyr_est;

  //
  // Code added to begin dealing better with irregularly spaced changes in time-varying selectivity changes
  //   Intended to apply to all gears generically but so far only implemented for the EIT (acoustic survey)
  //
  //   Reads in a matrix of 3 columns by nyrs rows.  Values for 3rd column are used to allow some variability in 
  //      EIT availability by year (a type of process error, Eqs. 4 and 5)
  !! ad_comm::change_datafile_name(Alt_MSY_File);
  // Vector of additional weight due to cost of travel (apply to Fmsy calc)
  init_vector Fmoney(1,nages);
  !! ad_comm::change_datafile_name(selchng_filename);
  int ii;
  init_matrix sel_data(styr,endyr,0,3);  // Columns: year, change by gear type (fsh, bts, eit)

  vector fsh_ch_in(styr,endyr);
  vector eit_ch_in(styr,endyr);
  int nch_fsh;
  int nch_eit;
 LOCAL_CALCS
   // Sets up sigmas (for each age) used to estimate future mean-wt-age (Eq. 21)
  for (i=1991;i<=endyr-1;i++) 
    for (j=1;j<=nages;j++) 
      wt_tmp(j,i) = wt_fsh(i,j);
  for (j=1;j<=nages;j++)
  {
    // wt_mn(j) = mean(wt_tmp(j));
    wt_mn(j) = min(wt_tmp(j));
    wt_sigma(j) = sqrt(norm2(wt_tmp(j)-mean(wt_tmp(j)))/(endyr-1991) );
  }

  // Flag for changing period of estimating recruits  
  Use_78_on_only = int(ctrl_flag(24));
  if (Use_78_on_only)
  {
    if (styr>1978)
      styr_est = styr;
    else
      styr_est = 1978;
  }
  else
  {
    styr_est = styr+1;
  }

  // Set bounds for SRR params (depending on estimation and type)
  if (phase_sr>0) 
  {
    phase_nosr=-1;
    phase_Rzero=3;
    if (SrType==3)
      phase_Rzero=-2;
  }
  else
  {
    phase_nosr=1;
    phase_Rzero=-1;
  }

  if (SrType==4)
    Steepness_UB=4.;
  else
    Steepness_UB=.99;

  n_fsh_r=0;
  n_bts_r=0;
  n_eit_r=0;
  n_avo_r=0;
  endyr_r = endyr - int(ctrl_flag(28));
  endyr_est = endyr_r - int(ctrl_flag(29)); // lop off last couple of years 
  cout <<"Last yr of estimation..."<<endyr_est<<endl;
  dec_tab_catch(1) = obs_catch(endyr_r);
  dec_tab_catch(2) = 500;
  dec_tab_catch(3) = 1000;
  dec_tab_catch(4) = 1250;
  dec_tab_catch(5) = 1500;
  dec_tab_catch(6) = 1750;
  dec_tab_catch(7) = 2000;
  dec_tab_catch(8) =   10; // bycatch in other fisheries

  // Used to count parameters changes in EIT survey selectivities
  eit_ch_in = column(sel_data,3);
  fsh_ch_in = column(sel_data,1);
  ii = 0; for(i=styr;i<=endyr_r;i++) if(eit_ch_in(i)>0) {ii++;} nch_eit=ii; 
  ii = 0; for(i=styr;i<=endyr_r;i++) if(fsh_ch_in(i)>0) {ii++;} nch_fsh=ii; 
  if (ctrl_flag(28)==0.)
  {
    n_fsh_r=n_fsh;
    n_bts_r=n_bts;
    n_eit_r=n_eit; 
    n_avo_r=n_avo; 
  }
  else
  {
    int ii=0;
    for (i=styr;i<endyr_r;i++)
    {
      ii++;
      if (i == yrs_fsh_data(ii)) 
        n_fsh_r++;
    }
    ii=0;
    for ( i=styr_bts;i<=endyr_r;i++)
    {
      ii++;
      if (i == yrs_bts_data(ii)) 
        n_bts_r++;
    }
    if (endyr_r <= styr_eit) {
      cout <<" Not enough years for EIT survey"<<endl; exit(1);
    }
    n_eit_r = 0;
    for (i=styr_eit;i<endyr_r;i++)
    {
      if (i == yrs_eit_data(n_eit_r+1)) 
        n_eit_r++;
    }
  // init_int n_avo
  // init_ivector yrs_avo(1,n_avo)
    n_avo_r = 0;
    for (i=yrs_avo(1);i<endyr_r;i++)
    {
      // if (yrs_avo(i) <= endyr_r)
      if (i == yrs_avo(n_avo_r+1)) 
        n_avo_r++;
    }
  }
  cout <<"End year, n's "<<endyr_r<<" "<<n_fsh_r<<" "<<n_bts_r<<" "<<n_eit_r<<" "<<endl;
  write_log(endyr_r);
  write_log(endyr_est);
  write_log(n_fsh_r);
  write_log(n_bts_r);
  write_log(n_eit_r);
  write_log(n_avo_r);

  n_selages_fsh = nages-last_age_sel_group_fsh+1;
  n_selages_bts = nages-last_age_sel_group_bts+1;
  n_selages_eit = nages-last_age_sel_group_eit+1;
  write_log(n_selages_fsh);
  write_log(n_selages_bts);
  write_log(n_selages_eit);
  group_num_fsh = int(ctrl_flag(16));
  group_num_bts = int(ctrl_flag(17));
  group_num_eit = int(ctrl_flag(18));
  int ifsh=0;
  int ibts=0;
  int ieit=0;
  // Old way of specifying parameter blocks over time (still in use for fishery and bts)
  for (i=styr;i<endyr_r;i++) 
  {
    if (!((i+sel_dev_shift)%group_num_fsh)) ifsh++; 
    cout <<i<<" "<<(i+sel_dev_shift)%group_num_fsh<<" "<<ifsh<<endl;
  }
  for ( i=styr_bts;i<endyr_r;i++)
    if (!(i%group_num_bts)) ibts++; 

  dim_sel_fsh=nch_fsh;
  dim_sel_bts=ibts;
  dim_sel_eit=nch_eit;cout<<"dim_sel_eit "<<dim_sel_eit<<endl;
  nbins=nages;
  nagecomp(1) = n_fsh_r;
  nagecomp(2) = n_bts_r;
  nagecomp(3) = n_eit_r; 
  write_log(n_fsh_r);
  write_log(n_bts_r);
  write_log(n_eit_r);

  // Future and SPR stuff
  endyr_fut = endyr_r+nyrs_future;
  styr_fut  = endyr_r+1;
  nFs       = 3;
  if (phase_sr>0) 
    phase_nosr = -1;
  else
    phase_nosr = 1;
 END_CALCS
  !! ad_comm::change_datafile_name(Cov_Filename);
  // Read in covariance matrix of BTS survey biomass over time
  init_matrix cov_in(1,n_bts,1,n_bts);
  matrix cov(1,n_bts_r,1,n_bts_r);
	!! for (i=1;i<=n_bts_r;i++) cov(i) = cov_in(i)(1,n_bts_r);
  matrix inv_bts_cov(1,n_bts_r,1,n_bts_r) // Covariance matrix     
  !! inv_bts_cov = inv(cov) ;
  !! write_log(cov);
  ivector    yrs_ch_eit(1,nch_eit);
  vector sel_ch_sig_eit(1,nch_eit);
  !! ii=0;for (i=styr;i<=endyr_r;i++) if(eit_ch_in(i)>0) {ii++;sel_ch_sig_eit(ii)=eit_ch_in(i);yrs_ch_eit(ii)=i;} 
  ivector    yrs_ch_fsh(1,nch_fsh);
  vector sel_ch_sig_fsh(1,nch_fsh);
  !! ii=0;for (i=styr;i<=endyr_r;i++) if(fsh_ch_in(i)>0) {ii++;sel_ch_sig_fsh(ii)=fsh_ch_in(i);yrs_ch_fsh(ii)=i;} 
  // Critical variables: yrs_ch_eit, sel_ch_sig_eit,  and nch_eit
  !! write_log(nch_fsh); write_log(yrs_ch_fsh); write_log(sel_ch_sig_fsh);
  !! write_log(nch_eit); write_log(yrs_ch_eit); write_log(sel_ch_sig_eit);
  matrix oac_fsh(1,n_fsh_r,1,nbins)//--Observed proportion at age in Fishery
  matrix oac_bts(1,n_bts_r,1,nbins)//--Observed proportion at age in Survey

  // Set up whether last survey value is used or not (if ALK is from BTS instead of EIT)
  int n_eit_ac_r;
  !!  if (use_last_eit_ac>0) n_eit_ac_r = n_eit_r; else n_eit_ac_r = n_eit_r-1; 
  !!  if (use_last_eit_ac>0) nagecomp(3) = n_eit_r; else nagecomp(3) = n_eit_r-1; 

  matrix oac_eit(1,n_eit_ac_r,1,nbins)//--Observed proportion at age in Survey
  vector oa1_eit(1,n_eit_ac_r)       //--Observed age 1 index from hydro survey
  vector ot_fsh(1,n_fsh_r)         //--Observed total numbers in Fishery
  vector ot_bts(1,n_bts_r)         //--Observed total numbers in BTS
  vector std_ob_bts(1,n_bts_r)    //--Observed total biomass in BTS
  vector     ob_bts(1,n_bts_r)    //--Observed total biomass in BTS

  vector ot_eit(1,n_eit_r)         //--Observed total numbers in HydroSurvey
  vector ob_eit(1,n_eit_r)        //--Observed total biomass in Survey
  vector std_ob_eit(1,n_eit_r)    //--Observed total biomass in Survey
  int ignore_last_eit_age1;
  vector lseb_eit(1,n_eit_r);
  vector lvarb_eit(1,n_eit_r);
   
  // Stuff for passing seed via command line and for initializing new sequence
  int iseed;
  !! iseed=0;
  int do_fmort;
  !! do_fmort=0;
   vector    adj_1(1,10)
   vector    adj_2(1,10)
   vector    SSB_1(1,10)
   vector    SSB_2(1,10)
  int do_check  // Placeholder to have debug checker flag...
 LOCAL_CALCS
  do_check=0;  
  if (ad_comm::argc > 1)
  {
    int on=0;
    if ( (on=option_match(argc,argv,"-io"))>-1)
      do_check = 1;
    if ( (on=option_match(ad_comm::argc,ad_comm::argv,"-iseed"))>-1)
    {
      if (on>ad_comm::argc-2 | ad_comm::argv[on+1][0] == '-')
      {
        cerr << "Invalid number of iseed arguements, command line option -iseed ignored" << endl;
      }
      else
      {
        iseed = atoi(ad_comm::argv[on+1]);
        cout<<  "Currently using "<<adstring(ad_comm::argv[on+1])<<" as random number seed for sims"<<endl;
      }
    }
    if ( (on=option_match(ad_comm::argc,ad_comm::argv,"-uFmort"))>-1)
      do_fmort=1;
  }
  // Some defaults------------
   adj_1=1.0;
   adj_2=1.0; 
   SSB_1=1.0;
   SSB_2=1.0; 

 END_CALCS
  int phase_cpue_q
  int phase_avo_q
  !!long int lseed=iseed;
  !!CLASS random_number_generator rng(iseed);

 // ------------------------------------------------------
 // read in wt-age data by 
 !! ad_comm::change_datafile_name(Wtage_file);
 // These were estimated in an RE model...
  init_number log_sd_coh 
  init_number log_sd_yr  
  init_number cur_yr
  init_int styr_wt
  init_int endyr_wt
  init_int ndat_wt
  // Number of years of observations in each data set
  init_ivector nyrs_data(1,ndat_wt);
  // Actual years of observations in each data set (ragged array)
  init_imatrix yrs_data(1,ndat_wt,1,nyrs_data);
 LOCAL_CALCS
  if (endyr_r < endyr)
    for (int h=1;h<=ndat_wt;h++)
    {
      int itmp = 1;
      for (i=styr;i<=endyr_r;i++)
      {
        if (i == yrs_data(h,itmp) )
          itmp++;
      }
      nyrs_data(h)= itmp-1;
    }
 END_CALCS
  init_int age_st
  init_int age_end
  int nages_wt;
  !! nages_wt = age_end - age_st + 1;
  int nscale_parm;
  !! nscale_parm = ndat_wt-1;
  // init_matrix wt_obs(styr_wt,endyr_wt,age_st,age_end)
  // init_matrix sd_obs(styr_wt,endyr_wt,age_st,age_end)
  init_3darray wt_obs(1,ndat_wt,1,nyrs_data,age_st,age_end);
  init_3darray sd_obs(1,ndat_wt,1,nyrs_data,age_st,age_end);
  int phase_d_scale;
 !! if (ndat_wt>1) phase_d_scale = 3; else phase_d_scale = -1;
 !! write_log(endyr_wt);
 !! write_log(styr_wt);
 !! write_log(log_sd_coh);
 !! write_log(log_sd_yr);
 !! write_log(wt_obs);
 !! write_log(sd_obs);
 !! endyr_wt = endyr_wt - int(ctrl_flag(28));
  int max_nyrs_data;
 !! cout<<(endyr_wt)<<endl;;
 !! max_nyrs_data = max(nyrs_data);


 // ------------------------------------------------------
 // read in CPUE data by station (with temperatures)
 //   Section to do experimental survey CPUE tests using 
 //    temperatures as a covariate (not completed).  
 //    intent is to read all raw station data (for CPUE anyway) to accommodate potential
 //    for availability effects due to habitat preferences
 //    
 //    NOT IN DOCUMENT/NOT USED 
 // ------------------------------------------------------
 !! ad_comm::change_datafile_name(RawSurveyCPUE_file);
  init_int nstrata;
 !! cout <<nstrata<<endl;
  init_vector sqkm(1,nstrata);
  init_int ndata;
  init_matrix d(1,ndata,1,5);  // Columns: year, strataindex, RACEstrata, CPUE, Temperature
  imatrix nobs(1982,2008,1,14); // years and strata 
   matrix mnCPUE(1982,2008,1,14); // years and strata 
   matrix mntemp(1982,2008,1,14); // years and strata 
  3darray temp_in(1982,2008,1,14,1,70); // for reading in 
  3darray CPUE_in(1982,2008,1,14,1,70); // for reading in  
 LOCAL_CALCS
  nobs.initialize();
  // int iobs=0;
  int nextyr;
  int nextst;
  for (int i=1;i<=ndata;i++)
  {
    int iyr = int(d(i,1)) ;
    int ist = int(d(i,2));
    nextyr=iyr; nextst=ist; 
    nobs(iyr,ist)++;
    temp_in(iyr,ist,nobs(iyr,ist))=d(i,5);
    CPUE_in(iyr,ist,nobs(iyr,ist))=d(i,4);
  }
 END_CALCS
  3darray temp(1982,2008,1,14,1,nobs); // for actually using (ragged, since not same number of observations each year)
  3darray CPUE(1982,2008,1,14,1,nobs); // for actually using (ragged, since not same number of observations each year)
 LOCAL_CALCS
  temp.initialize();
  CPUE.initialize();
  mntemp.initialize();
  mnCPUE.initialize();
  for (int iyr=1982;iyr<=2008;iyr++)
  {
    for (int ist=1;ist<=nstrata;ist++)
    {
      for (int iobs=1;iobs<=nobs(iyr,ist);iobs++)
      {
         temp(iyr,ist,iobs)=temp_in(iyr,ist,iobs);
         CPUE(iyr,ist,iobs)=CPUE_in(iyr,ist,iobs);
      }
      if (nobs(iyr,ist)>0)
      {
        mnCPUE(iyr,ist) = mean(CPUE(iyr,ist));
        mntemp(iyr,ist) = mean(temp(iyr,ist));
      }
    }
  }
 END_CALCS
 vector FW_fsh(1,4);
 number FW_bts;
 number FW_eit;
INITIALIZATION_SECTION
  // repl_F -.02
  L1 27.928
  L2 44.3676944103
  log_alpha -11.0000000000
  log_K -0.136352276302
  d_scale .85
  sigr  sigrprior ;
  steepness steepnessprior;
  log_avgrec 10.87558
  log_Rzero 10.2033
  log_avginit 4.8;
  log_avg_F -1.6;
  bt_slope  0.;
  log_q_eit -1.05313
  log_q_avo -9.6
  log_q_bts q_bts_prior;
  log_q_std_area 0.;
  log_q_cpue -0.16
  sel_coffs_fsh -.10
  sel_coffs_bts -.01
  sel_coffs_eit -.10
  sel_a50_bts 5.5
  sel_slp_bts 1.
  sel_dif1_fsh 1
  sel_a501_fsh 3
  sel_dif2_fsh 5
  sel_trm2_fsh .90
PARAMETER_SECTION
  init_number log_avgrec(1);
  init_number log_avginit(1);
  init_number log_avg_F(1)  ;
  init_number natmort_phi(phase_natmort)
  vector natmort(1,nages)
  vector base_natmort(1,nages)

  init_number log_q_bts(phase_q_bts);
  init_number log_q_std_area(phase_q_std_area);
  init_number bt_slope(phase_bt);

  !! cout <<phase_bt<<" Phase for bts temperature"<<endl;
  init_number log_q_eit(phase_q_eit);

  init_number         log_Rzero(phase_Rzero)
  init_bounded_number steepness(0.2,Steepness_UB,phase_steepness)
  !!   phase_cpue_q = 1; // always estimate historical CPUE q
  // estimate avo q if turned on 
  !!   if (n_avo_r < 6 || ctrl_flag(6)==0) phase_avo_q = -1; else phase_avo_q=1;  
  init_number log_q_cpue(phase_cpue_q);
  init_number log_q_avo(phase_avo_q);
  number q_avo;
  number q_bts;
  number q_eit;
  number q_cpue;

  init_bounded_vector log_initdevs(2,nages,-15.,15.,3)
  init_bounded_vector log_rec_devs(styr,endyr_r,-10.,10.,phase_rec_devs)
  vector rec_epsilons(styr,endyr_r) // These are the real rec-dev guys
  // 11x11 matrix of advection "cells" to use for testing explanatory power of post-spawning wind conditions on survival (rec)
  // Eq. 8
  init_bounded_matrix larv_rec_devs(1,11,1,11,-10.,10.,phase_larv)
  matrix larv_rec_trans(1,11,1,11)
  number alpha;
  number beta;
  number Rzero;
  likeprof_number q_all;
  // init_number repl_F(5)
  number repl_F
  number repl_yld
  number repl_SSB
  // Added to test for presence of alternative recruitment "regimes" :
  //  e.g., regime(1) = mean(pred_rec(1964,1977));
  // sdreport_vector regime(1,8);
  // Moved to regular vector since this broke during retrospective runs
  vector regime(1,8);
  // Some added stats
  number phizero

  // Reserved for closer evaluation of station-station data NOT USED, hence commented out
  // 3darray pred_CPUE(1982,2006,1,14,1,nobs); // for actually using (ragged) d

  init_bounded_dev_vector log_F_devs(styr,endyr_r,-15.,15.,2)
  init_bounded_number sigr(0.1,2.,phase_sigr)

  number sigmaRsq;

  init_bounded_matrix sel_devs_fsh(1,dim_sel_fsh,1,n_selages_fsh,-5.,5.,phase_selcoffs_fsh_dev)
  init_bounded_matrix sel_devs_bts(1,dim_sel_bts,1,n_selages_bts,-5.,5.,phase_selcoffs_bts_dev)
  init_bounded_matrix sel_devs_eit(1,dim_sel_eit,mina_eit,n_selages_eit,-5.,5.,phase_selcoffs_eit_dev)

  init_vector sel_coffs_fsh(1,n_selages_fsh,phase_selcoffs_fsh)
  init_vector sel_coffs_bts(1,n_selages_bts,phase_selcoffs_bts)
  init_vector sel_coffs_eit(mina_eit,n_selages_eit,phase_selcoffs_eit)

  vector wt_fut(1,nages) //

  init_bounded_number sel_slp_bts(0.001,5.,phase_logist_bts)
  init_bounded_number sel_a50_bts(0.1,8,phase_logist_bts)
  init_number             sel_age_one(phase_logist_bts)                              // Special since age-1 are selected more than others...
  init_bounded_dev_vector sel_slp_bts_dev(styr_bts,endyr_r,-5,5,phase_logist_bts_dev)// allow for variability in survey selectivity inflection 
  init_bounded_dev_vector sel_a50_bts_dev(styr_bts,endyr_r,-5,5,phase_logist_bts_dev)// allow for variability in survey selectivity inflection 
  init_bounded_dev_vector sel_one_bts_dev(styr_bts,endyr_r,-5,5,phase_age1devs_bts)  // allow for variability in survey selectivity inflection 
   
  init_number sel_dif1_fsh(phase_logist_fsh)
  init_bounded_number sel_a501_fsh(0.1,7,phase_logist_fsh)
  init_bounded_number sel_trm2_fsh(0.0,0.999,phase_logist_fsh)
  !! int ph_log_fsh2;
  !! if (phase_logist_fsh>0) ph_log_fsh2 = phase_logist_fsh+1;else ph_log_fsh2 = phase_logist_fsh;
  init_number sel_dif2_fsh(ph_log_fsh2)

  init_bounded_dev_vector sel_dif1_fsh_dev(styr,endyr_r,-5,5,phase_logist_fsh_dev) // allow for variability in survey selectivity inflection 
  init_bounded_dev_vector sel_a501_fsh_dev(styr,endyr_r,-5,5,phase_logist_fsh_dev) // allow for variability in survey selectivity inflection 
  init_bounded_dev_vector sel_trm2_fsh_dev(styr,endyr_r,-.5,.5,-2) // allow for variability in survey selectivity inflection 

 // Parameters for computing SPR rates
           number SPR_ABC // (0.05,2.,phase_F40)
  sdreport_vector endyr_N(1,nages);
  sdreport_number B_Bnofsh;
  sdreport_number Bzero;
  sdreport_number Percent_Bzero;
  sdreport_number Percent_Bzero_1;
  sdreport_number Percent_Bzero_2;
  sdreport_number Percent_B100;
  sdreport_number Percent_B100_1;
  sdreport_number Percent_B100_2;
  // Added to test for significance of "mean temperature" from earlier assessments (effect on survey q) 
  //   NOT presented as a sensitivity in 2008 nor 2009
  // sdreport_vector q_temp(1,5);
  vector q_temp(1,5);
  sdreport_number SPR_OFL // (0.05,2.,phase_F40)
  sdreport_number F40 // (0.05,2.,phase_F40)
  sdreport_number F35 // (0.05,2.,phase_F40)
  sdreport_vector SSB(styr,endyr_r)

 // Stuff for SPR and yield projections
  number sigmarsq_out
  number ftmp
  number SB0
  number SBF40
  number SBF35
  number sprpen
  number F_pen
  number meanrec
  vector SR_resids(styr_est,endyr_est);
  matrix Nspr(1,4,1,nages)
  vector sel_fut(1,nages)
 
  3darray natage_future(1,nscen,styr_fut,endyr_fut,1,nages)
  init_vector rec_dev_future(styr_fut,endyr_fut,phase_F40);

  3darray F_future(1,nscen,styr_fut,endyr_fut,1,nages);
  matrix Z_future(styr_fut,endyr_fut,1,nages);
  matrix S_future(styr_fut,endyr_fut,1,nages);
  matrix catage_future(styr_fut,endyr_fut,1,nages);
  number avg_rec_dev_future

  matrix   eac_fsh(1,n_fsh_r,1,nbins)  //--Expected proportion at age in Fishery
  vector   elc_fsh(1,nlbins)           //--Expected proportion at length in Fishery
  matrix   eac_bts(1,n_bts_r,1,nbins)  //--Expected proportion at age in trawl survey
  matrix   eac_cmb(1,n_bts_r,1,nbins)  //--Expected proportion at age in combined surveys
  matrix   oac_cmb(1,n_bts_r,1,nbins)  //--observed proportion at age in combined surveys
  matrix   eac_eit(1,n_eit_ac_r,1,nbins)//--Expected proportion at age in hydro survey
  vector   ea1_eit(1,n_eit_ac_r)       //--Expected age 1 index from hydro survey
  vector    et_fsh(1,n_fsh_r)          //--Expected total numbers in Fishery
  vector    et_bts(1,n_bts_r)          //--Expected total numbers in Survey
  vector    et_cmb(1,n_bts_r)          //--Expected total numbers in HydroSurvey
  vector avail_bts(1,n_bts_r)          //--Availability estimates in BTS
  vector avail_eit(1,n_bts_r)          //--Availability estimates in HydroSurvey
  vector sigma_cmb(1,n_bts_r)          //--Std errors of combined surveys (by year) 
  vector   var_cmb(1,n_bts_r)          //--Std errors of combined surveys (by year) 
  vector    ot_cmb(1,n_bts_r)          //--Observed total numbers in combined Surveys
  vector    eb_bts(1,n_bts_r)          //--Expected total biomass in Survey
  vector    eb_eit(1,n_eit_r)          //--Expected total biomass in Survey
  vector    et_eit(1,n_eit_r)          //--Expected total numbers in HydroSurvey
  vector lse_eit(1,n_eit_r)
  vector lvar_eit(1,n_eit_r)
  vector    et_avo(1,n_avo_r)          //--Expected total numbers in HydroSurvey
  vector   et_cpue(1,n_cpue)           //--Expected total numbers in CPUE
  vector     Fmort(styr,endyr_r)

  matrix catage(styr,endyr_r,1,nages)
  vector pred_catch(styr,endyr_r)
  vector Pred_N_bts(styr,endyr_r)
  vector Pred_N_eit(styr,endyr_r)
  vector pred_cpue(1,n_cpue)
  vector pred_avo(1,n_avo)
  // vector SSB(styr,endyr_r)
  matrix natage(styr,endyr_r,1,nages);
  vector srmod_rec(styr_est,endyr_est);
  matrix Z(styr,endyr_r,1,nages);
  matrix F(styr,endyr_r,1,nages);
  matrix S(styr,endyr_r,1,nages);
  matrix M(styr,endyr_r,1,nages);
  init_bounded_vector M_dev(styr+1,endyr_r,-1.,1.,-8);
  matrix log_sel_fsh(styr,endyr_r,1,nages);
  matrix sel_fsh(styr,endyr_r,1,nages);
  matrix log_sel_bts(styr,endyr_r,1,nages);
  matrix log_sel_eit(styr,endyr_r,1,nages);
  number ff;
  number ssqcatch;
  number avgsel_fsh;
  number avgsel_bts;
  number avgsel_eit;
  number bzero;
  number surv;
  number nthisage;
  vector surv_like(1,3);
  number cpue_like;
  number avo_like;
  vector sel_like(1,3);
  vector sel_like_dev(1,3);
  vector age_like(1,ngears);
  number len_like;
  number wt_like;
  vector age_like_offset(1,ngears);
  number MN_const // Multinomial constant
  !! MN_const = 1e-3; // Multinomial constant
  vector Priors(1,4);
  vector rec_like(1,7);
  vector all_like(1,26); 
  number sumtmp;
  number tmpsp;
  vector log_initage(2,nages);
  vector pred_biom(styr,endyr_r);
  vector SRR_SSB(1,20)

 // Average weight stuff
  init_bounded_number L1(10,50,2);
  init_bounded_number L2(30,90,3);
  init_number log_alpha(-1);
  init_number log_K(4);
  vector wt_inc(age_st,age_end-1);
  init_matrix d_scale(1,nscale_parm,age_st,age_end,phase_d_scale);
  number K;
  // init_number log_t0(3);
  // Predicted weight matrix
  3darray wt_hat(1,ndat_wt,1,max_nyrs_data,age_st,age_end);
  number alphawt;
  matrix wt_pre(styr_wt,endyr_wt,age_st,age_end)
  vector mnwt(age_st,age_end);
  init_bounded_vector coh_eff(styr_wt-nages_wt-age_st+1,endyr_wt-age_st+3,-15,15,phase_coheff);
  init_bounded_vector  yr_eff(styr_wt,endyr_wt+3,-15,15,phase_yreff);

  sdreport_vector wt_last(age_st,age_end);
  sdreport_vector wt_cur(age_st,age_end);
  sdreport_vector wt_next(age_st,age_end);
  sdreport_vector wt_yraf(age_st,age_end);

  sdreport_number avg_age_msy;
  // sdreport_number avgln_msy;
  sdreport_number avgwt_msy;
  sdreport_number MSY;
  sdreport_number MSY_wt;
  sdreport_number Fmsy;
  sdreport_number Fmsy_wt;
  sdreport_number Fmsy2;
  sdreport_number Fmsy2_wt;
  sdreport_vector Fmsy2_dec(1,10);   // uncertain next year weight previous decade selectivity estimates
  sdreport_vector Fmsy2_decwt(1,10); // uncertain next year selectivity but previous decade weight estimates
  sdreport_number Bmsy2;
  sdreport_number Bmsy2_wt;
  sdreport_number lnFmsy;
  sdreport_number lnFmsy2;
  sdreport_number SER_Fmsy;
  sdreport_number Fendyr_Fmsy;
  sdreport_number Rmsy;
  sdreport_number Bmsy;

  // Decision table variables...............................
  sdreport_vector Fcur_Fmsy(1,nscen);
  sdreport_vector Bcur_Bmsy(1,nscen);
  sdreport_vector Bcur_Bmean(1,nscen);
  sdreport_vector Bcur3_Bcur(1,nscen);
  sdreport_vector Bcur3_Bmean(1,nscen);
  sdreport_vector Bcur2_Bmsy(1,nscen);
  sdreport_vector Bcur2_B20(1,nscen);
  sdreport_vector LTA1_5R(1,nscen);   // long term average age 1_5 Ratio
  sdreport_vector LTA1_5(1,nscen);    // long term average age 1_5
  sdreport_vector MatAgeDiv1(1,nscen); // Diversity of Age structure in mature population
  sdreport_vector MatAgeDiv2(1,nscen); // Diversity of Age structure in mature population
  vector H(styr,endyr_r);
  vector avg_age_mature(styr,endyr_r);
  sdreport_vector RelEffort(1,nscen); // Effort relative to endyr   

  sdreport_number F40_spb;
  // sdreport_number F40_catch;
  sdreport_number begbiom;
  sdreport_number DepletionSpawners;
  sdreport_number SB100;
  sdreport_number Current_Spawners;
  sdreport_vector pred_rec(styr,endyr_r);
  sdreport_vector age_3_plus_biom(styr,endyr_r+2);
  sdreport_vector ABC_biom(1,10);
  sdreport_vector ABC_biom2(1,10);
  sdreport_vector rechat(1,20);
  sdreport_vector SER(styr,endyr_r);
  matrix future_SER(1,nscen,styr_fut,endyr_fut);
  matrix future_catch(1,nscen,styr_fut,endyr_fut);
  sdreport_matrix future_SSB(1,nscen,endyr_r,endyr_fut)
  sdreport_vector Age3_Abund(styr,endyr_r)
  vector age_1_7_biomass(styr,endyr_r);
  objective_function_value fff;
PRELIMINARY_CALCS_SECTION
  // fixed_catch_fut1 = fixed_catch_fut1 + 0.1 ;
  wt_fut = wt_fsh(endyr_r); // initializes estimates to correct values...Eq. 21
  // base_natmort(1)=.9; base_natmort(2)=.45; for (j=3 ;j<=nages;j++) base_natmort(j)=natmortprior;
  base_natmort = natmort_in;

  natmort = base_natmort;
  // cout <<"M input= "<<natmort <<endl;
  write_log(natmort);
  // cout <<ctrl_flag<<endl;
  write_log(ctrl_flag);
  age_like_offset.initialize();

  //--Caculate offset for multinomials (if used)---------------
  for (int igear =1;igear<=ngears;igear++)
  {
    for (int i=1; i <= nagecomp(igear); i++)
    {
      if (igear==1)
      {
        oac_fsh(i)=oac_fsh_data(i)/sum(oac_fsh_data(i));
        age_like_offset(igear)-=sam_fsh(i)*oac_fsh(i)*log(oac_fsh(i) +MN_const);
      }
      else if (igear==2)
      {
        std_ob_bts(i)  = std_ob_bts_data(i)        ;
        ot_bts(i)       = sum(oac_bts_data(i)(mina_bts,nages)); // mina_bts is for totals
        ob_bts(i)       = obs_bts_data(i)            ;
        oac_bts(i )     = oac_bts_data(i)/sum(oac_bts_data(i));
        age_like_offset(igear)-=sam_bts(i)*oac_bts(i)*log(oac_bts(i) +MN_const);
      }
      else if (igear==3)
      {
        ob_eit(i)                  = obs_eit_data(i)            ;
        std_ob_eit(i)              = std_ob_eit_data(i)        ;
        oa1_eit(i)                 = oac_eit_data(i,1); // set observed age 1 index
        ot_eit(i)                  = sum(oac_eit_data(i)(mina_eit,nages));
        oac_eit(i)(mina_eit,nages) = oac_eit_data(i)(mina_eit,nages)/sum(oac_eit_data(i)(mina_eit,nages));
        age_like_offset(igear)     -= sam_eit(i)*oac_eit(i)(mina_eit,nages)*
                                   log(oac_eit(i)(mina_eit,nages) +MN_const);
      }
    }     
  }
  ot_eit(n_eit_r) = sum(oac_eit_data(n_eit_r)(mina_eit,nages));
  // flag to ignore age 1's
  if (std_ot_eit(n_eit_r)/ot_eit(n_eit_r) > 0.4 ) ignore_last_eit_age1 = 1; else ignore_last_eit_age1=0;
  // cout <<" Last age comp in BTS: " << endl << oac_bts_data(n_bts) << endl;
  // cout <<" Age_like_offset:      " << endl << age_like_offset     << endl;
  Cat_Fut(1) = next_yrs_catch; //  catch guess                            
  // Simple decrement of future cathes to capture relationship between adjustments (below Bmsy) w/in same year
  for (i=2;i<=10;i++) 
    Cat_Fut(i) = Cat_Fut(i-1)*.90;
	write_log(Cat_Fut);

  // cout << "Next year's catch and decrements"<<endl<<Cat_Fut<<endl;
  lse_eit    = elem_div(std_ot_eit(1,n_eit_r),ot_eit);
  lse_eit    = sqrt(log(square(lse_eit) + 1.));
  lvar_eit   = square(lse_eit);
  var_ob_eit = elem_prod(std_ob_eit_data,std_ob_eit_data);
  for (i=1;i<=n_eit_r;i++) 
		lseb_eit(i) = (std_ob_eit(i)/ob_eit(i));
  lseb_eit   = sqrt(log(square(lseb_eit) + 1.));
  lvarb_eit  = square(lseb_eit);

RUNTIME_SECTION
   maximum_function_evaluations 50,200,900,1800,1900,15000
   convergence_criteria .001,.001,1e-7

PROCEDURE_SECTION
  if (active(yr_eff)||active(coh_eff))
		Est_Fixed_Effects_wts();
  Get_Selectivity();
  Get_Mortality_Rates();
  GetNumbersAtAge();
  Get_Catch_at_Age();
  GetDependentVar();  // Includes MSY, F40% computations
  Evaluate_Objective_Function();
  if (do_fmort)
    Profile_F();
  if (mceval_phase()) 
    write_eval();

REPORT_SECTION
	// if (last_phase()) Get_Replacement_Yield();
  save_gradients(gradients);
  if (last_phase())
		cout << endl<<"Finished last phase: "<<current_phase()<<" ============================================="<<endl<<endl;
  else
		cout << endl<<"Changing phases from: "<<current_phase()<<" ============================================="<<endl<<endl;
	if (ctrl_flag(28)==0 && last_phase())
	{
		int k;
	  i=1;k=i+2;
	  all_like(i,k) = surv_like            ;i+=3;
	  all_like(i)   = cpue_like            ;i++;
	  all_like(i)   = avo_like             ;i++;k=i+2;
	  all_like(i,k) = age_like.shift(i)    ;i+=3;k=i+2;
	  all_like(i,k) = sel_like.shift(i)    ;i+=3;k=i+2;
	  all_like(i,k) = sel_like_dev.shift(i);i+=3;
	  all_like(i)   = wt_like              ;i++;k=i+3;
	  all_like(i,k) = Priors.shift(i)      ;i+=4;k=i+6;
	  all_like(i,k) = rec_like.shift(i)    ;i++ ;
	  age_like.shift(1);
	  sel_like.shift(1);
	  sel_like_dev.shift(1);
	  rec_like.shift(1);
	  Priors.shift(1);
  report << "N"<<endl;
  report << natage<<endl;
  report << "C"<<endl;
  report << catage<<endl;
    legacy_rep << "Francis weights: fishery "<<endl;
    legacy_rep <<calc_Francis_weights(oac_fsh, eac_fsh,sam_fsh )<<endl;
    legacy_rep << "Francis weights: bTS "<<endl;
    legacy_rep <<calc_Francis_weights(oac_bts, eac_bts,sam_bts )<<endl;
    legacy_rep << "Francis weights: ATS "<<endl;
    dvar_matrix eac_ats(1,n_eit_r,mina_eit,nages);
    dmatrix oac_ats(1,n_eit_r,mina_eit,nages);
    for (int i=1;i<=n_eit_r;i++)
    {
      oac_ats(i) = oac_eit(i)(mina_eit,nages);
      eac_ats(i) = eac_eit(i)(mina_eit,nages);
    }
    legacy_rep <<calc_Francis_weights(oac_ats, eac_ats,sam_eit )<<endl;
  // cout<<repl_yld<<endl; cout<<repl_SSB<<endl; cout<<SSB(endyr_r)<<endl; 
  dvariable qtmp = mfexp(mean(log(oa1_eit)-log(ea1_eit)));
  legacy_rep << model_name<<" "<< datafile_name<<" "<<q_bts<<" "<<q_eit<<" "<<q_bts*exp(log_q_std_area)<< " "<<q_all<<" "<<qtmp<<" "<<sigr<<" q's and sigmaR"<<endl;
  legacy_rep << "Estimated Catch and Observed" <<endl;
  legacy_rep << pred_catch <<endl;
  legacy_rep << obs_catch <<endl;
  legacy_rep << "Estimated Survival at age" <<endl;
  for (i=styr;i<=endyr_r;i++) legacy_rep << i<<" "<<S(i) <<endl;
  legacy_rep << "Estimated N at age" <<endl;
  for (i=styr;i<=endyr_r;i++) legacy_rep << i<<" "<<natage(i) <<endl;
  legacy_rep << "selectivity Fishery, trawl survey, and hydro survey" <<endl;
  for (i=styr;i<=endyr_r;i++) legacy_rep << i<<" "<<sel_fsh(i) <<endl;
                              legacy_rep << "Future "<<sel_fut <<endl;
  for (i=styr;i<=endyr_r;i++) legacy_rep << i<<" "<<mfexp(log_sel_bts(i)) <<endl;
  if (use_age1_eit)
    for (i=styr;i<=endyr_r;i++) legacy_rep << i<<" 0 "<<mfexp(log_sel_eit(i)(mina_eit,nages)) <<endl;
  else
    for (i=styr;i<=endyr_r;i++) legacy_rep << i<<" "<<mfexp(log_sel_eit(i)) <<endl;

  legacy_rep << "Fishery observed P at age" <<endl;
  for (i=1;i<=n_fsh_r;i++) legacy_rep << yrs_fsh_data(i)<<" "<<oac_fsh(i) <<endl;
  legacy_rep << "Fishery observed P at size" <<endl;
  legacy_rep << endyr          <<" "<<olc_fsh    <<endl;

  legacy_rep << "Fishery Predicted P at age" <<endl;
  for (i=1;i<=n_fsh_r;i++) legacy_rep << yrs_fsh_data(i)<<" "<<eac_fsh(i) <<endl;
  legacy_rep << "Fishery Predicted P at size" <<endl;
                           legacy_rep << endyr_r        <<" "<<elc_fsh    <<endl;

  legacy_rep << "Survey Observed P at age"<<endl;
  for (i=1;i<=n_bts_r;i++) legacy_rep << yrs_bts_data(i)<<" "<<oac_bts(i) <<endl;
  legacy_rep << "Survey Predicted P at age"<<endl;
  for (i=1;i<=n_bts_r;i++) legacy_rep << yrs_bts_data(i)<<" "<<eac_bts(i) <<endl;

  legacy_rep << "Hydro Survey Observed P at age"<<endl;
  if (use_age1_eit) 
    for (i=1;i<=n_eit_r;i++) legacy_rep << yrs_eit_data(i)<<" 0 "<<oac_eit(i)(mina_eit,nages) <<endl;
  else
    for (i=1;i<=n_eit_r;i++) legacy_rep << yrs_eit_data(i)<<" "<<oac_eit(i) <<endl;

  if (use_last_eit_ac<=0) 
  {
    n_eit_ac_r = n_eit_r-1; 
    iyr          = yrs_eit_data(n_eit_r);
    legacy_rep<<  (elem_prod(natage(iyr),mfexp(log_sel_eit(iyr))) * q_eit)/et_eit(n_eit_r)<<endl; 
  }

  legacy_rep << "Hydro Survey Predicted P at age"<<endl;
  if (use_age1_eit) 
    for (i=1;i<=n_eit_r;i++) legacy_rep << yrs_eit_data(i)<<" 0 "<<eac_eit(i)(mina_eit,nages) <<endl;
  else
    for (i=1;i<=n_eit_r;i++) legacy_rep << yrs_eit_data(i)<<" "<<eac_eit(i) <<endl;

  if (use_last_eit_ac<=0) 
  {
    legacy_rep<<  oac_eit_data(n_eit_r)/sum(oac_eit_data(n_eit_r))  <<endl;
  }
  legacy_rep << "Pred. Survey numbers " <<endl;                 
  legacy_rep << et_bts(1,n_bts_r)  <<" "<<endl;
  legacy_rep << "Obs. Survey numbers " <<endl;
  legacy_rep << ot_bts(1,n_bts_r)  <<" "<<endl;
  legacy_rep << "Pred. hydro Survey numbers " <<endl;
  legacy_rep << et_eit(1,n_eit_r) <<endl;
  legacy_rep << "Obs. hydro Survey numbers " <<endl;   
  legacy_rep << ot_eit(1,n_eit_r) <<endl;
  legacy_rep << "Yrs. AVO biomass " <<endl;
  legacy_rep << yrs_avo(1,n_avo) <<endl;
  legacy_rep << "Pred. AVO biomass " <<endl;
  legacy_rep << pred_avo(1,n_avo) <<endl;
  legacy_rep << "Obs. AVO biomass biomass " <<endl;   
  legacy_rep << obs_avo(1,n_avo) <<endl<<endl;

  legacy_rep << "Obs. Japanese CPUE " <<endl;   
  legacy_rep << obs_cpue(1,n_cpue) <<endl;
  legacy_rep << "Pred Japanese CPUE " <<endl;   
  legacy_rep << pred_cpue(1,n_cpue) <<endl<<endl;

  legacy_rep << "Fmort " <<endl;
  legacy_rep << Fmort  <<endl;
  legacy_rep << "Natural Mortality" << endl;
  legacy_rep << natmort  <<endl;
  legacy_rep << "Catch at age year" << endl;
  for (i=styr;i<=endyr_r;i++) legacy_rep << i<<" "<<catage(i)<<endl;
  legacy_rep << "available biomass by year" << endl;
  for (i=styr;i<=endyr_r;i++)
  {
    dvar_vector real_sel=sel_fsh(i)/max(sel_fsh(i));
    dvar_vector avbio= elem_prod(elem_prod(natage(i),real_sel),wt_fsh(i));
    legacy_rep << i<<" "<<sum(avbio) << "  " <<  avbio  << endl;
  }
  legacy_rep << endl;
  legacy_rep << "Overall--Phase: "<< current_phase()<<"-----------------------"<<endl;
  legacy_rep << fff << endl;
  legacy_rep << "Catch_and_indices-----------------------------"<<endl;
  legacy_rep << "Fishery_Catch  "
         << ctrl_flag(1) * ssqcatch      << endl;
  legacy_rep << "wt_like  "
         <<   wt_like                    << endl;
  legacy_rep << "CPUE_like "
         << ctrl_flag(12) * cpue_like    << endl;
  legacy_rep << "Bottom_Trawl_Like "
         << ctrl_flag(2) * surv_like(1)  << endl;
  legacy_rep << "EIT_N2+_Like "
         << ctrl_flag(5) * surv_like(2)  << endl;
  legacy_rep << "EIT_N1_Like "
         << ctrl_flag(2) * surv_like(3)  << endl<<endl;
  legacy_rep << "AVO_Biom_Like "
         << ctrl_flag(6) * avo_like      << endl<<endl;

  legacy_rep << "AgeComps--------------------------------------"<<endl;
  legacy_rep << "Fishery_age_Like "
         << ctrl_flag(7) * age_like(1) << endl;
  legacy_rep << "Fishery_Length_Like "
         << ctrl_flag(7) * len_like    << endl;
  legacy_rep << "Bottom_Trawl_age_Like "
         << ctrl_flag(8) * age_like(2) << endl;
  legacy_rep << "EIT_Age_Like "
         << ctrl_flag(9) * age_like(3) << endl<<endl;

  legacy_rep << "Priors ---------------------------------------"<<endl;
  legacy_rep << "F_penalty " 
         << ctrl_flag(4) * F_pen       << endl;
  legacy_rep << "Rec_Like_1 "   
         << ctrl_flag(3) * rec_like(1) << endl;
  legacy_rep << "Rec_Like_2 "
         << ctrl_flag(3) * rec_like(2) << endl;
  legacy_rep << "Rec_Like_3 "
         << ctrl_flag(3) * rec_like(3) << endl;
  legacy_rep << "Rec_Like_4 "
         << ctrl_flag(3) * rec_like(4) << endl;
  legacy_rep << "Rec_Like_5 "
         << ctrl_flag(3) * rec_like(5) << endl;
  legacy_rep << "Rec_Like_6 "
         << ctrl_flag(3) * rec_like(6) << endl;

  legacy_rep << "sel_Like_1 "
         << sel_like(1) << endl;
  legacy_rep << "sel_Like_2 "
         << sel_like(2) << endl;
  legacy_rep << "sel_Like_3 "
         << sel_like(3) << endl;

  legacy_rep << "sel_Like_devs_1 "
         << sel_like_dev(1) << endl;
  legacy_rep << "sel_Like_devs_2 "
         << sel_like_dev(2) << endl;
  legacy_rep << "sel_Like_devs_3 "
         << sel_like_dev(3) << endl;

  legacy_rep << "sel_avg_fishery "
      << 10.*square(avgsel_fsh)<<endl;
  legacy_rep << "sel_avg_BTS     "
      << 10.*square(avgsel_bts)<<endl;
  legacy_rep << "sel_avg_EIT "
      << 10.*square(avgsel_eit)<<endl;

  legacy_rep << "Prior_h "
         << Priors(1) <<" "<<srprior_a<<" "<<srprior_b<<" Alpha_Beta_of_Prior "<<endl;
  legacy_rep << "Prior_q "
         << Priors(2) <<endl<<endl;

  legacy_rep << "Totals----------------------------------------"<<endl;
  legacy_rep << "Without_prior " << fff - (sum(rec_like)+sum(sel_like)+sum(sel_like_dev)+ sum(Priors)) <<endl;
  legacy_rep << "With_Priors "<< fff<<endl<<endl;

  legacy_rep << "Spawning_Biomass  "<<endl;
  legacy_rep << SSB  <<endl;
  legacy_rep << "larv_rec_devs"<<endl;
  legacy_rep << larv_rec_devs<<endl;
  legacy_rep << " Spawners and Rhat for plotting" <<endl;
  legacy_rep << SRR_SSB<<endl;
  legacy_rep << rechat<<endl;
  for (i=1;i<=11;i++)
    for (j=1;j<=11;j++)
      legacy_rep << 1.66679*(double(j)-6.) / 2. -164.4876 <<" "<< 0.62164*(double(i)-6.) / 2. + 56.1942 <<" "<< exp(larv_rec_devs(i,j)) <<endl;
  legacy_rep << rec_epsilons-log_rec_devs<<endl;
  // Report on bottom temperature affect on survey q
  legacy_rep << endl<<"Year"<<" Temperature q mean"<< endl;
  for (i=1;i<=n_bts_r;i++)
    legacy_rep << yrs_bts_data(i)<<" "<< bottom_temp(i)<<" "<< bt_slope * bottom_temp(i) + q_bts<<" "<<q_bts <<endl;
  legacy_rep<<endl;

  if(last_phase() )
  {
    dvar_matrix eac_fsh_2(1,14,1,nages);
    dvar_matrix eac_fsh_3(15,35,1,nages);
    dvar_matrix eac_fsh_4(36,n_fsh_r,1,nages);
    dmatrix     oac_fsh_2(1,14,1,nages);
    dmatrix     oac_fsh_3(15,35,1,nages);
    dmatrix     oac_fsh_4(36,n_fsh_r,1,nages);
    dvector     sam_fsh_2(1,14);
    dvector     sam_fsh_3(15,35);
    dvector     sam_fsh_4(36,n_fsh_r);
    for (int i=1;i<=n_fsh_r;i++)
    {
      if (i<=14)
      {
        oac_fsh_2(i) = oac_fsh(i);
        eac_fsh_2(i) = eac_fsh(i);
        sam_fsh_2(i) = sam_fsh(i);
      }
      else
      if (i<=35)
      {
          oac_fsh_3(i) = oac_fsh(i);
          eac_fsh_3(i) = eac_fsh(i);
          sam_fsh_3(i) = sam_fsh(i);
      }
      else
      {
          oac_fsh_4(i) = oac_fsh(i);
          eac_fsh_4(i) = eac_fsh(i);
          sam_fsh_4(i) = sam_fsh(i);
      }
    }

  if (ctrl_flag(28)==0 && last_phase())
	{
    FW_fsh(1) = calc_Francis_weights(oac_fsh, eac_fsh,sam_fsh );
    FW_fsh(2) = calc_Francis_weights(oac_fsh_2, eac_fsh_2,sam_fsh_2 );
    FW_fsh(3) = calc_Francis_weights(oac_fsh_3, eac_fsh_3,sam_fsh_3 );
    FW_fsh(4) = calc_Francis_weights(oac_fsh_4, eac_fsh_4,sam_fsh_4 );

    FW_bts    = calc_Francis_weights(oac_bts, eac_bts,sam_bts );
    dvar_matrix eac_ats(1,n_eit_r,mina_eit,nages);
    dmatrix oac_ats(1,n_eit_r,mina_eit,nages);
    for (int i=1;i<=n_eit_r;i++)
    {
      oac_ats(i) = oac_eit(i)(mina_eit,nages);
      eac_ats(i) = eac_eit(i)(mina_eit,nages);
    }
    FW_eit = calc_Francis_weights(oac_ats, eac_ats,sam_eit );
	}
    // cout<<"Report"<<endl;
    get_msy();
    // cout<<"Report"<<endl;
    get_SER();
    cout<<"Last phase in legacy_rep section"<<endl;
  legacy_rep << "F40  F35"  <<endl;
  legacy_rep << F40<<" "<<F35 <<endl;
  legacy_rep << "Future_Selectivity"<<endl;
  legacy_rep << sel_fut<<endl;

  Future_projections_fixed_F();
  legacy_rep << "Future Fmsy " <<endl;
    for (i=styr_fut;i<=endyr_fut;i++) 
      legacy_rep << mean(F_future(1,i))<<" " << endl;
  legacy_rep << "Numbers at age in Future (for Fmsy)"<<endl;
  legacy_rep << natage_future(3) <<endl;
  legacy_rep <<"Fmsy, MSY, Steepness, Rzero, Bzero, PhiZero, Alpha, Beta, SPB0, SPRBF40, Fmsy2, Bmsy2"<<endl;
  legacy_rep << Fmsy<<" "<<MSY<<" "<<steepness<<" "<<Rzero<<" "<<Bzero<<" "<<phizero<<" "<<alpha<<" "<<beta<<" "<<phizero*meanrec
  <<" "<<phizero*meanrec*.4
  <<" "<<Fmsy2
  <<" "<<Bmsy2
  <<endl;
  }
  legacy_rep<<"Num_parameters_Estimated "<<initial_params::nvarcalc()<<endl;
  legacy_rep<<  SSB(styr_est-1,endyr_est-1)<<endl
        <<  pred_rec(styr_est,endyr_est) <<endl
        <<  (SRecruit(SSB(styr_est-1,endyr_est-1))) <<endl
        <<  log(pred_rec(styr_est,endyr_est))- ++log(SRecruit(SSB(styr_est-1,endyr_est-1)))<<endl;

  if (last_phase())
  {
    if(iseed>0)
      SimulateData1();
    cout<< "Estimated and SR-predicted recruits"<<endl;
    cout<< pred_rec(styr,endyr_r)<<endl;
    cout<< SRecruit(SSB(styr,endyr_r))<<endl;

    write_projout2();
    write_projout();
    // write_newproj();
    ofstream temp_q("temp_q.rep");
    for (i=1;i<=5;i++)
    {
      q_temp(i)         = bt_slope * double(i-3)*.15 + q_bts ;
      temp_q<< double(i-3)*.15 <<" "<< q_temp(i)         <<  endl;
    }
  }
  legacy_rep << "Age_1_EIT index"<<endl;
  legacy_rep << yrs_eit_data     <<endl;
  legacy_rep << oa1_eit          <<endl;
  legacy_rep << ea1_eit*qtmp     <<endl;
  legacy_rep << ea1_eit          <<endl;

  legacy_rep << "Obs_Pred_BTS_Biomass"<<endl;
  legacy_rep << yrs_bts_data     <<endl;
  legacy_rep << ob_bts           <<endl;
  legacy_rep << eb_bts           <<endl;

  legacy_rep << "Obs_Pred_EIT_Biomass"<<endl;
  legacy_rep << yrs_eit_data     <<endl;
  legacy_rep << ob_eit     <<endl;
  legacy_rep << eb_eit     <<endl;
  legacy_rep << "Pred_EIT_N_age"<<endl;
  for (i=1;i<=n_eit_r;i++)
    legacy_rep << yrs_eit_data(i)<<" "<<et_eit(i)*eac_eit(i)(2,15)     <<endl;
  legacy_rep << "Stock-Rec_Residuals"<<endl;
  for (i=styr_est;i<=endyr_est;i++)
    legacy_rep << i<<" "<<SR_resids(i)     <<endl;
  legacy_rep << "Years Combined_Indices_CV Observed Predicted Avail_BTS Avail_EIT Likelihood"<<endl;
  /* 
  if (last_phase())
  {
    get_combined_index();
    for (i=1;i<=n_bts_r;i++)
      legacy_rep << yrs_bts_data(i)<<" "<<pow(var_cmb(i),.5)/ot_cmb(i)<< " "<< ot_cmb(i)<<" "<<et_cmb(i) <<" " 
             << avail_bts(i) <<" "
             << avail_eit(i) <<" "
             << square(ot_cmb(i)-et_cmb(i))/(2.*var_cmb(i))
             << endl;
  } 
  */ 
  legacy_rep << F<<endl;
  legacy_rep << wt_pre<<endl;
	}
FUNCTION Get_Selectivity
  avgsel_fsh.initialize();
  avgsel_bts.initialize();
  avgsel_eit.initialize();
  //cout<<"InSel"<<endl;
  // Basic free-form penalized selectivities for fishery, calls different function if devs active or not
  if (active(sel_devs_fsh))
    log_sel_fsh = compute_fsh_selectivity(n_selages_fsh,styr,avgsel_fsh,sel_coffs_fsh,sel_devs_fsh,group_num_fsh);
  else 
    log_sel_fsh = compute_selectivity(n_selages_fsh,styr,avgsel_fsh,sel_coffs_fsh);
  //cout<<"InSel"<<endl;

  if (phase_logist_fsh>0) // For logistic fishery selectivity (not default, NOT USED)
  {
    dvariable dif;
    dvariable inf;
    if (active(sel_a501_fsh_dev))
    {
      dvar_matrix seldevs_tmp(1,3,styr,endyr_r);
      seldevs_tmp(1) = sel_dif1_fsh_dev;
      seldevs_tmp(2) = sel_a501_fsh_dev;
      seldevs_tmp(3) = sel_trm2_fsh_dev;
      log_sel_fsh = compute_selectivity1(styr,sel_dif1_fsh,sel_a501_fsh,sel_trm2_fsh,seldevs_tmp);
    }
    else 
      log_sel_fsh = compute_selectivity1(styr,sel_dif1_fsh,sel_a501_fsh,sel_trm2_fsh);
  }

  //cout<<"InSel"<<endl;
  // Eq. 4
  if (active(sel_a50_bts))
  {
    if (active(sel_a50_bts_dev))
      log_sel_bts = compute_selectivity(styr_bts,sel_slp_bts,sel_a50_bts,sel_slp_bts_dev,sel_a50_bts_dev); // log_sel_bts = compute_selectivity(styr_bts,sel_slp_bts,sel_a50_bts,sel_a50_bts_dev);
    else 
      log_sel_bts = compute_selectivity(styr_bts,sel_slp_bts,sel_a50_bts);

  // Bottom trawl selectivity of age 1's independent of logistic selectivity
    for (i=styr_bts;i<=endyr_r;i++)
      log_sel_bts(i,1) = sel_age_one*exp(sel_one_bts_dev(i));
  }
  else
    if (active(sel_devs_bts))
      log_sel_bts = compute_selectivity(n_selages_bts,styr_bts,avgsel_bts,sel_coffs_bts,sel_devs_bts,group_num_bts);
    else 
      log_sel_bts = compute_selectivity(n_selages_bts,styr_bts,avgsel_bts,sel_coffs_bts);


  if (active(sel_devs_eit))
    log_sel_eit = compute_selectivity_eit(n_selages_eit,styr_eit,avgsel_eit,sel_coffs_eit,sel_devs_eit);
    // log_sel_eit = compute_selectivity(n_selages_eit,styr_eit,avgsel_eit,sel_coffs_eit,sel_devs_eit,group_num_eit);
  else 
    log_sel_eit = compute_selectivity_eit(n_selages_eit,styr_eit,avgsel_eit,sel_coffs_eit);
  //cout<<"InSel"<<endl;

  sel_fsh = mfexp(log_sel_fsh);
  compute_Fut_selectivity();

FUNCTION Get_Mortality_Rates
  if (active(natmort_phi)) // Sensitivity approach for estimating natural mortality (as offset of input vector, NOT USED, NOT IN DOC)
    natmort(3,nages) = base_natmort(3,nages) * mfexp(natmort_phi);

  Fmort=  mfexp(log_avg_F + log_F_devs); // Eq. 2
  for (i=styr; i<=endyr_r; i++)
  {
    if (i==styr) 
      M(i) = natmort;
    else
      M(i) = M(i-1)*mfexp(M_dev(i));
    F(i) = Fmort(i) * sel_fsh(i); // Eq. 2
    Z(i) = F(i) + M(i); // Eq. 1
  }
  S=mfexp(-1.0*Z); // Eq. 1
FUNCTION GetNumbersAtAge 
  //-This calculates the first year's numbers at age, estimated freely (no equil. assumptions)
  Get_Bzero();
  for (i=styr;i<=endyr_r;i++)
    rec_epsilons(i)=log_rec_devs(i)+larv_rec_devs(nsindex(i),ewindex(i));

  log_initage=log_initdevs+log_avginit; 

  natage(styr)(2,nages)=mfexp(log_initage); // Eq. 1

  // Recruitment in subsequent years
  for (i=styr;i<=endyr_r;i++)
  {
    natage(i,1) = mfexp(log_avgrec+rec_epsilons(i)); // Eq. 1
    pred_rec(i) = natage(i,1);
  }

  SSB(styr)  = elem_prod(elem_prod(natage(styr),pow(S(styr),yrfrac)),p_mature)*wt_ssb(styr); // Eq. 1
  natage(styr+1)(2,nages) = ++elem_prod(natage(styr)(1,nages-1), S(styr)(1,nages-1));   // Eq. 1
  natage(styr+1,nages)   += natage(styr,nages)*S(styr,nages); // Eq. 1

  for (i=styr+1;i<endyr_r;i++)
  {
    SSB(i)          = elem_prod(elem_prod(natage(i),pow(S(i),yrfrac)),p_mature)*wt_ssb(i); // Eq. 1
    natage(i+1)(2,nages) = ++elem_prod(natage(i)(1,nages-1), S(i)(1,nages-1));   // Eq. 1
    natage(i+1,nages)   += natage(i,nages)*S(i,nages); // Eq. 1
  }
  SSB(endyr_r)  = elem_prod(elem_prod(natage(endyr_r),pow(S(endyr_r),yrfrac)),p_mature)*wt_ssb(endyr_r); // Eq. 1

  meanrec = mean(pred_rec(styr_est,endyr_r)); 
FUNCTION GetDependentVar 
  // For making some output for spiffy output
  // Spiffy SR output
  tmpsp=1.1*max(SSB);
  if (tmpsp<Bzero) tmpsp=1.1*Bzero;
  dvariable Xspawn ;
  for (i=1;i<=20;i++)
  {
    SRR_SSB(i)=tmpsp*double(i-.5)/19.5;
    Xspawn = SRR_SSB(i); 
    rechat(i)=SRecruit(Xspawn); // Eq. 12
  }

  if (last_phase())
  {
  // Spiffy q-temperature relationship output
    for (i=1;i<=5;i++)
      q_temp(i)         = bt_slope * double(i-3)*.6666666667 + q_bts ;

    SB100   = meanrec*Bzero/Rzero ;
    F40_spb = 0.4*SB100;
    SBF40   = F40_spb;
    SBF35   = 0.35*SB100;
    compute_Fut_selectivity();
    compute_spr_rates();
  }
  ////For standard deviation report////////////////////
  // if (mceval_phase())
  if (sd_phase()||mceval_phase())
  {

    for (i=styr;i<=endyr_r;i++)
    {
      age_3_plus_biom(i) = natage(i)(3,nages) * wt_ssb(i)(3,nages); 
      age_1_7_biomass(i) = natage(i)(1,7) * wt_ssb(i)(1,7); 
      Age3_Abund(i) = natage(i,3);
    }
    regime(1) = mean(pred_rec(1964,1977));
    regime(4) = mean(pred_rec(1978,1989));

    if (endyr_r>=2005)
    {
      regime(2) = mean(pred_rec(1978,2005));
      regime(5) = mean(pred_rec(1990,2005));
      regime(7) = mean(pred_rec(2000,2005));
      regime(8) = mean(pred_rec(1964,2005));
      regime(6) = mean(pred_rec(1990,1999));
      regime(3) = mean(pred_rec(1978,1999));
    }
    else
    {
      if (endyr_r<=2000)
        regime(7) = pred_rec(endyr_r);
      else
        regime(7) = mean(pred_rec(2000,endyr_r));

      regime(2) = mean(pred_rec(1978,endyr_r));
      regime(5) = mean(pred_rec(1990,endyr_r));
      regime(8) = mean(pred_rec(1964,endyr_r));
      if (endyr_r<=1999)
      {
        regime(3) = mean(pred_rec(1978,endyr_r));
        regime(6) = mean(pred_rec(1990,endyr_r));
      }
      else
      {
        regime(6) = mean(pred_rec(1990,1999));
        regime(3) = mean(pred_rec(1978,1999));
      }
    }
    if (!mceval_phase()) get_msy();

    dvar_vector res(1,4);
    res.initialize(); 
    res      = get_msy_wt();
    Fmsy_wt  = res(1);
    MSY_wt   = res(2);
    Bmsy2_wt = res(3);      
    Fmsy2_wt = res(4);   
    // cout <<"Msy stuff: "<<res<<endl;
    for (int iyr=10;iyr>=1;iyr--)
    {
      res.initialize(); 
      sel_fut   = sel_fsh(endyr_r-iyr+1);
      sel_fut  /=sel_fut(6); // NORMALIZE TO AGE 6
      if (!mceval_phase()) res = get_msy_wt(); 
      Fmsy2_dec(iyr) = res(4); 
    //   cout <<endyr_r - iyr +1<<" "<<res<<endl;
    }
		// need to reset it ...
    compute_Fut_selectivity();
    
    for (int iyr=10;iyr>=1;iyr--)
    {
      res.initialize(); 
      wt_fut(3,nages) = wt_pre(endyr_r-iyr+1);
      if (!mceval_phase()) res = get_msy_wt();
      Fmsy2_decwt(iyr) = res(4);
      // cout <<endyr_r - iyr +1<<" "<<res<<endl;
    }
    
    i = endyr_r;
    dvar_vector Ntmp(1,nages);
    dvar_vector Ntmp2(1,nages);
    dvar_vector Stmp(1,nages);
    dvariable   Ftmp;
    Ntmp.initialize();
    Ntmp2.initialize();
    Stmp.initialize();

    endyr_N       = natage(endyr_r);
    Ntmp(2,nages) = ++elem_prod(natage(i)(1,nages-1), S(i)(1,nages-1));  
    Ntmp(nages)  += natage(i,nages)*S(i,nages);
    Ntmp(1)       = meanrec;
    age_3_plus_biom(i+1)  = Ntmp(3,nages) * wt_ssb(i)(3,nages); 

    Ftmp = SolveF2(Ntmp, Cat_Fut(1));
    Stmp = mfexp(-(Ftmp*sel_fut + natmort));
    Ntmp2(2,nages) = ++elem_prod(Ntmp(1,nages-1), Stmp(1,nages-1));  
    Ntmp2(nages)  += Ntmp(nages)*Stmp(nages);
    Ntmp2(1)       = meanrec;
    age_3_plus_biom(i+2)  = Ntmp2(3,nages) * wt_ssb(endyr_r)(3,nages); 

    // Loop over range of future catch levels
		for (int icat=1;icat<=10;icat++)
    {
      Ntmp(2,nages) = ++elem_prod(natage(i)(1,nages-1), S(i)(1,nages-1));  
      Ntmp(nages)  += natage(i,nages)*S(i,nages);
      Ntmp(1)       = meanrec;
      Ftmp = SolveF2(Ntmp, Cat_Fut(icat));
      Stmp = mfexp(-(Ftmp*sel_fut + natmort));
      // ABC_biom = age_3_plus_biom(i+1) ; // ABC_biom =  elem_prod(p_mature,Ntmp) * elem_prod(wt_ssb(i),pow(Stmp,yrfrac)); 
      ABC_biom(icat) =  elem_prod(sel_fut,Ntmp) * wt_ssb(i); 
      SSB_1(icat)    = value(elem_prod(elem_prod(Ntmp,pow(Stmp,yrfrac)),p_mature)*wt_ssb(endyr_r));
    
   // Add to get 2-yr projection of ABC based on harmonic mean
      Ntmp2(2,nages) = ++elem_prod(Ntmp(1,nages-1), Stmp(1,nages-1));  
      Ntmp2(nages)  += Ntmp(nages)*Stmp(nages);
      Ntmp2(1)       = meanrec;
      Ftmp = SolveF2(Ntmp2,Cat_Fut(icat)); // mean(obs_catch(endyr_r-3,endyr_r)));
      Stmp = mfexp(-(Ftmp*sel_fut + natmort));
      ABC_biom2(icat) =  elem_prod(sel_fut,Ntmp2) * wt_ssb(i); 
      SSB_2(icat)   = value(elem_prod(elem_prod(Ntmp2,pow(Stmp,yrfrac)),p_mature)*wt_ssb(endyr_r));
      if(SSB_1(icat) < value(Bmsy))
        adj_1(icat) = value((SSB_1(icat)/Bmsy - 0.05)/(1.-0.05));
      if(SSB_2(icat) < value(Bmsy))
        adj_2(icat) = value((SSB_2(icat)/Bmsy - 0.05)/(1.-0.05));
    }

    get_SER();
    begbiom           = natage(styr)*wt_ssb(styr);
    Current_Spawners  = SSB(endyr_r);
    DepletionSpawners = SSB(endyr_r)/SSB(styr);
    Future_projections_fixed_F();
    // F40_catch = catch_future(1,styr_fut);
    if (sd_phase())
    {
      // Re-run w/o F mort (for output)
      write_nofish();
      write_srec();
    }
    Percent_Bzero   = SSB(endyr_r) / Bzero;
    Percent_Bzero_1 = future_SSB(4,styr_fut) / Bzero;
    Percent_Bzero_2 = future_SSB(5,styr_fut) / Bzero;
    Percent_B100   = SSB(endyr_r) / SB100;
    Percent_B100_1 = future_SSB(4,styr_fut) / SB100;
    Percent_B100_2 = future_SSB(5,styr_fut) / SB100;
  }  // End of sd_phase

FUNCTION Future_projections_fixed_F
  // wt_fut = wt_fsh(endyr_r);
  future_catch.initialize();
  future_SSB.initialize();
  dvariable sumtmp1;
  dvariable sumtmp2;
  dvariable MeanSSB;
  dvar_vector ptmp(1,nages);
  sumtmp1=0.;
  sumtmp2=0.;
  dvector agevec(1,nages);
	for (int j=1;j<=nages;j++) agevec(j) = double(j);
  for (i=styr; i<=endyr_r; i++)
  {
		dvar_vector wtmatage = elem_prod(elem_prod(natage(i),wt_ssb(i)),p_mature);
    avg_age_mature(i) = (agevec * wtmatage)/sum(wtmatage);
    ptmp     = wtmatage +0.0001;
    ptmp    /= sum(ptmp);
    H(i)     = mfexp(-ptmp*log(ptmp));
    sumtmp1 += sum(natage(i)(1,5));
    sumtmp2 += sum(natage(i)(6,nages));
  }
  MeanSSB    = mean(SSB(1978,endyr_r-1));
  // R_report(H);
  for (int k=1;k<=nscen;k++) {
    future_SSB(k,endyr_r)         = SSB(endyr_r);
    dvariable Xspawn ;
    if (phase_sr<0) 
      natage_future(k,styr_fut, 1)  = mfexp(log_avgrec + rec_dev_future(styr_fut)); // Note no bias correction, should be ok in MCMC mode...
    else //Stock-recruitment curve included---------
    {
      Xspawn =   future_SSB(k,endyr_r) ;
      natage_future(k,styr_fut,1)   = SRecruit(Xspawn) * mfexp(rec_dev_future(styr_fut) ); // Note no bias correction, should be ok in MCMC mode...
    }
    natage_future(k,styr_fut)(2,nages)  = ++elem_prod(natage(endyr_r)(1,nages-1), S(endyr_r)(1,nages-1));  
    natage_future(k,styr_fut,nages)    += natage(endyr_r,nages)*S(endyr_r,nages);
    // Set two-year olds in 1st future year to mean value...
    // natage_future(k,styr_fut,2)         = mean(column(natage,2));
    // natage_future(k,styr_fut,5)         = mean(column(natage,5));

      // case 2:
        // F_future(k,i) = sel_fut * F35;
        // break;
    // sel_fut is normalized to age 6 (=1)
    // ftmp = F_future(k,i,6);
    // Get future F's since these are the same in the future...
    if (k==1) // for all cases...
      ftmp = SolveF2(natage_future(k,i),obs_catch(endyr_r));
		else
		{
	    if (nscen>8)
        ftmp= F(endyr_r,6) * ((double(k-1)-1.)*.05 + 0.5); // this takes endyr F and brackets it...
	    else
        ftmp = SolveF2(natage_future(k,styr_fut),dec_tab_catch(k));
		}
    for (i=styr_fut;i<=endyr_fut;i++)
    {
      F_future(k,i) = sel_fut*ftmp;
      Z_future(i) = F_future(k,i) + natmort;
      S_future(i) = mfexp(-Z_future(i));
      dvariable criterion;
      dvariable Bref ;
      future_SSB(k,i)   = elem_prod(elem_prod(natage_future(k,i),pow(S_future(i),yrfrac)), p_mature) * wt_ssb(endyr_r);
    // Now compute the time of spawning SSB for everything else....
      // future_SSB(k,i)   = elem_prod(elem_prod(natage_future(k,i),pow(S_future(i),yrfrac)), p_mature) * wt_ssb(endyr_r);

      if (phase_sr<0) //No Stock-recruitment curve for future projections--------
        natage_future(k,i, 1)  = mfexp(log_avgrec + rec_dev_future(i));
      else //Use Stock-recruitment curve ---------
      {
        Xspawn =future_SSB(k,i-1);  
        natage_future(k,i,1)   = SRecruit(Xspawn)  * mfexp(rec_dev_future(i) );
      }
    
      if (i<endyr_fut)
      {
        natage_future(k,i+1)(2,nages) = ++elem_prod(natage_future(k,i)(1,nages-1), S_future(i)(1,nages-1));  
        natage_future(k,i+1,nages)   +=  natage_future(k,i,nages)*S_future(i,nages);
      }

      catage_future(i)  = elem_prod( elem_prod(natage_future(k,i) , F_future(k,i) ) , elem_div( (1. - S_future(i)) , Z_future(i) ));
      future_catch(k,i) = catage_future(i)*wt_fut;
      future_SER(k,i)   = get_SER(natage_future(k,i),mean(F_future(k,i)));
    }
    if (phase_sr<0)
      natage_future(k,endyr_fut, 1) = mfexp(log_avgrec + rec_dev_future(endyr_fut));
    else
    {
      Xspawn =future_SSB(k,endyr_fut-1);  
      natage_future(k,endyr_fut,1)  = SRecruit(Xspawn) * mfexp(rec_dev_future(endyr_fut) );
    }
    future_SSB(k,endyr_fut)    = elem_prod(elem_prod(natage_future(k,endyr_fut),pow(S_future(endyr_fut),yrfrac)), p_mature) * wt_ssb(endyr_r);
    
    Fcur_Fmsy(k)   = F_future(k,styr_fut,6)/Fmsy;
    Bcur_Bmsy(k)   = future_SSB(k,styr_fut+1)/Bmsy;
    Bcur_Bmean(k)  = future_SSB(k,styr_fut+1)/MeanSSB;
    Bcur2_Bmsy(k)  = future_SSB(k,styr_fut+2)/Bmsy;
    Bcur2_B20(k)   = future_SSB(k,styr_fut+2)/(.2*Bzero);
    Bcur3_Bcur(k)  = future_SSB(k,styr_fut+4)/future_SSB(k,styr_fut);
    Bcur3_Bmean(k) = future_SSB(k,styr_fut+4)/MeanSSB;
    ptmp           = elem_prod(elem_prod(natage_future(k,styr_fut+1),wt_ssb(endyr_r)),p_mature)+0.0001;
    ptmp          /= sum(ptmp);
    MatAgeDiv1(k)  = mfexp(-ptmp*log(ptmp))/(H(1994));
    ptmp           = elem_prod(elem_prod(natage_future(k,endyr_fut),wt_ssb(endyr_r)),p_mature)+0.0001;
    ptmp          /= sum(ptmp);
    MatAgeDiv2(k)  = mfexp(-ptmp*log(ptmp))/(H(1994));
    RelEffort(k)   = F_future(k,styr_fut,6)/F(endyr_r,6) ; // Effort relative to 2012 (endyr)   
    LTA1_5(k)      = sum(natage_future(k,endyr_fut)(1,5))/sum(natage_future(k,endyr_fut)(6,nages));                                                   // long term average age 1_5
    LTA1_5R(k)     = LTA1_5(k)/(sumtmp1/sumtmp2);
  }   //End of loop over F's

FUNCTION dvariable get_SER(const dvariable& Ftmp)
  RETURN_ARRAYS_INCREMENT();
  dvar_vector NoFishSurvival=mfexp(-natmort);
  dvar_vector WiFishSurvival=mfexp(-natmort - Ftmp*sel_fut);
  dvar_vector Ntmp(1,nages);
  dvariable spawn_nofsh;
  dvariable spawn_wfsh;
  spawn_nofsh.initialize();
  spawn_wfsh.initialize();
  Ntmp.initialize();
  Ntmp(1) = 1.;
  for (j=2;j<nages;j++) 
    Ntmp(j) = Ntmp(j-1) * NoFishSurvival(j-1);
  Ntmp(nages) = Ntmp(nages-1)/(1-NoFishSurvival(nages));
  spawn_nofsh  = elem_prod(Ntmp,wt_ssb(endyr_r))  * p_mature; //Target computation, note restarts Ntmp in next line

  for (j=2;j<nages;j++) Ntmp(j) = Ntmp(j-1) * WiFishSurvival(j-1);
  Ntmp(nages) = Ntmp(nages-1)/(1-WiFishSurvival(nages));
  spawn_wfsh  = elem_prod(Ntmp,wt_ssb(endyr_r))  * p_mature; //Target computation, note restarts Ntmp in next line

  RETURN_ARRAYS_DECREMENT();
  return(1. - spawn_wfsh / spawn_nofsh) ;
FUNCTION dvariable get_SER(dvar_vector& Ntmp, const dvariable& Ftmp)
  RETURN_ARRAYS_INCREMENT();
  dvar_vector NoFishSurvival=mfexp(-natmort);
  dvar_vector WiFishSurvival=mfexp(-natmort - Ftmp*sel_fut);
  dvar_vector Ntmpw(1,nages);
  dvar_vector Ntmpwo(1,nages);
  dvariable spawn_nofsh;
  dvariable spawn_wfsh;
  spawn_nofsh.initialize();
  spawn_wfsh.initialize();
  Ntmpwo.initialize();
  Ntmpw.initialize();
  // for (j=2;j<nages;j++) Ntmpwo(j) = Ntmpwo(j-1) * NoFishSurvival(j-1);
  Ntmpw(1)      = Ntmp(1);
  Ntmpw(2,nages)= ++elem_prod(Ntmp(1,nages-1), WiFishSurvival(1,nages-1));  
  Ntmpw(nages) += Ntmp(nages) * WiFishSurvival(nages);
  spawn_wfsh  = elem_prod(Ntmpw,wt_ssb(endyr_r))  * p_mature; //Target computation, note restarts Ntmp in next line

  // Now do without fishing
  Ntmpwo(1)      = Ntmp(1);
  Ntmpwo(2,nages)= ++elem_prod(Ntmp(1,nages-1), NoFishSurvival(1,nages-1));  
  Ntmpwo(nages) += Ntmp(nages) * NoFishSurvival(nages);
  spawn_nofsh  = elem_prod(Ntmpwo,wt_ssb(endyr_r))  * p_mature; //Target computation, note restarts Ntmp in next line

  RETURN_ARRAYS_DECREMENT();
  return(1. - spawn_wfsh / spawn_nofsh) ;
FUNCTION get_SER
  dvar_vector NoFishSurvival=mfexp(-natmort);
  dvar_vector Ntmp(1,nages); 
  dvariable spawn_nofsh;
  dvariable spawn_wfsh;
  // S = Matrix of survival (sel(j)*fmort(i)+natmort)
  for (i=styr;i < endyr_r;i++)
  {
    Ntmp(1)      = natage(i+1,1);
    Ntmp(2,nages)= ++elem_prod(natage(i)(1,nages-1), S(i)(1,nages-1));  
    Ntmp(nages) += Ntmp(nages) * S(i,nages);

    spawn_wfsh  = elem_prod(Ntmp,wt_ssb(i))  * p_mature; //Target computation, note restarts Ntmp in next line

    Ntmp(1)      = natage(i+1,1);
    Ntmp(2,nages)= ++elem_prod(natage(i)(1,nages-1), NoFishSurvival(1,nages-1));  
    Ntmp(nages) += Ntmp(nages) * NoFishSurvival(nages);//Accumulate last age group

    spawn_nofsh = elem_prod(Ntmp,wt_ssb(i)) * p_mature;  // Same as above target, but this time w/o fshing

    SER(i)       = 1. - spawn_wfsh/spawn_nofsh;
  }
  // This is just for the last year...
  Ntmp(1)       = natage(endyr_r,1);
  Ntmp(2,nages) = ++elem_prod(natage(endyr_r)(1,nages-1), S(endyr_r)(1,nages-1));  
  Ntmp(nages)  += Ntmp(nages) * S(endyr_r,nages);
  spawn_wfsh   = elem_prod(Ntmp,wt_ssb(endyr_r))  * p_mature;

  Ntmp(2,nages) = ++elem_prod(natage(endyr_r)(1,nages-1), NoFishSurvival(1,nages-1));  
  Ntmp(nages)  += Ntmp(nages) * NoFishSurvival(nages);
  spawn_nofsh  = elem_prod(Ntmp,wt_ssb(endyr_r)) * p_mature;

  SER(endyr_r)    = 1. - spawn_wfsh/spawn_nofsh;
FUNCTION compute_Fut_selectivity
  sel_fut.initialize();
	// If nyrs_sel_avg negative, use that year (as abs())
  // Average future selectivity based on most recent years' (as read in from file)
	if (nyrs_sel_avg >0 )
	{
    for (i=endyr_r-(nyrs_sel_avg+1);i<=endyr_r;i++)
      sel_fut = sel_fut + sel_fsh(i);
    sel_fut/=nyrs_sel_avg;
	}
	else
		sel_fut = sel_fsh(endyr_r+nyrs_sel_avg); // negative nyrs_sel_avg can be used to pick years for evaluation

  sel_fut/=sel_fut(6); // NORMALIZE TO AGE 6

FUNCTION compute_spr_rates
  //Compute SPR Rates 
  F35 = get_spr_rates(.35);
  F40 = get_spr_rates(.40);
FUNCTION dvariable get_spr_rates(double spr_percent,dvar_vector sel)
  RETURN_ARRAYS_INCREMENT();
  double df=1.e-3;
  dvariable F1 ;
  F1.initialize();
  F1 = .9*natmort(9);
  dvariable F2;
  dvariable F3;
  dvariable yld1;
  dvariable yld2;
  dvariable yld3;
  dvariable dyld;
  dvariable dyldp;
  // Newton Raphson stuff to go here
  for (int ii=1;ii<=6;ii++)
  {
    F2     = F1 + df;
    F3     = F1 - df;
    yld1   = -100.*square(log(spr_percent/spr_ratio(F1,sel)));
    yld2   = -100.*square(log(spr_percent/spr_ratio(F2,sel)));
    yld3   = -100.*square(log(spr_percent/spr_ratio(F3,sel)));
    dyld   = (yld2 - yld3)/(2*df);                          // First derivative (to find the root of this)
    dyldp  = (yld3-(2*yld1)+yld2)/(df*df);  // Newton-Raphson approximation for second derivitive
    F1    -= dyld/dyldp;
  }
  RETURN_ARRAYS_DECREMENT();
  return(F1);
FUNCTION dvariable spr_ratio(dvariable trial_F,dvar_vector& sel)
  RETURN_ARRAYS_INCREMENT();
  dvariable SBtmp;
  dvar_vector Ntmp(1,nages);
  dvar_vector srvtmp(1,nages);
  SBtmp.initialize();
  Ntmp.initialize();
  srvtmp.initialize();
  dvar_vector Ftmp(1,nages);
  Ftmp = sel*trial_F;
  srvtmp  = exp(-(Ftmp + natmort) );
  dvar_vector wttmp = wt_ssb(endyr_r);
  Ntmp(1)=1.;
  j=1;
  SBtmp  += Ntmp(j)*p_mature(j)*wttmp(j)*pow(srvtmp(j),yrfrac);
  for (j=2;j<nages;j++)
  {
    Ntmp(j) = Ntmp(j-1)*srvtmp(j-1);
    SBtmp  += Ntmp(j)*p_mature(j)*wttmp(j)*pow(srvtmp(j),yrfrac);
  }
  Ntmp(nages)=Ntmp(nages-1)*srvtmp(nages-1)/(1.-srvtmp(nages));

  SBtmp  += Ntmp(nages)*p_mature(nages)*wttmp(nages)*pow(srvtmp(nages),yrfrac);
  RETURN_ARRAYS_DECREMENT();
  return(SBtmp/phizero);
FUNCTION dvariable get_spr_rates(double spr_percent)
  RETURN_ARRAYS_INCREMENT();
  double df=1.e-3;
  dvariable F1 ;
  F1.initialize();
  F1 = .9*natmort(9);
  dvariable F2;
  dvariable F3;
  dvariable yld1;
  dvariable yld2;
  dvariable yld3;
  dvariable dyld;
  dvariable dyldp;
  // Newton Raphson stuff to go here
  for (int ii=1;ii<=6;ii++)
  {
    F2     = F1 + df;
    F3     = F1 - df;
    yld1   = -100.*square(log(spr_percent/spr_ratio(F1)));
    yld2   = -100.*square(log(spr_percent/spr_ratio(F2)));
    yld3   = -100.*square(log(spr_percent/spr_ratio(F3)));
    dyld   = (yld2 - yld3)/(2*df);                          // First derivative (to find the root of this)
    dyldp  = (yld3-(2*yld1)+yld2)/(df*df);  // Newton-Raphson approximation for second derivitive
    F1    -= dyld/dyldp;
  }
  RETURN_ARRAYS_DECREMENT();
  return(F1);
FUNCTION dvariable spr_ratio(double trial_F)
  RETURN_ARRAYS_INCREMENT();
  dvariable SBtmp;
  dvar_vector Ntmp(1,nages);
  dvar_vector srvtmp(1,nages);
  SBtmp.initialize();
  Ntmp.initialize();
  srvtmp.initialize();
  dvar_vector Ftmp(1,nages);
  dvar_vector wttmp = wt_ssb(endyr_r);
  Ftmp = sel_fut*trial_F;
  srvtmp  = mfexp(-(Ftmp + natmort) );
  Ntmp(1)=1.;
  j=1;
  SBtmp  += Ntmp(j)*p_mature(j)*wttmp(j)*pow(srvtmp(j),yrfrac);
  for (j=2;j<nages;j++)
  {
    Ntmp(j) = Ntmp(j-1)*srvtmp(j-1);
    SBtmp  += Ntmp(j)*p_mature(j)*wttmp(j)*pow(srvtmp(j),yrfrac);
  }
  Ntmp(nages)=Ntmp(nages-1)*srvtmp(nages-1)/(1.-srvtmp(nages));
  SBtmp  += Ntmp(nages)*p_mature(nages)*wttmp(nages)*pow(srvtmp(nages),yrfrac);
  RETURN_ARRAYS_DECREMENT();
  return(SBtmp/phizero);
FUNCTION dvariable spr_ratio(dvariable trial_F)
  RETURN_ARRAYS_INCREMENT();
  dvariable SBtmp;
  dvar_vector Ntmp(1,nages);
  dvar_vector srvtmp(1,nages);
  SBtmp.initialize();
  Ntmp.initialize();
  srvtmp.initialize();
  dvar_vector Ftmp(1,nages);
  dvar_vector wttmp = wt_ssb(endyr_r);
  Ftmp = sel_fut*trial_F;
  srvtmp  = mfexp(-(Ftmp + natmort) );
  Ntmp(1)=1.;
  j=1;
  SBtmp  += Ntmp(j)*p_mature(j)*wttmp(j)*pow(srvtmp(j),yrfrac);
  for (j=2;j<nages;j++)
  {
    Ntmp(j) = Ntmp(j-1)*srvtmp(j-1);
    SBtmp  += Ntmp(j)*p_mature(j)*wttmp(j)*pow(srvtmp(j),yrfrac);
  }
  Ntmp(nages)=Ntmp(nages-1)*srvtmp(nages-1)/(1.-srvtmp(nages));

  SBtmp  += Ntmp(nages)*p_mature(nages)*wttmp(nages)*pow(srvtmp(nages),yrfrac);
  RETURN_ARRAYS_DECREMENT();
  return(SBtmp/phizero);
FUNCTION dvariable spr_unfished()
  RETURN_ARRAYS_INCREMENT();
  dvariable Ntmp;
  dvariable SBtmp;
  dvar_vector wttmp = wt_ssb(endyr_r);
  SBtmp.initialize();
  Ntmp = 1.;
  for (j=1;j<nages;j++)
  {
    SBtmp += Ntmp*p_mature(j)*wttmp(j)*mfexp(-yrfrac * natmort(j));
    Ntmp  *= mfexp( -natmort(j));
  }
  Ntmp    /= (1.-exp(-natmort(nages)));
  SBtmp += Ntmp*p_mature(nages)*wttmp(nages)*exp(-yrfrac * natmort(nages) );

  RETURN_ARRAYS_DECREMENT();
  return(SBtmp);

FUNCTION Get_Catch_at_Age
  q_bts  = mfexp(log_q_bts);
  q_eit  = mfexp(log_q_eit);
  q_cpue = mfexp(log_q_cpue);
  q_avo  = mfexp(log_q_avo);

  // Define this to get to survey time of year.... 
  catage = elem_prod( elem_prod(natage , F ) , elem_div( (1. - S) , Z ));
  for (i=styr; i<=endyr_r; i++)
    pred_catch(i)  = catage(i) * wt_fsh(i);

 //Fishery expected values------------------------
  for (i=1;i<=n_fsh_r;i++)
  {
    iyr       = yrs_fsh_data(i);
    et_fsh(i) = sum(catage(iyr));
    if (use_age_err)
      eac_fsh(i) = age_err * catage(iyr)/et_fsh(i); 
    else 
      eac_fsh(i) =           catage(iyr)/et_fsh(i); 
  }
  // only do this for 3+ predicted fish...
  elc_fsh = elem_prod(selages,catage(endyr_r))/sum(catage(endyr_r)(3,nages)) * age_len;

 //CPUE predicted values..
    for (i=1;i<=n_cpue;i++)
    {
      iyr          = yrs_cpue(i);
      pred_cpue(i) = elem_prod(wt_fsh(iyr), natage(iyr) ) * sel_fsh(iyr) * q_cpue; 
    }
 //avo predicted values..
    for (i=1;i<=n_avo_r;i++)
    {
      iyr          = yrs_avo(i);
      pred_avo(i)  = elem_prod(wt_avo(i), natage(iyr) ) * mfexp(log_sel_eit(iyr)) * q_avo; 
      // pred_avo(i)  = wt_fsh(iyr) * elem_prod(natage(iyr)  , avo_sel) * q_avo; 
      // pred_avo(i)  = wt_fsh(iyr) * natage(iyr)  * q_avo; 
    }
   
  //Trawl survey expected values------------------------
  dvar_vector ntmp(1,nages); 
  dvariable qtmp;
  dvariable qtmp_early;
  for ( i=1;i<=n_bts_r;i++)
  {
    iyr          = yrs_bts_data(i);
    qtmp         = bt_slope * bottom_temp(i) + q_bts ;
    // For reduced survey strata years
    if (active(log_q_std_area)&&(iyr<1985||iyr==1986)) 
      qtmp *= exp(log_q_std_area); 

    ntmp(1,nages)= elem_prod(natage(iyr),pow(S(iyr),.5));

    if (use_age_err)
      eac_bts(i)  = age_err * elem_prod(ntmp,mfexp(log_sel_bts(iyr))) * qtmp; // Eq. 15
    else 
      eac_bts(i)  =           elem_prod(ntmp,mfexp(log_sel_bts(iyr))) * qtmp; 
    et_bts(i)   = sum(eac_bts(i)(mina_bts,nages)); 
    eb_bts(i)   = wt_bts(i) * eac_bts(i); 
    eac_bts(i) /= sum(eac_bts(i)); 
  }
 
 //Hydro survey expected values------------------------
  for (i=1;i<=n_eit_ac_r;i++)
  {
    iyr          = yrs_eit_data(i);
    ntmp(1,nages)= elem_prod(natage(iyr),pow(S(iyr),.5));
    if (use_age_err)
      eac_eit(i)  = age_err * elem_prod(ntmp,mfexp(log_sel_eit(iyr))) * q_eit; // Eq. 15
    else
      eac_eit(i)  =           elem_prod(ntmp,mfexp(log_sel_eit(iyr))) * q_eit; 

    ea1_eit(i)  = ntmp(1); // NOTE that this is independent of selectivity function...
    eb_eit(i)   = wt_eit(i) * eac_eit(i); 
    et_eit(i)   = sum(eac_eit(i)(mina_eit,nages)); 
    eac_eit(i)(mina_eit,nages) /= et_eit(i);
  }

  // This is to deal with et_eit being greater than the age comps
  for (i=n_eit_ac_r;i<=n_eit_r;i++)
  {
    iyr          = yrs_eit_data(i);
    ntmp(1,nages)= elem_prod(natage(iyr),pow(S(iyr),.5));
    et_eit(i)    = sum( elem_prod(ntmp,mfexp(log_sel_eit(iyr)))(mina_eit,nages) ) * q_eit; 
  }
  // Experimental (not implemented nor used) for combining both surveys
  // if (Do_Combined && current_phase()>3) get_combined_index();
FUNCTION get_combined_index
  {
    int i_eit=2; // NOTE Start at 2nd year of data (ignores 1979 survey for combined run)
    for ( i=1;i<=n_bts_r;i++)
    {
      dvar_vector bts_tmp(mina_bts,nages);
      dvariable Ng_bts;
      dvariable Ng_eit;
      iyr     = yrs_bts_data(i);
      bts_tmp = ot_bts(i)*oac_bts(i)(mina_bts,nages);
      Ng_bts  = bts_tmp *(1./mfexp(log_sel_bts(iyr)(mina_bts,nages)))/q_bts ;
      if (yrs_eit_data(i_eit) == yrs_bts_data(i))
      {
        dvar_vector eit_tmp(mina_bts,nages);
        eit_tmp = ot_eit(i_eit)*oac_eit(i_eit)(mina_bts,nages);
        Ng_eit = eit_tmp *(1./mfexp(log_sel_eit(iyr)(mina_bts,nages)))/q_eit ; 
        ot_cmb(i) = 0.5*(Ng_eit + Ng_bts);
        var_cmb(i)  = .25*square(std_ot_bts(i)     * Ng_bts/sum(bts_tmp));
        var_cmb(i) += .25*square(std_ot_eit(i_eit) * Ng_eit/sum(eit_tmp));
        avail_eit(i) = q_eit * mfexp(log_sel_eit(iyr)(mina_bts,nages)) * oac_eit(i_eit)(mina_bts,nages);
        //Increment eit year counter
        i_eit++;
      }
      else
      {
        ot_cmb(i) = Ng_bts;
        var_cmb(i)  = square(std_ot_bts(i) * Ng_bts/sum(bts_tmp));
      }
      avail_bts(i) = q_bts * mfexp(log_sel_bts(iyr)(mina_bts,nages)) * oac_bts(i)(mina_bts,nages);
      et_cmb(i)    = natage(iyr)(mina_bts,nages)*pow(S(iyr)(mina_bts,nages),.5);
    }
  }
FUNCTION get_msy
 // NOTE THis will need to be conditional on SrType too
 /*Function calculates used in calculating MSY and MSYL for a designated component of the
  population, given values for stock recruitment and selectivity...  Fmsy is the trial value of MSY example of the use of "funnel" to reduce the amount of storage for derivative calculations */
  dvariable Fdmsy;
  dvariable Stmp;
  dvariable Rtmp;
  dvariable Btmp;
  double df=1.e-6;
  dvariable F1=.3;
  dvariable F2;
  dvariable F3;
  dvariable yld1;
  dvariable yld2;
  dvariable yld3;
  dvariable dyld;
  dvariable dyldp;
  // Newton Raphson stuff to go here //cout <<endl<<endl<<"Iter  F  Stock  1Deriv  Yld  2Deriv"<<endl; //for (int ii=1;ii<=500;ii++)
  for (int ii=1;ii<=8;ii++)
  {
		int bomb_flag=0;
    if (mceval_phase()&&(F1>5||F1<0.01)) 
    {
      ii=9;
      count_Ffail++;
      cout<<F1<<" Bombed at  "<<count_mcmc<<" "<<count_Ffail<<" ";
      F1=F35; // When things bomb (F <0 or F really big then just set it to F35...)
			bomb_flag=1;
    }
    else
    {
      F2     = F1 + df*.5;
      F3     = F2 - df; 
      yld1   = get_yield(F1,Stmp,Rtmp,Btmp); 
      yld2   = get_yield(F2,Stmp,Rtmp,Btmp);
      yld3   = get_yield(F3,Stmp,Rtmp,Btmp);
      dyld   = (yld2 - yld3)/df;                          // First derivative (to find the root of this)
      dyldp  = (yld2 + yld3 - 2.*yld1)/(.25*df*df);   // Second derivative (for Newton Raphson)
      F1    -= dyld/dyldp;
    }
		if (bomb_flag) break;
  }
  Fdmsy    = F1;
  Fmsy     = Fdmsy;
  SPR_OFL  = spr_ratio(Fmsy,sel_fut);
  lnFmsy   = log(Fmsy);
  SER_Fmsy = get_SER(Fmsy);
  MSY      = get_yield(Fmsy,Stmp,Rtmp,Btmp);
  avg_age_msy  = get_avg_age(Fmsy,Stmp,Rtmp,Btmp);
  Bmsy     = Stmp;
  Bmsy2    = Btmp; // Fishable      
  Fmsy2    = MSY/Btmp; 
  lnFmsy2  = log(Fmsy2);
  Fendyr_Fmsy = mean( F(endyr_r) ) / Fmsy;
  Rmsy     = Rtmp;
FUNCTION dvar_vector get_msy_wt();
  RETURN_ARRAYS_INCREMENT();
 // NOTE THis will need to be conditional on SrType too
 /*Function calculates used in calculating MSY and MSYL for a designated component of the
  population, given values for stock recruitment and selectivity...  Fmsy is the trial value of MSY example of the use of "funnel" to reduce the amount of storage for derivative calculations */
  double Stmp;
  double Rtmp;
  dvariable Btmp;
  double df=1.e-6;
  dvariable F1=.3;
  dvariable F2;
  dvariable F3;
  dvariable yld1;
  dvariable yld2;
  dvariable yld3;
  dvariable dyld;
  dvariable dyldp;
  dvar_vector results(1,4);
  // Newton Raphson stuff to go here //cout <<endl<<endl<<"Iter  F  Stock  1Deriv  Yld  2Deriv"<<endl; //for (int ii=1;ii<=500;ii++)
  for (int ii=1;ii<=8;ii++)
  {
		int bomb_flag=0;
    if (mceval_phase()&&(F1>5||F1<0.01)) 
    {
      ii=5;
      count_Ffail++;
      cout<<F1<<" Bombed at  "<<count_mcmc<<" "<<count_Ffail<<" ";
      F1=F35; // When things bomb (F <0 or F really big then just set it to F35...)
			bomb_flag=1;
    }
    else
    {
      F2     = F1 + df*.5;
      F3     = F2 - df; 
      yld1   = get_yield_wt(F1); 
      yld2   = get_yield_wt(F2);
      yld3   = get_yield_wt(F3);
      dyld   = (yld2 - yld3)/df;                          // First derivative (to find the root of this)
      dyldp  = (yld2 + yld3 - 2.*yld1)/(.25*df*df);   // Second derivative (for Newton Raphson)
      F1    -= dyld/dyldp;
    }
		if (bomb_flag) break;
  }
  // Fmsy_wt  = F1;
  // MSY_wt   = get_yield_wt(Fmsy,Stmp,Rtmp,Btmp);
  // Bmsy2_wt = Btmp; // Fishable      
  // Fmsy2_wt = MSY_wt/Btmp; 
  results(1) = F1;
  results(2) = get_yield_wt(Fmsy,Stmp,Rtmp,Btmp);
  results(3) = Btmp; // Fishable      
  results(4) = results(2)/Btmp; 
  RETURN_ARRAYS_DECREMENT();
  return(results);
FUNCTION dvariable get_yield_wt(dvariable& Ftmp)
  RETURN_ARRAYS_INCREMENT();
  // Note that two wt vectors are used: 1 for yield, the other for biomass.  
  dvariable yield;
  double phi;
  double Req;
  dvar_vector Ntmp(1,nages);
  dvar_vector Ctmp(1,nages);
  dvector wttmp   = wt_ssb(endyr_r);
  dvar_vector Fatmp   = Ftmp * value(sel_fut); // No uncertainty in future selectivity...
  dvar_vector Ztmp    = Fatmp+ natmort;
  dvar_vector survtmp = mfexp(-Ztmp);
  Ntmp(1) = 1.;
  for ( j=1 ; j < nages; j++ )
    Ntmp(j+1)  =   Ntmp(j) * survtmp(j); // Begin numbers in the next year/age class
  Ntmp(nages)  /= (1.- survtmp(nages)); 
  for ( j=1 ; j <= nages; j++ )
    Ctmp(j)     = Ntmp(j) * Fatmp(j) * (1. - survtmp(j)) / Ztmp(j);
  yield  = wt_fut * elem_prod(Fmoney,Ctmp); 
  // phi    = value(elem_prod( elem_prod( Ntmp , pow(survtmp,yrfrac) ), p_mature ) * wttmp) ; 
  phi    = value(elem_prod( elem_prod( value(Ntmp) , pow(survtmp,yrfrac) ), p_mature ) * wttmp) ; 
  Req    = value(Requil(phi)); 
  yield *= Req;
  RETURN_ARRAYS_DECREMENT();
  return yield;
FUNCTION dvariable get_yield_wt(dvariable& Ftmp, double& Stmp,double& Rtmp,dvariable& Btmp)
  RETURN_ARRAYS_INCREMENT();
  // Note that two wt vectors are used: 1 for yield, the other for biomass.  
  dvariable yield;
  double phi;
  dvariable Req;
  dvar_vector Ntmp(1,nages);
  dvar_vector Ctmp(1,nages);
  dvector wttmp   = wt_ssb(endyr_r);
  dvar_vector Fatmp   = Ftmp * value(sel_fut);
  dvar_vector Ztmp    = Fatmp+ natmort;
  dvar_vector survtmp = mfexp(-Ztmp);
  Ntmp(1) = 1.;
  for ( j=1 ; j < nages; j++ )
    Ntmp(j+1)  =   Ntmp(j) * survtmp(j); // Begin numbers in the next year/age class
  Ntmp(nages)  /= (1.- survtmp(nages)); 
  for ( j=1 ; j <= nages; j++ )
    Ctmp(j)     = Ntmp(j) * Fatmp(j) * (1. - survtmp(j)) / Ztmp(j);
  yield  = wt_fut * elem_prod(Fmoney,Ctmp); 
  // phi    = value(elem_prod( elem_prod( Ntmp , pow(survtmp,yrfrac) ), p_mature ) * wttmp) ; 
  phi    = value(elem_prod( elem_prod( value(Ntmp) , pow(survtmp,yrfrac) ), p_mature ) * wttmp) ; 
  Req    = value(Requil(phi)); 
  yield *= Req;
  Stmp   = value(phi*Req);
  Btmp   = Req *  elem_prod(value(Ntmp),value(sel_fut)) * wt_fut; // Fishable biomass, Eq. 23
  Rtmp   = value(Req);   
  RETURN_ARRAYS_DECREMENT();
  return yield;
FUNCTION dvariable get_yield(dvariable& Ftmp, dvariable& Stmp,dvariable& Rtmp,dvariable& Btmp)
  RETURN_ARRAYS_INCREMENT();
  // Note that two wt vectors are used: 1 for yield, the other for biomass.  
  dvariable yield;
  dvariable phi;
  phi.initialize();
  dvariable Req;
  dvar_vector Ntmp(1,nages);
  dvar_vector Ctmp(1,nages);
  dvar_vector wttmp   = wt_ssb(endyr_r);
  dvar_vector Fatmp   = Ftmp * sel_fut;
  dvar_vector Ztmp    = Fatmp+ natmort;
  dvar_vector survtmp = mfexp(-Ztmp);
  Ntmp(1) = 1.;
  for ( j=1 ; j < nages; j++ )
    Ntmp(j+1)  =   Ntmp(j) * survtmp(j); // Begin numbers in the next year/age class
  Ntmp(nages)  /= (1.- survtmp(nages)); 
  for ( j=1 ; j <= nages; j++ )
    Ctmp(j)     = Ntmp(j) * Fatmp(j) * (1. - survtmp(j)) / Ztmp(j);
  yield  = wt_fut * elem_prod(Fmoney,Ctmp); 
  phi    = elem_prod( elem_prod( Ntmp , pow(survtmp,yrfrac) ), p_mature ) * wttmp; 
  Req    = Requil(phi); 
  yield *= Req;
  Stmp   = phi*Req;
  // Btmp   = Req *  elem_prod(Ntmp,sel_fut) * wttmp; // Fishable biomass, Eq. 23
  Btmp   = Req *  elem_prod(Ntmp,sel_fut) * wt_fut; // Fishable biomass, Eq. 23
  Rtmp   = Req;   
  RETURN_ARRAYS_DECREMENT();
  return yield;
FUNCTION dvariable get_avg_age(dvariable& Ftmp, dvariable& Stmp,dvariable& Rtmp,dvariable& Btmp)
  RETURN_ARRAYS_INCREMENT();
  // Note that two wt vectors are used: 1 for yield, the other for biomass.  
  dvariable avgage;
  dvariable phi;
  phi.initialize();
  dvariable Req;
  dvar_vector Ntmp(1,nages);
  dvar_vector Ctmp(1,nages);
  dvar_vector wttmp   = wt_ssb(endyr_r);
  dvar_vector Fatmp   = Ftmp * sel_fut;
  dvar_vector Ztmp    = Fatmp+ natmort;
  dvar_vector survtmp = mfexp(-Ztmp);
  Ntmp(1) = 1.;
  for ( j=1 ; j < nages; j++ )
    Ntmp(j+1)  =   Ntmp(j) * survtmp(j); // Begin numbers in the next year/age class
  Ntmp(nages)  /= (1.- survtmp(nages)); 
  for ( j=1 ; j <= nages; j++ )
    Ctmp(j)     = Ntmp(j) * Fatmp(j) * (1. - survtmp(j)) / Ztmp(j);
  phi    = elem_prod( elem_prod( Ntmp , pow(survtmp,yrfrac) ), p_mature ) * wttmp; 
  Req    = Requil(phi); 
  Ctmp  *= Req;
  avgwt_msy = (wt_fut * Ctmp)/sum(Ctmp); 
  // avgln_msy = (lens*(age_len*Ctmp))/sum(Ctmp); 
  avgage    = (age_vector * Ctmp)/sum(Ctmp); 
  Stmp   = phi*Req;
  Btmp   = Req *  elem_prod(Ntmp,sel_fut) * wttmp; // Fishable biomass, Eq. 23
  Rtmp   = Req;   
  RETURN_ARRAYS_DECREMENT();
  return avgage;
FUNCTION dvariable SRecruit(const dvariable& Stmp)
  RETURN_ARRAYS_INCREMENT();
  dvariable RecTmp;
  switch (SrType)
  {
    case 1: // Eq. 12
      RecTmp = (Stmp / phizero) * mfexp( alpha * ( 1. - Stmp / Bzero )) ; //Ricker form from Dorn
      break;
    case 2:
      RecTmp = Stmp / ( alpha + beta * Stmp);        //Beverton-Holt form
      break;
    case 3:
      RecTmp = mfexp(log_avgrec);                    //Avg recruitment
      break;
    case 4:
      RecTmp = Stmp * mfexp( alpha  - Stmp * beta) ; //old Ricker form
      break;
  }
  RETURN_ARRAYS_DECREMENT();
  return RecTmp;
FUNCTION dvar_vector SRecruit(const dvar_vector& Stmp)
  RETURN_ARRAYS_INCREMENT();
  dvar_vector RecTmp(Stmp.indexmin(),Stmp.indexmax());
  switch (SrType)
  {
    case 1: // Eq. 12
      RecTmp = elem_prod((Stmp / phizero) , mfexp( alpha * ( 1. - Stmp / Bzero ))) ; //Ricker form from Dorn
      break;
    case 2:
      RecTmp = elem_prod(Stmp , 1. / ( alpha + beta * Stmp)); //Beverton-Holt form
      break;
    case 3:
      RecTmp = mfexp(log_avgrec);                              //Avg recruitment
      break;
    case 4:
      RecTmp = elem_prod(Stmp ,mfexp( alpha - Stmp * beta));  //old Ricker form
      break;
  }
  RETURN_ARRAYS_DECREMENT();
  //cout <<RecTmp<<endl;
  return RecTmp;
FUNCTION dvariable Requil(const dvariable& phi)
  RETURN_ARRAYS_INCREMENT();
  dvariable RecTmp;
  switch (SrType)
  {
    case 1: // Eq. 12
      RecTmp =  Bzero * (alpha + log(phi) - log(phizero) ) / (alpha*phi);
      break;
    case 2:
      RecTmp =  (phi-alpha)/(beta*phi);
      break;
    case 3:
      RecTmp =  mfexp(log_avgrec);
      break;
    case 4:
      RecTmp =  (log(phi)+alpha) / (beta*phi); //RecTmp =  (log(phi)/alpha + 1.)*beta/phi;
      break;
  }
  RETURN_ARRAYS_DECREMENT();
  return RecTmp;

 //=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
FUNCTION Get_Bzero
  Bzero.initialize();
  Rzero    =  mfexp(log_Rzero); 
  dvar_vector Ntmp(1,nages);
  dvar_vector survtmp = mfexp(-natmort);
  Ntmp.initialize();

  Ntmp(1) = Rzero;
  for ( j=1 ; j < nages; j++ )
  {
    Ntmp(j+1)  =   Ntmp(j) * survtmp(j); // Begin numbers in the next year/age class
  }
  Ntmp(nages)  /= (1.- survtmp(nages)); 
  for ( j=1 ; j <= nages; j++ )
    Ntmp(j) *= mfexp(yrfrac*log(survtmp(j)));
    // Ntmp(j) *= pow(survtmp(j),yrfrac);

  Bzero = elem_prod(wt_ssb(endyr_r) , p_mature) * Ntmp ; // p_mature is of Females (half of adults)
  phizero = Bzero/Rzero;

  switch (SrType)
  {
    case 1:
      alpha = log(-4.*steepness/(steepness-1.)); // Eq. 13
      break;
    case 2:
      alpha  =  Bzero * (1. - (steepness - 0.2) / (0.8*steepness) ) / Rzero;
      beta   = (5. * steepness - 1.) / (4. * steepness * Rzero);
      break;
    case 4:
    //R = S * EXP(alpha - beta * S))
      beta  = log(5.*steepness)/(0.8*Bzero) ;
      alpha = log(Rzero/Bzero)+beta*Bzero;
      break;
  }
FUNCTION Recruitment_Likelihood
  sigmaRsq = sigr*sigr;
  rec_like.initialize();

  if (active(log_rec_devs))
    rec_like(2) =  1.*norm2(log_rec_devs);

  rec_like(4) =  .1*norm2(log_initdevs);

  // Tune recruits to spawners via functional form of Srec (to estimate srec params) RAM's exp. value form of -ln like
  //if (current_phase()<4)
  if (phase_sr<0) 
  {
    sigmarsq_out    = norm2(log_rec_devs)/size_count(log_rec_devs);
    // No stock-rec relationship------------------------
    rec_like(1) = norm2( log_rec_devs(styr_est,endyr_est )) / (2.*sigmaRsq) + 
                  size_count(pred_rec(styr_est,endyr_est))*log(sigr);
  }
  else
  {
    sigmarsq_out    = norm2(log_rec_devs(styr_est,endyr_est))/size_count(log_rec_devs(styr_est,endyr_est));

    // SRR estimated for a specified window of years
    for (i=styr_est;i<=endyr_est;i++)
    {
      srmod_rec(i) = SRecruit(SSB(i-1)); // 1 year lag w/ SSB
    }
    SR_resids = log(pred_rec(styr_est,endyr_est)+1.e-8) - log(srmod_rec + 1.e-8)  ;

  
    // if (ctrl_flag(30)==0)// use srr in fit (not just the prior) { }

      // Flag to ignore the impact of the 1978 YC on S-Rec estimation...
      if (ctrl_flag(25)<1)
      {
        rec_like(1) = 0.5 * norm2( SR_resids + sigmaRsq/2. ) / sigmaRsq + (endyr_est-styr_est+1)*log(sigr);
      }
      else
      {
        for (i=styr_est;i<=endyr_est;i++)
        {
        if (i!=1979)
          rec_like(1) += 0.5 * square(SR_resids(i) + sigmaRsq/2.)/sigmaRsq + log(sigr);
        }
      }
      if (last_phase()) 
				rec_like(1) *= ctrl_flag(30);
			else 
				rec_like(1) *= .8;
  }

 // This sets variability of future recruitment to same as in past....
  if (active(rec_dev_future)) 
  {
    // sigmarsq_out    = norm2(log_rec_devs(styr_est,endyr_est))/(endyr_est-styr_est+1);
    rec_like(5) = norm2(rec_dev_future)/(2.*sigmarsq_out+.001);
    // cout <<styr_est<<" "<<endyr_est<<log_rec_devs(styr_est,endyr_est)<<endl;
  }
  if (ctrl_flag(29) > 0)
    rec_like(5) += 10.*norm2(log_rec_devs(endyr_est,endyr_r))/(2.*sigmarsq_out+.001);// WILL BREAK ON RETROSPECTIVE

  // Larval drift contribution to recruitment prediction (not used in recent years) Eq. 8
  if (active(larv_rec_devs))
    rec_like(3) += ctrl_flag(23)*norm2(larv_rec_devs);
  if (ctrl_flag(27)>0)
  {
    larv_rec_trans=trans(larv_rec_devs);
    // Do third differencing on spatial aspect...
    for (i=1;i<=11;i++)
    {
      rec_like(6) += ctrl_flag(27)*norm2(first_difference( first_difference(first_difference( larv_rec_devs(i)))));
      rec_like(6) += ctrl_flag(27)*norm2(first_difference( first_difference(first_difference(larv_rec_trans(i)))));
    }
  }

 // +===+====+==+==+==+==+==+==+==+====+====+==+==+===+====+==+==+==+==+==+==+==+====+====+====+
FUNCTION Evaluate_Objective_Function 
  // if (active(repl_F))
  // For logistic fishery selectivity option (sensitivity)
  if (active(sel_dif2_fsh)) 
  {
    fff += .01 * sel_dif2_fsh*sel_dif2_fsh ;
  }
  Recruitment_Likelihood();
  Surv_Likelihood();  //-survey Deviations
  Selectivity_Likelihood();  
  
  ssqcatch = norm2(log(obs_catch(styr,endyr_r)+1e-4)-log(pred_catch+1e-4));

  if (current_phase() >= robust_phase)
    Robust_Likelihood();       //-Robust AGE  Likelihood part
  else  
    Multinomial_Likelihood();  //-Multinomial AGE  Likelihood part

  fff += ctrl_flag(1) * ssqcatch;
  fff += ctrl_flag(2) * sum(surv_like);
  fff += ctrl_flag(12) * cpue_like;
  fff += ctrl_flag(6) * avo_like;
  fff += ctrl_flag(3) * sum(rec_like);
  F_pen = norm2(log_F_devs);
  fff += ctrl_flag(4) * F_pen;

  fff += ctrl_flag(7)*age_like(1);
  fff += ctrl_flag(8)*age_like(2);
  fff += ctrl_flag(9)*age_like(3);

  if (use_endyr_len>0)
    fff+= ctrl_flag(7)*len_like;

  fff+= sum(sel_like);
  fff+= sum(sel_like_dev);
	// COUT(sel_like);
	// COUT(age_like);
	// COUT(avo_like);
	// COUT(surv_like);

  // Condition model in early phases to stay reasonable
  if (current_phase()<3)
  {
      fff += 10.*square(log(mean(Fmort)/.2));
      fff += 10.*square(log_avginit-log_avgrec)  ; //This is to make the initial comp not stray too far 
  }

  Priors.initialize();
  // Prior on combined-survey catchability, idea is to have sum of two surveys tend to the prior distribution
  // q_all.initialize();
  dvariable q_bts_tmp;
  q_bts_tmp.initialize();
  dvariable q_eit_tmp;
  q_eit_tmp.initialize();

  for (i=1;i<=n_bts_r;i++)
  {
    iyr = yrs_bts_data(i);
    // Note this is to correct for reduced survey strata coverage pre 1985 and in 86
    if (!(iyr<1985||iyr==1986)) 
    {
      q_bts_tmp += sum(mfexp(log_q_bts + log_sel_bts(iyr)(q_amin,q_amax)));
    }
  }
  q_bts_tmp /= ((q_amax-q_amin+1)*(n_bts_r-4)) ; // 4 years not in main q calc...OjO will break if BTS series length changes between 1982 and 86
  for ( i=1;i<=n_eit_r;i++)
  {
    iyr = yrs_eit_data(i);
    q_eit_tmp += sum(mfexp(log_q_eit + log_sel_eit(iyr)(q_amin,q_amax)));
  }
  q_eit_tmp /= ((q_amax-q_amin+1)*n_eit_r) ;
  q_all= log(q_bts_tmp + q_eit_tmp)     ;

  // Note: optional ability to put a prior on "combined" surveys overall catchability
  if (q_all_sigma<1.)
    Priors(2) = square( q_all- q_all_prior )/(2.*q_all_sigma*q_all_sigma); 
  q_all = exp(q_all);
  
  // Prior on BTS catchability
  if (active(log_q_bts)&&q_bts_sigma<1.)
  {
    Priors(2) = square( log_q_bts - q_bts_prior )/(2.*q_bts_sigma*q_bts_sigma); 
    // cout<<Priors(2)<<" "<<log_q_bts<<endl;
  }
  // Beta prior on steepness....
  if (active(steepness)&&cvsteepnessprior<1.)
  {
    if (SrType==4) // Old Ricker prior (1999)
      Priors(1) = log(steepness*cvsteepnessprior) + square( log( steepness/steepnessprior ) )/(2.*cvsteepnessprior*cvsteepnessprior); 
    else
    {
      // Note that the prior for steepness has already been mapped to interval 0.2, 1.0
      Priors(1) = -((srprior_a-1.)*log(steepness) + (srprior_b-1)*log(1.-steepness)); 

      // Under development (use of F_SPR as a prior)
      if (use_spr_msy_pen&&last_phase())
      {
        get_msy();
        // cout<<"SPR: "<<SPR_OFL<<endl; cout<<"Fmsy "<<Fmsy   <<endl; 
        Priors(1) = lambda_spr_msy*square(log(SPR_OFL)-log(.35));
      }
    }
  }

  fff += sum(Priors);
  // Conditional bits
  fff += 10.*square(avgsel_fsh);
  fff += 10.*square(avgsel_bts);
  fff += 10.*square(avgsel_eit);

 /*
  if (active(wt_fut))
    for (j=1;j<=nages;j++)
    {
      dvariable res = wt_mn(j)-wt_fut(j);
      fff += res*res/ (2.*wt_sigma(j)*wt_sigma(j));
    }
 */

 // +===+====+==+==+==+==+==+==+==+====+====+==+==+===+====+==+==+==+==+==+==+==+====+====+====+
FUNCTION Selectivity_Likelihood
  sel_like.initialize();

  for (i=styr;i<= endyr_r;i++) //--This is for limiting the dome-shapedness FISHERY
    for (j=1;j<=n_selages_fsh;j++)
      if (log_sel_fsh(i,j)>log_sel_fsh(i,j+1))
        sel_like(1)+=ctrl_flag(13)*square(log_sel_fsh(i,j)-log_sel_fsh(i,j+1));


  if (active(sel_coffs_bts))
  {
    for (i=styr_bts;i<= endyr_r;i++) //--This is for controlling the selectivity shape BOTTOM TRAWL SURVEY
      for (j=6;j<=n_selages_bts;j++)
        if (log_sel_bts(i,j)>log_sel_bts(i,j+1))
          sel_like(2)+=ctrl_flag(14)*square(log_sel_bts(i,j)-log_sel_bts(i,j+1));
  }
  
  for (i=styr_eit;i<= endyr_r;i++) //--This is for selectivity shape HYDROA TRAWL SURVEY
    for (j=mina_eit;j<=n_selages_eit;j++)
      if (log_sel_eit(i,j)<log_sel_eit(i,j+1))
        sel_like(3) += ctrl_flag(15) * square(log_sel_eit(i,j)-log_sel_eit(i,j+1));

  //////////////////////////////////////////////////////////////////////////////////
  //--If time changes turned on then do 2nd differencing 
  //  for curvature penalty on subsequent years, otherwise only first year matters
  sel_like_dev.initialize();
  if (active(sel_coffs_fsh))
  {
    if (active(sel_devs_fsh))
    {
      // overall slight penalty on deviations for estimability...
      sel_like_dev(1)+=ctrl_flag(10)/group_num_fsh*norm2(sel_devs_fsh);
      // Curvature to regularize selectivity, weighted by number of changes so interpretation of ctrl_flag(11) penalty stays the same...
      sel_like_dev(1)+=ctrl_flag(11)/nch_fsh *norm2(first_difference( first_difference(log_sel_fsh(styr))));
      for (i=1;i<=nch_fsh;i++)
      {
        // Curvature to regularize selectivity, weighted by number of changes so interpretation of ctrl_flag(11) penalty stays the same...
        sel_like_dev(1) += ctrl_flag(11)/nch_fsh * norm2(first_difference( first_difference(log_sel_fsh(yrs_ch_fsh(i)))));
        if (yrs_ch_fsh(i)!=styr)
          sel_like_dev(1) += norm2(log_sel_fsh(yrs_ch_fsh(i)-1) - log_sel_fsh(yrs_ch_fsh(i))) / 
                             (2*sel_ch_sig_fsh(i) * sel_ch_sig_fsh(i));
      }
    }
    else
      sel_like_dev(1)+=ctrl_flag(11)*norm2(first_difference( first_difference(log_sel_fsh(styr))));
  }
  if (active(sel_a501_fsh_dev))
  {
    sel_like_dev(1) +=  5.0*norm2(first_difference(sel_a501_fsh_dev)); 
    sel_like_dev(1) += 25.0*norm2(first_difference(sel_trm2_fsh_dev)); 
    sel_like_dev(1) += 12.5*norm2(first_difference(sel_dif1_fsh_dev)); 
  }

  
  //////////////////////////////////////////////////////////////////////////////////
  if (active(sel_coffs_bts))
  {
    if (active(sel_devs_bts))
    {
      sel_like_dev(2) += ctrl_flag(20)/group_num_bts*norm2(sel_devs_bts);
      sel_like_dev(2) += ctrl_flag(21)/dim_sel_bts * norm2(first_difference( first_difference(log_sel_bts(styr))));
      for (i=styr;i<endyr_r;i++)
        if (!(i%group_num_bts))
          sel_like_dev(2)+=ctrl_flag(21)/dim_sel_bts*norm2(first_difference( first_difference(log_sel_bts(i+1))));
    }
    else
      sel_like_dev(2)+=ctrl_flag(21)*norm2(first_difference( first_difference(log_sel_bts(styr))));
  }
  if (active(sel_a50_bts_dev))
  {
    // sel_like_dev(2) += 12.5*norm2(first_difference(sel_a50_bts_dev)); 
    // sel_like_dev(2) += 12.5*norm2(first_difference(sel_slp_bts_dev)); 
		if(ctrl_flag(19)>0.){
		  dvar_matrix lnseltmp = trans(log_sel_bts);
      for (j=q_amin;j<q_amax;j++)
			  sel_like_dev(2) += ctrl_flag(26)*norm2(first_difference(lnseltmp(j))); 
		} else {
      sel_like_dev(2) += 50.*norm2(first_difference(sel_a50_bts_dev)); 
      sel_like_dev(2) += 50.*norm2(first_difference(sel_slp_bts_dev)); 
		}

    if (active(sel_one_bts_dev))
      sel_like_dev(2) += 8.*norm2(first_difference(sel_one_bts_dev)); // 25% CV on this
      // sel_like_dev(2) += 3.125*norm2(first_difference(sel_one_bts_dev)); // 40% CV on this
  }
 
  //////////////////////////////////////////////////////////////////////////////////
  dvar_vector like_tmp(1,4);
  like_tmp.initialize();

  like_tmp(1)  = ctrl_flag(22) * norm2(first_difference( first_difference(log_sel_eit(styr))));
  if (active(sel_devs_eit))
  {
    for (i=1;i<=nch_eit;i++)
    {
      like_tmp(1) += ctrl_flag(22) * norm2(first_difference( first_difference(log_sel_eit(yrs_ch_eit(i)))));
      like_tmp(2) += norm2(log_sel_eit(yrs_ch_eit(i)-1) - log_sel_eit(yrs_ch_eit(i))) / 
                         (2*sel_ch_sig_eit(i) * sel_ch_sig_eit(i));
    }
  }
  sel_like_dev(3)  = sum(like_tmp);
FUNCTION Surv_Likelihood
 //-Likelihood due to Survey Numbers-------------------
  surv_like.initialize();
  // survey index
  if (Do_Combined && current_phase()>3)
  {
    for (i=1;i<=n_bts_r;i++)
    {
      // Under development--not used (yet).  Idea to combine surveys for directly accounting for differences
      //  of water column densities...
      surv_like(1) += square(ot_cmb(i)-et_cmb(i))/(2.*var_cmb(i));
      // slight penalty here to get the q to scale correctly (note--development, not used)
      surv_like(1) += .01*square(ot_bts(i)-et_bts(i))/(2.*var_ot_bts(i));
    }
    // slight penalty here to get the q to scale correctly
    for (i=1;i<=n_eit_r;i++)
      surv_like(2) += .01*square(log(ot_eit(i)+.01)-log(et_eit(i)+.01))/ (2.*lvar_eit(i)) ;
  }
  else
  {
    // This is used (standard approach) Eq. 19,  historically used normal distribution since year-by-year var_bts avail
    // for (i=1;i<=n_bts_r;i// ++)
      // surv_like(1) += square(ot_bts(i)-et_bts(i))/(2.*var_bts(i));

    //dvar_vector srv_tmp = log(ot_bts + 1e-8)-log(et_bts + 1e-8);
    // Note not logged...

    dvar_vector srv_tmp(1,n_bts_r);
    q_bts  = mean(ob_bts)/mean(eb_bts);
    eb_bts *= q_bts;
    // eb_bts *= mean(ob_bts)/mean(eb_bts);
    if (do_bts_bio)
      srv_tmp = (ob_bts )-(eb_bts );
		else
      srv_tmp = (ot_bts )-(et_bts );

    // Covariance on observed population (numbers) switch
    if (DoCovBTS && current_phase()>4)
    {
      surv_like(1)  = .5 * srv_tmp * inv_bts_cov * srv_tmp;
      // cout <<"Survey likelihood: " << surv_like(1) << endl;
    }
    else
    {
      if (do_bts_bio)
      {
        for (i=1;i<=n_bts_r;i++)
          surv_like(1) += square(srv_tmp(i))/(2.*var_ob_bts(i));
      } 
      else
      {
        for (i=1;i<=n_bts_r;i++)
          surv_like(1) += square(srv_tmp(i))/(2.*var_ot_bts(i));
      }
    }
    surv_like(1) *= ctrl_flag(5);

  // AT Biomass section
  /*
  */
    if (do_eit_bio)
    {
      for (i=1;i<=n_eit_r;i++) // Eq. 19
        surv_like(2) += square(log(ob_eit(i)+.01)-log(eb_eit(i)+.01))/ (2.*lvarb_eit(i)) ;
        // #surv_like(2) += square(log(ob_eit(i)+.01)-log(eb_eit(i)+.01))/ (2.*var_ob_eit(i)) ;
    } 
    else
    {
      for (i=1;i<=n_eit_r;i++) // Eq. 19
        surv_like(2) += square(log(ot_eit(i)+.01)-log(et_eit(i)+.01))/ (2.*lvar_eit(i)) ;
    }
    surv_like(2) *= ctrl_flag(2);

  }
  if (use_age1_eit) 
  {
    // Compute q for this age1 index...
    dvariable qtmp = mfexp(mean(log(oa1_eit)-log(ea1_eit)));
    if (ignore_last_eit_age1)
      surv_like(3) = 0.5*norm2(log(oa1_eit(1,n_eit_r-1)+.01)-log(ea1_eit(1,n_eit_r-1)*qtmp +.01))/(age1_sigma_eit*age1_sigma_eit) ; 
    else
      surv_like(3) = 0.5*norm2(log(oa1_eit+.01)-log(ea1_eit*qtmp +.01))/(age1_sigma_eit*age1_sigma_eit) ; 
  }
  avo_like.initialize();
  cpue_like.initialize();

  dvar_vector cpue_dev = obs_cpue-pred_cpue;
  for (i=1;i<=n_cpue;i++)
    cpue_like += square(cpue_dev(i))/(2.*obs_cpue_var(i));

  dvar_vector avo_dev = obs_avo-pred_avo;
  for (i=1;i<=n_avo_r;i++)
    avo_like += square(avo_dev(i))/(2.*obs_avo_var(i));
FUNCTION Robust_Likelihood
  age_like.initialize();
  len_like.initialize();
  // dvariable robust_p(const dmatrix& obs,const dvar_matrix& pred,const dvariable& a,const dvariable& b)
  dvariable  rf=.1/nages;
  age_like(1) = robust_p(oac_fsh,eac_fsh,rf,sam_fsh);
  age_like(2) = robust_p(oac_bts,eac_bts,rf,sam_bts);


  if (current_phase() >= eit_robust_phase ) // eit robustness phase big number means do multinomial, not robust
    age_like(3) = robust_p(oac_eit,eac_eit,rf,sam_eit,mina_eit,nages);
  else // Multinomial for EIT
    for (i=1; i <= nagecomp(3); i++) 
      age_like(3) -= sam_eit(i)*oac_eit(i)(mina_eit,nages)*log(eac_eit(i)(mina_eit,nages) + MN_const);
  len_like    = robust_p(olc_fsh,elc_fsh,rf,50);

FUNCTION Multinomial_Likelihood
  age_like.initialize();
  len_like.initialize();
  //-Likelihood due to Age compositions--------------------------------
  for (int igear =1;igear<=ngears;igear++)
  {
    for (i=1; i <= nagecomp(igear); i++)
    {
      switch (igear)
      {
        case 1:
          age_like(igear) -= sam_fsh(i)*oac_fsh(i)*log(eac_fsh(i) + MN_const);
          break;
        case 2:
          age_like(igear) -= sam_bts(i)*oac_bts(i)*log(eac_bts(i) + MN_const);
          break;
        default:
          age_like(igear) -= sam_eit(i)*oac_eit(i)(mina_eit,nages)*log(eac_eit(i)(mina_eit,nages) +MN_const);
          break;
      }
    }     
    age_like(igear)-=age_like_offset(igear);
  }
  len_like = sam_fsh(n_fsh_r)*olc_fsh*log(elc_fsh+MN_const);

  // this one allows a concentrated range of ages (last two args are min and max age range)
FUNCTION dvariable robust_p(dmatrix& obs,dvar_matrix& pred,const dvariable& a, const data_ivector& b, const int amin, const int amax)
    if (obs.indexmin() != pred.indexmin() || obs.indexmax() != pred.indexmax() )
      cerr << "Index limits on observed vector are not equal to the Index\n"
        "limits on the predicted vector in robust_p function\n";
    RETURN_ARRAYS_INCREMENT(); //Need this statement because the function returns a variable type
    dvar_matrix v(obs.indexmin(),obs.indexmax(),amin,amax);
    // dvar_matrix l  =  elem_div(square(pred - obs), v);
    dvariable log_likelihood = 0.;
    for (i=obs.indexmin();i<= obs.indexmax() ;i++) 
    {
      v(i) = a  + 2. * elem_prod(obs(i)(amin,amax) ,1.  - obs(i)(amin,amax));
      dvar_vector l  =  elem_div(square(pred(i)(amin,amax) - obs(i)(amin,amax)), v(i));
      log_likelihood -=  sum(log(mfexp(-1.* double(b(i)) * l) + .01));  
    }
    log_likelihood  += 0.5 * sum(log(v));
    RETURN_ARRAYS_DECREMENT(); // Need this to decrement the stack increment
    return(log_likelihood);
FUNCTION dvariable robust_p(const dmatrix& obs,const dvar_matrix& pred,const dvariable& a, const data_ivector& b)
    RETURN_ARRAYS_INCREMENT(); //Need this statement because the function returns a variable type
    if (obs.indexmin() != pred.indexmin() || obs.indexmax() != pred.indexmax() )
      cerr << "Index limits on observed vector are not equal to the Index\n"
        "limits on the predicted vector in robust_p function\n";
    // dvar_matrix v = a  + 2. * elem_prod(pred ,1.  - pred );
    dvar_matrix v = a  + 2. * elem_prod(obs ,1.  - obs );
    dvar_matrix l  =  elem_div(square(pred - obs), v);
    dvariable log_likelihood = 0.;
    for (i=obs.indexmin();i<= obs.indexmax() ;i++) 
    {
      log_likelihood -=  sum(log(mfexp(-1.* double(b(i)) * l(i)) + .01));  
    }
    log_likelihood  += 0.5 * sum(log(v));
    RETURN_ARRAYS_DECREMENT(); // Need this to decrement the stack increment
    return(log_likelihood);
FUNCTION dvariable robust_p(const dmatrix& obs, const dvar_matrix& pred, const dvariable& a, const dvariable& b)
    RETURN_ARRAYS_INCREMENT(); //Need this statement because the function
    if (obs.indexmin() != pred.indexmin() || obs.indexmax() != pred.indexmax() )
      cerr << "Index limits on observed vector are not equal to the Index\n"
        "limits on the predicted vector in robust_p function\n";
             //returns a variable type
  
    // dvar_matrix v = a  + 2. * elem_prod(pred ,1.  - pred );
    dvar_matrix v = a  + 2. * elem_prod(obs ,1.  - obs );
    dvar_matrix l  = mfexp(- b * elem_div(square(pred - obs), v ));
    dvariable log_likelihood = -1.0*sum(log(l + .01));  
    log_likelihood  += 0.5 * sum(log(v));
    RETURN_ARRAYS_DECREMENT(); // Need this to decrement the stack increment
    return(log_likelihood);
FUNCTION dvariable robust_p(const dvector& obs, const dvar_vector& pred, const dvariable& a, const dvariable& b)
    RETURN_ARRAYS_INCREMENT(); //Need this statement because the function
    if (obs.indexmin() != pred.indexmin() || obs.indexmax() != pred.indexmax() )
      cerr << "Index limits on observed vector are not equal to the Index\n"
        "limits on the predicted vector in robust_p function\n";
             //returns a variable type
  
    // dvar_matrix v = a  + 2. * elem_prod(pred ,1.  - pred );
    dvar_vector v = a  + 2. * elem_prod(obs ,1.  - obs );
    dvar_vector l  = mfexp(- b * elem_div(square(pred - obs), v ));
    dvariable log_likelihood = -1.0*sum(log(l + .01));  
    log_likelihood  += 0.5 * sum(log(v));
    RETURN_ARRAYS_DECREMENT(); // Need this to decrement the stack increment
    return(log_likelihood);
FUNCTION write_srec
  srecout << "Yearclass SSB Recruit Pred_Rec Residual"<<endl;
  for (i=styr+1;i<=endyr_r;i++)
  {
    dvariable tmpr=SRecruit(SSB(i-1)) ; 
    srecout << i-1               <<" "
            << SSB(i-1)          <<" "
            << tmpr              <<" "
            << pred_rec(i)       <<" "
            << log(pred_rec(i)) 
               - log(tmpr)       <<" "
            <<endl;
  }
FUNCTION write_eval
  count_mcmc++;
  // only use every 100th chain...
  // if (count_mcmc % 10 == 0)
  {
    count_mcsave++;
    if(iseed>0)
      SimulateData1();
    else
    {
      // if (!pflag) 
			/*
      for (int k=1;k<=nscen;k++)
      {
        write_mceval(future_SSB(k));
        write_mceval(future_catch(k));
      }
      write_mceval(Fcur_Fmsy);
      write_mceval(Bcur_Bmsy);
      write_mceval(Bcur_Bmean);
      write_mceval(Bcur2_Bmsy);
      write_mceval(Bcur2_B20);
      write_mceval(Bcur3_Bcur);
      write_mceval(Bcur3_Bmean);
      write_mceval(LTA1_5R);
      write_mceval(LTA1_5);
      write_mceval(MatAgeDiv1);
      write_mceval(MatAgeDiv2);
      write_mceval(RelEffort);
      write_mceval <<endl;
			*/
			get_msy();
			write_nofish();
			write_mceval(fff);
			write_mceval(steepness);
			write_mceval(log_Rzero);
			write_mceval(Fmsy2);
			write_mceval(SPR_OFL);
			write_mceval(SER_Fmsy);
			write_mceval(Bzero);
			write_mceval(Bmsy);
			write_mceval(SB100);
			write_mceval(SSB(endyr_r));
			write_mceval(future_SSB(1,endyr_r+1));
			write_mceval(Bcur_Bmean(1)); //8 
			write_mceval(Bcur2_B20(1)); //8 
			write_mceval(B_Bnofsh); //8 
			write_mceval(q_all); //8 
      write_mceval <<endl;
      // eval<< "Obj_Fun steep q AvgRec SER_endyr SSBendyr_B40 1989_YC 1992_YC 1996_YC 2000YC MSYR Bmsy3+ Fmsy F35 SER_Fmsy SER_Endyr SBF40 Bcur_Bmsy Cur_Sp F40Catch Steepness Q CC1_1 CC1_2 CC1_3 CC2_1 CC2_2 CC2_3"<<endl;
      // eval <<" Future ssb"<<endl;
      // pflag=1;
      // for (j=4;j<=5;j++) eval<< future_SSB(j) << " "; eval<<endl;
      // eval << Bmsy<<" "<< future_SSB(4)<<" "<<future_SSB(5)<<" "<<future_SSB(6) <<endl;
      // eval<<"SPR: "<<SPR_OFL<<" Fmsy "<<Fmsy   <<" "<< future_catch(3,endyr+1)    <<endl;
    }
  }
FUNCTION write_nofish
  // function to write out results if there had been no fishing...
  dvar_vector a3p_nofsh(1978,endyr_r);
  dvar_vector SSB_nofsh(1977,endyr_r);
  dvariable adj_age1;
  adj_age1.initialize();
  a3p_nofsh.initialize();
  SSB_nofsh.initialize();

  log_initage=log_initdevs+log_avginit;
  natage(styr)(2,nages)=mfexp(log_initage);
    natage(styr,1) = mfexp(log_avgrec+rec_epsilons(styr));
  // Recruitment in subsequent years
  for (i=styr;i<=endyr_r;i++)
  {
    S(i)=mfexp(-1.*natmort);
    natage(i,1) = mfexp(log_avgrec+rec_epsilons(i));
  }
  
  SSB_nofsh(1978)         = elem_prod(elem_prod(natage(1978),pow(S(1978),yrfrac)),p_mature)*wt_ssb(1978);
  natage(1978+1)(2,nages) = ++elem_prod(natage(1978)(1,nages-1), S(1978)(1,nages-1));  
  natage(1978+1,nages)   += natage(1978,nages)*S(1978,nages);

  SSB_nofsh(1977)         = elem_prod(elem_prod(natage(1977),pow(S(1977),yrfrac)),p_mature)*wt_ssb(1977);
  for (i=1978;i<endyr_r;i++)
  {
    // S-R impact on recruitment (estimated_R/R_had_new) Eq. 14
    SSB_nofsh(i)         = elem_prod(elem_prod(natage(i),pow(S(i),yrfrac)),p_mature)*wt_ssb(i);
    adj_age1             = SRecruit(SSB_nofsh(i-1))/SRecruit(SSB(i-1));
    natage(i,1)         *= adj_age1;

    natage(i+1)(2,nages) = ++elem_prod(natage(i)(1,nages-1), S(i)(1,nages-1));  
    natage(i+1,nages)   += natage(i,nages)*S(i,nages);
  }
  SSB_nofsh(endyr_r)  = elem_prod(elem_prod(natage(endyr_r),pow(S(endyr_r),yrfrac)),p_mature)*wt_ssb(endyr_r);
  for (i=1978;i<=endyr_r;i++)
  {
    a3p_nofsh(i)  = natage(i)(3,nages)*wt_ssb(i)(3,nages); //cout<<a3p_nofsh(i)<<endl; cout<<natage(i)(3,nages)<<endl<< wt_ssb(i)(3,nages)<<endl; exit(1);
    // nofish<<i<<" "<<SSB_nofsh(i)<<" "<<" "<<SSB_nofsh_nosr(i)<<" "<<a3p_nofsh(i)<<" "<<a3p_nofsh(i)<<endl;
    nofish<<i<<" "<<SSB_nofsh(i)<<" "<<a3p_nofsh(i)<<" "<<endl;
  }
  nofish<<endl<<"N_Endyr "<<natage(endyr_r)<<endl;
  nofish<<endl<<"wt_Fut_fsh  "<<wt_fut     <<endl;
  nofish<<endl<<"wt_Fut_ssb  "<<wt_ssb(endyr_r) <<endl;
  nofish<<endl<<elem_prod(natage(endyr_r),wt_ssb(endyr_r)     )<<endl;
  B_Bnofsh = SSB(endyr_r)/SSB_nofsh(endyr_r);
FUNCTION write_projout2
  // Function to write out data file for projection model....just an output for alternative projections
  // Species part....
  /*
  Name
  Number  of  fsheries                                          
  Is_it_Const_popln?
  2000 Catch
  reserved
  TAC Split
  ABC Adjustment
  SpwnMonth
  NumAges
  Fratio  (must  sum  to  one)                                      
  M
  Maturity
  SpawnWtatAge
  FemWtatAge
  MaleWtatAge
  FemSelectivity
  MaleSelectivity
  Female NatAge
  Male Natage
  NumRecs
  Recs
  Spawning biomass
  */
 projout2 <<"EBS_Pollock"<<endl;
 projout2 <<"# Number of fsheries"<<endl<<"1" <<endl;;
 projout2 <<"# Const Popln?" <<endl  <<"0"     <<endl;;
 projout2 <<"# Recent TAC"   <<endl  <<obs_catch(endyr_r)  <<endl;;
 projout2 <<"# reserved "    <<endl  <<"0"     <<endl;;
 projout2 <<"# TAC Split "   <<endl  <<"1 1 "  <<endl;;
 projout2 <<"# ABC Adjustment "<<endl<<"1"     <<endl;;
 projout2 <<"# Spawnmonth "  <<endl    <<"4"   <<endl;;
 projout2 <<"# NumberAges "  <<endl    <<nages <<endl;;
 projout2 << " 1  # Fratio                  "  <<endl;
 projout2 << natmort<< " # Natural Mortality " <<endl;
 projout2 <<"# Maturity"<<endl<< p_mature/max(p_mature)<< endl;
 projout2 <<"# Wt spawn"<<endl<< wt_ssb(endyr_r)     << endl;
 projout2 <<"# Wt fsh"<<endl<< wt_fut     << endl;
 projout2 <<"# Wt fsh"<<endl<< wt_fut     << endl;
 projout2 <<"# selectivity"<<endl<< sel_fut << endl;
 projout2 <<"# selectivity"<<endl<< sel_fut << endl;
 projout2 <<"# natage"<<endl<< natage(endyr_r) << endl;
 projout2 <<"# natage"<<endl<< natage(endyr_r) << endl;
 projout2 <<"# Nrec"<<endl<< endyr_r-1978+1<< endl;
 projout2 <<"# rec"<<endl<< pred_rec(1978,endyr_r) << endl;
 projout2 <<"# SpawningBiomass"<<endl<< SSB(1978-1,endyr_r-1) << endl;

FUNCTION write_newproj
 ofstream newproj("newproj.prj");
 newproj <<"#Ebspollock:"<<endl<<model_name<<endl;
 newproj <<"#SSL Species?"<<endl;
 newproj <<"1"<<endl;
 newproj <<"#Constant buffer of Dorn?"<<endl;
 newproj <<"0"<<endl;
 newproj <<"#Number of fisheries?"<<endl;
 newproj <<"1"<<endl;
 newproj <<"#Number of sexes?"<<endl;
 newproj <<"1"<<endl;
 newproj <<"#5year_Average_F(endyr-4,endyr_as_estimated_by_ADmodel)"<<endl;
  sel_fut.initialize(); 
  for (i=1;i<=5;i++)
    sel_fut += F(endyr_r-i-1);
  sel_fut /= 5.;
 newproj << "# "<< mean(Fmort(endyr_r-4,endyr_r))<<endl;
 newproj << max(sel_fut) << endl;
 newproj << "# Sel_fut " << sel_fut<<endl;
 sel_fut /= max(sel_fut);
 newproj << "# F at last yr catch and fut select: " << SolveF2(natage(endyr_r),obs_catch(endyr_r))<<endl;
 newproj << "# F at last yr catch and fut select: " << SolveF2(natage(endyr_r-1),obs_catch(endyr_r-1))<<endl;
 newproj << "# F at last yr catch and fut select: " << SolveF2(natage(endyr_r-2),obs_catch(endyr_r-2))<<endl;
 newproj << "# F at last yr catch and fut select: " << SolveF2(natage(endyr_r-3),obs_catch(endyr_r-3))<<endl;
 newproj << "# F at last yr catch and fut select: " << SolveF2(natage(endyr_r-4),obs_catch(endyr_r-4))<<endl;
 newproj << "# Sel_fut " << sel_fut<<endl;
 newproj <<"#_Author_F_as_fraction_F_40%"<<endl;
 newproj <<"1"<<endl;
 newproj <<"#ABC SPR" <<endl;
 newproj <<"0.4"<<endl;
 newproj <<"#MSY SPR" <<endl;
 newproj <<"0.35"<<endl;
 newproj <<"#_Spawn_month"<<endl;
 newproj << yrfrac*12+1<<endl;
 newproj <<"#_Number_of_ages"<<endl;
 newproj <<nages<<endl;
 newproj <<"#_F_ratio(must_sum_to_one_only_one_fishery)"<<endl;
 newproj <<"1"<<endl;
 newproj <<"#_Natural_Mortality" << endl;
 newproj << natmort << endl; // for (j=1;j<=nages;j++) newproj <<natmort<<" "; newproj<<endl;
 newproj <<"#_Maturity_divided_by_2(projection_program_uses_to_get_female_spawning_biomass_if_divide_by_2"<<endl<<2*p_mature<< endl;
 newproj <<"#_Wt_at_age_spawners"<<endl<<wt_ssb(endyr_r)     << endl;
 newproj <<"#_Wt_at_age_fishery" <<endl<<wt_fut      << endl;
 newproj <<"#" <<endl;

 newproj <<"#_Selectivity_fishery_scaled_to_max_at_one"<<endl;
 newproj << sel_fut/max(sel_fut)<<endl;
 newproj <<"#_Numbers_at_age_end_year"<<endl<<natage(endyr_r)<< endl;
 newproj <<"#_N_recruitment_years (including last 3 estimates)"<<endl<<endyr-(1977+recage) << endl;
 newproj <<"#_Recruitment_start_at_1977_yearclass=1978_for_age_1_recruits"<<endl
         <<pred_rec(1977+recage,endyr_r-1)<< endl;
 newproj <<"#_Spawning biomass "<<endl<<SSB(1977,endyr_r-recage-1)<< endl;
  // SSB_nofsh(endyr_r)  = elem_prod(elem_prod(natage(endyr_r),pow(S(endyr_r),yrfrac)),p_mature)*wt_fut     ;
 newproj.close();
FUNCTION write_projout
  // Function to write out data file for projection model....just an output for alternative projections
  // Function to write out data file for projection model....
 projout << "EBS_Pollock_"<<endyr_r<<endl;
 projout <<"1    # SSLn species..."<<endl;
 projout <<"0    # Buffer of Dorn"<<endl;
 projout <<"1    # Number of fsheries"<<endl;
 projout <<"1    # Number of sexes"<<endl;
 dvariable sumFtmp;
 sumFtmp=0.;
 for (i = endyr_r-4;i<=endyr_r;i++) sumFtmp += F(i,6); 
 sumFtmp /= 5.;
 projout << sumFtmp << "  # averagei 5yr f                  " <<endl;
 // projout << mean(Fmort(endyr_r-4,endyr_r))<<"  # averagei 5yr f                  " <<endl;
 projout << " 1  # author f                  " <<endl;
 projout <<" 0.4  # ABC SPR        "<<endl;
 projout <<" 0.35 # MSY/OFL SPR    "<<endl;
 projout << " 4  # Spawnmo                   " <<endl;
 projout <<nages<< " # Number of ages" <<endl;
 projout << " 1  # Fratio                  " <<endl;
 projout <<natmort<< " # Natural Mortality       " <<endl;
 projout <<"# Maturity"<<endl<< p_mature/max(p_mature)<< endl;
 projout <<"# Wt spawn"<<endl<< wt_ssb(endyr_r)     << endl;
 projout <<"# Wt fsh"<<endl<< wt_fut     << endl;
 projout <<"# selectivity"<<endl<< sel_fut << endl;
 projout <<"# natage"<<endl<< natage(endyr_r) << endl;
 projout <<"# Nrec"<<endl<< endyr_r-1978<< endl;
 projout <<"# rec"<<endl<< pred_rec(1978,endyr_r) << endl;
 projout <<"# SpawningBiomass"<<endl<< SSB(1978-1,endyr_r-1) << endl;
FUNCTION SimulateData1
  cout <<"Doing mcsim: "<< count_mcsave<<" for iseed "<<iseed<<endl;// exit(1);
  dvector ran_age_vect(1,nages);
  ran_age_vect.fill_randn(rng);

 // Simulate 1-year ahead..............................................
  int k=5;
  dvar_matrix natage_futsim(styr_fut,endyr_fut,1,nages);
  natage_futsim.initialize();
  F_future.initialize();
  Z_future.initialize();
  S_future.initialize();

  natage_futsim(styr_fut,1)  = mfexp(log_avgrec + rec_dev_future(styr_fut));

 // If 2005 yc is above average (by 2x)...
  // natage(endyr_r) = elem_prod(YC_mult,natage(endyr_r));
  // multivariate normal
  // cout<<natage(endyr_r)<<endl;

  ofstream ssb("ssb.rep");
  dvector ntmp1(1,nages);
  ntmp1.initialize();

  // Stochastic version
  // begin-yr 2006 N
  // ntmp1 = N2006 + chol*ran_age_vect; // for (i=1;i<=nages;i++) ntmp1(i) = max(0.1,ntmp1(i));
  // non stochastic version
  // 2009 N (current year)
  ntmp1 = value(natage(endyr_r));
  ssb << elem_prod(elem_prod(ntmp1, pow(S(endyr_r),yrfrac)), p_mature) * wt_ssb(endyr_r)     <<" ";

  // begin-yr 2010 N
  natage_futsim(styr_fut)(2,nages)  = ++elem_prod(ntmp1(1,nages-1), S(endyr_r)(1,nages-1));  
  natage_futsim(styr_fut,nages)    += ntmp1(nages)*S(endyr_r,nages);

  ftmp = SolveF2(natage_futsim(styr_fut),next_yrs_catch);
  F_future(k,styr_fut) = sel_fut * ftmp;
  Z_future(styr_fut)   = F_future(k,styr_fut) + natmort;
  S_future(styr_fut)   = mfexp(-Z_future(styr_fut));
  dvariable  Xspawn1    = elem_prod(elem_prod(natage_futsim(styr_fut),pow(S_future(styr_fut),yrfrac)), p_mature) * wt_ssb(endyr_r)     ;
  ssb << Xspawn1<<" ";

  // begin-yr 2011 N
  i=styr_fut+1;
  natage_futsim(i)(2,nages)  = ++elem_prod(natage_futsim(styr_fut)(1,nages-1), S(endyr_r)(1,nages-1));  
  natage_futsim(i,nages)    += natage_futsim(styr_fut,nages)*S(endyr_r,nages);
  natage_futsim(i,1)  = mfexp(log_avgrec + rec_dev_future(i));
  // get morts
  ftmp = SolveF2(natage_futsim(i),next_yrs_catch);
  F_future(k,i) = sel_fut * ftmp;
  Z_future(i)   = F_future(k,i) + natmort;
  S_future(i)   = mfexp(-Z_future(i));
  ssb << elem_prod(elem_prod(natage_futsim(i), pow(S_future(i),yrfrac)), p_mature)*wt_ssb(endyr_r)     <<" " ;

  // begin-yr 2012 N
  i=styr_fut+2;
  natage_futsim(i)(2,nages)  = ++elem_prod(natage_futsim(styr_fut)(1,nages-1), S(endyr_r)(1,nages-1));  
  natage_futsim(i,nages)    += natage_futsim(styr_fut,nages)*S(endyr_r,nages);
  natage_futsim(i,1)  = mfexp(log_avgrec + rec_dev_future(i));

  // get morts
  ftmp = SolveF2(natage_futsim(i),next_yrs_catch);
  F_future(k,i) = sel_fut * ftmp;
  Z_future(i)   = F_future(k,i) + natmort;
  S_future(i)   = mfexp(-Z_future(i));
  ssb << elem_prod(elem_prod(natage_futsim(i), pow(S_future(i),yrfrac)), p_mature)*wt_ssb(endyr_r)     <<" " ;
  ssb <<endl; ssb.close();


 // Numbers at age for survey (note based on styr_fut)
 // 2010 survey timing N
  dvector ntmp         = value(elem_prod(natage_futsim(styr_fut),pow(S_future(styr_fut),.5)));
  dvector eac_fsh_fut(1,nages);
  dvector eac_bts_fut(1,nages);
  dvector eac_eit_fut(1,nages);
  eac_fsh_fut.initialize();
  eac_bts_fut.initialize();
  eac_eit_fut.initialize();

  // simply the last year's catch expectation (e.g., since 2007 data unavailable in 2007, 2006 for 2007 projection)
  eac_fsh_fut = value(catage(endyr_r)); 

  // BTS expectation for 2007 projection
  eac_bts_fut = value(elem_prod(ntmp,mfexp(log_sel_bts(endyr_r))) * q_bts); 

  // EIT expectation for 2007 projection
  eac_eit_fut = value(elem_prod(ntmp,mfexp(log_sel_eit(endyr_r))) * q_eit); 

  // Simulate data for next  year...
  // stochastic in surveys and fishery
  // not in wt-age
  char simno[33];
  int nsims;
  if (mceval_phase()) nsims=1; else nsims=100;
  for (int isim=1;isim<=nsims;isim++)
  {
    // if (mceval_phase()) 
      // simname = "sim_"+ adstring(itoa(count_mcsave,simno,10)) + ".dat";
    // else 
      // simname = "sim_"+ adstring(itoa(isim,simno,10)) + ".dat";
    cout<<"Simulate 1-year ahead data, iseed:  "<<simname<<" "<<iseed<<endl;
    ofstream simdat(simname);
    simdat<< styr             <<endl;
    simdat<< styr_bts         <<endl;
    simdat<< styr_eit         <<endl;
    simdat<< endyr+1          <<endl;
    simdat<< recage           <<endl;
    simdat<< nages            <<endl;
    simdat<< 2*p_mature       <<endl;
    simdat<< ewindex<<" 4 "   <<endl;
    simdat<< nsindex<<" 4 "   <<endl;
    simdat<< "# Wt fishey    "<<endl;
    simdat<< wt_fsh           <<endl;
    // Simulate next year's wt-age from stochsastic history? xxx
    simdat<< wt_fut           <<endl;
    simdat<< wt_ssb           <<endl;
    simdat<< wt_ssb(endyr)   <<endl;
  
    dvariable sigmasq;
    dvariable sigma;
    simdat << obs_catch <<" "
           << next_yrs_catch      <<endl;
  
    simdat << obs_effort       <<endl;
    simdat << obs_effort(endyr)<<endl;
  
    simdat << n_cpue          <<endl;
    simdat << yrs_cpue        <<endl;
    simdat << obs_cpue        <<endl;
    simdat << obs_cpue_std    <<endl;
    
    simdat << ngears          <<endl;
    simdat << minind          <<endl;
    // Add one year of fishery and survey years
    simdat << n_fsh+1         <<endl;
    simdat << n_bts+1         <<endl;
    // if(do_EIT1) 
    // this was to test for value of EIT survey...
    //if (Sim_status==1)
      simdat << n_eit+1       <<endl;
    // else
      // simdat << n_eit         <<endl;
  
    simdat << yrs_fsh_data    <<endl;
    simdat << yrs_fsh_data(n_fsh)+1   <<endl;
  
    simdat << yrs_bts_data             <<endl;
    simdat << yrs_bts_data(n_bts)+1    <<endl;
  
    simdat << yrs_eit_data             <<endl;
    // if(Sim_status==1) 
      simdat << yrs_eit_data(n_eit)+1    <<endl;// Nota
  
    simdat << sam_fsh         <<endl;
    simdat << sam_fsh(n_fsh)  <<endl;
  
    simdat << sam_bts         <<endl;
    simdat << sam_bts(n_bts)  <<endl;

    simdat << sam_eit         <<endl;
  // if(Sim_status==1) 
    simdat << sam_eit(n_eit)<<endl;

    // dvector ran_age_vect(1,nages);
    sigma   = 0.100;
    sigmasq = sigma*sigma;
    ran_age_vect.fill_randn(rng);
  
    simdat << "# Fishery simulate age compositions "    <<endl;
    simdat << oac_fsh                                 <<endl;
    simdat << exp(-sigmasq/2.) * elem_prod(mfexp(sigma * ran_age_vect) , eac_fsh_fut)<<endl;
  
    sigma   = 0.150;
    sigmasq = sigma*sigma;
    simdat << "# BTS Biomass estimates "                    <<endl;
    simdat << obs_bts_data<<" "<<eac_bts_fut * wt_bts(n_bts)<<endl;
    simdat << "# BTS Biomass std errors "                   <<endl;
    simdat << std_ob_bts_data 
    // 20% CV for new data
           << " "<< eac_bts_fut*wt_bts(n_bts)*.2            <<endl;
    simdat << "# BTS wt at age "                            <<endl;
    simdat <<   wt_bts << endl << wt_bts(n_bts)             <<endl;
    simdat << "# BTS Numbers std errors "                   <<endl;
    simdat << std_ot_bts                                              
           << " "<< sum(eac_bts_fut)*.15                    <<endl;
  
    //matrix eac_bts(1,n_bts_r,1,nbins)  //--Expected proportion at age in trawl survey
    // Need to correct for lognormal bias ------------------------
    sigmasq=norm2(log(et_bts+.01)-log(ot_bts+.01))/size_count(et_bts);
    sigma=sqrt(sigmasq);
  
    ran_age_vect.fill_randn(rng);
    simdat << "# Bottom Trawl survey simulate age compositions " <<endl;
    simdat <<  oac_bts_data         <<endl;
    // Simulate next year's bt survey age compositions and totals....TODO
    dvector bts_tmp(1,nages);
    bts_tmp = value(mfexp(-sigmasq/2.) * elem_prod(mfexp(sigma * ran_age_vect) , eac_bts_fut));
    simdat << bts_tmp <<endl;
    // simdat <<  eac_bts_fut <<endl;
  
    // sigmasq=norm2(log(et_eit+.01)-log(ot_eit+.01))/size_count(et_eit);
    // sigma=sqrt(sigmasq);
    sigma   = 0.200;
    sigmasq = sigma*sigma;
    ran_age_vect.fill_randn(rng);
    dvector eit_tmp(1,nages);
    eit_tmp = value(mfexp(-sigmasq/2.) * elem_prod(mfexp(sigma * ran_age_vect) , eac_eit_fut));
  
    simdat << "# EIT Trawl survey stdevs for total N "<<endl;
    simdat <<   std_ot_eit <<" "<< sum(eit_tmp)*.2<<endl;
    simdat << "# EIT Trawl survey simulate age compositions "<<endl;
    simdat <<  oac_eit_data         <<endl;
    // Simulate next year's EIT survey age compositions and totals....TODO
    simdat << eit_tmp <<endl;
  
    simdat << "# EIT Biomass estimates "                    <<endl;
    simdat << obs_eit_data<<" "<<eac_eit_fut * wt_eit(n_eit)<<endl;
    simdat << "# BTS Biomass std errors "                   <<endl;
    simdat << std_ob_eit_data<<" "<<std_ob_eit_data(n_eit)<<endl; 
    simdat << "# EIT wt at age "                            <<endl;
    simdat <<   wt_eit << endl << wt_eit(n_eit)             <<endl;
    simdat << "# BTS Bottom  temperatures (Habitat area) "  <<endl;
    simdat << bottom_temp<<" 0 "                            <<endl;
    simdat << "# Ageing error                            "  <<endl;
    simdat << age_err                                       <<endl;
  
    simdat << "# Expected length composition             "  <<endl;
    simdat << nlbins                                        <<endl;
    simdat << olc_fsh(1,nlbins)                             <<endl;
    simdat << age_len << endl;
    simdat << "1234567"                                     <<endl;																																														
    simdat.close();
  }

 // Selectivity functions........................
FUNCTION dvar_matrix compute_selectivity(const int stsel,const dvariable& slp,const dvariable& a50)
  // Single logistic, no trends....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  for (i=stsel;i<=endyr_r;i++)
    log_sel(i)  =  -1.*log( 1.0 + mfexp(-slp * ( age_vector - a50 )  ))  ;
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity(const int stsel,const dvariable& slp,const dvariable& a50,const dvar_vector& a50_dev)
  // Single logistic, trends in inflection....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  for (i=stsel;i<=endyr_r;i++)
    log_sel(i)  =  -1.*log( 1.0 + mfexp(-slp * ( age_vector - a50*exp(a50_dev(i)) )  ))  ;
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity(const int stsel,const dvariable& slp,const dvariable& a50,const dvar_vector& se,const dvar_vector& ae)
  // Single logistic, trends in inflection and slope....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  for (i=stsel;i<=endyr_r;i++)
    log_sel(i)  =  -1.*log( 1.0 + mfexp(-exp(se(i)) * slp * ( age_vector - a50*exp(ae(i)) )  ))  ;
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity(const int stsel,const dvar_vector& slp,const dvar_vector& a50)
  // double logistic, NO trends in inflection and slope....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  dvariable slp1;
  dvariable inf1;
  dvariable slp2;
  dvariable inf2;
  for (i=stsel;i<=endyr_r;i++)
  {
    slp1        = mfexp(slp(1));
    inf1        = a50(1) ;
    slp2        = mfexp(slp(2));
    inf2        = a50(2) ;
    log_sel(i)  = -1.*log( 1.0 + mfexp(-slp1             * ( age_vector - inf1 ) )  - ( 1.0 - 1.0 / ( 1 + mfexp( -slp2 *( age_vector - inf2 ) ) )) );
    log_sel(i) -= max(log_sel(i));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity1(const int stsel,const dvariable& dif,const dvariable& a50,const dvariable& trm)
  // slow_gistic, NO trends in ascending inflection, slope, and terminal Selectivity value....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  dvariable inf1;
  dvariable slp1;
  dvariable slp2;
  dvariable dif1;
  dvariable   x1;
  dvariable trm1;
  dvariable intrcpt;
  for (i=stsel;i<=endyr_r;i++)
  {
    dif1        = mfexp(dif);
    slp1        = 2.9444389791664400/ dif1;
    inf1        = a50 ;
    trm1        = trm ;

    x1          =  dif/2 + inf1;
    slp2        = (0.95-trm)/(dif/2. + inf1 - nages);
    intrcpt     =  0.95-x1*slp2;

    int tt;
    tt = int(value(x1));
    for ( j = 1  ; j < tt ; j++ )
      log_sel(i,j)  = -1.*log( 1.0 + mfexp(-slp1 * ( double(j) - inf1 ) ))  ;
    for (j = tt  ;j<=nages; j++ )
      log_sel(i,j)  = log( intrcpt + slp2 * double(j) ) ;

    log_sel(i) -= max(log_sel(i));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity1(const int stsel,const dvariable& dif,const dvariable& a50,const dvariable& trm,const dvar_matrix& devs)
  // slow_gistic, trends in ascending inflection, slope, and terminal Selectivity value....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  dvariable inf1;
  dvariable slp1;
  dvariable slp2;
  dvariable dif1;
  dvariable   x1;
  dvariable trm1;
  dvariable intrcpt;
  for (i=stsel;i<=endyr_r;i++)
  {
    dif1        = mfexp(devs(1,i) + dif);
    slp1        = 2.9444389791664400/ dif1;
    inf1        = mfexp(devs(2,i)) * a50 ;
    trm1        = mfexp(devs(3,i)) * trm ;

    x1          =  dif/2 + inf1;
    slp2        = (0.95-trm)/(dif/2. + inf1 - nages);
    intrcpt     =  0.95-x1*slp2;

    for (j=1;j<=nages;j++)
    {
      if (j < x1)
        log_sel(i,j)  = -1.*log( 1.0 + mfexp(-slp1 * ( double(j) - inf1 ) ) ) ;
      else
        log_sel(i,j)  = log( intrcpt + slp2 * double(j) ) ;
    }
    log_sel(i) -= max(log_sel(i));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity2(const int stsel,const dvar_vector& slp,const dvar_vector& a50,const dvar_matrix& devs)
  // double logistic, trends in ascending (only) inflection and both slopes....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  dvariable inf1;
  dvariable inf2;
  dvariable slp1;
  dvariable slp2;
  for (i=stsel;i<=endyr_r;i++)
  {
    slp1        = mfexp(devs(1,i)  + slp(1));
    inf1        = mfexp(devs(2,i)) * a50(1) ;
    slp2        = mfexp(devs(3,i)  + slp(2));
    inf2        = a50(2) ;
    log_sel(i)  = -1.*log( 1.0 + mfexp(-slp1 * ( age_vector - inf1 ) )  - ( 1.0 - 1.0 / ( 1 + mfexp( -slp2 *( age_vector - inf2 ) ) )) );
    log_sel(i) -= max(log_sel(i));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity3(const int stsel,const dvar_vector& dif,const dvar_vector& a50)
  // double logistic, Andre's parameterization, NO trends in inflection and slope....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  dvariable dif1;
  dvariable inf1;
  dvariable dif2;
  dvariable inf2;
  for (i=stsel;i<=endyr_r;i++)
  {
    dif1        = 2.9444389791664400/( mfexp(dif(1)));
    inf1        = a50(1) ;
    dif2        = 2.9444389791664400/ (mfexp(dif(2)));
    inf2        = a50(2) ;
    log_sel(i)  = -1.*log( 1.0 + mfexp(-dif1 * ( age_vector - inf1 ) )  
                  -(1.0 - 1.0/(1.0 + mfexp( -dif2 *( age_vector - inf2 ) ) )) );

    log_sel(i) -= max(log_sel(i));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity3(const int stsel,const dvar_vector& dif,const dvar_vector& a50,const dvar_matrix& devs)
  // double logistic, Andre's parameterization, trends in inflection and slope....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  dvariable dif1;
  dvariable inf1;
  dvariable dif2;
  dvariable inf2;
  for (i=stsel;i<=endyr_r;i++)
  {
    dif1        = 2.9444389791664400/( mfexp(devs(1,i) + dif(1)));
    inf1        = mfexp(devs(2,i)) * a50(1) ;
    dif2        = 2.9444389791664400/ (mfexp(devs(3,i) + dif(2)));
    inf2        = mfexp(devs(4,i)) * a50(2) ;
    log_sel(i)  = -1.*log( 1.0 + mfexp(-dif1 * ( age_vector - inf1 ) )  
                  -(1.0 - 1.0 / ( 1 + mfexp( -dif2 *( age_vector - inf2 ) ) )) );
    log_sel(i) -= max(log_sel(i));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity(const int stsel,const dvar_vector& slp,const dvar_vector& a50,const dvar_matrix& devs)
  // double logistic, trends in inflection and slope....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  dvariable slp1;
  dvariable inf1;
  dvariable slp2;
  dvariable inf2;
  for (i=stsel;i<=endyr_r;i++)
  {
    slp1        = mfexp(devs(1,i)  + slp(1));
    inf1        = mfexp(devs(2,i)) * a50(1) ;
    slp2        = mfexp(devs(3,i)  + slp(2));
    inf2        = mfexp(devs(4,i)) * a50(2) ;
    log_sel(i)  = -1.*log( 1.0 + mfexp(-slp1 * ( age_vector - inf1 ) )  - ( 1.0 - 1.0 / ( 1 + mfexp( -slp2 *( age_vector - inf2 ) ) )) );
    log_sel(i) -= max(log_sel(i));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);

 // Coefficient selectivity forms from here down===================================================
FUNCTION dvar_matrix compute_fsh_selectivity(const int nsel,const int stsel,dvariable& avgsel,const dvar_vector& coffs,const dvar_matrix& sel_devs,int  gn)
  // Coefficient selectivity, with deviations...
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  avgsel                       = log(mean(mfexp(coffs)));
  log_sel(stsel)(1,nsel)       = coffs;
  log_sel(stsel)(nsel+1,nages) = coffs(nsel);
  int ii;
  log_sel(stsel)               -=log(mean(exp(log_sel(stsel))));
  ii=1;
  for (i=stsel;i<endyr_r;i++)
  {
    // if (!((i+sel_dev_shift)%gn)) // note that this makes the shift occurr in different years....
    if (ii<=nch_fsh)
    {
      if (i==yrs_ch_fsh(ii) )
      {
        log_sel(i+1)(1,nsel)       = log_sel(i)(1,nsel) + sel_devs(ii); // Next year's selectivity has a deviation from this (the 3rd yr)
        log_sel(i+1)(nsel+1,nages) = log_sel(i+1,nsel);
        ii++;
      }
      else
        log_sel(i+1)=log_sel(i);
    }
    else
      log_sel(i+1)=log_sel(i);

    log_sel(i+1)-=log(mean(exp(log_sel(i+1))));
  }
  // log_sel(endyr_r)=log_sel(endyr_r-1); // This avoids uncertainty in last age group
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity_eit(const int nsel,const int stsel,dvariable& avgsel,const dvar_vector& coffs)
  // Coefficient selectivity, withOUT deviations...
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  avgsel  = log(mean(mfexp(coffs)));
  log_sel(stsel)(mina_eit,nsel)     = coffs;
  log_sel(stsel)(nsel+1,nages)      = coffs(nsel);
  int ii;
  log_sel(stsel)-=log(mean(exp(log_sel(stsel))));
  for (i=stsel;i<endyr_r;i++)
    log_sel(i+1)=log_sel(i);
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity_eit(const int nsel,const int stsel,dvariable& avgsel,const dvar_vector& coffs,const dvar_matrix& sel_devs)
    // log_sel_eit = compute_selectivity(n_selages_eit,styr_eit,avgsel_eit,sel_coffs_eit,sel_devs_eit);
  // Coefficient selectivity, with deviations...
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  avgsel  = log(mean(mfexp(coffs)));
  log_sel(stsel)(mina_eit,nsel)     = coffs;
  log_sel(stsel)(nsel+1,nages)      = coffs(nsel);
  int ii;
  log_sel(stsel)-=log(mean(exp(log_sel(stsel))));
  ii=1;
  for (i=stsel+1;i<=endyr_r;i++) // Starts in 1979
  {
    // if (i==yrs_eit_data(ii)&&ii<=dim_sel_eit)
    if (i==yrs_ch_eit(ii))
    {
      // log_sel(i+1)(mina_eit,nsel) = log_sel(i)(mina_eit,nsel) + sel_devs(ii);
      // log_sel(i+1)(nsel+1,nages)  = log_sel(i+1,nsel);
      log_sel(i)(mina_eit,nsel) = log_sel(i-1)(mina_eit,nsel) + sel_devs(ii);
      log_sel(i)(nsel+1,nages)  = log_sel(i,nsel);
      // cout<<yrs_eit_data(ii)<<endl;
      if(ii<dim_sel_eit)
        ii++;
    }
    else
      log_sel(i)=log_sel(i-1);
    log_sel(i)-=log(mean(exp(log_sel(i))));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity(const int nsel,const int stsel,dvariable& avgsel,const dvar_vector& coffs,const dvar_matrix& sel_devs,int  gn)
  // Coefficient selectivity, with deviations...
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  avgsel  = log(mean(mfexp(coffs)));
  log_sel(stsel)(1,nsel)      = coffs;
  log_sel(stsel)(nsel+1,nages)      = coffs(nsel);
  int ii;
  log_sel(stsel)-=log(mean(exp(log_sel(stsel))));
  ii=1;
  for (i=stsel;i<endyr_r;i++)
  {
    if (!(i%gn))
    {
      log_sel(i+1)(1,nsel)       = log_sel(i)(1,nsel) + sel_devs(ii);
      log_sel(i+1)(nsel+1,nages) = log_sel(i+1,nsel);
      ii++;
    }
    else
      log_sel(i+1)=log_sel(i);

    log_sel(i+1)-=log(mean(exp(log_sel(i+1))));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvar_matrix compute_selectivity(const int nsel,const int stsel, dvariable& avgsel,const dvar_vector& coffs)
  // Coefficient selectivity, without deviations...
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  dvar_vector log_sel_tmp(1,nages);
  avgsel  = log(mean(mfexp(coffs )));
  log_sel_tmp(1,nsel)       = coffs;
  log_sel_tmp(nsel+1,nages) = coffs(nsel);
  log_sel_tmp                   -= log(mean(exp(log_sel_tmp)));
  for (i=stsel;i<=endyr_r;i++)
    log_sel(i) = log_sel_tmp;

  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
FUNCTION dvariable SolveF2(const dvar_vector& N_tmp, double  TACin)
  RETURN_ARRAYS_INCREMENT();
  dvariable dd = 10.;
  dvariable cc = TACin;
  dvariable btmp =  elem_prod(sel_fut,N_tmp) * wt_fut ;
  dvariable ftmp;
  ftmp = 1.2*TACin/btmp;

  dvar_vector Fatmp = ftmp * sel_fut;
  dvar_vector Z_tmp = Fatmp + natmort;
  dvar_vector S_tmp = mfexp(-Z_tmp);

  int icount;
  icount=0;
  for (icount=1;icount<=20;icount++)
  {
    ftmp += (TACin-cc) / btmp;
    Fatmp = ftmp * sel_fut;
    Z_tmp = Fatmp + natmort;
    S_tmp = mfexp( -Z_tmp );
    cc = (wt_fut * elem_prod(elem_div(Fatmp,  Z_tmp),elem_prod(1.-S_tmp,N_tmp))); // Catch equation (vectors)
    dd = cc / TACin - 1.;
    dd = sfabs(dd);
  }
  RETURN_ARRAYS_DECREMENT();
  //cout << TACin <<" "<< cc <<endl;
  return(ftmp);
FUNCTION Profile_F
 /* NOTE THis will need to be conditional on SrType too
  Function calculates used in calculating MSY and MSYL for a designated component of the
  population, given values for stock recruitment and selectivity...  Fmsy is the trial value of MSY example of the use of "funnel" to reduce the amount of storage for derivative calculations */
  dvariable Fdmsy;
  dvariable Stmp;
  dvariable Rtmp;
  dvariable Btmp;
  dvariable F1;
  dvariable yld1;
  cout <<"sel_fut"<<endl;
  cout <<sel_fut<<endl;
  cout <<natmort<<endl;
  cout <<p_mature<<endl;
  cout <<wt_ssb(endyr_r)     <<endl;
  cout <<sigmarsq_out<<endl;
  cout <<"Fmsy, MSY, Steepness, Rzero, Bzero, PhiZero, Alpha, Beta, SPB0, SPRBF40"<<endl;
  cout << Fmsy<<" "<<MSY<<" "<<steepness<<" "<<Rzero<<" "<<Bzero<<" "<<phizero<<" "<<alpha<<" "<<beta<<" "<<SB0/meanrec<<" "<<SBF40/meanrec<<endl;;
  cout <<endl<<endl<<"Iter  F  Stock  Yld  Recruit"<<endl;
  for (int ii=1;ii<=500;ii++)
  {
    F1    = double(ii)/100;
    yld1   = get_yield(F1,Stmp,Rtmp,Btmp);
    cout <<ii<<" " <<F1<<" "<< Stmp <<" "<<yld1<<" "<<Rtmp<<" "<<" "<< endl; 
  } 
 exit(1);
FUNCTION double mn_age(const dvar_vector& pobs)
  int lb1 = pobs.indexmin();
  int ub1 = pobs.indexmax();
  dvector av = age_vector(lb1,ub1)  ;
  double mobs = value(pobs*av);
  return mobs;
FUNCTION double Sd_age(const dvar_vector& pobs, const dvar_vector& phat)
  int lb1 = pobs.indexmin();
  int ub1 = pobs.indexmax();
  dvector av = age_vector(lb1,ub1)  ;
  double mobs = value(pobs*av);
  double stmp = value(sqrt(elem_prod(av,av)*pobs - mobs*mobs));
  return stmp;
FUNCTION double Eff_N_adj(const double, const dvar_vector& pobs, const dvar_vector& phat)
  // Eq. 6
  int lb1 = pobs.indexmin();
  int ub1 = pobs.indexmax();
  dvector av = age_vector(lb1,ub1)  ;
  double mobs = value(pobs*av);
  double mhat = value(phat*av );
  double rtmp = mobs-mhat;
  double stmp = value(sqrt(elem_prod(av,av)*pobs - mobs*mobs));
  return square(stmp)/square(rtmp);
FUNCTION double Eff_N2(const dvar_vector& pobs, const dvar_vector& phat)
  // Eq. 6
  int lb1 = pobs.indexmin();
  int ub1 = pobs.indexmax();
  dvector av = age_vector(lb1,ub1)  ;
  double mobs = value(pobs*av);
  double mhat = value(phat*av );
  double rtmp = mobs-mhat;
  double stmp = value(sqrt(elem_prod(av,av)*pobs - mobs*mobs));
  return square(stmp)/square(rtmp);
FUNCTION double Eff_N(const dvar_vector& pobs, const dvar_vector& phat)
  // Eq. 6
  dvar_vector rtmp = elem_div((pobs-phat),sqrt(elem_prod(phat,(1-phat))));
  double vtmp;
  vtmp = value(norm2(rtmp)/size_count(rtmp));
  return 1/vtmp;

FUNCTION write_R
  adstring ad_tmp=initial_params::get_reportfile_name();
  ofstream report((char*)(adprogram_name + ad_tmp),ios::app);



  // Development--just start to get some output into R
	R_report(H);
	R_report(avg_age_mature);
  report << "h_prior" << endl << Priors(1) << endl;
  report << "q_prior" << endl << Priors(2) << endl;
  if (ctrl_flag(28)==0)// Only do these if not retrospective..
	{
		dvector sigtmp(1,n_bts);
		if (DoCovBTS) for (i=1;i<=n_bts;i++) sigtmp(i) = sqrt(cov(i,i)); 
		double sdnr_bts;
		double sdnr_ats;
		double sdnr_avo;
		sdnr_bts = sdnr(ob_bts,eb_bts,std_ob_bts_data);
		sdnr_ats = sdnr(ob_eit,eb_eit,std_ob_eit_data);
  // dvar_vector avo_dev = obs_avo-pred_avo;
		sdnr_avo = sdnr(obs_avo,pred_avo,obs_avo_std);
  // std_ob_eit_data(1,n_eit)
  // std_ob_bts_data(1,n_bts)
  // obs_avo_std(1,n_avo)

		report << "sdnr_bts"<< endl << sdnr_bts << endl;
		report << "sdnr_ats"<< endl << sdnr_ats << endl;
		report << "sdnr_avo"<< endl << sdnr_avo << endl;

    report << "FW_fsh"  << endl << FW_fsh(1) << endl;
    report << "FW_fsh1" << endl << FW_fsh(2) << endl;
    report << "FW_fsh2" << endl << FW_fsh(3) << endl;
    report << "FW_fsh3" << endl << FW_fsh(4) << endl;
    R_report(obs_catch);
    R_report(pred_catch);
    R_report(FW_bts);
    R_report(FW_eit);
	}
  R_report(dec_tab_catch);
  R_report(sam_fsh);
  R_report(sam_bts);
  R_report(sam_eit);
  R_report(sel_fsh);
  dvar_matrix sel_bts = mfexp(log_sel_bts);
  dvar_matrix sel_eit = mfexp(log_sel_eit);
  R_report(sel_bts);
  R_report(sel_eit);
  R_report(steepness);
  R_report(SR_resids);
  R_report(sigr);
  R_report(SRR_SSB);
  R_report(rechat);
  R_report(rechat.sd);
  R_report(repl_F);
  R_report(repl_yld);
  R_report(repl_SSB);
	report<<"cat_like"<<endl<< ctrl_flag(1) * ssqcatch      << endl;
	report<<"Fpen_like"<<endl<< ctrl_flag(4) * F_pen         << endl;
  R_report(wt_like);
  R_report(all_like);
  R_report(surv_like);
  R_report(cpue_like);
  R_report(avo_like);
  R_report(sel_like);
  R_report(sel_like_dev);
  R_report(age_like);
  R_report(len_like);
  R_report(rec_like);
	report<<"tot_like"<<endl<<fff<<endl;
  report<<"Yr"<<endl; for (i=styr;i<=endyr_r;i++) report<<i<<" "; report<<endl;
  report<<"yr_bts"<<endl; report<<yrs_bts_data<<endl;
  R_report(ob_bts);
  R_report(eb_bts);
  R_report(ot_bts);
  R_report(et_bts);
  report<<"sd_ob_bts"<<endl<<std_ob_bts<<endl;
  report<<"sd_ot_bts"<<endl<<std_ot_bts<<endl;
  report<<"yr_eit"<<endl; report<<yrs_eit_data<<endl;
  R_report(ob_eit);
  R_report(eb_eit);
  R_report(ot_eit);
  R_report(et_eit);
  report<<"sd_ob_eit"<<endl<<std_ob_eit<<endl;
  report<<"sd_ot_eit"<<endl<<std_ot_eit<<endl;
  report<<"sd_eit"<<endl<<std_ob_eit<<endl;
  report<<"Future_F"<<endl;
  for (int k=1;k<=nscen;k++) 
  {
    report<< mean(F(endyr_r)(4,10))<<" "; // reference year as current
    for (int i=styr_fut;i<=endyr_fut;i++) 
       report<< mean(F_future(k,i)(4,10))<<" ";
    report<<endl;
  }
  // 3darray F_future(1,nscen,styr_fut,endyr_fut,1,nages);
  R_report(future_SER);
  R_report(future_SSB);
  R_report(future_SSB.sd);
  R_report(future_catch);
  R_report(Fcur_Fmsy);
  R_report(Fcur_Fmsy.sd);
  R_report(Bcur_Bmsy);
  R_report(Bcur_Bmsy.sd);
  R_report(Bcur_Bmean);
  R_report(Bcur_Bmean.sd);
  R_report(Bcur2_Bmsy);
  R_report(Bcur2_Bmsy.sd);
  R_report(Bcur2_B20);
  R_report(Bcur2_B20.sd);
  R_report(Bcur3_Bcur);
  R_report(Bcur3_Bcur.sd);
  R_report(Bcur3_Bmean);
  R_report(Bcur3_Bmean.sd);
  R_report(LTA1_5R);
  R_report(LTA1_5R.sd);
  R_report(MatAgeDiv1);
  R_report(MatAgeDiv1.sd);
  R_report(MatAgeDiv2);
  R_report(MatAgeDiv2.sd);
  R_report(RelEffort);
  R_report(RelEffort.sd);
  R_report(LTA1_5);
  R_report(LTA1_5.sd);
  double lb=0.;
  double ub=0.;
  report<<"SER"<<endl; 
  for (i=styr;i<=endyr_r;i++) 
  {
		//lb=value(SER(i)-2.*SER.sd(i));
		//ub=value(SER(i)+2.*SER.sd(i));
		lb=value(SER(i)/exp(2.*sqrt(log(1+square(SER.sd(i))/square(SER(i))))));
		ub=value(SER(i)*exp(2.*sqrt(log(1+square(SER.sd(i))/square(SER(i))))));
    report<<i<<" "<<SER(i)<<" "<<SER.sd(i)<<" "<<lb<<" "<<ub<<endl;
  }
  report<<"SSB"<<endl; 
  for (i=styr;i<=endyr_r;i++) 
  {
    lb=value(SSB(i)/exp(2.*sqrt(log(1+square(SSB.sd(i))/square(SSB(i))))));
    ub=value(SSB(i)*exp(2.*sqrt(log(1+square(SSB.sd(i))/square(SSB(i))))));
    report<<i<<" "<<SSB(i)<<" "<<SSB.sd(i)<<" "<<lb<<" "<<ub<<endl;
  }
  report<<"R"<<endl; for (i=styr;i<=endyr_r;i++) 
  {
    lb=value(pred_rec(i)/exp(2.*sqrt(log(1+square(pred_rec.sd(i))/square(pred_rec(i))))));
    ub=value(pred_rec(i)*exp(2.*sqrt(log(1+square(pred_rec.sd(i))/square(pred_rec(i))))));
    report<<i<<" "<<pred_rec(i)<<" "<<pred_rec.sd(i)<<" "<<lb<<" "<<ub<<endl;
  }
  R_report(yrs_cpue); 
  R_report(obs_cpue); 
  R_report(obs_cpue_std); 
  R_report(pred_cpue); 
  R_report(yrs_avo); 
  R_report(obs_avo); 
  R_report(obs_avo_std); 
  R_report(pred_avo); 
  report << "pobs_fsh"<<  endl;
  for (i=1;i<=n_fsh_r;i++) 
    report << yrs_fsh_data(i)<< " "<< oac_fsh(i) << endl;
  report << "phat_fsh"<< endl;
  for (i=1;i<=n_fsh_r;i++) 
    report << yrs_fsh_data(i)<< " "<< eac_fsh(i) << endl;

  report << "phat_bts"<<endl;
  for (i=1;i<=n_bts_r;i++) 
    report << yrs_bts_data(i)<< " "<< eac_bts(i) << endl;

  report << "phat_eit"<<endl;
  for (i=1;i<=n_eit_r;i++) 
    report << yrs_eit_data(i)<< " "<< eac_eit(i) << endl;
      
  report << "pobs_bts"<<endl;
  for (i=1;i<=n_bts_r;i++) 
    report << yrs_bts_data(i)<< " "<< oac_bts(i) << endl;

  report << "pobs_eit"<<endl;
  for (i=1;i<=n_eit_r;i++) 
    report << yrs_eit_data(i)<< " "<< oac_eit(i) << endl;
      
  report <<"EffN_bts"<<endl;
  for (i=1;i<=n_bts_r;i++) 
  {
      double sda_tmp = Sd_age(oac_bts(i),eac_bts(i));
      report << yrs_bts_data(i)
               << " "<<Eff_N(oac_bts(i),eac_bts(i)) 
               << " "<<Eff_N2(oac_bts(i),eac_bts(i))
               << " "<<mn_age(oac_bts(i))
               << " "<<mn_age(eac_bts(i))
               << " "<<sda_tmp
               << " "<<mn_age(oac_bts(i)) - sda_tmp *2. / sqrt(sam_bts(i))
               << " "<<mn_age(oac_bts(i)) + sda_tmp *2. / sqrt(sam_bts(i))
               <<endl;
  }
  dvar_matrix eac_ats(1,n_eit_r,mina_eit,nages);
  dmatrix oac_ats(1,n_eit_r,mina_eit,nages);
  for (int i=1;i<=n_eit_r;i++)
  {
      oac_ats(i) = oac_eit(i)(mina_eit,nages);
      eac_ats(i) = eac_eit(i)(mina_eit,nages);
  }
  report <<"EffN_ats"<<endl;
  for (i=1;i<=n_eit_r;i++) 
  {
    double sda_tmp = Sd_age(oac_ats(i),eac_ats(i));
    report << yrs_eit_data(i)
             << " "<<Eff_N(oac_ats(i),eac_ats(i)) 
             << " "<<Eff_N2(oac_ats(i),eac_ats(i))
             << " "<<mn_age(oac_ats(i))
             << " "<<mn_age(eac_ats(i))
             << " "<<sda_tmp
             << " "<<mn_age(oac_ats(i)) - sda_tmp *2. / sqrt(sam_eit(i))
             << " "<<mn_age(oac_ats(i)) + sda_tmp *2. / sqrt(sam_eit(i))
             <<endl;
  }

  report <<"EffN_fsh"<<endl;
  for (i=1;i<=n_fsh_r;i++) 
  {
    double sda_tmp = Sd_age(oac_fsh(i),eac_fsh(i));
    report << yrs_fsh_data(i)
           << " "<<Eff_N(oac_fsh(i),eac_fsh(i)) 
               << " "<<Eff_N2(oac_fsh(i),eac_fsh(i))
               << " "<<mn_age(oac_fsh(i))
               << " "<<mn_age(eac_fsh(i))
               << " "<<sda_tmp
               << " "<<mn_age(oac_fsh(i)) - sda_tmp *2. / sqrt(sam_fsh(i))
               << " "<<mn_age(oac_fsh(i)) + sda_tmp *2. / sqrt(sam_fsh(i))
               <<endl;
    }

  R_report(F);
  // Print out the proportion of each age's contribution to SSB...
  report <<"P_SSB"<<endl;
  for (i=styr;i<=endyr_r;i++) 
    report <<i<<" "<< 
    elem_prod( elem_prod(
        elem_prod(natage(i),pow(S(i),yrfrac)), p_mature), wt_ssb(i)) /SSB(i) <<endl;
  R_report(wt_ssb);
  R_report(wt_cur);
  R_report(wt_cur.sd);
  R_report(wt_next);
  R_report(wt_next.sd);
  R_report(wt_yraf);
  R_report(wt_yraf.sd);
  R_report(wt_fsh);
  R_report(wt_fut);
	// Report survey q for bts
  report << "q_bts_3_8" <<endl;
	double qtmp;
	for ( i=1;i<=n_bts_r;i++)
  {
    iyr          = yrs_bts_data(i);
    qtmp         = value(bt_slope * bottom_temp(i) + q_bts );
    // For reduced survey strata years
    if (active(log_q_std_area)&&(iyr<1985||iyr==1986)) 
      qtmp *= value(exp(log_q_std_area)); 

    report  << mfexp(log_sel_bts(iyr))(3,8) * qtmp<<endl; 
  }
 


  {
 //   ofstream sd_output("extra_sd.rep");
  // sd_output << "GM_Biom GM_Biom2 HM_Fmsyr AM_Fmsyr Avg_3yr_Catch C_F40 C_F35 SSB_F40 SSB_F35 ABC_HM OFL_AM ABC_HM2 OFL_AM2 Adjust_1 Adjust_2 SPR_ABC SPR_OFL 1989YC 1989YC.sd "
           // << "1992YC 1992YC.sd 1996YC 1996YC.sd 2000YC 2000YC.sd Fut_2yr_Catch"<<endl;
  dvar_vector  cv_b(1,10);
  dvar_vector  cv_b2(1,10);
  dvar_vector  gm_b(1,10);
  dvar_vector  gm_b2(1,10);
 
  cv_b = elem_div(ABC_biom.sd , ABC_biom); 
  cv_b2= elem_div(ABC_biom2.sd , ABC_biom2); 
 
  gm_b = exp(log(ABC_biom) -elem_prod(cv_b ,cv_b )/2.); // Eq. 22
  gm_b2= exp(log(ABC_biom2)-elem_prod(cv_b2,cv_b2)/2.); // Eq. 22
 
  dvariable hm_f = exp(lnFmsy2 - lnFmsy2.sd*lnFmsy2.sd /2.); // Eq. 22
  dvariable am_f = exp(lnFmsy2 + lnFmsy2.sd*lnFmsy2.sd /2.); // Eq. 22

 // get spr rates for ABC and OFL
  SPR_ABC = SPR_OFL * am_f / hm_f;

  dvariable ABC  = gm_b(1)*hm_f*adj_1(1); 
  dvariable OFL  = gm_b(1)*am_f*adj_1(1); 
	report <<"T1"<<endl;
	//  yr ABC OFL SSB 3+Biom CatchFut harmeanF arithmeanF geomB SPRABC SPROFL
  report << endyr_r+1<<" " << ABC <<" " << OFL <<" "<< future_SSB(1,styr_fut) <<" "<< age_3_plus_biom(endyr_r+1) <<" "<<
  future_catch(1,styr_fut) <<" " << hm_f  <<" "<< am_f <<" "<< gm_b(1) <<" "<< SPR_ABC <<" "<< SPR_OFL <<endl;

  ABC  = gm_b2(1)*hm_f*adj_2(1); 
  OFL  = gm_b2(1)*am_f*adj_2(1); 
  report << endyr_r+2<<" " << ABC <<" " << OFL <<" "<< future_SSB(1,styr_fut+1) <<" "<< age_3_plus_biom(endyr_r+2)  <<" "<<
  future_catch(11,styr_fut+1) <<" " << hm_f  <<" "<< am_f <<" "<< gm_b2(1)<<" "<< SPR_ABC <<" "<< SPR_OFL <<endl;

  R_report(Cat_Fut);
	report <<"YC"<<endl;
	int age1tmp=1990;
	report << age1tmp-1 << " " <<pred_rec(age1tmp) <<" "<< pred_rec.sd(age1tmp)/pred_rec(age1tmp) <<endl;
  age1tmp = 1993; 
	if (endyr_r > age1tmp) report << age1tmp-1 << " " <<pred_rec(age1tmp) <<" "<< pred_rec.sd(age1tmp)/pred_rec(age1tmp) <<endl;
  age1tmp = 1997; 
	if (endyr_r > age1tmp) report << age1tmp-1 << " " <<pred_rec(age1tmp) <<" "<< pred_rec.sd(age1tmp)/pred_rec(age1tmp) <<endl;
  age1tmp = 2001; 
	if (endyr_r > age1tmp) report << age1tmp-1 << " " <<pred_rec(age1tmp) <<" "<< pred_rec.sd(age1tmp)/pred_rec(age1tmp) <<endl;
  age1tmp = 2009; 
	if (endyr_r > age1tmp) report << age1tmp-1 << " " <<pred_rec(age1tmp) <<" "<< pred_rec.sd(age1tmp)/pred_rec(age1tmp) <<endl;
  age1tmp = 2013; 
	if (endyr_r > age1tmp) report << age1tmp-1 << " " <<pred_rec(age1tmp) <<" "<< pred_rec.sd(age1tmp)/pred_rec(age1tmp) <<endl;
  age1tmp = 2014; 
	if (endyr_r > age1tmp) report << age1tmp-1 << " " <<pred_rec(age1tmp) <<" "<< pred_rec.sd(age1tmp)/pred_rec(age1tmp) <<endl;


  for_sd<<
	"Scen Catch	SSBNext	AdjNext	ABC1	OFL1	SSB2yrs	Adj2yrs	ABC2	OFL2"<<endl;
   for (i=1;i<=10;i++)
   {
      for_sd <<  i           << " ";
      for_sd <<  Cat_Fut(i)  << " ";
      for_sd <<  SSB_1(i)    << " ";
      for_sd <<  adj_1(i)    << " ";
      for_sd <<  gm_b(i)   * hm_f * adj_1(i) << " ";
      for_sd <<  gm_b(i)   * am_f * adj_1(i) << " ";
      for_sd <<  SSB_2(i)                    << " ";
      for_sd <<  adj_2(i)                    << " ";
      for_sd <<  gm_b2(i)  * hm_f * adj_2(i) << " ";
      for_sd <<  gm_b2(i)  * am_f * adj_2(i) << " "<<endl; 
   }
   misc_out<<endl<<"Stock in year "<<endyr_r<< " relative to Bzero (and SD):"<<endl;
   misc_out<< endyr_r<<" "<<Percent_Bzero <<" "<<Percent_Bzero.sd<<endl;
   misc_out<< endyr_r+1<<" "<<Percent_Bzero_1 <<" "<<Percent_Bzero_1.sd<<endl;
   misc_out<< endyr_r+2<<" "<<Percent_Bzero_2 <<" "<<Percent_Bzero_2.sd<<endl;
   misc_out<< endyr_r<<" "<<Percent_B100 <<" "<<Percent_B100.sd<<endl;
   misc_out<< endyr_r+1<<" "<<Percent_B100_1 <<" "<<Percent_B100_1.sd<<endl;
   misc_out<< endyr_r+2<<" "<<Percent_B100_2 <<" "<<Percent_B100_2.sd<<endl<<endl;
   misc_out<< " Plus and minus 5% from mode (normal approx) sensitivity"<<endl;
  // 0.12566 sigma
   double tweaklo;
   double tweakhi;
   tweaklo = (1.- 0.12566*value(cv_b(5)));
   tweakhi = (1.+ 0.12566*value(cv_b(5)));
   double adjlo=1.;
   double adjhi=1.;
   if(tweaklo*SSB_1(5) < value(Bmsy))
        adjlo = value((tweaklo*SSB_1(5)/Bmsy - 0.05)/(1.-0.05));
   if(tweakhi*SSB_1(5) < value(Bmsy))
        adjhi = value((tweakhi*SSB_1(5)/Bmsy - 0.05)/(1.-0.05));

   misc_out << "low:  "<< tweaklo*gm_b(5)   * hm_f * adjlo      << endl;
   misc_out << "mode: "<< gm_b(5)   * hm_f * adj_1(5)           << endl;
   misc_out << "high: "<< tweakhi*gm_b(5)   * hm_f * adjhi      << endl;

   misc_out << "No adjustment below Bmsy..."<<endl;
   misc_out << "low:  "<< tweaklo*gm_b(5)   * hm_f              << endl;
   misc_out << "mode: "<< gm_b(5)   * hm_f                      << endl;
   misc_out << "high: "<< tweakhi*gm_b(5)   * hm_f              << endl;
   misc_out << "Fut_Cat ABC_biom gm_b "<< endl;
   for (int icat=1;icat<=10;icat++)
     misc_out<<Cat_Fut(icat)<< " "<<ABC_biom(icat)<<" "<<gm_b(icat)<<endl;
  
  // Change sel_fut and recompute stuff
   misc_out <<" MSYR with younger selectivity (shifted down one age group)"<<endl;
   misc_out <<"Shift hm_f am_f "<<endl;
   misc_out << "0 " << hm_f<<" "<<am_f<<" "<<sel_fut<<endl;
   dvar_vector seltmp(1,nages);
   seltmp = sel_fut;

   for (j=1;j<nages;j++)
     sel_fut(j) = .5*(seltmp(j)+seltmp(j+1));
   sel_fut(nages) = sel_fut(nages-1);
   get_msy();
   hm_f = exp(lnFmsy2 - lnFmsy2.sd*lnFmsy2.sd /2.);
   am_f = exp(lnFmsy2 + lnFmsy2.sd*lnFmsy2.sd /2.);
   misc_out << "-0.5 " << hm_f<<" "<<am_f<<" "<<sel_fut<<endl;

   for (j=1;j<nages;j++)
     sel_fut(j) = seltmp(j+1);
   sel_fut(nages) = sel_fut(nages-1);
   get_msy();
   hm_f = exp(lnFmsy2 - lnFmsy2.sd*lnFmsy2.sd /2.);
   am_f = exp(lnFmsy2 + lnFmsy2.sd*lnFmsy2.sd /2.);
   misc_out << "-1 " << hm_f<<" "<<am_f<<" "<<sel_fut<<endl;

   for (j=1;j<nages;j++)
     sel_fut(j+1) = seltmp(j);
   sel_fut(1) = seltmp(1);
   get_msy();
   hm_f = exp(lnFmsy2 - lnFmsy2.sd*lnFmsy2.sd /2.);
   am_f = exp(lnFmsy2 + lnFmsy2.sd*lnFmsy2.sd /2.);
   misc_out << "1 " << hm_f<<" "<<am_f<<" "<<sel_fut<<endl;

   for (j=1;j<nages;j++)
     sel_fut(j+1) = .5*(seltmp(j)+seltmp(j+1));
   sel_fut(1) = seltmp(1);
   get_msy();
   hm_f = exp(lnFmsy2 - lnFmsy2.sd*lnFmsy2.sd /2.);
   am_f = exp(lnFmsy2 + lnFmsy2.sd*lnFmsy2.sd /2.);
   misc_out << "0.5 " << hm_f<<" "<<am_f<<" "<<sel_fut<<endl;
   misc_out.close();
   for_sd.close();

   ofstream F40_out("F40_t.rep");

   F40_out << "Year B/Bmsy HR/MSYR SER/SERmsy F/Fmsy Bmsy SSB Bmsy2 Bfshble AM_fmsyr ";
   F40_out << "C/Bfshble SPRMSY_F Implied_SPR SPRMSY meanF F35 Fmsy Age3+ A3PRatio_Bmsy2 ";
   F40_out << "B35 F_Fmsyr avgAgeMSY avgWtMSY"<<endl;
   double fshable;
   double AM_fmsyr;
   for (i=styr;i<=endyr_r;i++)
   {
     sel_fut = sel_fsh(i);
     age_3_plus_biom(i)  = natage(i)(3,nages) * wt_ssb(i)(3,nages); 
     fshable = value(elem_prod(natage(i),sel_fut) * wt_ssb(endyr_r)); // fishable biomass
     AM_fmsyr =  value(exp(lnFmsy2 + lnFmsy2.sd*lnFmsy2.sd /2.));
     get_msy();
     F40_out << i       // Year
         <<" "<< SSB(i)/Bmsy   // Fshable Bmsy
         <<" "<< (obs_catch(i)/fshable) /AM_fmsyr  // Realized harvest rate
         <<" "<< (SER(i)/SER_Fmsy)                 // SER harvest rate
         <<" "<< mean(F(i))/Fmsy
         <<" "<< Bmsy
         <<" "<< SSB(i)
         <<" "<< Bmsy2   // Fshable Bmsy
         <<" "<< fshable // fishable biomass
         <<" "<< AM_fmsyr// AM Msyr
         <<" "<< obs_catch(i)/fshable // Realized harvest rate
         <<" "<< get_spr_rates(value(SPR_OFL),sel_fsh(i)) // F at MSY
         <<" "<< Implied_SPR(F(i))    // Implied SPR Given F
         <<" "<< SPR_OFL 
         <<" "<< mean(F(i))
         <<" "<<get_spr_rates(.35,sel_fsh(i))
         <<" "<<Fmsy 
         <<" "<<age_3_plus_biom(i) 
         <<" "<<value(age_3_plus_biom(i))/value(Bmsy2)
         <<" "<<value(SB100)*.35
         <<" "<<(obs_catch(i)/value(age_3_plus_biom(i)))/value(Fmsy2)
         <<" "<<value(avg_age_msy)
         <<" "<<value(avgwt_msy)
         <<endl; 
    }
    F40_out.close();
   ofstream SelGrid("selgrid.rep");
   for (i=1;i<=5;i++)
   {
     sel_fut = 0.0;
     sel_fut(i+1,nages) = 1.;

     get_msy();

     SelGrid << i+1       // knife-selection
         <<" "<<value(MSY)
         <<" "<<value(Bmsy)
         <<" "<<value(avg_age_msy)
         <<" "<<value(avgwt_msy)
         <<" SPR "<<get_spr_rates(.4,sel_fut)
         <<" "<< value(Fmsy2)
         <<endl; 
   }
   for (i=styr;i<=endyr_r;i++)
   {
     sel_fut = sel_fsh(i);
     get_msy();
    SelGrid << i       // 
         <<" "<<value(MSY)
         <<" "<<value(Bmsy)
         <<" "<<value(avg_age_msy)
         <<" "<<value(avgwt_msy)
         <<" SPR "<<get_spr_rates(.4,sel_fut)
         <<" "<< value(Fmsy2)
         <<endl; 
   }
   compute_Fut_selectivity();
   get_msy();
    SelGrid << "sel_fut"        // knife-selection
         <<" "<<value(MSY)
         <<" "<<value(Bmsy)
         <<" "<<value(avg_age_msy)
         <<" "<<value(avgwt_msy)
         <<" SPR "<<get_spr_rates(.4,sel_fut)
         <<" "<< value(Fmsy2)
         <<endl; 
    SelGrid.close();
  }
FUNCTION dvariable Implied_SPR( const dvar_vector& F_age) 
  RETURN_ARRAYS_INCREMENT();
  // Function that returns SPR percentage given a realized value of F...
    dvar_vector ntmp0(1,nages);
    dvar_vector ntmp1(1,nages);
    ntmp0(1) = 1.;
    ntmp1(1) = 1.;
    for (j=2;j<nages;j++)
    {
      ntmp0(j)  = ntmp0(j-1)* mfexp( -natmort(j-1));
      ntmp1(j)  = ntmp1(j-1)* mfexp(-(natmort(j-1) + F_age(j-1) ));
    }
    ntmp0(nages)  =  ntmp0(nages-1)* mfexp(-natmort(nages-1))/ (1.- mfexp(-natmort(nages-1)));
    ntmp1(nages)  =  ntmp1(nages-1)* mfexp(-(natmort(nages-1) + F_age(nages-1)))/ (1.- mfexp(-(natmort(nages) + F_age(nages) )));
    dvariable sb0_tmp;
    dvariable sb1_tmp;

    sb0_tmp.initialize();
    sb1_tmp.initialize();
    for (j=1;j<=nages;j++)
    {
      // natmort till spawning 
      sb0_tmp += ntmp0(j)*wt_ssb(endyr_r,j) * mfexp(-yrfrac * natmort(j));
      sb1_tmp += ntmp1(j)*wt_ssb(endyr_r,j) * mfexp(-yrfrac * ( natmort(j) + F_age(j) ));
    }
  RETURN_ARRAYS_DECREMENT();
    return(sb1_tmp / sb0_tmp);

FUNCTION Get_Replacement_Yield
  double df=1.e-6;
  dvariable F1=-0.3;
  dvariable F2;
  dvariable F3;
  dvariable ssb1;
  dvariable ssb2;
  dvariable ssb3;
  dvariable dssb;
  dvariable dssbp;
  // compute ndvariable dyldp;
  // Newton Raphson stuff to go here //cout <<endl<<endl<<"Iter  F  Stock  1Deriv  Yld  2Deriv"<<endl; //for (int ii=1;ii<=500;ii++)
  for (int ii=1;ii<=8;ii++)
  {
      F2     = F1 + df*.5;
      F3     = F2 - df; 
      ssb1   = get_repl_b(F1); 
      ssb2   = get_repl_b(F2);
      ssb3   = get_repl_b(F3);
			cout<<ii<<" "<<F1<<" "<<ssb1<<" "<<ssb3<<endl;
      dssb   = (ssb2 - ssb3)/df;                          // First derivative (to find the root of this)
      dssbp  = (ssb2 + ssb3 - 2.*ssb1)/(.25*df*df);   // Second derivative (for Newton Raphson)
      F1    -= dssb/dssbp;
  }
	repl_F = F1;
	repl_SSB= ssb3;

FUNCTION dvariable get_repl_b(const dvariable& Ftry)
 // Next year's yield and SSB and add penalty to ensure F gives same SSB... 
  dvar_vector ntmp(1,nages);
  ntmp(2,nages) = ++elem_prod(S(endyr_r)(1,nages-1),natage(endyr_r)(1,nages-1));
  ntmp(nages)   += natage(endyr_r,nages)*S(endyr_r,nages);
  ntmp(1)       = mean(pred_rec);
  dvariable ssb_tmp;
  dvar_vector Ftmp(1,nages);
  dvar_vector Ctmp(1,nages);
  dvar_vector Ztmp(1,nages);
  dvar_vector Stmp(1,nages);
  Ctmp.initialize();
  Ftmp          = Ftry*sel_fut ;
  Ztmp          = natmort + Ftmp;
  Stmp          = mfexp(-Ztmp);
  Ctmp          = elem_prod(ntmp, elem_prod( elem_div(Ftmp,Ztmp), (1.-Stmp) ) );
  repl_yld      = wt_fut*Ctmp ;
  ntmp(2,nages) = ++elem_prod(Stmp(1,nages-1),ntmp(1,nages-1));
  ntmp(nages)   += ntmp(nages)*Stmp(nages);
  ntmp(1)       = mean(pred_rec);
  ssb_tmp       = elem_prod(p_mature,elem_prod(ntmp, pow(Stmp,yrfrac))) * wt_ssb(endyr_r); 
	return(ssb_tmp);
  // cout<<Ftmp<<endl; cout<<Ztmp<<endl; cout<<Stmp<<endl; cout<<Ctmp<<endl; cout<<repl_yld<<endl; cout<<ntmp<<endl; cout<<repl_SSB<<endl; cout<<SSB(endyr_r)<<endl; cout<< 500.*square(log(SSB(endyr_r))-log(repl_SSB))<<endl; exit(1);
  // SSB(styr)  = elem_prod(elem_prod(natage(styr),pow(S(styr),yrfrac)),p_mature)*wt_ssb(styr); // Eq. 1

  // fff           += 50.*square(log(SSB(endyr_r))-log(repl_SSB));

FUNCTION Est_Fixed_Effects_wts
  double sigma_coh = (mfexp(log_sd_coh));
  double sigma_yr = (mfexp(log_sd_yr ));
  K            = mfexp(log_K);
  alphawt      = mfexp(log_alpha);
  wt_like      = 0.;
  for (int j=age_st;j<=age_end;j++)
  {
    mnwt(j)    = alphawt * pow(L1 + (L2-L1)*(1.-pow(K,double(j-age_st))) / (1.-pow(K,double(nages-1))) ,3);
  }
  wt_inc       = --mnwt(age_st+1,age_end) - mnwt(age_st,age_end-1);

  // Initialize first year
  wt_pre(styr_wt)    = mnwt;

   // subsequent years
  for (int i=styr_wt+1;i<=endyr_wt;i++)
  {
    wt_pre(i,age_st) = mnwt(age_st)*mfexp(square(sigma_coh)/2.+sigma_coh*coh_eff(i));
    if (last_phase())
      wt_pre(i)(age_st+1,age_end) = ++(wt_pre(i-1)(age_st,age_end-1) + wt_inc*mfexp(square(sigma_yr)/2. + sigma_yr*yr_eff(i)));
    else
      wt_pre(i)(age_st+1,age_end) = ++(wt_pre(i-1)(age_st,age_end-1) + wt_inc*mfexp(                      sigma_yr*yr_eff(i)));
  }
  int iyr;
  // Fit global mean to all years...
  for (int h = 1;h<=ndat_wt;h++)
  {
    for (int i=1;i<=nyrs_data(h);i++)
    {
      iyr = yrs_data(h,i);
			// COUT(i);COUT(iyr);
      if (h>int(1) )
        wt_hat(h,i) = elem_prod(d_scale(h-1) , wt_pre(iyr) );
      else
        wt_hat(h,i) = wt_pre(iyr);

      for (int j=age_st;j<=age_end;j++)
      {
        wt_like += square(wt_obs(h,i,j) - mnwt(j))      /(2.*square(sd_obs(h,i,j)));
        wt_like += square(wt_obs(h,i,j) - wt_hat(h,i,j))/(2.*square(sd_obs(h,i,j)));
      }
    }
  }
  wt_like += 0.5*norm2(coh_eff);
  wt_like += 0.5*norm2( yr_eff);
  fff += wt_like;
  wt_last = wt_pre(endyr_r-1); //*exp(sigma_coh*sigma_coh/2. + sigma_yr*sigma_yr/2.);;
  wt_cur  = wt_pre(endyr_r  ); //*exp(sigma_coh*sigma_coh/2. + sigma_yr*sigma_yr/2.);;
  wt_next = wt_pre(endyr_r+1); //*exp(sigma_coh*sigma_coh/2. + sigma_yr*sigma_yr/2.);;
  wt_yraf = wt_pre(endyr_r+2); //*exp(sigma_coh*sigma_coh/2. + sigma_yr*sigma_yr/2.);;
  
  // Condition on using this based on wt flag
  if (wt_fut_phase>0)
  {
    // Use cohort and year effects fits for current year catch
    pred_catch(endyr_r) = catage(endyr_r)(3,nages) * wt_cur;

    // Set future catch equal to estimate from model
    // Only model wts-at-age from 3+ so this is the 1's and 2's
    pred_catch(endyr_r) = catage(endyr_r)(1,2) * wt_fsh(endyr_r)(1,2);
    // wt_fut = wt_fsh(endyr_r); // initializes estimates to correct values...Eq. 21
    wt_fut(3,nages) = wt_next; // initializes estimates to correct values...Eq. 21
  }
FUNCTION double sdnr(const dvector& obs, const dvar_vector& pred, const dvector& sig)
  RETURN_ARRAYS_INCREMENT();
  double sdnr;
  sdnr = std_dev(elem_div((obs-value(pred)),sig));
  RETURN_ARRAYS_DECREMENT();
  return sdnr;

 /* ******************************************************
 FUNCTION dvariable Check_Parm(const double& Pmin, const double& Pmax, const double& jitter, const prevariable& Pval)
  {
    dvariable NewVal;
    dvariable temp;
    NewVal=Pval;
    if(Pval<Pmin)
    {N_warn++; warning<<" parameter init value is less than parameter min "<<Pval<<" < "<<Pmin<<endl; NewVal=Pmin;}
    if(Pval>Pmax)
    {N_warn++; warning<<" parameter init value is greater than parameter max "<<Pval<<" > "<<Pmax<<endl; NewVal=Pmax;}
    if(jitter>0.0)
    {
      temp=log((Pmax-Pmin+0.0000002)/(NewVal-Pmin+0.0000001)-1.)/(-2.);   // transform the parameter
      temp += randn(radm) * jitter;
      NewVal=Pmin+(Pmax-Pmin)/(1.+mfexp(-2.*temp));
    }
    return NewVal;
  }
  */

  /**
   * @brief Calculate sdnr and MAR
  **/
  /**
  FUNCTION void get_all_sdnr_MAR()
  {
    for ( int k = 1; k <= nSurveys; k++ )
    {
      dvector stdtmp = cpue_sd(k) * 1.0 / cpue_lambda(k);
      dvar_vector restmp = elem_div(log(elem_div(obs_cpue(k), pre_cpue(k))), stdtmp) + 0.5 * stdtmp;
      sdnr_MAR_cpue(k) = calc_sdnr_MAR(value(restmp));
    }
    for ( int k = 1; k <= nSizeComps; k++ )
    {
      //dvector sdtmp = cpue_sd(k) * 1.0 / cpue_lambda(i);
      sdnr_MAR_lf(k) = calc_sdnr_MAR(value(d3_res_size_comps(k)));
    }
    Francis_weights = calc_Francis_weights();
  }


  FUNCTION dvector calc_sdnr_MAR(dvector tmpVec)
  {
    dvector out(1,2);
    dvector tmp = fabs(tmpVec);
    dvector w = sort(tmp);
    out(1) = std_dev(tmpVec);                 // sdnr
    out(2) = w(floor(0.5*(size_count(w)+1))); // MAR
    return out;
  }


  FUNCTION dvector calc_sdnr_MAR(dmatrix tmpMat)
  {
    dvector tmpVec(1,size_count(tmpMat));
    dvector out(1,2);
    int dmin,dmax;
    dmin = 1;
    for ( int ii = tmpMat.indexmin(); ii <= tmpMat.indexmax(); ii++ )
    {
      dmax = dmin + size_count(tmpMat(ii)) - 1;
      tmpVec(dmin,dmax) = tmpMat(ii).shift(dmin);
      dmin = dmax + 1;
    }
    dvector tmp = fabs(tmpVec);
    dvector w = sort(tmp);
    out(1) = std_dev(tmpVec);                 // sdnr
    out(2) = w(floor(0.5*(size_count(w)+1))); // MAR
    return out;
  }
  **/


  /**
   * @brief Calculate Francis weights
   * @details this code based on equation TA1.8 in Francis(2011) should be changed so separate weights if by sex
   *
   * Produces the new weight that should be used.
  **/
FUNCTION double calc_Francis_weights(const dmatrix oac, const dvar_matrix eac, const ivector sam )
  {
    int nobs;
    int i1=oac.rowmin();
    int i2=oac.rowmax();
    double lfwt,Var,Pre,Obs;
    dvector ages(oac.colmin(),nages);
    for (int i=oac.colmin();i<=nages;i++) 
      ages(i) = double(i)+.5;
    nobs = oac.rowsize();
    dvector resid(i1,i2);
    resid.initialize();
    for ( int i = i1; i <= i2; i++ )
    {
      // Obs = sum(elem_prod(oac(i), ages+.5));
      Obs = oac(i) * (ages+.5);
      // Pre = sum(elem_prod(value(eac(i)), ages+.5));
      Pre = value(eac(i)) * (ages+.5);
      Var = value(eac(i)) * square(ages+.5);
      Var -= square(Pre);
      resid(i) = (Obs - Pre) / sqrt(Var * 1.0 / (sam(i) ));
      // cout<<Obs<<" "<<Pre<<" "<<Var<<" "<<resid(i)<<endl;
    }
    lfwt = 1.0 / (square(std_dev(resid)) * ((nobs - 1.0) / nobs * 1.0));
    // lfwt(k) *= lf_lambda(k);
    return lfwt;
  }

FINAL_SECTION
  write_R();
TOP_OF_MAIN_SECTION
  gradient_structure::set_MAX_NVAR_OFFSET(2600);
  gradient_structure::set_GRADSTACK_BUFFER_SIZE(200000);
  gradient_structure::set_NUM_DEPENDENT_VARIABLES(9100); 
  gradient_structure::set_CMPDIF_BUFFER_SIZE(3000000);
  arrmblsize=10000000;
GLOBALS_SECTION
  #include <float.h>
  #include <admodel.h>

  #undef COUT
  #define COUT(object) cout << #object "," << object << endl;

  ofstream misc_out("misc_out.rep");
  #undef misc_out
  #define misc_out(object) misc_out << #object "\n" << object << endl;

  ofstream for_sd("extra_sd.rep");
  #undef for_sd
  #define for_sd(object) for_sd << #object "\n" << object << endl;

  ofstream write_mceval("mceval.rep");
  #undef write_mceval
  #define write_mceval(object) write_mceval << " " << object ;

  ofstream write_log("Input_Log.rep");
  #undef write_log
  #define write_log(object) write_log << #object "\n" << object << endl;

  ofstream retro_out("retro.rep",ios::app);
  #undef write_retro
  #define write_retro(object) retro_out << #object " " <<model_name<<" "<<datfile_name<<" "<< object << endl;

  ofstream legacy_rep("old_rep.rep");
  #undef legacy_rep
  #define legacy_rep(object) legacy_rep << #object "\n" << object << endl;

  #undef R_report
  #define R_report(object) report << #object "\n" << object << endl;

  adstring simname;
  adstring model_name;
  adstring datafile_name;
  adstring control_filename;
  adstring selchng_filename; 
  adstring Alt_MSY_File;
  adstring Cov_Filename;
  adstring Wtage_file;
  adstring RawSurveyCPUE_file; 
  adstring endyrn_file;
