#ifdef DEBUG
  #ifndef __SUNPRO_C
    #include <cfenv>
    #include <cstdlib>
  #endif
#endif
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
  ofstream write_mcFmort("mcFmort.rep");
  #undef write_mcFmort
  #define write_mcFmort(object) write_mcFmort << " " << object ;
  ofstream write_mcSRR("mcSRR.rep");
  #undef write_mcSRR
  #define write_mcSRR(object) write_mcSRR << " " << object ;
  ofstream write_mceval("mceval.rep");
  #undef write_mceval
  #define write_mceval(object) write_mceval << " " << object ;
  ofstream mceval_ac_ppl("mceval_ac_ppl.csv");
  #undef write_mceval_ac_ppl
  #define write_mceval_ac_ppl(object) mceval_ac_ppl << "," << object ;
  ofstream mceval_ppl("mceval_ppl.csv");
  #undef write_mceval_ppl
  #define write_mceval_ppl(object) mceval_ppl << "," << object ;
  ofstream write_mceval_eb_bts("mceval_eb_bts.rep");
  #undef write_mceval_eb_bts
  #define write_mceval_eb_bts(object) write_mceval_eb_bts << " " << object ;
  ofstream write_mceval_eb_ats("mceval_eb_ats.rep");
  #undef write_mceval_eb_ats
  #define write_mceval_eb_ats(object) write_mceval_eb_ats << " " << object ;
  ofstream write_mceval_ea1_ats("mceval_ea1_ats.rep");
  #undef write_mceval_ea1_ats
  #define write_mceval_ea1_ats(object) write_mceval_ea1_ats << " " << object ;
  ofstream write_mceval_pred_catch("mceval_pred_catch.rep");
  #undef write_mceval_pred_catch
  #define write_mceval_pred_catch(object) write_mceval_pred_catch << " " << object ;
  ofstream write_mceval_eac_fsh("mceval_eac_fsh.rep");
  #undef write_mceval_eac_fsh
  #define write_mceval_eac_fsh(object) write_mceval_eac_fsh << " " << object ;
  ofstream write_mceval_eac_bts("mceval_eac_bts.rep");
  #undef write_mceval_eac_bts
  #define write_mceval_eac_bts(object) write_mceval_eac_bts << " " << object ;
  ofstream write_mceval_eac_ats("mceval_eac_ats.rep");
  #undef write_mceval_eac_ats
  #define write_mceval_eac_ats(object) write_mceval_eac_ats << " " << object ;
  ofstream write_mceval_pred_cpue("mceval_pred_cpue.rep");
  #undef write_mceval_pred_cpue
  #define write_mceval_pred_cpue(object) write_mceval_pred_cpue << " " << object ;
  ofstream write_mceval_pred_avo("mceval_pred_avo.rep");
  #undef write_mceval_pred_avo
  #define write_mceval_pred_avo(object) write_mceval_pred_avo << " " << object ;
  ofstream write_mceval_mnwt("mceval_mnwt.rep");
  #undef write_mceval_mnwt
  #define write_mceval_mnwt(object) write_mceval_mnwt << " " << object ;
  ofstream write_mceval_fsh_wt("mceval_fsh_wt.rep");
  #undef write_mceval_fsh_wt
  #define write_mceval_fsh_wt(object) write_mceval_fsh_wt << " " << object ;
  ofstream write_mceval_srv_wt("mceval_srv_wt.rep");
  #undef write_mceval_srv_wt
  #define write_mceval_srv_wt(object) write_mceval_srv_wt << " " << object ;
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
  // adstring control_temp_pred_filename;
  adstring Temp_Cons_Dist_file; 
  adstring endyrn_file;
#ifdef DEBUG
  #include <chrono>
#endif
#include <admodel.h>
#ifdef USE_ADMB_CONTRIBS
#include <contrib.h>

#include <gdbprintlib.cpp>
#endif
  extern "C"  {
    void ad_boundf(int i);
  }
#include <pm.htp>

model_data::model_data(int argc,char * argv[]) : ad_comm(argc,argv)
{
  adstring tmpstring;
  tmpstring=adprogram_name + adstring(".dat");
  if (argc > 1)
  {
    int on=0;
    if ( (on=option_match(argc,argv,"-ind"))>-1)
    {
      if (on>argc-2 || argv[on+1][0] == '-')
      {
        cerr << "Invalid input data command line option"
                " -- ignored" << endl;
      }
      else
      {
        tmpstring = adstring(argv[on+1]);
      }
    }
  }
  global_datafile = new cifstream(tmpstring);
  if (!global_datafile)
  {
    cerr << "Error: Unable to allocate global_datafile in model_data constructor.";
    ad_exit(1);
  }
  if (!(*global_datafile))
  {
    delete global_datafile;
    global_datafile=NULL;
  }
  *(ad_comm::global_datafile) >>  model_name; 
  *(ad_comm::global_datafile) >>  datafile_name; 
  *(ad_comm::global_datafile) >>  selchng_filename; 
  *(ad_comm::global_datafile) >>  control_filename; 
  *(ad_comm::global_datafile) >> Alt_MSY_File;
  *(ad_comm::global_datafile) >> Cov_Filename;
  *(ad_comm::global_datafile) >> Wtage_file;
  *(ad_comm::global_datafile) >> RawSurveyCPUE_file;
  *(ad_comm::global_datafile) >> Temp_Cons_Dist_file;
 write_log(model_name);
 write_log(datafile_name);
 write_log(selchng_filename);
 write_log(control_filename);
 write_log(Alt_MSY_File);
 write_log(Cov_Filename);
 write_log(Wtage_file);
 write_log(RawSurveyCPUE_file);
 write_log(Temp_Cons_Dist_file);
 count_mcmc=0;
 count_mcsave=0;
 q_amin = 3; q_amax= 15; // age range overwhich q applies (for prior specifications)
  selages.allocate(1,15);
 selages=1.0;selages(1)=0;selages(2)=0;
  avo_sel.allocate(1,15);
 avo_sel(1)=0.0;  avo_sel(2)=1;  avo_sel(3)=1;  avo_sel(4)=0.85;  avo_sel(5)=0.7;  avo_sel(6)=0.55;  avo_sel(7)=0.3;  avo_sel(8)=0.15;  avo_sel(9)=0.05;  avo_sel(10)=0.01;  avo_sel(11)=0.01;  avo_sel(12)=0.01;  avo_sel(13)=0.01;  avo_sel(14)=0.01;  avo_sel(15)=0.01;
  Cat_Fut.allocate(1,10);
 do_EIT1=1; // flag to carry EIT out in future year (for simulations only)
 pflag=0;
  pad_srecout = new ofstream("srec_Ass_out.rep");
  pad_projout = new ofstream("pm.prj");
  pad_nofish = new ofstream("nofish.rep");
  pad_projout2 = new ofstream("pmsr.prj");
  pad_eval = new ofstream("pm_eval.rep")     ;
 ad_comm::change_datafile_name(control_filename); cout<<"Opening "<<control_filename<<endl;
  DoCovBTS.allocate("DoCovBTS");
  SrType.allocate("SrType");
  Do_Combined.allocate("Do_Combined");
  use_age_err.allocate("use_age_err");
  use_age1_ats.allocate("use_age1_ats");
  age1_sigma_ats.allocate("age1_sigma_ats");
  mina_bts=2;
  if (use_age1_ats ) mina_ats =2; else mina_ats =1;
  write_log(DoCovBTS);
  write_log(SrType);
  write_log(Do_Combined);
  write_log(use_age_err);
  write_log(use_age1_ats );
  write_log(age1_sigma_ats );
  write_log(mina_ats );
  cout<<" Minimum age for EIT is: "<<mina_ats <<endl;// exit(1);
  use_endyr_len.allocate("use_endyr_len");
  use_popwts_ssb.allocate("use_popwts_ssb");
  natmortprior.allocate("natmortprior");
  cvnatmortprior.allocate("cvnatmortprior");
  natmort_in.allocate(1,15,"natmort_in");
  q_all_prior.allocate("q_all_prior");
  q_all_sigma.allocate("q_all_sigma");
  q_bts_prior.allocate("q_bts_prior");
  q_bts_sigma.allocate("q_bts_sigma");
  sigrprior.allocate("sigrprior");
  cvsigrprior.allocate("cvsigrprior");
  phase_sigr.allocate("phase_sigr");
  steepnessprior.allocate("steepnessprior");
  cvsteepnessprior.allocate("cvsteepnessprior");
  phase_steepness.allocate("phase_steepness");
  use_spr_msy_pen.allocate("use_spr_msy_pen");
  sigma_spr_msy.allocate("sigma_spr_msy");
  dec_tab_catch.allocate(1,8);
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
  use_last_ats_ac.allocate("use_last_ats_ac");
  nyrs_sel_avg.allocate("nyrs_sel_avg");
  do_bts_bio.allocate("do_bts_bio");
  do_ats_bio.allocate("do_ats_bio");
  srprior_a.allocate("srprior_a");
  srprior_b.allocate("srprior_b");
  nyrs_future.allocate("nyrs_future");
  next_yrs_catch.allocate("next_yrs_catch");
  nscen.allocate("nscen");
  fixed_catch_fut2.allocate("fixed_catch_fut2");
  fixed_catch_fut3.allocate("fixed_catch_fut3");
  phase_F40.allocate("phase_F40");
  robust_phase.allocate("robust_phase");
  ats_robust_phase.allocate("ats_robust_phase");
  ats_like_type.allocate("ats_like_type");
  phase_logist_fsh.allocate("phase_logist_fsh");
  phase_logist_bts.allocate("phase_logist_bts");
   write_log(nyrs_future);
   write_log(next_yrs_catch);
   write_log(nscen);
   write_log(fixed_catch_fut2);
   write_log(fixed_catch_fut3);
   write_log(nyrs_sel_avg);
   write_log(phase_F40);
   write_log(robust_phase);
   write_log(ats_robust_phase); 
   write_log(ats_like_type)   ;
   write_log(phase_logist_fsh);
   write_log(phase_logist_bts);
 phase_selcoffs_bts   = 2;
 phase_selcoffs_fsh   = 2;
  phase_seldevs_fsh.allocate("phase_seldevs_fsh");
  phase_seldevs_bts.allocate("phase_seldevs_bts");
  phase_age1devs_bts.allocate("phase_age1devs_bts");
 write_log(phase_seldevs_bts);
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
  phase_selcoffs_ats.allocate("phase_selcoffs_ats");
  phase_selcoffs_ats_dev.allocate("phase_selcoffs_ats_dev");
 cout <<"Phase fsh coef: "<<phase_selcoffs_fsh<<" "<<phase_selcoffs_fsh_dev<<endl;
 cout <<"Phase bts coef: "<<phase_selcoffs_bts<<" "<<phase_selcoffs_bts_dev<<endl;
 cout <<"Phase ats coef: "<<phase_selcoffs_ats<<" "<<phase_selcoffs_ats_dev<<endl;
 cout <<"Phase fsh logist: "<<phase_logist_fsh<<" "<<phase_logist_fsh_dev<<endl;
 cout <<"Phase bts logist: "<<phase_logist_bts<<" "<<phase_logist_bts_dev<<endl;
  phase_natmort.allocate("phase_natmort");
  phase_q_bts.allocate("phase_q_bts");
  phase_q_std_area.allocate("phase_q_std_area");
  phase_q_ats.allocate("phase_q_ats");
 if (DoCovBTS) phase_q_bts = -1;
  phase_bt.allocate("phase_bt");
  phase_rec_devs.allocate("phase_rec_devs");
  phase_larv.allocate("phase_larv");
  phase_sr.allocate("phase_sr");
  wt_fut_phase.allocate("wt_fut_phase");
  last_age_sel_group_fsh.allocate("last_age_sel_group_fsh");
  last_age_sel_group_bts.allocate("last_age_sel_group_bts");
  last_age_sel_group_ats.allocate("last_age_sel_group_ats");
  ctrl_flag.allocate(1,30,"ctrl_flag");
 cout<<ctrl_flag<<endl;
  sel_dev_shift.allocate("sel_dev_shift");
  phase_coheff.allocate("phase_coheff");
  phase_yreff.allocate("phase_yreff");
 write_log(phase_natmort);
 write_log(phase_q_bts);
 write_log(phase_q_std_area);
 write_log(phase_q_ats);
 write_log(phase_bt);
 write_log(phase_rec_devs);
 write_log(phase_larv);
 write_log(phase_sr);
 write_log(wt_fut_phase);
 write_log(last_age_sel_group_fsh);
 write_log(last_age_sel_group_bts);
 write_log(last_age_sel_group_ats);
 write_log(ctrl_flag);
 write_log(sel_dev_shift);
  do_temp.allocate("do_temp");
  temp_phase.allocate("temp_phase");
  do_pred.allocate("do_pred");
  pred_phase.allocate("pred_phase");
  do_mult_func_resp.allocate("do_mult_func_resp");
  do_yield_curve.allocate("do_yield_curve");
   write_log(do_temp);
   write_log(temp_phase);           // phase for parameters in recruitment function
   write_log(do_pred);              // switch to do the predation mortality (1=yes)
   write_log(pred_phase);           // phase for parameters for estimating spatial predation
   write_log(do_mult_func_resp);    // switch to do teh mutlispecies functional response
   write_log(do_yield_curve);       // switch to do yield curve
 ad_comm::change_datafile_name(datafile_name); cout<<"Opening "<<datafile_name<<endl;
  styr.allocate("styr");
  styr_bts.allocate("styr_bts");
  styr_ats.allocate("styr_ats");
  endyr.allocate("endyr");
 cout <<datafile_name<<" "<<styr<<" "<<endyr<<endl;;
  recage.allocate("recage");
  nages.allocate("nages");
 write_log(nages);write_log(recage);write_log(endyr);
  p_mature.allocate(1,nages,"p_mature");
p_mature *= 0.5;
  ewindex.allocate(styr,endyr,"ewindex");
  nsindex.allocate(styr,endyr,"nsindex");
  wt_fsh.allocate(styr,endyr,1,nages,"wt_fsh");
  wt_ssb.allocate(styr,endyr,1,nages,"wt_ssb");
 if(use_popwts_ssb==0)  wt_ssb = wt_fsh; // this is the historical default (and continued use) Eq. 9
  wt_tmp.allocate(1,nages,1991,endyr-1);
  wt_mn.allocate(1,nages);
  wt_sigma.allocate(1,nages);
  obs_catch.allocate(styr,endyr,"obs_catch");
 write_log(p_mature);write_log(obs_catch);write_log(wt_fsh);
  obs_effort.allocate(styr,endyr,"obs_effort");
  n_cpue.allocate("n_cpue");
  yrs_cpue.allocate(1,n_cpue,"yrs_cpue");
  obs_cpue.allocate(1,n_cpue,"obs_cpue");
  obs_cpue_std.allocate(1,n_cpue,"obs_cpue_std");
  obs_cpue_var.allocate(1,n_cpue);
 obs_cpue_var = square(obs_cpue_std);
  n_avo.allocate("n_avo");
  yrs_avo.allocate(1,n_avo,"yrs_avo");
  obs_avo.allocate(1,n_avo,"obs_avo");
  obs_avo_std.allocate(1,n_avo,"obs_avo_std");
  wt_avo.allocate(1,n_avo,1,nages,"wt_avo");
  obs_avo_var.allocate(1,n_avo);
 obs_avo_var = square(obs_avo_std); 
 write_log(obs_effort);write_log(n_cpue);write_log(obs_cpue);
 write_log(obs_cpue_std);write_log(n_avo);
 write_log(yrs_avo);write_log(obs_avo);write_log(wt_avo);
  ngears.allocate("ngears");
  minind.allocate(1,ngears,"minind");
  n_fsh.allocate("n_fsh");
  n_bts.allocate("n_bts");
  n_ats.allocate("n_ats");
  nagecomp.allocate(1,ngears);
  yrs_fsh_data.allocate(1,n_fsh,"yrs_fsh_data");
  yrs_bts_data.allocate(1,n_bts,"yrs_bts_data");
  yrs_ats_data.allocate(1,n_ats,"yrs_ats_data");
 write_log(ngears);write_log(minind);  write_log(n_bts); write_log(yrs_fsh_data);write_log(yrs_bts_data);write_log(yrs_ats_data);
  sam_fsh.allocate(1,n_fsh,"sam_fsh");
  sam_bts.allocate(1,n_bts,"sam_bts");
  sam_ats.allocate(1,n_ats,"sam_ats");
  oac_fsh_data.allocate(1,n_fsh,1,nages,"oac_fsh_data");
 cout<< " Index min and max for age comp data: "<<endl <<oac_fsh_data.indexmin()<<" Max "<<oac_fsh_data.indexmax()<<endl;
  obs_bts_data.allocate(1,n_bts,"obs_bts_data");
  std_ob_bts_data.allocate(1,n_bts,"std_ob_bts_data");
  wt_bts.allocate(1,n_bts,1,nages,"wt_bts");
  std_ot_bts.allocate(1,n_bts,"std_ot_bts");
 write_log(sam_fsh);write_log(sam_bts);write_log(sam_ats);
 write_log(oac_fsh_data);write_log(yrs_bts_data);write_log(yrs_ats_data);
 write_log(obs_bts_data);
 write_log(std_ob_bts_data);
 write_log(wt_bts);
 write_log(std_ot_bts);
  var_ob_bts.allocate(1,n_bts);
 var_ob_bts = elem_prod(std_ob_bts_data,std_ob_bts_data);
  var_ot_bts.allocate(1,n_bts);
 var_ot_bts = elem_prod(std_ot_bts,std_ot_bts);
  oac_bts_data.allocate(1,n_bts,1,nages,"oac_bts_data");
  std_ot_ats.allocate(1,n_ats,"std_ot_ats");
 write_log(oac_bts_data); write_log(std_ot_ats);
  var_ot_ats.allocate(1,n_ats);
 var_ot_ats = elem_prod(std_ot_ats,std_ot_ats);
  oac_ats_data.allocate(1,n_ats,1,nages,"oac_ats_data");
  ln_oac_ats.allocate(1,n_ats,mina_ats,nages);
 for (i=1;i<=n_ats;i++) ln_oac_ats(i) = log(oac_ats_data(i)(mina_ats,nages));
 write_log(oac_ats_data); write_log(std_ot_ats);
  obs_ats_data.allocate(1,n_ats,"obs_ats_data");
  std_ob_ats_data.allocate(1,n_ats,"std_ob_ats_data");
 write_log(obs_ats_data); write_log(std_ob_ats_data);
  var_ob_ats.allocate(1,n_ats);
  wt_ats.allocate(1,n_ats,1,nages,"wt_ats");
  bottom_temp.allocate(1,n_bts,"bottom_temp");
 cout<<"BottomTemp:"<<endl<<bottom_temp<<endl;
 write_log(wt_ats); write_log(bottom_temp);
  age_err.allocate(1,nages,1,nages,"age_err");
 write_log(age_err); 
  nlbins.allocate("nlbins");
  olc_fsh.allocate(1,nlbins,"olc_fsh");
  lens.allocate(1,nlbins);
   write_log(nlbins); 
   write_log(olc_fsh);
   olc_fsh /= sum(olc_fsh);
   for (j=0;j<nlbins;j++)
      lens(j+1) = double(j)+20;
   write_log(lens);
  age_len.allocate(1,nages,1,nlbins);
  age_lenold.allocate(1,nages,1,25,"age_lenold");
  test.allocate("test");
 write_log(test);
 if(test!=1234567){ cout<<"Failed on data read "<<test<<endl;exit(1);}
 spawnmo = 4.;
 yrfrac= (spawnmo-1.)/12; 
  age_vector.allocate(1,nages);
 for (j=1;j<=nages;j++) age_vector(j) = double(j)+.5;
 ad_comm::change_datafile_name(Alt_MSY_File);cout<<"Opening "<<Alt_MSY_File<<endl;
  Fmoney.allocate(1,nages,"Fmoney");
 ad_comm::change_datafile_name(selchng_filename);cout<<"Opening "<<selchng_filename<<endl;
  sel_data.allocate(styr,endyr,0,3,"sel_data");
  fsh_ch_in.allocate(styr,endyr);
  ats_ch_in.allocate(styr,endyr);
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
  n_ats_r=0;
  n_avo_r=0;
  endyr_r = endyr - int(ctrl_flag(28));
  endyr_est = endyr_r - int(ctrl_flag(29)); // lop off last couple of years 
  cout <<"Last yr of estimation..."<<endyr_est<<endl;
  dec_tab_catch(1) = obs_catch(endyr_r);
  dec_tab_catch(2) = 850;
  dec_tab_catch(3) = 1000;
  dec_tab_catch(4) = 1150;
  dec_tab_catch(5) = 1300;
  dec_tab_catch(6) = 1450;
  dec_tab_catch(7) = 1600;
  dec_tab_catch(8) =   10; // bycatch in other fisheries
  // Used to count parameters changes in EIT survey selectivities
  ats_ch_in = column(sel_data,3);
  fsh_ch_in = column(sel_data,1);
  ii = 0; for(i=styr;i<=endyr_r;i++) if(ats_ch_in(i)>0) {ii++;} nch_ats=ii; 
  ii = 0; for(i=styr;i<=endyr_r;i++) if(fsh_ch_in(i)>0) {ii++;} nch_fsh=ii; 
  if (ctrl_flag(28)==0.)
  {
    n_fsh_r=n_fsh;
    n_bts_r=n_bts;
    n_ats_r=n_ats; 
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
    if (endyr_r <= styr_ats) {
      cout <<" Not enough years for EIT survey"<<endl; exit(1);
    }
    n_ats_r = 0;
    for (i=styr_ats;i<endyr_r;i++)
    {
      if (i == yrs_ats_data(n_ats_r+1)) 
        n_ats_r++;
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
  cout <<"End year, n's "<<endyr_r<<" "<<n_fsh_r<<" "<<n_bts_r<<" "<<n_ats_r<<" "<<endl;
  write_log(endyr_r);
  write_log(endyr_est);
  write_log(n_fsh_r);
  write_log(n_bts_r);
  write_log(n_ats_r);
  write_log(n_avo_r);
  n_selages_fsh = nages-last_age_sel_group_fsh+1;
  n_selages_bts = nages-last_age_sel_group_bts+1;
  n_selages_ats = nages-last_age_sel_group_ats+1;
  write_log(n_selages_fsh);
  write_log(n_selages_bts);
  write_log(n_selages_ats);
  group_num_fsh = int(ctrl_flag(16));
  group_num_bts = int(ctrl_flag(17));
  group_num_ats = int(ctrl_flag(18));
  int ifsh=0;
  int ibts=0;
  int iats=0;
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
  dim_sel_ats=nch_ats;cout<<"dim_sel_ats "<<dim_sel_ats<<endl;
  nbins=nages;
  nagecomp(1) = n_fsh_r;
  nagecomp(2) = n_bts_r;
  nagecomp(3) = n_ats_r; 
  write_log(n_fsh_r);
  write_log(n_bts_r);
  write_log(n_ats_r);
  // Future and SPR stuff
  endyr_fut = endyr_r+nyrs_future;
  styr_fut  = endyr_r+1;
  nFs       = 3;
  if (phase_sr>0) 
    phase_nosr = -1;
  else
    phase_nosr = 1;
 ad_comm::change_datafile_name(Cov_Filename);cout<<"Opening "<<Cov_Filename<<endl;
  cov_in.allocate(1,n_bts,1,n_bts,"cov_in");
  cov.allocate(1,n_bts_r,1,n_bts_r);
 for (i=1;i<=n_bts_r;i++) cov(i) = cov_in(i)(1,n_bts_r);
  inv_bts_cov.allocate(1,n_bts_r,1,n_bts_r);
 inv_bts_cov = inv(cov) ;
 write_log(cov);
  yrs_ch_ats.allocate(1,nch_ats);
  sel_ch_sig_ats.allocate(1,nch_ats);
 ii=0;for (i=styr;i<=endyr_r;i++) if(ats_ch_in(i)>0) {ii++;sel_ch_sig_ats(ii)=ats_ch_in(i);yrs_ch_ats(ii)=i;} 
  yrs_ch_fsh.allocate(1,nch_fsh);
  sel_ch_sig_fsh.allocate(1,nch_fsh);
 ii=0;for (i=styr;i<=endyr_r;i++) if(fsh_ch_in(i)>0) {ii++;sel_ch_sig_fsh(ii)=fsh_ch_in(i);yrs_ch_fsh(ii)=i;} 
 write_log(nch_fsh); write_log(yrs_ch_fsh); write_log(sel_ch_sig_fsh);
 write_log(nch_ats); write_log(yrs_ch_ats); write_log(sel_ch_sig_ats);
  oac_fsh.allocate(1,n_fsh_r,1,nbins);
  oac_bts.allocate(1,n_bts_r,1,nbins);
  if (use_last_ats_ac>0) n_ats_ac_r = n_ats_r; else n_ats_ac_r = n_ats_r-1; 
  if (use_last_ats_ac>0) nagecomp(3) = n_ats_r; else nagecomp(3) = n_ats_r-1; 
  oac_ats.allocate(1,n_ats_ac_r,1,nbins);
  oa1_ats.allocate(1,n_ats_ac_r);
  ot_fsh.allocate(1,n_fsh_r);
  ot_bts.allocate(1,n_bts_r);
  std_ob_bts.allocate(1,n_bts_r);
  ob_bts.allocate(1,n_bts_r);
  ot_ats.allocate(1,n_ats_r);
  ob_ats.allocate(1,n_ats_r);
  std_ob_ats.allocate(1,n_ats_r);
  lseb_ats.allocate(1,n_ats_r);
  lvarb_ats.allocate(1,n_ats_r);
 iseed=0;
 do_fmort=0;
  adj_1.allocate(1,10);
  adj_2.allocate(1,10);
  SSB_1.allocate(1,10);
  SSB_2.allocate(1,10);
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
long int lseed=iseed;
  pad_rng = new random_number_generator(iseed);;
 ad_comm::change_datafile_name(Wtage_file);
  log_sd_coh.allocate("log_sd_coh");
  log_sd_yr.allocate("log_sd_yr");
  cur_yr.allocate("cur_yr");
  styr_wt.allocate("styr_wt");
  endyr_wt.allocate("endyr_wt");
  ndat_wt.allocate("ndat_wt");
  nyrs_data.allocate(1,ndat_wt,"nyrs_data");
  yrs_data.allocate(1,ndat_wt,1,nyrs_data,"yrs_data");
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
  age_st.allocate("age_st");
  age_end.allocate("age_end");
 nages_wt = age_end - age_st + 1;
 nscale_parm = ndat_wt-1;
  wt_obs.allocate(1,ndat_wt,1,nyrs_data,age_st,age_end,"wt_obs");
  sd_obs.allocate(1,ndat_wt,1,nyrs_data,age_st,age_end,"sd_obs");
 if (ndat_wt>1) phase_d_scale = 3; else phase_d_scale = -1;
 write_log(endyr_wt);
 write_log(styr_wt);
 write_log(log_sd_coh);
 write_log(log_sd_yr);
 write_log(wt_obs);
 write_log(sd_obs);
 endyr_wt = endyr_wt - int(ctrl_flag(28));
 cout<<(endyr_wt)<<endl;;
 max_nyrs_data = max(nyrs_data);
 ad_comm::change_datafile_name(RawSurveyCPUE_file);
  nstrata.allocate("nstrata");
 cout <<nstrata<<endl;
  sqkm.allocate(1,nstrata,"sqkm");
  ndata.allocate("ndata");
  d.allocate(1,ndata,1,5,"d");
  nobs.allocate(1982,2008,1,14);
  mnCPUE.allocate(1982,2008,1,14);
  mntemp.allocate(1982,2008,1,14);
  temp_in.allocate(1982,2008,1,14,1,70);
  CPUE_in.allocate(1982,2008,1,14,1,70);
  write_log(d);
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
  temp.allocate(1982,2008,1,14,1,nobs);
  CPUE.allocate(1982,2008,1,14,1,nobs);
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
  FW_fsh.allocate(1,4);
 ad_comm::change_datafile_name(Temp_Cons_Dist_file);
  SST.allocate(styr-1,endyr-1,"SST");
 SST_fut = mean(SST(endyr-7,endyr-3));
  n_pred_grp_nonpoll.allocate("n_pred_grp_nonpoll");
  n_pred_grp_poll.allocate("n_pred_grp_poll");
 n_pred_grp = n_pred_grp_nonpoll + n_pred_grp_poll;         // the number of predator groups
  N_pred.allocate(1,n_pred_grp,styr,endyr,"N_pred");
  nstrata_pred.allocate("nstrata_pred");
  strata.allocate(1,nstrata_pred,"strata");
  n_pred_ages.allocate("n_pred_ages");
  pred_ages.allocate(1,n_pred_ages,"pred_ages");
  poll_dist.allocate(1,n_pred_ages,styr,endyr,1,nstrata_pred,"poll_dist");
  pred_dist_nonpoll.allocate(1,n_pred_grp,styr,endyr,1,nstrata_pred,"pred_dist_nonpoll");
  Npred_bystrata_nonpoll.allocate(styr,endyr,1,n_pred_grp_nonpoll,1,nstrata_pred);
  area_pred.allocate(1,nstrata_pred,"area_pred");
  nyrs_cons_nonpoll.allocate(1,n_pred_grp_nonpoll,"nyrs_cons_nonpoll");
  yrs_cons_nonpoll.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,"yrs_cons_nonpoll");
  obs_cons_nonpoll.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,"obs_cons_nonpoll");
  oac_cons_nonpoll.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,1,n_pred_ages,"oac_cons_nonpoll");
  sam_oac_cons_nonpoll_raw.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,"sam_oac_cons_nonpoll_raw");
  obs_cons_wgt_atage_nonpoll.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,1,n_pred_ages);
  obs_cons_natage_nonpoll.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,1,n_pred_ages);
  obs_cpup_nonpoll.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,1,n_pred_ages);
  C_a_nonpoll.allocate(1,n_pred_grp_nonpoll,"C_a_nonpoll");
  C_b_nonpoll.allocate(1,n_pred_grp_nonpoll,"C_b_nonpoll");
  TCM_nonpoll.allocate(1,n_pred_grp_nonpoll,"TCM_nonpoll");
  TC0_nonpoll.allocate(1,n_pred_grp_nonpoll,"TC0_nonpoll");
  CQ_nonpoll.allocate(1,n_pred_grp_nonpoll,"CQ_nonpoll");
  temp_bystrata.allocate(styr,endyr,1,nstrata_pred,"temp_bystrata");
  mn_wgt_nonpoll.allocate(1,n_pred_grp_nonpoll,styr,endyr,"mn_wgt_nonpoll");
  Y_nonpoll.allocate(1,n_pred_grp_nonpoll);
  Z_nonpoll.allocate(1,n_pred_grp_nonpoll);
  X_nonpoll.allocate(1,n_pred_grp_nonpoll);
  V_nonpoll.allocate(styr,endyr,1,n_pred_grp_nonpoll,1,nstrata_pred);
  F_t_nonpoll.allocate(styr,endyr,1,n_pred_grp_nonpoll,1,nstrata_pred);
  Cmax_nonpoll.allocate(styr,endyr,1,n_pred_grp_nonpoll,1,nstrata_pred);
  Cmax_avg.allocate(1,n_pred_grp,"Cmax_avg");
  atf_wgts.allocate(1,n_pred_grp);
  poll_wgts.allocate(1,n_pred_ages);
  comp_nr_ub.allocate(1,n_pred_grp_nonpoll);
 comp_nr_ub = ivector(nyrs_cons_nonpoll*n_pred_ages);  
  phase_cope.allocate("phase_cope");
  n_cope.allocate("n_cope");
  yrs_cope.allocate(1,n_cope,"yrs_cope");
  obs_cope.allocate(1,n_cope,"obs_cope");
  obs_cope_std.allocate(1,n_cope,"obs_cope_std");
  lse_cope.allocate(1,n_cope);
  lvar_cope.allocate(1,n_cope);
  lse_cope    = elem_div(obs_cope_std,obs_cope);
  lse_cope    = sqrt(log(square(lse_cope) + 1.));
  lvar_cope   = square(lse_cope);
   write_log(SST);
   write_log( n_pred_grp_nonpoll);
   write_log( n_pred_grp_poll);
   write_log( n_pred_grp);
   write_log( N_pred);
   write_log( nstrata_pred);
   write_log( strata);
   write_log( n_pred_ages);
   write_log( pred_ages);
   write_log( poll_dist);
   write_log( pred_dist_nonpoll);
   write_log( area_pred);
   write_log( nyrs_cons_nonpoll);
   write_log( yrs_cons_nonpoll);
   write_log( obs_cons_nonpoll);
   write_log(sam_oac_cons_nonpoll_raw);
   write_log(temp_phase);           
   write_log(C_a_nonpoll);       
   write_log(C_b_nonpoll);            
   write_log(TCM_nonpoll);        
   write_log(TC0_nonpoll); 
   write_log(CQ_nonpoll);
   write_log(temp_bystrata);  
   write_log(mn_wgt_nonpoll);
   write_log(Cmax_avg);  
   write_log(phase_cope);
   write_log(n_cope);
   write_log(yrs_cope);
   write_log(obs_cope);
   write_log(obs_cope_std);
   // Assign values to temperature and predation phases (if estimating predation mortality or climate enhanced recruitment)
  if(do_pred==1  && do_mult_func_resp==1)
  {
    do_pred_phase_ms = pred_phase;
    do_pred_phase_ss = -1;
    do_pred_phase    = pred_phase;
  } 
  else if (do_pred==1  && do_mult_func_resp!=1)
  {
    do_pred_phase_ms = -1;
    do_pred_phase_ss = pred_phase;
    do_pred_phase    = pred_phase;
  }
  else
  {
    do_pred_phase_ms = -1;
    do_pred_phase_ss = -1;
    do_pred_phase    = -1;
  }  
  if(do_temp==1) 
    do_temp_phase = temp_phase;
  else 
    do_temp_phase = -1;
  // If estimating predation mortality, do a bunch of preliminary calculations
  if (do_pred==1)
  {
    //Rescale spatial distribution matrices to add to one, and compute predator by year and strata
    for (i=1;i<=n_pred_ages;i++) 
    {
      for (ii=styr;ii<=endyr;ii++) 
      {
        poll_dist(i,ii) = poll_dist(i,ii)/sum(poll_dist(i,ii));
      }
    }
    for (i=1;i<=n_pred_grp;i++) 
    {
      for (ii=styr;ii<=endyr;ii++) 
      {
        pred_dist_nonpoll(i,ii)      = pred_dist_nonpoll(i,ii)/sum(pred_dist_nonpoll(i,ii));
        Npred_bystrata_nonpoll(ii,i) = N_pred(i,ii)*pred_dist_nonpoll(i,ii);
      }
    }
  // Compute the catch per unit predator (CPUP) in numbers
    for (m=1;m<=n_pred_grp;m++) 
    {
      for (i=1;i<=nyrs_cons_nonpoll(m);i++)
      {
        yr_ind = yrs_cons_nonpoll(m,i) - 1981;    // for getting the index for the wt_bts
        if(yr_ind<1) 
          yr_ind = 1;
        if(yr_ind>38) 
          yr_ind = 38;
        obs_cons_wgt_atage_nonpoll(m,i) = oac_cons_nonpoll(m,i)*obs_cons_nonpoll(m,i);  // kilotons
        obs_cons_natage_nonpoll(m,i)    = elem_div(obs_cons_wgt_atage_nonpoll(m,i),wt_bts(yr_ind)(1,n_pred_ages));
        obs_cpup_nonpoll(m,i)           = obs_cons_natage_nonpoll(m,i)/N_pred(m,yrs_cons_nonpoll(m,i));
      }
    }
  // Compute things for Cmax
    for (i=1;i<=n_pred_grp_nonpoll;i++)
    {
      Y_nonpoll(i) = log(CQ_nonpoll(i))*(TCM_nonpoll(i)-TC0_nonpoll(i)+2);
      Z_nonpoll(i) = log(CQ_nonpoll(i))*(TCM_nonpoll(i)-TC0_nonpoll(i));
      X_nonpoll(i) = Z_nonpoll(i)*Z_nonpoll(i)*pow(1+sqrt(1+40.0/Y_nonpoll(i)),2)/400.0;
      for (j=styr;j<=endyr;j++)
      {
        V_nonpoll(j,i)    = (TCM_nonpoll(i) - temp_bystrata(j))/(TCM_nonpoll(i) - TC0_nonpoll(i));
        F_t_nonpoll(j,i)  = elem_prod(pow(V_nonpoll(j,i),X_nonpoll(i)),mfexp(X_nonpoll(i)*(1.0- V_nonpoll(j,i))));
        Cmax_nonpoll(j,i) = 365*C_a_nonpoll(i)*pow(mn_wgt_nonpoll(i,j),C_b_nonpoll(i))*F_t_nonpoll(j,i);
      }
    }
    // Compute average of atf and pollock weights for computing functional response
    for (i=1;i<=n_pred_grp;i++)  
      atf_wgts(i)  = mean(mn_wgt_nonpoll(i));
    for(i=1;i<=n_pred_ages;i++)
      poll_wgts(i) = 1000.0*mean(column(wt_bts,i));   // convert from kg to g 
  }
  write_log(do_temp_phase);        // copy the temperture phase here
  write_log(do_pred_phase_ss);     // phase for estimating the predation parameters, single species function response
  write_log(do_pred_phase_ms);     // phase for estimating the predation parameters, multi-species function response
  write_log(do_pred_phase);        // phase for estimating the residual M
  test_2.allocate("test_2");
 write_log(test_2);
 if(test_2!=1234567){ cout<<"Failed on data read "<<test_2<<endl;exit(1);}
  sam_oac_cons_nonpoll.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll);
  // start to read from the composition weight file
  // only reweighting the consumption estimates
    ad_comm::change_datafile_name("compweights.ctl"); 
  compweights.allocate(1,n_pred_grp_nonpoll,"compweights");
  consweights.allocate(1,n_pred_grp_nonpoll,"consweights");
  if(do_pred==1)
  {
    for (i=1;i<=n_pred_grp_nonpoll;i++)
    {
      sam_oac_cons_nonpoll(i) = compweights(i)*sam_oac_cons_nonpoll_raw(i);    
    }
  }
  if(do_pred==2)
  {
    ad_comm::change_datafile_name("../dat/M_matrix.dat"); cout<<"Opening ../dat/M_matrix.dat"<<endl;
  }  
  M_matrix.allocate(styr,endyr,1,nages,"M_matrix");
}

void model_parameters::initializationfunction(void)
{
  L1.set_initial_value(27.928);
  L2.set_initial_value(44.3676944103);
  log_alpha.set_initial_value(-11.0000000000);
  log_K.set_initial_value(-0.136352276302);
  d_scale.set_initial_value(.85);
  sigr.set_initial_value(sigrprior);
  steepness.set_initial_value(steepnessprior);
  log_avgrec.set_initial_value(10.87558);
  log_Rzero.set_initial_value(10.2033);
  log_avginit.set_initial_value(4.8);
  log_avg_F.set_initial_value(-1.6);
  bt_slope.set_initial_value(0.);
  log_q_ats.set_initial_value(-1.05313);
  log_q_avo.set_initial_value(-9.6);
  log_q_bts.set_initial_value(q_bts_prior);
  log_q_std_area.set_initial_value(0.);
  log_q_cpue.set_initial_value(-0.16);
  sel_coffs_fsh.set_initial_value(-.10);
  sel_coffs_bts.set_initial_value(-.01);
  sel_coffs_ats.set_initial_value(-.10);
  sel_a50_bts.set_initial_value(5.5);
  sel_slp_bts.set_initial_value(1.);
  sel_dif1_fsh.set_initial_value(1);
  sel_a501_fsh.set_initial_value(3);
  sel_dif2_fsh.set_initial_value(5);
  sel_trm2_fsh.set_initial_value(.90);
  log_rho.set_initial_value(-2.5);
  log_a_II_vec.set_initial_value(-4.0);
  log_b_II_vec.set_initial_value(2.5);
  if (global_datafile)
  {
    delete global_datafile;
    global_datafile = NULL;
  }
}

model_parameters::model_parameters(int sz,int argc,char * argv[]) : 
 model_data(argc,argv) , function_minimizer(sz)
{
  initializationfunction();
  log_avgrec.allocate(1,"log_avgrec");
  log_avginit.allocate(1,"log_avginit");
  log_avg_F.allocate(1,"log_avg_F");
  natmort_phi.allocate(phase_natmort,"natmort_phi");
  natmort.allocate(1,nages,"natmort");
  #ifndef NO_AD_INITIALIZE
    natmort.initialize();
  #endif
  base_natmort.allocate(1,nages,"base_natmort");
  #ifndef NO_AD_INITIALIZE
    base_natmort.initialize();
  #endif
  log_q_bts.allocate(phase_q_bts,"log_q_bts");
  log_q_std_area.allocate(phase_q_std_area,"log_q_std_area");
  bt_slope.allocate(phase_bt,"bt_slope");
 cout <<phase_bt<<" Phase for bts temperature"<<endl;
  log_q_ats.allocate(phase_q_ats,"log_q_ats");
  log_Rzero.allocate(phase_Rzero,"log_Rzero");
  steepness.allocate(0.2,Steepness_UB,phase_steepness,"steepness");
   phase_cpue_q = 1; // always estimate historical CPUE q
   if (n_avo_r < 6 || ctrl_flag(6)==0) phase_avo_q = -1; else phase_avo_q=1;  
  log_q_cpue.allocate(phase_cpue_q,"log_q_cpue");
  log_q_avo.allocate(phase_avo_q,"log_q_avo");
  q_avo.allocate("q_avo");
  #ifndef NO_AD_INITIALIZE
  q_avo.initialize();
  #endif
  q_bts.allocate("q_bts");
  #ifndef NO_AD_INITIALIZE
  q_bts.initialize();
  #endif
  q_ats.allocate("q_ats");
  #ifndef NO_AD_INITIALIZE
  q_ats.initialize();
  #endif
  q_cpue.allocate("q_cpue");
  #ifndef NO_AD_INITIALIZE
  q_cpue.initialize();
  #endif
  log_initdevs.allocate(2,nages,-15.,15.,3,"log_initdevs");
  log_rec_devs.allocate(styr,endyr_r,-10.,10.,phase_rec_devs,"log_rec_devs");
  rec_epsilons.allocate(styr,endyr_r,"rec_epsilons");
  #ifndef NO_AD_INITIALIZE
    rec_epsilons.initialize();
  #endif
  larv_rec_devs.allocate(1,11,1,11,-10.,10.,phase_larv,"larv_rec_devs");
  larv_rec_trans.allocate(1,11,1,11,"larv_rec_trans");
  #ifndef NO_AD_INITIALIZE
    larv_rec_trans.initialize();
  #endif
  alpha.allocate("alpha");
  #ifndef NO_AD_INITIALIZE
  alpha.initialize();
  #endif
  beta.allocate("beta");
  #ifndef NO_AD_INITIALIZE
  beta.initialize();
  #endif
  Rzero.allocate("Rzero");
  #ifndef NO_AD_INITIALIZE
  Rzero.initialize();
  #endif
  q_all.allocate("q_all");
  repl_F.allocate("repl_F");
  #ifndef NO_AD_INITIALIZE
  repl_F.initialize();
  #endif
  repl_yld.allocate("repl_yld");
  #ifndef NO_AD_INITIALIZE
  repl_yld.initialize();
  #endif
  repl_SSB.allocate("repl_SSB");
  #ifndef NO_AD_INITIALIZE
  repl_SSB.initialize();
  #endif
  regime.allocate(1,8,"regime");
  phizero.allocate("phizero");
  #ifndef NO_AD_INITIALIZE
  phizero.initialize();
  #endif
  log_F_devs.allocate(styr,endyr_r,-15.,15.,2,"log_F_devs");
  sigr.allocate(0.1,2.,phase_sigr,"sigr");
  sigmaRsq.allocate("sigmaRsq");
  #ifndef NO_AD_INITIALIZE
  sigmaRsq.initialize();
  #endif
  sel_devs_fsh.allocate(1,dim_sel_fsh,1,n_selages_fsh,-5.,5.,phase_selcoffs_fsh_dev,"sel_devs_fsh");
  sel_devs_bts.allocate(1,dim_sel_bts,1,n_selages_bts,-5.,5.,phase_selcoffs_bts_dev,"sel_devs_bts");
  sel_devs_ats.allocate(1,dim_sel_ats,mina_ats,n_selages_ats,-5.,5.,phase_selcoffs_ats_dev,"sel_devs_ats");
  sel_coffs_fsh.allocate(1,n_selages_fsh,phase_selcoffs_fsh,"sel_coffs_fsh");
  sel_coffs_bts.allocate(1,n_selages_bts,phase_selcoffs_bts,"sel_coffs_bts");
  sel_coffs_ats.allocate(mina_ats,n_selages_ats,phase_selcoffs_ats,"sel_coffs_ats");
  wt_fut.allocate(1,nages,"wt_fut");
  #ifndef NO_AD_INITIALIZE
    wt_fut.initialize();
  #endif
  sel_slp_bts.allocate(0.001,5.,phase_logist_bts,"sel_slp_bts");
  sel_a50_bts.allocate(0.1,8,phase_logist_bts,"sel_a50_bts");
  sel_age_one_bts.allocate(phase_logist_bts,"sel_age_one_bts");
  sel_slp_bts_dev.allocate(styr_bts,endyr_r,-5,5,phase_logist_bts_dev,"sel_slp_bts_dev");
  sel_a50_bts_dev.allocate(styr_bts,endyr_r,-5,5,phase_logist_bts_dev,"sel_a50_bts_dev");
  sel_age_one_bts_dev.allocate(styr_bts,endyr_r,-5,5,phase_age1devs_bts,"sel_age_one_bts_dev");
  sel_dif1_fsh.allocate(phase_logist_fsh,"sel_dif1_fsh");
  sel_a501_fsh.allocate(0.1,7,phase_logist_fsh,"sel_a501_fsh");
  sel_trm2_fsh.allocate(0.0,0.999,phase_logist_fsh,"sel_trm2_fsh");
 int ph_log_fsh2;
 if (phase_logist_fsh>0) ph_log_fsh2 = phase_logist_fsh+1;else ph_log_fsh2 = phase_logist_fsh;
  sel_dif2_fsh.allocate(ph_log_fsh2,"sel_dif2_fsh");
  sel_dif1_fsh_dev.allocate(styr,endyr_r,-5,5,phase_logist_fsh_dev,"sel_dif1_fsh_dev");
  sel_a501_fsh_dev.allocate(styr,endyr_r,-5,5,phase_logist_fsh_dev,"sel_a501_fsh_dev");
  sel_trm2_fsh_dev.allocate(styr,endyr_r,-.5,.5,-2,"sel_trm2_fsh_dev");
  SPR_ABC.allocate("SPR_ABC");
  #ifndef NO_AD_INITIALIZE
  SPR_ABC.initialize();
  #endif
  endyr_N.allocate(1,nages,"endyr_N");
  B_Bnofsh.allocate("B_Bnofsh");
  Bzero.allocate("Bzero");
  Percent_Bzero.allocate("Percent_Bzero");
  Percent_Bzero_1.allocate("Percent_Bzero_1");
  Percent_Bzero_2.allocate("Percent_Bzero_2");
  Percent_B100.allocate("Percent_B100");
  Percent_B100_1.allocate("Percent_B100_1");
  Percent_B100_2.allocate("Percent_B100_2");
  q_temp.allocate(1,5,"q_temp");
  #ifndef NO_AD_INITIALIZE
    q_temp.initialize();
  #endif
  SPR_OFL.allocate("SPR_OFL");
  F40.allocate("F40");
  F35.allocate("F35");
  SSB.allocate(styr,endyr_r,"SSB");
  sigmarsq_out.allocate("sigmarsq_out");
  #ifndef NO_AD_INITIALIZE
  sigmarsq_out.initialize();
  #endif
  ftmp.allocate("ftmp");
  #ifndef NO_AD_INITIALIZE
  ftmp.initialize();
  #endif
  SB0.allocate("SB0");
  #ifndef NO_AD_INITIALIZE
  SB0.initialize();
  #endif
  SBF40.allocate("SBF40");
  #ifndef NO_AD_INITIALIZE
  SBF40.initialize();
  #endif
  SBF35.allocate("SBF35");
  #ifndef NO_AD_INITIALIZE
  SBF35.initialize();
  #endif
  sprpen.allocate("sprpen");
  #ifndef NO_AD_INITIALIZE
  sprpen.initialize();
  #endif
  F_pen.allocate("F_pen");
  #ifndef NO_AD_INITIALIZE
  F_pen.initialize();
  #endif
  meanrec.allocate("meanrec");
  #ifndef NO_AD_INITIALIZE
  meanrec.initialize();
  #endif
  SR_resids.allocate(styr_est,endyr_est,"SR_resids");
  #ifndef NO_AD_INITIALIZE
    SR_resids.initialize();
  #endif
  Nspr.allocate(1,4,1,nages,"Nspr");
  #ifndef NO_AD_INITIALIZE
    Nspr.initialize();
  #endif
  sel_fut.allocate(1,nages,"sel_fut");
  natage_future.allocate(1,nscen,styr_fut,endyr_fut,1,nages,"natage_future");
  #ifndef NO_AD_INITIALIZE
    natage_future.initialize();
  #endif
  rec_dev_future.allocate(styr_fut,endyr_fut,phase_F40,"rec_dev_future");
  F_future.allocate(1,nscen,styr_fut,endyr_fut,1,nages,"F_future");
  #ifndef NO_AD_INITIALIZE
    F_future.initialize();
  #endif
  Z_future.allocate(styr_fut,endyr_fut,1,nages,"Z_future");
  #ifndef NO_AD_INITIALIZE
    Z_future.initialize();
  #endif
  S_future.allocate(styr_fut,endyr_fut,1,nages,"S_future");
  #ifndef NO_AD_INITIALIZE
    S_future.initialize();
  #endif
  catage_future.allocate(styr_fut,endyr_fut,1,nages,"catage_future");
  #ifndef NO_AD_INITIALIZE
    catage_future.initialize();
  #endif
  avg_rec_dev_future.allocate("avg_rec_dev_future");
  #ifndef NO_AD_INITIALIZE
  avg_rec_dev_future.initialize();
  #endif
  eac_fsh.allocate(1,n_fsh_r,1,nbins,"eac_fsh");
  #ifndef NO_AD_INITIALIZE
    eac_fsh.initialize();
  #endif
  elc_fsh.allocate(1,nlbins,"elc_fsh");
  #ifndef NO_AD_INITIALIZE
    elc_fsh.initialize();
  #endif
  eac_bts.allocate(1,n_bts_r,1,nbins,"eac_bts");
  #ifndef NO_AD_INITIALIZE
    eac_bts.initialize();
  #endif
  eac_cmb.allocate(1,n_bts_r,1,nbins,"eac_cmb");
  #ifndef NO_AD_INITIALIZE
    eac_cmb.initialize();
  #endif
  oac_cmb.allocate(1,n_bts_r,1,nbins,"oac_cmb");
  #ifndef NO_AD_INITIALIZE
    oac_cmb.initialize();
  #endif
  eac_ats.allocate(1,n_ats_ac_r,1,nbins,"eac_ats");
  #ifndef NO_AD_INITIALIZE
    eac_ats.initialize();
  #endif
  ea1_ats.allocate(1,n_ats_ac_r,"ea1_ats");
  #ifndef NO_AD_INITIALIZE
    ea1_ats.initialize();
  #endif
  et_fsh.allocate(1,n_fsh_r,"et_fsh");
  #ifndef NO_AD_INITIALIZE
    et_fsh.initialize();
  #endif
  et_bts.allocate(1,n_bts_r,"et_bts");
  #ifndef NO_AD_INITIALIZE
    et_bts.initialize();
  #endif
  et_cmb.allocate(1,n_bts_r,"et_cmb");
  #ifndef NO_AD_INITIALIZE
    et_cmb.initialize();
  #endif
  avail_bts.allocate(1,n_bts_r,"avail_bts");
  #ifndef NO_AD_INITIALIZE
    avail_bts.initialize();
  #endif
  avail_ats.allocate(1,n_bts_r,"avail_ats");
  #ifndef NO_AD_INITIALIZE
    avail_ats.initialize();
  #endif
  sigma_cmb.allocate(1,n_bts_r,"sigma_cmb");
  #ifndef NO_AD_INITIALIZE
    sigma_cmb.initialize();
  #endif
  var_cmb.allocate(1,n_bts_r,"var_cmb");
  #ifndef NO_AD_INITIALIZE
    var_cmb.initialize();
  #endif
  ot_cmb.allocate(1,n_bts_r,"ot_cmb");
  #ifndef NO_AD_INITIALIZE
    ot_cmb.initialize();
  #endif
  eb_bts.allocate(1,n_bts_r,"eb_bts");
  #ifndef NO_AD_INITIALIZE
    eb_bts.initialize();
  #endif
  eb_ats.allocate(1,n_ats_r,"eb_ats");
  #ifndef NO_AD_INITIALIZE
    eb_ats.initialize();
  #endif
  et_ats.allocate(1,n_ats_r,"et_ats");
  #ifndef NO_AD_INITIALIZE
    et_ats.initialize();
  #endif
  lse_ats.allocate(1,n_ats_r,"lse_ats");
  #ifndef NO_AD_INITIALIZE
    lse_ats.initialize();
  #endif
  lvar_ats.allocate(1,n_ats_r,"lvar_ats");
  #ifndef NO_AD_INITIALIZE
    lvar_ats.initialize();
  #endif
  et_avo.allocate(1,n_avo_r,"et_avo");
  #ifndef NO_AD_INITIALIZE
    et_avo.initialize();
  #endif
  et_cpue.allocate(1,n_cpue,"et_cpue");
  #ifndef NO_AD_INITIALIZE
    et_cpue.initialize();
  #endif
  Fmort.allocate(styr,endyr_r,"Fmort");
  #ifndef NO_AD_INITIALIZE
    Fmort.initialize();
  #endif
  catage.allocate(styr,endyr_r,1,nages,"catage");
  #ifndef NO_AD_INITIALIZE
    catage.initialize();
  #endif
  pred_catch.allocate(styr,endyr_r,"pred_catch");
  #ifndef NO_AD_INITIALIZE
    pred_catch.initialize();
  #endif
  Pred_N_bts.allocate(styr,endyr_r,"Pred_N_bts");
  #ifndef NO_AD_INITIALIZE
    Pred_N_bts.initialize();
  #endif
  Pred_N_ats.allocate(styr,endyr_r,"Pred_N_ats");
  #ifndef NO_AD_INITIALIZE
    Pred_N_ats.initialize();
  #endif
  pred_cpue.allocate(1,n_cpue,"pred_cpue");
  #ifndef NO_AD_INITIALIZE
    pred_cpue.initialize();
  #endif
  pred_cope.allocate(1,n_cope,"pred_cope");
  #ifndef NO_AD_INITIALIZE
    pred_cope.initialize();
  #endif
  Nage_3.allocate(styr,endyr_r,"Nage_3");
  pred_avo.allocate(1,n_avo,"pred_avo");
  #ifndef NO_AD_INITIALIZE
    pred_avo.initialize();
  #endif
  natage.allocate(styr,endyr_r,1,nages,"natage");
  #ifndef NO_AD_INITIALIZE
    natage.initialize();
  #endif
  srmod_rec.allocate(styr_est,endyr_est,"srmod_rec");
  #ifndef NO_AD_INITIALIZE
    srmod_rec.initialize();
  #endif
  Z.allocate(styr,endyr_r,1,nages,"Z");
  #ifndef NO_AD_INITIALIZE
    Z.initialize();
  #endif
  F.allocate(styr,endyr_r,1,nages,"F");
  #ifndef NO_AD_INITIALIZE
    F.initialize();
  #endif
  S.allocate(styr,endyr_r,1,nages,"S");
  #ifndef NO_AD_INITIALIZE
    S.initialize();
  #endif
  M.allocate(styr,endyr_r,1,nages,"M");
  #ifndef NO_AD_INITIALIZE
    M.initialize();
  #endif
  M_dev.allocate(styr+1,endyr_r,-1.,1.,-8,"M_dev");
  log_sel_fsh.allocate(styr,endyr_r,1,nages,"log_sel_fsh");
  #ifndef NO_AD_INITIALIZE
    log_sel_fsh.initialize();
  #endif
  sel_fsh.allocate(styr,endyr_r,1,nages,"sel_fsh");
  #ifndef NO_AD_INITIALIZE
    sel_fsh.initialize();
  #endif
  log_sel_bts.allocate(styr,endyr_r,1,nages,"log_sel_bts");
  #ifndef NO_AD_INITIALIZE
    log_sel_bts.initialize();
  #endif
  log_sel_ats.allocate(styr,endyr_r,1,nages,"log_sel_ats");
  #ifndef NO_AD_INITIALIZE
    log_sel_ats.initialize();
  #endif
  ff.allocate("ff");
  #ifndef NO_AD_INITIALIZE
  ff.initialize();
  #endif
  catch_like.allocate("catch_like");
  #ifndef NO_AD_INITIALIZE
  catch_like.initialize();
  #endif
  avgsel_fsh.allocate("avgsel_fsh");
  #ifndef NO_AD_INITIALIZE
  avgsel_fsh.initialize();
  #endif
  avgsel_bts.allocate("avgsel_bts");
  #ifndef NO_AD_INITIALIZE
  avgsel_bts.initialize();
  #endif
  avgsel_ats.allocate("avgsel_ats");
  #ifndef NO_AD_INITIALIZE
  avgsel_ats.initialize();
  #endif
  bzero.allocate("bzero");
  #ifndef NO_AD_INITIALIZE
  bzero.initialize();
  #endif
  surv.allocate("surv");
  #ifndef NO_AD_INITIALIZE
  surv.initialize();
  #endif
  nthisage.allocate("nthisage");
  #ifndef NO_AD_INITIALIZE
  nthisage.initialize();
  #endif
  surv_like.allocate(1,3,"surv_like");
  #ifndef NO_AD_INITIALIZE
    surv_like.initialize();
  #endif
  cpue_like.allocate("cpue_like");
  #ifndef NO_AD_INITIALIZE
  cpue_like.initialize();
  #endif
  cope_like.allocate("cope_like");
  #ifndef NO_AD_INITIALIZE
  cope_like.initialize();
  #endif
  avo_like.allocate("avo_like");
  #ifndef NO_AD_INITIALIZE
  avo_like.initialize();
  #endif
  sel_like.allocate(1,3,"sel_like");
  #ifndef NO_AD_INITIALIZE
    sel_like.initialize();
  #endif
  sel_like_dev.allocate(1,3,"sel_like_dev");
  #ifndef NO_AD_INITIALIZE
    sel_like_dev.initialize();
  #endif
  age_like.allocate(1,ngears,"age_like");
  #ifndef NO_AD_INITIALIZE
    age_like.initialize();
  #endif
  len_like.allocate("len_like");
  #ifndef NO_AD_INITIALIZE
  len_like.initialize();
  #endif
  wt_like.allocate("wt_like");
  #ifndef NO_AD_INITIALIZE
  wt_like.initialize();
  #endif
  age_like_offset.allocate(1,ngears,"age_like_offset");
  #ifndef NO_AD_INITIALIZE
    age_like_offset.initialize();
  #endif
  len_like_offset.allocate("len_like_offset");
  #ifndef NO_AD_INITIALIZE
  len_like_offset.initialize();
  #endif
  MN_const.allocate("MN_const");
  #ifndef NO_AD_INITIALIZE
  MN_const.initialize();
  #endif
 MN_const = 1e-3; // Multinomial constant
  Priors.allocate(1,4,"Priors");
  #ifndef NO_AD_INITIALIZE
    Priors.initialize();
  #endif
  rec_like.allocate(1,7,"rec_like");
  #ifndef NO_AD_INITIALIZE
    rec_like.initialize();
  #endif
  all_like.allocate(1,26,"all_like");
  #ifndef NO_AD_INITIALIZE
    all_like.initialize();
  #endif
  sumtmp.allocate("sumtmp");
  #ifndef NO_AD_INITIALIZE
  sumtmp.initialize();
  #endif
  tmpsp.allocate("tmpsp");
  #ifndef NO_AD_INITIALIZE
  tmpsp.initialize();
  #endif
  log_initage.allocate(2,nages,"log_initage");
  #ifndef NO_AD_INITIALIZE
    log_initage.initialize();
  #endif
  pred_biom.allocate(styr,endyr_r,"pred_biom");
  #ifndef NO_AD_INITIALIZE
    pred_biom.initialize();
  #endif
  SRR_SSB.allocate(1,20,"SRR_SSB");
  #ifndef NO_AD_INITIALIZE
    SRR_SSB.initialize();
  #endif
  fake_SST.allocate(1,40,"fake_SST");
  #ifndef NO_AD_INITIALIZE
    fake_SST.initialize();
  #endif
  fake_dens.allocate(1,40,"fake_dens");
  #ifndef NO_AD_INITIALIZE
    fake_dens.initialize();
  #endif
  L1.allocate(10,50,2,"L1");
  L2.allocate(30,90,3,"L2");
  log_alpha.allocate(-1,"log_alpha");
  log_K.allocate(4,"log_K");
  wt_inc.allocate(age_st,age_end-1,"wt_inc");
  #ifndef NO_AD_INITIALIZE
    wt_inc.initialize();
  #endif
  d_scale.allocate(1,nscale_parm,age_st,age_end,phase_d_scale,"d_scale");
  K.allocate("K");
  #ifndef NO_AD_INITIALIZE
  K.initialize();
  #endif
  wt_hat.allocate(1,ndat_wt,1,max_nyrs_data,age_st,age_end,"wt_hat");
  #ifndef NO_AD_INITIALIZE
    wt_hat.initialize();
  #endif
  alphawt.allocate("alphawt");
  #ifndef NO_AD_INITIALIZE
  alphawt.initialize();
  #endif
  wt_pre.allocate(styr_wt,endyr_wt,age_st,age_end,"wt_pre");
  #ifndef NO_AD_INITIALIZE
    wt_pre.initialize();
  #endif
  mnwt.allocate(age_st,age_end,"mnwt");
  #ifndef NO_AD_INITIALIZE
    mnwt.initialize();
  #endif
  coh_eff.allocate(styr_wt-nages_wt-age_st+1,endyr_wt-age_st+3,-15,15,phase_coheff,"coh_eff");
  yr_eff.allocate(styr_wt,endyr_wt+3,-15,15,phase_yreff,"yr_eff");
  wt_last.allocate(age_st,age_end,"wt_last");
  wt_cur.allocate(age_st,age_end,"wt_cur");
  wt_next.allocate(age_st,age_end,"wt_next");
  wt_yraf.allocate(age_st,age_end,"wt_yraf");
  avg_age_msy.allocate("avg_age_msy");
  avgwt_msy.allocate("avgwt_msy");
  MSY.allocate("MSY");
  MSY_wt.allocate("MSY_wt");
  Fmsy.allocate("Fmsy");
  Fmsy_wt.allocate("Fmsy_wt");
  Fmsy2.allocate("Fmsy2");
  Fmsy2_wt.allocate("Fmsy2_wt");
  Fmsy2_dec.allocate(1,10,"Fmsy2_dec");
  Fmsy2_decwt.allocate(1,10,"Fmsy2_decwt");
  Bmsy2.allocate("Bmsy2");
  Bmsy2_wt.allocate("Bmsy2_wt");
  lnFmsy.allocate("lnFmsy");
  lnFmsy2.allocate("lnFmsy2");
  SER_Fmsy.allocate("SER_Fmsy");
  Fendyr_Fmsy.allocate("Fendyr_Fmsy");
  Rmsy.allocate("Rmsy");
  Bmsy.allocate("Bmsy");
  Fcur_Fmsy.allocate(1,nscen,"Fcur_Fmsy");
  Bcur_Bmsy.allocate(1,nscen,"Bcur_Bmsy");
  Bcur_Bmean.allocate(1,nscen,"Bcur_Bmean");
  Bcur3_Bcur.allocate(1,nscen,"Bcur3_Bcur");
  Bcur3_Bmean.allocate(1,nscen,"Bcur3_Bmean");
  Bcur2_Bmsy.allocate(1,nscen,"Bcur2_Bmsy");
  Bcur2_B20.allocate(1,nscen,"Bcur2_B20");
  LTA1_5R.allocate(1,nscen,"LTA1_5R");
  LTA1_5.allocate(1,nscen,"LTA1_5");
  MatAgeDiv1.allocate(1,nscen,"MatAgeDiv1");
  MatAgeDiv2.allocate(1,nscen,"MatAgeDiv2");
  H.allocate(styr,endyr_r,"H");
  #ifndef NO_AD_INITIALIZE
    H.initialize();
  #endif
  avg_age_mature.allocate(styr,endyr_r,"avg_age_mature");
  #ifndef NO_AD_INITIALIZE
    avg_age_mature.initialize();
  #endif
  RelEffort.allocate(1,nscen,"RelEffort");
  F40_spb.allocate("F40_spb");
  begbiom.allocate("begbiom");
  DepletionSpawners.allocate("DepletionSpawners");
  SB100.allocate("SB100");
  Current_Spawners.allocate("Current_Spawners");
  pred_rec.allocate(styr,endyr_r,"pred_rec");
  age_3_plus_biom.allocate(styr,endyr_r+2,"age_3_plus_biom");
  ABC_biom.allocate(1,10,"ABC_biom");
  ABC_biom2.allocate(1,10,"ABC_biom2");
  rechat.allocate(1,20,"rechat");
  SRresidhat.allocate(1,40,"SRresidhat");
  #ifndef NO_AD_INITIALIZE
    SRresidhat.initialize();
  #endif
  SER.allocate(styr,endyr_r,"SER");
  future_SER.allocate(1,nscen,styr_fut,endyr_fut,"future_SER");
  #ifndef NO_AD_INITIALIZE
    future_SER.initialize();
  #endif
  future_catch.allocate(1,nscen,styr_fut,endyr_fut,"future_catch");
  #ifndef NO_AD_INITIALIZE
    future_catch.initialize();
  #endif
  future_SSB.allocate(1,nscen,endyr_r,endyr_fut,"future_SSB");
  Age3_Abund.allocate(styr,endyr_r,"Age3_Abund");
  age_1_7_biomass.allocate(styr,endyr_r,"age_1_7_biomass");
  #ifndef NO_AD_INITIALIZE
    age_1_7_biomass.initialize();
  #endif
  fff.allocate("fff");
  prior_function_value.allocate("prior_function_value");
  likelihood_function_value.allocate("likelihood_function_value");
  resid_temp_x1.allocate(do_temp_phase,"resid_temp_x1");
  resid_temp_x2.allocate(do_temp_phase,"resid_temp_x2");
  SR_resids_temp.allocate(styr_est,endyr_est,"SR_resids_temp");
  #ifndef NO_AD_INITIALIZE
    SR_resids_temp.initialize();
  #endif
  SR_resids_like.allocate("SR_resids_like");
  #ifndef NO_AD_INITIALIZE
  SR_resids_like.initialize();
  #endif
  log_a_II.allocate(1,n_pred_grp,1,n_pred_ages,-12,0,do_pred_phase_ss,"log_a_II");
  log_b_II.allocate(1,n_pred_grp,1,n_pred_ages,0,12,do_pred_phase_ss,"log_b_II");
  log_a_II_vec.allocate(1,n_pred_grp,-12,0,do_pred_phase_ms,"log_a_II_vec");
  log_b_II_vec.allocate(1,n_pred_grp,0,12,do_pred_phase_ms,"log_b_II_vec");
  log_rho.allocate(1,n_pred_grp,1,n_pred_ages,-12,0,do_pred_phase_ms,"log_rho");
  log_resid_M.allocate(1,n_pred_ages,-3,0.1,do_pred_phase,"log_resid_M");
  resid_M.allocate(1,n_pred_ages,"resid_M");
  #ifndef NO_AD_INITIALIZE
    resid_M.initialize();
  #endif
  resid_M_like.allocate(1,n_pred_ages,"resid_M_like");
  #ifndef NO_AD_INITIALIZE
    resid_M_like.initialize();
  #endif
  a_II.allocate(1,n_pred_grp,1,n_pred_ages,"a_II");
  #ifndef NO_AD_INITIALIZE
    a_II.initialize();
  #endif
  b_II.allocate(1,n_pred_grp,1,n_pred_ages,"b_II");
  #ifndef NO_AD_INITIALIZE
    b_II.initialize();
  #endif
  rho.allocate(1,n_pred_grp,1,n_pred_ages,"rho");
  #ifndef NO_AD_INITIALIZE
    rho.initialize();
  #endif
  a_II_vec.allocate(1,n_pred_grp,"a_II_vec");
  #ifndef NO_AD_INITIALIZE
    a_II_vec.initialize();
  #endif
  b_II_vec.allocate(1,n_pred_grp,"b_II_vec");
  #ifndef NO_AD_INITIALIZE
    b_II_vec.initialize();
  #endif
  natage_strat.allocate(styr,endyr_r,1,n_pred_ages,1,nstrata_pred,"natage_strat");
  #ifndef NO_AD_INITIALIZE
    natage_strat.initialize();
  #endif
  natage_strat_dens.allocate(styr,endyr_r,1,n_pred_ages,1,nstrata_pred,"natage_strat_dens");
  #ifndef NO_AD_INITIALIZE
    natage_strat_dens.initialize();
  #endif
  meannatage.allocate(styr,endyr_r,1,nages,"meannatage");
  #ifndef NO_AD_INITIALIZE
    meannatage.initialize();
  #endif
  meannatage_bystrata.allocate(styr,endyr_r,1,nages,1,nstrata_pred,"meannatage_bystrata");
  #ifndef NO_AD_INITIALIZE
    meannatage_bystrata.initialize();
  #endif
  mean_dens_bystrata.allocate(styr,endyr_r,1,nages,1,nstrata_pred,"mean_dens_bystrata");
  #ifndef NO_AD_INITIALIZE
    mean_dens_bystrata.initialize();
  #endif
  mean_dens.allocate(styr,endyr_r,1,n_pred_ages,"mean_dens");
  #ifndef NO_AD_INITIALIZE
    mean_dens.initialize();
  #endif
  cons.allocate(1,n_pred_grp,styr,endyr_r,1,n_pred_ages,1,nstrata_pred,"cons");
  #ifndef NO_AD_INITIALIZE
    cons.initialize();
  #endif
  natmort_pred.allocate(1,n_pred_ages,styr,endyr_r,1,nstrata_pred,"natmort_pred");
  #ifndef NO_AD_INITIALIZE
    natmort_pred.initialize();
  #endif
  M_pred.allocate(styr,endyr_r,1,n_pred_ages,1,nstrata_pred,1,n_pred_grp_nonpoll,"M_pred");
  #ifndef NO_AD_INITIALIZE
    M_pred.initialize();
  #endif
  M_pred_tmp.allocate(1,n_pred_grp_nonpoll,1,n_pred_ages,"M_pred_tmp");
  #ifndef NO_AD_INITIALIZE
    M_pred_tmp.initialize();
  #endif
  M_pred_sum.allocate(styr,endyr_r,1,n_pred_ages,1,nstrata_pred,"M_pred_sum");
  #ifndef NO_AD_INITIALIZE
    M_pred_sum.initialize();
  #endif
  Z_pred.allocate(styr,endyr_r,1,n_pred_ages,1,nstrata_pred,"Z_pred");
  #ifndef NO_AD_INITIALIZE
    Z_pred.initialize();
  #endif
  S_pred.allocate(styr,endyr_r,1,n_pred_ages,1,nstrata_pred,"S_pred");
  #ifndef NO_AD_INITIALIZE
    S_pred.initialize();
  #endif
  M_pred_avg.allocate(1,n_pred_ages,styr,endyr_r,"M_pred_avg");
  #ifndef NO_AD_INITIALIZE
    M_pred_avg.initialize();
  #endif
  cons_atage.allocate(1,n_pred_grp,styr,endyr_r,1,n_pred_ages,"cons_atage");
  #ifndef NO_AD_INITIALIZE
    cons_atage.initialize();
  #endif
  cons_atage_wt.allocate(1,n_pred_grp,styr,endyr_r,1,n_pred_ages,"cons_atage_wt");
  #ifndef NO_AD_INITIALIZE
    cons_atage_wt.initialize();
  #endif
  pred_cons.allocate(1,n_pred_grp,styr,endyr_r,"pred_cons");
  #ifndef NO_AD_INITIALIZE
    pred_cons.initialize();
  #endif
  eac_cons.allocate(1,n_pred_grp,styr,endyr_r,1,n_pred_ages,"eac_cons");
  #ifndef NO_AD_INITIALIZE
    eac_cons.initialize();
  #endif
  ssq_cons.allocate(1,n_pred_grp,"ssq_cons");
  #ifndef NO_AD_INITIALIZE
    ssq_cons.initialize();
  #endif
  oac_cons_like_offset.allocate(1,n_pred_grp,"oac_cons_like_offset");
  #ifndef NO_AD_INITIALIZE
    oac_cons_like_offset.initialize();
  #endif
  age_like_cons.allocate(1,n_pred_grp,"age_like_cons");
  #ifndef NO_AD_INITIALIZE
    age_like_cons.initialize();
  #endif
  pred_cpup.allocate(1,n_pred_grp,styr,endyr_r,1,n_pred_ages,"pred_cpup");
  #ifndef NO_AD_INITIALIZE
    pred_cpup.initialize();
  #endif
  implied_cpuppa.allocate(1,n_pred_grp,styr,endyr_r,1,n_pred_ages,1,nstrata_pred,"implied_cpuppa");
  #ifndef NO_AD_INITIALIZE
    implied_cpuppa.initialize();
  #endif
  implied_obs_cons_bystrata.allocate(1,n_pred_grp,styr,endyr_r,1,n_pred_ages,1,nstrata_pred,"implied_obs_cons_bystrata");
  #ifndef NO_AD_INITIALIZE
    implied_obs_cons_bystrata.initialize();
  #endif
  implied_prop_Cmax.allocate(1,n_pred_grp,styr,endyr_r,1,n_pred_ages,1,nstrata_pred,"implied_prop_Cmax");
  #ifndef NO_AD_INITIALIZE
    implied_prop_Cmax.initialize();
  #endif
  max_F_yldcrv.allocate("max_F_yldcrv");
  #ifndef NO_AD_INITIALIZE
  max_F_yldcrv.initialize();
  #endif
  F_yldcrv.allocate(1,40,"F_yldcrv");
  #ifndef NO_AD_INITIALIZE
    F_yldcrv.initialize();
  #endif
  yield_curve.allocate(1,40,"yield_curve");
  #ifndef NO_AD_INITIALIZE
    yield_curve.initialize();
  #endif
  natmort_fut.allocate(1,nages,"natmort_fut");
  #ifndef NO_AD_INITIALIZE
    natmort_fut.initialize();
  #endif
  compweightsnew.allocate(1,n_pred_grp_nonpoll,"compweightsnew");
  #ifndef NO_AD_INITIALIZE
    compweightsnew.initialize();
  #endif
  comp_mcian_wgt_inv.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,"comp_mcian_wgt_inv");
  #ifndef NO_AD_INITIALIZE
    comp_mcian_wgt_inv.initialize();
  #endif
  comp_mcian_wgt.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,"comp_mcian_wgt");
  #ifndef NO_AD_INITIALIZE
    comp_mcian_wgt.initialize();
  #endif
  consweightsnew.allocate(1,n_pred_grp_nonpoll,"consweightsnew");
  #ifndef NO_AD_INITIALIZE
    consweightsnew.initialize();
  #endif
  cons_nr.allocate(1,n_pred_grp_nonpoll,1,nyrs_cons_nonpoll,"cons_nr");
  #ifndef NO_AD_INITIALIZE
    cons_nr.initialize();
  #endif
  comp_nr.allocate(1,n_pred_grp_nonpoll,1,comp_nr_ub,"comp_nr");
  #ifndef NO_AD_INITIALIZE
    comp_nr.initialize();
  #endif
  pred_rec_alpha.allocate("pred_rec_alpha");
  #ifndef NO_AD_INITIALIZE
  pred_rec_alpha.initialize();
  #endif
  srmod_rec_alpha.allocate("srmod_rec_alpha");
  #ifndef NO_AD_INITIALIZE
  srmod_rec_alpha.initialize();
  #endif
}

void model_parameters::preliminary_calculations(void)
{

#if defined(USE_ADPVM)

  admaster_slave_variable_interface(*this);

#endif
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
  len_like_offset.initialize();
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
        std_ob_bts(i)   = std_ob_bts_data(i)        ;
        ot_bts(i)       = sum(oac_bts_data(i)(mina_bts,nages)); // mina_bts is for totals
        ob_bts(i)       = obs_bts_data(i)            ;
        oac_bts(i )     = oac_bts_data(i)/sum(oac_bts_data(i));
        age_like_offset(igear)-=sam_bts(i)*oac_bts(i)*log(oac_bts(i) +MN_const);
      }
      else if (igear==3)
      {
        ob_ats(i)                  = obs_ats_data(i)            ;
        std_ob_ats(i)              = std_ob_ats_data(i)        ;
        oa1_ats(i)                 = oac_ats_data(i,1); // set observed age 1 index
        ot_ats(i)                  = sum(oac_ats_data(i)(mina_ats,nages));
        oac_ats(i)(mina_ats,nages) = oac_ats_data(i)(mina_ats,nages)/sum(oac_ats_data(i)(mina_ats,nages));
        age_like_offset(igear)     -= sam_ats(i)*oac_ats(i)(mina_ats,nages)*
                                   log(oac_ats(i)(mina_ats,nages) +MN_const);
      }
    }     
  }
  write_log(oac_ats); write_log(ot_ats); write_log(ob_ats);
  len_like_offset -= 50. * olc_fsh * log(olc_fsh + MN_const);
  ot_ats(n_ats_r) = sum(oac_ats_data(n_ats_r)(mina_ats,nages));
  // flag to ignore age 1's
  if (std_ot_ats(n_ats_r)/ot_ats(n_ats_r) > 0.4 ) ignore_last_ats_age1 = 1; else ignore_last_ats_age1=0;
  // cout <<" Last age comp in BTS: " << endl << oac_bts_data(n_bts) << endl;
  // cout <<" Age_like_offset:      " << endl << age_like_offset     << endl;
  Cat_Fut(1) = next_yrs_catch; //  catch guess                            
  // Simple decrement of future cathes to capture relationship between adjustments (below Bmsy) w/in same year
  for (i=2;i<=10;i++) 
    Cat_Fut(i) = Cat_Fut(i-1)*.90;
  write_log(Cat_Fut);
  // cout << "Next year's catch and decrements"<<endl<<Cat_Fut<<endl;
  lse_ats    = elem_div(std_ot_ats(1,n_ats_r),ot_ats);
  lse_ats    = sqrt(log(square(lse_ats) + 1.));
  lvar_ats   = square(lse_ats);
  var_ob_ats = elem_prod(std_ob_ats_data,std_ob_ats_data);
  for (i=1;i<=n_ats_r;i++) 
    lseb_ats(i) = (std_ob_ats(i)/ob_ats(i));
  lseb_ats   = sqrt(log(square(lseb_ats) + 1.));
  lvarb_ats  = square(lseb_ats);
  oac_cons_like_offset.initialize();
  for(j=1;j<=n_pred_grp;j++) {
    for (i=1;i<=nyrs_cons_nonpoll(j);i++) {
       oac_cons_nonpoll(j,i) = oac_cons_nonpoll(j,i)/sum(oac_cons_nonpoll(j,i));     
       oac_cons_like_offset(j) -=sam_oac_cons_nonpoll(j,i)*oac_cons_nonpoll(j,i)*log(oac_cons_nonpoll(j,i) +1e-3);
    }
  }
  write_log(oac_cons_nonpoll);
  write_log(oac_cons_like_offset);
    if (do_pred==2)
      M = M_matrix;
  Get_Age2length();
  write_log(lens);
  write_log(age_len);
  dvector olc_last(1,nlbins);
  // Print out length comp given last year's age data
  olc_last = oac_fsh(n_fsh_r) * age_len;
  write_log(olc_last);
}

void model_parameters::set_runtime(void)
{
  dvector temp1("{50,400,900,1800,1900,15000}");
  maximum_function_evaluations.allocate(temp1.indexmin(),temp1.indexmax());
  maximum_function_evaluations=temp1;
  dvector temp("{.001,.001,1e-7}");
  convergence_criteria.allocate(temp.indexmin(),temp.indexmax());
  convergence_criteria=temp;
}

void model_parameters::userfunction(void)
{
  fff =0.0;
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  if (active(yr_eff)||active(coh_eff))
    Est_Fixed_Effects_wts();
  Get_Selectivity();
  Get_Mortality_Rates();
  GetNumbersAtAge();
  Get_Catch_at_Age();
  if(active(log_resid_M))                // added by Paul
    Get_Cons_at_Age();
  GetDependentVar();  // Includes MSY, F40% computations
  Evaluate_Objective_Function();
  if (do_fmort || (ctrl_flag(28)>0))
    Profile_F();
  if (mceval_phase()) 
    write_eval();
  update_compweights();  //  added by Paul
}

void model_parameters::update_compweights(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  if(active(log_resid_M))
  {
    for (i=1;i<=n_pred_grp_nonpoll;i++)
    {
      compweightsnew(i) = 1.0/mean(comp_mcian_wgt_inv(i));  // weights for consumption age comps
      consweightsnew(i) = std_dev(cons_nr(i));              // weights for consumption estimates
    }
  }
  else
  {
    compweightsnew = compweights;
    consweightsnew = consweights;
  }
}

void model_parameters::Get_Selectivity(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  avgsel_fsh.initialize();
  avgsel_bts.initialize();
  avgsel_ats.initialize();
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
      log_sel_bts(i,1) = sel_age_one_bts*exp(sel_age_one_bts_dev(i));
  }
  else
    if (active(sel_devs_bts))
      log_sel_bts = compute_selectivity(n_selages_bts,styr_bts,avgsel_bts,sel_coffs_bts,sel_devs_bts,group_num_bts);
    else 
      log_sel_bts = compute_selectivity(n_selages_bts,styr_bts,avgsel_bts,sel_coffs_bts);
  if (active(sel_devs_ats))
    log_sel_ats = compute_selectivity_ats(n_selages_ats,styr_ats,avgsel_ats,sel_coffs_ats,sel_devs_ats);
    // log_sel_ats = compute_selectivity(n_selages_ats,styr_ats,avgsel_ats,sel_coffs_ats,sel_devs_ats,group_num_ats);
  else 
    log_sel_ats = compute_selectivity_ats(n_selages_ats,styr_ats,avgsel_ats,sel_coffs_ats);
  //cout<<"InSel"<<endl;
  sel_fsh = mfexp(log_sel_fsh);
  compute_Fut_selectivity();
}

void model_parameters::Get_Mortality_Rates(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  if (active(natmort_phi)) // Sensitivity approach for estimating natural mortality (as offset of input vector, NOT USED, NOT IN DOC)
    natmort(3,nages) = base_natmort(3,nages) * mfexp(natmort_phi);
  Fmort=  mfexp(log_avg_F + log_F_devs); // Eq. 2
  for (i=styr; i<=endyr_r; i++)
  {
    // if (i==styr) 
    if (do_pred !=2)
      M(i) = natmort;
    // else
      // M(i) = M(i-1)*mfexp(M_dev(i));
    F(i) = Fmort(i) * sel_fsh(i); // Eq. 2
    Z(i) = F(i) + M(i); // Eq. 1
  }
  S=mfexp(-1.0*Z); // Eq. 1
}

void model_parameters::GetNumbersAtAge(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  //-This calculates the first year's numbers at age, estimated freely (no equil. assumptions)
  Get_Bzero();
  for (i=styr;i<=endyr_r;i++)
    rec_epsilons(i)=log_rec_devs(i)+larv_rec_devs(nsindex(i),ewindex(i));
  log_initage=log_initdevs+log_avginit; 
  natage(styr)(2,nages)=mfexp(log_initage); // Eq. 1
  // Recruitment in subsequent years
  if(active(resid_temp_x1))
  {
    pred_rec_alpha = log(size_count(SST(styr-1,endyr_r-1))/sum(mfexp(resid_temp_x1*SST(styr-1,endyr_r-1)   + resid_temp_x2*elem_prod(SST(styr-1,endyr_r-1),SST(styr-1,endyr_r-1)))));
    for (i=styr;i<=endyr_r;i++)
    {
      natage(i,1) = mfexp(log_avgrec+rec_epsilons(i)+pred_rec_alpha + resid_temp_x1*SST(i-1) + resid_temp_x2*SST(i-1)*SST(i-1)); // Eq. 1
      pred_rec(i) = natage(i,1);
    }
  }
  else
  {
    for (i=styr;i<=endyr_r;i++)
    {
      natage(i,1) = mfexp(log_avgrec+rec_epsilons(i)); // Eq. 1
      pred_rec(i) = natage(i,1); 
    }  
  }
  // ***** start of thing by Paul  **********
  // *****  for each year, for each predator and age of pollock preyed upon, distribute the predator and prey across the strata,
  //           compute the predation in each strata with a functional response based on prey density, compute the consumption
  //           in each strata, update the pollock numbers in each area, and combine to get the natage and SSB for the next year  
  int ii;   // ages of prey
  int jj;   // number of predators 
  // switch to estimate predation mort, otherwise revert back to standad equations
  if(do_pred==1)
  {                       
    if(active(log_resid_M))   
      resid_M = mfexp(log_resid_M);
    else {
      resid_M(1) = 0.9;
      resid_M(2) = 0.45;
      resid_M(3) = 0.3;
    }
    if(active(log_resid_M))
    {
      a_II = mfexp(log_a_II);
      b_II = mfexp(log_b_II);
      a_II_vec = mfexp(log_a_II_vec);
      b_II_vec = mfexp(log_b_II_vec);
      for (i=1;i<=n_pred_grp;i++)
      {
        rho(i) = mfexp(log_rho(i));
        /*
        cout << "pred_grp is "  << i <<endl;
        cout << " log_rho(i) is "  << log_rho(i) << endl;
        cout << " mfexp(log_rho(i) is "  << mfexp(log(rho(i)))  <<  endl;
        cout << " sum(mfexp(log_rho(i))) "  << sum(mfexp(log_rho(i))) << endl;
        cout << "log_rho minus sum is "  << log_rho(i) -  log(sum(mfexp(log_rho(i)))) << endl;
        cout << " exponentiated is "  << mfexp(log_rho(i) -  log(sum(mfexp(log_rho(i))))) << endl;
        //log_rho(i) -=log(sum(mfexp(log_rho(i))));
        //log_rho2(i) = log_rho(i) - log(sum(exp(log_rho(i)))); 
        //rho(i) = rho(i)/sum(rho(i));
        cout << "actual is "  << rho(i) << endl;
        cout << " " << endl; 
        */
      }
    }
    else 
    {
      a_II = 0.0;
      b_II = 50.0;
      a_II_vec = 0.0;
      b_II_vec = 50.0;
      rho = 0.0;
    }
    // loop over years
    for (i=styr;i<=endyr_r;i++)
    {           
      SSB(i) = 0.0;          // set SSB for year to zero
      yr_ind = i - 1981;    // for getting the index for the wt_bts
      if(yr_ind<1) 
        yr_ind = 1;
    if(yr_ind>38) 
      yr_ind = 38;
      for (k=1;k<=n_pred_ages;k++)            // loop over ages of pollock that are preyed upon
      {           
        natage_strat(i,k) = natage(i,pred_ages(k))*poll_dist(k,i);       // distribute the age k pollock in each area  
        natage_strat_dens(i,k) = elem_div(natage_strat(i,k),area_pred);  // the density of age k pollock in each area
      }
      // do the multispecies funcction response thing    
      if (do_mult_func_resp==1)
      {
        for (j=1;j<=nstrata_pred;j++)  // loop over strata, and get the mean abundance accounting for all mortality
        {            
          M_pred_tmp = get_Mpred2(column(natage_strat_dens(i),j),resid_M,F(i)(1,n_pred_ages),
                                    column(Npred_bystrata_nonpoll(i),j),
                                    column(mn_wgt_nonpoll,i), 
                                    wt_bts(yr_ind)(1,n_pred_ages)*1000,
                                    column(Cmax_nonpoll(i),j),rho,
                                    a_II_vec,b_II_vec, j);
          // cout << "M_pred_tmp is "  << M_pred_tmp << endl;
          // loop to get the results in the right structure
          for (ii=1;ii<=n_pred_ages;ii++)
          {
            for (jj=1;jj<=n_pred_grp;jj++)
            {
              M_pred(i,ii,j,jj) = M_pred_tmp(jj,ii);
              //cout <<" prey age is " << ii<< " pred_grp is "<< jj << " strata is "  << j << " M_pred is " << M_pred(i,ii,j,jj) << endl;
            }     
          }
        }
      }   // loop if doing the multispecies functional response 
      // loop over ages of pollock that are preyed upon
      for (k=1;k<=n_pred_ages;k++)            
      {           
        // loop over strata, and get the mean abundance accounting for all mortality
        for (j=1;j<=nstrata_pred;j++)
        {            
          if (do_mult_func_resp != 1)   // loop is doing the single species functional response
          {
            //  natage_strat(styr,endyr_r,1,n_pred_ages,1,nstrata_pred)  // the number of poll by strata for a given year and age
            // Jim thinks this may be easier implemented by passing the indices (i,j,k)...
            M_pred(i,k,j) = get_Mpred(natage_strat_dens(i,k,j),
                                      F(i,pred_ages(k)),
                                      resid_M(k),
                                      column(natage_strat_dens(i),j),
                                      column(a_II,k),
                                      column(b_II,k),
                                      column(Npred_bystrata_nonpoll(i),j),
                                      column(mn_wgt_nonpoll,i)/(wt_bts(yr_ind,k)*1000),
                                      column(Cmax_nonpoll(i),j),rho);
            // e.g.,: M_pred(i,k,j) = get_Mpred(i,k,j);
          }
          M_pred_sum(i,k,j) = sum(M_pred(i,k,j));  // sum across the different predators
          natmort_pred(k,i,j) = M_pred_sum(i,k,j) + resid_M(k);
          Z_pred(i,k,j) = F(i,pred_ages(k)) + natmort_pred(k,i,j);   // get the total Z by year, pollock age, and strata
          S_pred(i,k,j) =  mfexp(-1.0*Z_pred(i,k,j));
        }                                // close strata loop 
        // cout << "M_pred is "  << M_pred<< endl;
        meannatage_bystrata(i,k) = elem_div(elem_prod(natage_strat(i,k),(1.-S_pred(i,k))),Z_pred(i,k)); // the mean number at age by strata      
        meannatage(i,k) = sum(meannatage_bystrata(i,k));             // the mean N summed across the strata
        mean_dens_bystrata(i,k) = elem_div(meannatage_bystrata(i,k),area_pred); 
        mean_dens(i,k) = (meannatage(i,k))/sum(area_pred);   // the mean density summed over the strata within a year and age 
        for (j=1;j<=nstrata_pred;j++)
        {            // loop over strata, and get the mean abundance accounting for all mortality
          for (m=1;m<=n_pred_grp;m++)
          {   // loop over predators, and get the consumption and M by predator, pollock age, year, and strata 
            cons(m,i,k,j) = M_pred(i,k,j,m)*meannatage_bystrata(i,k,j); 
          }
        } 
        M_pred_avg(k,i) = (M_pred_sum(i,k)*meannatage_bystrata(i,k))/sum(meannatage_bystrata(i,k));     // get an average M_pred across the strata, weighted by the beginning abundance in each strata                                                  
        // get the total survival by year, pollock age, and strata
        if(i < endyr_r) 
          natage(i+1,k+1) = natage_strat(i,k)*S_pred(i,k);     // the natage after predation (summed over strata) 
        SSB(i) +=  natage_strat(i,k)*pow(S_pred(i,k),yrfrac)*p_mature(pred_ages(k))*wt_ssb(i,pred_ages(k)); 
      } // end age loop
      SSB(i) += elem_prod(elem_prod(natage(i)(n_pred_ages+1,nages),
                   pow(S(i)(n_pred_ages+1,nages),yrfrac)),p_mature(n_pred_ages+1,nages))*wt_ssb(i)(n_pred_ages+1,nages); // Eq. 1 
      meannatage(i)(n_pred_ages+1,nages) = elem_prod(elem_div(1.-S(i)(n_pred_ages+1,nages),Z(i)(n_pred_ages+1,nages)),
                   natage(i)(n_pred_ages+1,nages));   // the mean n at age for the ages not preyed upon
      if (i < endyr_r) 
      {
        natage(i+1)(n_pred_ages+2,nages) = ++elem_prod(natage(i)(n_pred_ages+1,nages-1), S(i)(n_pred_ages+1,nages-1));
        natage(i+1,nages)               += natage(i,nages)*S(i,nages); // Eq. 1
      }
    } // end year loop
   // added by Paul to get M values the reflect the recent predation
    for (i=1;i<=n_pred_ages;i++)
    {
      natmort_fut(i) = mean(M_pred_avg(i)(endyr_r-4,endyr_r) + resid_M(i));      
    }
  }   //   ********* end of thing by Paul  *******************
  else 
  {
    SSB(styr)               = elem_prod(elem_prod(natage(styr),pow(S(styr),yrfrac)),p_mature)*wt_ssb(styr); // Eq. 1
    natage(styr+1)(2,nages) = ++elem_prod(natage(styr)(1,nages-1), S(styr)(1,nages-1));   // Eq. 1
    natage(styr+1,nages)   += natage(styr,nages)*S(styr,nages); // Eq. 1
    for (i=styr+1;i<endyr_r;i++)
    {
      SSB(i)               = elem_prod(elem_prod(natage(i),pow(S(i),yrfrac)),p_mature)*wt_ssb(i); // Eq. 1
      natage(i+1)(2,nages) = ++elem_prod(natage(i)(1,nages-1), S(i)(1,nages-1));   // Eq. 1
      natage(i+1,nages)   += natage(i,nages)*S(i,nages); // Eq. 1
    }
    SSB(endyr_r) = elem_prod(elem_prod(natage(endyr_r),pow(S(endyr_r),yrfrac)),p_mature)*wt_ssb(endyr_r); // Eq. 1
    meannatage   = elem_prod(elem_div(1.-S,Z),natage);
  }  // end else loop
  //meanrec = mean(pred_rec(styr_est,endyr_r));
  meanrec = mean(pred_rec(1978,endyr_r));  // *****  changed by Paul to hard-wire mean rec to 1978 onwards 
  /* // This function might replace the uglier one...
}

dvar_vector model_parameters::get_Mpred(const int& i,const int& j,const int& k)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  dvariable tmp_abun_bg    = natage_strat_dens(i,k,j);
  dvariable tmp_F          = F(i,pred_ages(k));
  dvariable tmp_M          = resit_M(k);
  dvar_vector tmp_abun_vec = column(natage_strat_dens(i),j);
  dvar_vector a            = column(a_II,k);
  dvar_vector b            = column(b_II,k);
  dvector Npred            = column(Npred_bystrata_nonpoll(i),j);
  dvector wt_ratio         = column(mn_wgt_nonpoll,i)/(wt_bts(yr_ind,k)*1000);
  dvector tmp_Cmax         = column(Cmax_nonpoll(i),j),rho);
      dvariable tmp_abun_end;    // the abundance at the end of the period
    dvariable avg_N;           // the average N within the year
    dvar_vector M_pred(1,n_pred_grp);          // Holling type II predation F (for each predator type)
    dvariable M_pred_sum;               // the total M_pred  
    dvariable prev_tmp_abun_end;    // the abundance at the end of the period, from the previous time step 
    if (tmp_abun_bg >0) 
    {
      tmp_abun_end = tmp_abun_bg*mfexp(-tmp_F -tmp_M);
      avg_N        = tmp_abun_bg*(1-mfexp(-tmp_F -tmp_M))/(tmp_F + tmp_M);
      M_pred       = elem_prod(elem_prod(wt_ratio,elem_prod(tmp_Cmax,elem_prod(a,Npred))),(1/(b+avg_N)));
      M_pred_sum   = sum(M_pred);
      //M_pred     = elem_prod(a,Npred)*(1/(b+avg_N));
      cout << "the weight ratio is " << endl;
      cout << wt_ratio << endl;
      cout << "the tmp_Cmax is  " << endl;
      cout << tmp_Cmax << endl;
      cout << "the a_II  " << endl;
      cout << a << endl;
      cout << "the Npred  " << endl;
      cout << Npred << endl;
      cout << "The b_II  " << endl;
      cout << b  << endl;
      cout << "The avg_N  " << endl;
      cout << avg_N  << endl;
      cout << "the M_pred  " << endl;
      cout << elem_prod(wt_ratio,elem_prod(tmp_Cmax,elem_prod(a,Npred)))*(1/(b+avg_N))   << endl;
      // Check this should be double not dvariable...
      double dd = 10.;
      int iter     = 0;
      // Check differentiability here...
      while (iter < 10) 
      {
        iter++;
        prev_tmp_abun_end = tmp_abun_end;
        tmp_abun_end = tmp_abun_bg*mfexp(-tmp_F -tmp_M -M_pred_sum);
        avg_N = tmp_abun_bg*(1-mfexp(-tmp_F -tmp_M -M_pred_sum))/(tmp_F + tmp_M + M_pred_sum);
        M_pred = elem_prod(elem_prod(wt_ratio,elem_prod(tmp_Cmax,elem_prod(a,Npred))),(1/(b+avg_N))); 
        M_pred_sum = sum(M_pred);
        //M_pred = elem_prod(a,Npred)*(1/(b+avg_N)); 
        dd =  value(prev_tmp_abun_end) / value(tmp_abun_end) - 1.;
        if (dd<0.) dd *= -1.;
        //  if(active(log_a_II)){
        //  cout <<"in loop  "<<iter<<" "<<tmp_abun_bg<<" "<<prev_tmp_abun_end<<" "<< tmp_abun_end<<" "<<"M_pred is "<< M_pred<<endl;
        //  cout << avg_N << endl;
        //  }
      }
    }
    else 
      M_pred = 0.0;
    RETURN_ARRAYS_DECREMENT();
    return M_pred;
    */
}

dvar_vector model_parameters::get_Mpred(const dvariable& tmp_abun_bg,const dvariable& tmp_F,const dvariable& tmp_M, const dvar_vector& tmp_abun_vec, const dvar_vector& a,const dvar_vector& b,const dvector& Npred, const dvector& wt_ratio, const dvector& tmp_Cmax, const dvar_matrix& rho)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
     // function to iterate to get the mean numbers, based on F, residual M, and predation M with type II function response
    RETURN_ARRAYS_INCREMENT();
    dvariable tmp_abun_end;    // the abundance at the end of the period
    dvariable avg_N;           // the average N within the year
    dvar_vector M_pred(1,n_pred_grp);          // Holling type II predation F (for each predator type)
    dvariable M_pred_sum;               // the total M_pred  
    dvariable prev_tmp_abun_end;    // the abundance at the end of the period, from the previous time step 
    if (tmp_abun_bg >0) 
    {
      tmp_abun_end = tmp_abun_bg*mfexp(-tmp_F -tmp_M);
      avg_N        = tmp_abun_bg*(1-mfexp(-tmp_F -tmp_M))/(tmp_F + tmp_M);
      M_pred       = elem_prod(elem_prod(wt_ratio,elem_prod(tmp_Cmax,elem_prod(a,Npred))),(1/(b+avg_N)));
      M_pred_sum   = sum(M_pred);
      //M_pred     = elem_prod(a,Npred)*(1/(b+avg_N));
      /*cout << "the weight ratio is " << endl;
      cout << wt_ratio << endl;
      cout << "the tmp_Cmax is  " << endl;
      cout << tmp_Cmax << endl;
      cout << "the a_II  " << endl;
      cout << a << endl;
      cout << "the Npred  " << endl;
      cout << Npred << endl;
      cout << "The b_II  " << endl;
      cout << b  << endl;
      cout << "The avg_N  " << endl;
      cout << avg_N  << endl;
      cout << "the M_pred  " << endl;
      cout << elem_prod(wt_ratio,elem_prod(tmp_Cmax,elem_prod(a,Npred)))*(1/(b+avg_N))   << endl;
      */
      // Check this should be double not dvariable...
      dvariable dd = 10.;
      int iter     = 0;
      // Check differentiability here...
      while (dd > 1e-6) 
      {
        iter++;
        prev_tmp_abun_end = tmp_abun_end;
        tmp_abun_end      = tmp_abun_bg*mfexp(-tmp_F -tmp_M -M_pred_sum);
        avg_N             = tmp_abun_bg*(1-mfexp(-tmp_F -tmp_M -M_pred_sum))/(tmp_F + tmp_M + M_pred_sum);
        M_pred            = elem_prod(elem_prod(wt_ratio,elem_prod(tmp_Cmax,elem_prod(a,Npred))),(1/(b+avg_N)));
        M_pred_sum        = sum(M_pred);
        dd                = prev_tmp_abun_end / tmp_abun_end - 1.;
        //M_pred          = elem_prod(a,Npred)*(1/(b+avg_N));
        if (dd<0.) 
          dd *= -1.;
        //  if(active(log_a_II)){
        //  cout <<"in loop  "<<iter<<" "<<tmp_abun_bg<<" "<<prev_tmp_abun_end<<" "<< tmp_abun_end<<" "<<"M_pred is "<< M_pred<<endl;
        //  cout << avg_N << endl;
        //  }
      }
    }
    else 
      M_pred = 0.0;
    RETURN_ARRAYS_DECREMENT();
    return M_pred;
}

dvar_matrix model_parameters::get_Mpred2(const dvar_vector& tmp_abun_vec, const dvar_vector& tmp_M_vec, const dvar_vector& F_vec, const dvector& Npred, const dvector& wts_pred, const dvector& wts_prey, const dvector& tmp_Cmax, const dvar_matrix& rho, const dvar_vector& a_vec,const dvar_vector& b_vec, const int strata)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // function to iterate to get the mean numbers, based on F, residual M, and predation M with type II function response
  RETURN_ARRAYS_INCREMENT();
  dvar_vector tmp_abun_end_vec(1,n_pred_ages);  // the abundance at the end of the period, by prey age      
  dvar_vector avg_N_vec(1,n_pred_ages); // the average N within the year, by prey age 
  dvar_matrix M_pred_mat(1,n_pred_grp,1,n_pred_ages);          // Holling type II predation F (for each predator type and prey age)
  dvar_vector M_pred_sum_vec(1,n_pred_ages);  // the total M_pred, by prey age group
  dvar_vector prev_tmp_abun_end_vec(1,n_pred_ages);  // the vector of abundances at the end of the period, from the previous time step   
  int ii;
  int jj;
  if (sum(tmp_abun_vec) >0.0) 
  {
    tmp_abun_end_vec = elem_prod(tmp_abun_vec,mfexp(-F_vec -tmp_M_vec));
    avg_N_vec = elem_prod(tmp_abun_vec,elem_div((1-mfexp(-F_vec -tmp_M_vec)),(F_vec + tmp_M_vec)));
    for (ii=1;ii<=n_pred_ages;ii++)   // loop over prey ages
    {
      for (jj=1;jj<=n_pred_grp;jj++)  // loop over number of predators   
      {
         M_pred_mat(jj,ii) = (tmp_Cmax(jj)* (wts_pred(jj)/wts_prey(ii)) *a_vec(jj)*Npred(jj)*rho(jj,ii))/
                               (b_vec(jj) + rho(jj)*avg_N_vec);
      }
      M_pred_sum_vec(ii) = sum(column(M_pred_mat,ii));
    } 
    dvector dd_vec(1,n_pred_ages);
    double dd_vec_sum = 10;
    int iter = 0;
    while (dd_vec_sum > 1e-6) 
    {
      iter++;
      prev_tmp_abun_end_vec = tmp_abun_end_vec;
      tmp_abun_end_vec = elem_prod(tmp_abun_vec,mfexp(-F_vec -tmp_M_vec -M_pred_sum_vec));
      avg_N_vec = elem_prod(tmp_abun_vec,elem_div((1-mfexp(-F_vec -tmp_M_vec -M_pred_sum_vec)),(F_vec + tmp_M_vec +M_pred_sum_vec)));
      for (ii=1;ii<=n_pred_ages;ii++)   // loop over prey ages
      {
        for (jj=1;jj<=n_pred_grp;jj++)  // loop over number of predators   
        {
          M_pred_mat(jj,ii) = (tmp_Cmax(jj)*(wts_pred(jj)/wts_prey(ii))*a_vec(jj)*Npred(jj)*rho(jj,ii))/(b_vec(jj) + rho(jj)*avg_N_vec);
        }
        M_pred_sum_vec(ii) = sum(column(M_pred_mat,ii));
      }
      for (ii=1;ii<=n_pred_ages;ii++)
      {
        if (tmp_abun_end_vec(ii)>0.0)   
          {
            dd_vec(ii) = value(prev_tmp_abun_end_vec(ii)) / value(tmp_abun_end_vec(ii)) - 1.;
            if (dd_vec(ii)<0.) dd_vec(ii) *= -1.;
          }              
        else dd_vec(ii) = 0.0;   
      }
      dd_vec_sum = sum(dd_vec);
    }  
  }
  else 
  {
    M_pred_mat = 0.0;
  }
  for (ii=1;ii<=n_pred_ages;ii++)
  {
     if (tmp_abun_end_vec(ii)==0.0) 
     {
        for (jj=1;jj<=n_pred_grp;jj++)  M_pred_mat(jj,ii) = 0.0; 
     }
  }  
  RETURN_ARRAYS_DECREMENT();
  return M_pred_mat;
}

void model_parameters::GetDependentVar(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
   // Spiffy SR resid-temp output (added by Paul)
  if (active(resid_temp_x1))
  {
    dvariable Xsst ;
    dvariable step;
    dvariable dist;
    dvariable low; 
    low = 0.9*min(SST);
    dist = 1.1*max(SST) - low;
    for (i=1;i<=40;i++)
    {
      fake_SST(i)=low + dist*(i-0.5)/39.5;  
      Xsst = fake_SST(i); 
      SRresidhat(i)= srmod_rec_alpha + resid_temp_x1*Xsst + resid_temp_x2*Xsst*Xsst;  
    }
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
     // added by Paul to get yld curve
    if (do_yield_curve)
    {
      max_F_yldcrv = get_spr_rates(0.10);   // set max F for yield curve to F10%
      dvariable Ftmp; 
      for (i=1;i<=40;i++)
      {
        F_yldcrv(i) = max_F_yldcrv*double(i-.5)/39.5;
        Ftmp = F_yldcrv(i); 
        yield_curve(i) = get_yield_curve(Ftmp);
        //yield_curve_fut(i) = get_yield_curve_fut(Ftmp);
      }
    }
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
    if (endyr_r>=2020)
    {
      regime(2) = mean(pred_rec(1978,2020));
      regime(5) = mean(pred_rec(1990,2020));
      regime(7) = mean(pred_rec(2000,2020));
      regime(8) = mean(pred_rec(1964,2020));
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
      // sel_fut  /=sel_fut(6); // NORMALIZE TO AGE 6
      sel_fut  /= mean(sel_fut); // NORMALIZE TO mean
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
}

void model_parameters::Future_projections_fixed_F(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
        ftmp= mean(F(endyr_r)) * ((double(k-1)-1.)*.05 + 0.5); // this takes endyr F and brackets it...for mean
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
    Fcur_Fmsy(k)   = mean(F_future(k,styr_fut))/mean(sel_fut*Fmsy);
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
    RelEffort(k)   = mean(F_future(k,styr_fut))/mean(F(endyr_r)) ; // Effort relative to endyr   
    LTA1_5(k)      = sum(natage_future(k,endyr_fut)(1,5))/sum(natage_future(k,endyr_fut)(6,nages));                                                   // long term average age 1_5
    LTA1_5R(k)     = LTA1_5(k)/(sumtmp1/sumtmp2);
  }   //End of loop over F's
}

dvariable model_parameters::get_SER(const dvariable& Ftmp)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::get_SER(dvar_vector& Ntmp, const dvariable& Ftmp)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::get_SER(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::compute_Fut_selectivity(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
  //sel_fut/=sel_fut(6); // NORMALIZE TO AGE 6
  sel_fut/=mean(sel_fut); // NORMALIZE TO mean
}

void model_parameters::compute_spr_rates(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  //Compute SPR Rates 
  F35 = get_spr_rates(.35);
  F40 = get_spr_rates(.40);
}

dvariable model_parameters::get_spr_rates(double spr_percent,dvar_vector sel)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::spr_ratio(dvariable trial_F,dvar_vector& sel)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::get_spr_rates(double spr_percent)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::spr_ratio(double trial_F)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::spr_ratio(dvariable trial_F)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::spr_unfished()
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::Get_Catch_at_Age(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  q_bts  = mfexp(log_q_bts);
  q_ats  = mfexp(log_q_ats);
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
      pred_avo(i)  = elem_prod(wt_avo(i), natage(iyr) ) * mfexp(log_sel_ats(iyr)) * q_avo; 
      // pred_avo(i)  = wt_fsh(iyr) * elem_prod(natage(iyr)  , avo_sel) * q_avo; 
      // pred_avo(i)  = wt_fsh(iyr) * natage(iyr)  * q_avo; 
    }
    for (i=1;i<=n_cope;i++)
    {
      iyr          = yrs_cope(i)+3;
      if (iyr<=endyr_r)
        pred_cope(i) = natage(iyr,3) ; 
    }
 //avo predicted values..
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
  for (i=1;i<=n_ats_ac_r;i++)
  {
    iyr          = yrs_ats_data(i);
    ntmp(1,nages)= elem_prod(natage(iyr),pow(S(iyr),.5));
    if (use_age_err)
      eac_ats(i)  = age_err * elem_prod(ntmp,mfexp(log_sel_ats(iyr))) * q_ats; // Eq. 15
    else
      eac_ats(i)  =           elem_prod(ntmp,mfexp(log_sel_ats(iyr))) * q_ats; 
    ea1_ats(i)  = ntmp(1); // NOTE that this is independent of selectivity function...
    eb_ats(i)   = wt_ats(i) * eac_ats(i); 
    et_ats(i)   = sum(eac_ats(i)(mina_ats,nages)); 
    eac_ats(i)(mina_ats,nages) /= et_ats(i);
  }
  // This is to deal with et_ats being greater than the age comps
  for (i=n_ats_ac_r;i<=n_ats_r;i++)
  {
    iyr          = yrs_ats_data(i);
    ntmp(1,nages)= elem_prod(natage(iyr),pow(S(iyr),.5));
    et_ats(i)    = sum( elem_prod(ntmp,mfexp(log_sel_ats(iyr)))(mina_ats,nages) ) * q_ats; 
  }
  // Experimental (not implemented nor used) for combining both surveys
  // if (Do_Combined && current_phase()>3) get_combined_index();
}

void model_parameters::Get_Cons_at_Age(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // added by Paul  
  // if doing the spatial predation thing, get the consumption at age
  for (i=styr;i<=endyr_r;i++)
  {
    for (k=1;k<=n_pred_ages;k++)
    {
      for (m=1;m<=n_pred_grp;m++)
      {
        cons_atage(m,i,k) = sum(cons(m,i,k));  // get ths consumption by predator, year, and age (summed over strata)
        pred_cpup(m,i,k)  = cons_atage(m,i,k)/N_pred(m,i);
      }    // predator loop
    }  // age loop
  }  // year loop
  for (i=styr;i<=endyr_r;i++)
  {
    yr_ind = i-1981;    // for getting the index for the wt_bts
    if(yr_ind<1) 
      yr_ind = 1;
    if(yr_ind>38) 
      yr_ind = 38;
    for (m=1;m<=n_pred_grp;m++)
    {
      cons_atage_wt(m,i) = elem_prod(cons_atage(m,i),wt_bts(yr_ind)(1,n_pred_ages));
      pred_cons(m,i)     = sum(cons_atage_wt(m,i));  // the predicted consumption by predator and year (summed over age and strata)
      eac_cons(m,i)      = cons_atage_wt(m,i)/pred_cons(m,i);  // the predicted consumption age comp (by predator and year)
    } // predator loop
  }  // year loop
  for (i=styr;i<=endyr_r;i++)
  {
    yr_ind = i-1981;    // for getting the index for the wt_bts
    if(yr_ind<1) 
      yr_ind = 1;
    if(yr_ind>38) 
      yr_ind = 38;
    for (m=1;m<=n_pred_grp;m++)
    {
      for (k=1;k<=n_pred_ages;k++)
      {
        // implied_obs_cons_bystrata(m,i,k) = obs_cons_natage_nonpoll(m,i,k)*(cons(m,iyr,k)/cons_atage(m,iyr,k));
        implied_obs_cons_bystrata(m,i,k) = cons(m,i,k);            
        for (z=1;z<=nstrata_pred;z++) 
        {
          if (Npred_bystrata_nonpoll(i,m,z)>0) 
          {
            implied_cpuppa(m,i,k,z)    = implied_obs_cons_bystrata(m,i,k,z)/(Npred_bystrata_nonpoll(i,m,z)*area_pred(z));
            implied_prop_Cmax(m,i,k,z) = (implied_cpuppa(m,i,k,z)*area_pred(z))/
                                ((mn_wgt_nonpoll(m,i)/(wt_bts(yr_ind,k)*1000))*Cmax_nonpoll(i,m,z));
            //  old code here -- used in model runs for Brazil paper
            //  implied_cpuppa(m,i,k,z) = 
            //   (implied_obs_cons_bystrata(m,i,k,z)*((wt_bts(yr_ind,k)*1000)/mn_wgt_nonpoll(m,iyr)))/
            //          (Cmax_nonpoll(iyr,m,z)*Npred_bystrata_nonpoll(iyr,m,z)*area_pred(z));
            //  implied_prop_Cmax(m,i,k,z) = implied_cpuppa(m,i,k,z)*area_pred(z);
          } 
          else 
          {
            implied_cpuppa(m,i,k,z)    = -9;
            implied_prop_Cmax(m,i,k,z) = -9;
          }
          /*cout <<"year is "<<yrs_cons_nonpoll(i)<<", pred is "<<m<<", prey age is "<<k<<"strata is "<<z<<endl;
          cout << "implied_obs_cons_bystrata is "<< implied_obs_cons_bystrata(m,i,k,z) << endl;
          cout << "poll wghts "<< wt_bts(yr_ind,k)*1000 << endl; 
          cout << "atf wghts "<< mn_wgt(m,iyr) << endl;
          cout << "Cmax is " << Cmax(iyr,m,z) << endl;
          cout << "Npred_bystrata is "<< Npred_bystrata(iyr,m,z) << endl;
          cout << "area_pred is " << area_pred(z) << endl;
          cout << "implied_cpuppa(m,i,k,z) is " << implied_cpuppa(m,i,k,z) << endl;
          */
        }
      }
    }
  }
}

void model_parameters::get_combined_index(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  {
    int i_ats=2; // NOTE Start at 2nd year of data (ignores 1979 survey for combined run)
    for ( i=1;i<=n_bts_r;i++)
    {
      dvar_vector bts_tmp(mina_bts,nages);
      dvariable Ng_bts;
      dvariable Ng_ats;
      iyr     = yrs_bts_data(i);
      bts_tmp = ot_bts(i)*oac_bts(i)(mina_bts,nages);
      Ng_bts  = bts_tmp *(1./mfexp(log_sel_bts(iyr)(mina_bts,nages)))/q_bts ;
      if (yrs_ats_data(i_ats) == yrs_bts_data(i))
      {
        dvar_vector ats_tmp(mina_bts,nages);
        ats_tmp = ot_ats(i_ats)*oac_ats(i_ats)(mina_bts,nages);
        Ng_ats = ats_tmp *(1./mfexp(log_sel_ats(iyr)(mina_bts,nages)))/q_ats ; 
        ot_cmb(i) = 0.5*(Ng_ats + Ng_bts);
        var_cmb(i)  = .25*square(std_ot_bts(i)     * Ng_bts/sum(bts_tmp));
        var_cmb(i) += .25*square(std_ot_ats(i_ats) * Ng_ats/sum(ats_tmp));
        avail_ats(i) = q_ats * mfexp(log_sel_ats(iyr)(mina_bts,nages)) * oac_ats(i_ats)(mina_bts,nages);
        //Increment ats year counter
        i_ats++;
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
}

void model_parameters::get_msy(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_vector model_parameters::get_msy_wt()
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::get_yield_wt(dvariable& Ftmp)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::get_yield_wt(dvariable& Ftmp, double& Stmp,double& Rtmp,dvariable& Btmp)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::get_yield(dvariable& Ftmp, dvariable& Stmp,dvariable& Rtmp,dvariable& Btmp)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::get_yield_curve(dvariable& Ftmp)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // simplier eq yield function, w/o Stmp, Rtmp, and Btmp. Used to make yield curve
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
  RETURN_ARRAYS_DECREMENT();
  return yield;
}

dvariable model_parameters::get_avg_age(dvariable& Ftmp, dvariable& Stmp,dvariable& Rtmp,dvariable& Btmp)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::SRecruit(const dvariable& Stmp)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_vector model_parameters::SRecruit(const dvar_vector& Stmp)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::Requil(const dvariable& phi)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::Get_Bzero(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::Recruitment_Likelihood(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
    // SRR estimated for a specified window of years, with optional SST effect 
    if (active(resid_temp_x1))    
    {
      srmod_rec_alpha = log(size_count(SST(styr_est-1,endyr_est-1))/sum(mfexp(resid_temp_x1*SST(styr_est-1,endyr_est-1)   + resid_temp_x2*elem_prod(SST(styr_est-1,endyr_est-1),SST(styr_est-1,endyr_est-1)))));
      for (i=styr_est;i<=endyr_est;i++)
      {
        srmod_rec(i)      = SRecruit(SSB(i-1))*mfexp(srmod_rec_alpha  +  resid_temp_x1*SST(i-1) + resid_temp_x2*SST(i-1)*SST(i-1)); ///1 year lag w/ SSB and sst
        SR_resids_temp(i) = srmod_rec_alpha +  resid_temp_x1*SST(i-1) + resid_temp_x2*SST(i-1)*SST(i-1);  //***** added by Paul ******, log scale resids due to temp
      }
    }
    else
    {
      for (i=styr_est;i<=endyr_est;i++)
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
}

void model_parameters::Evaluate_Objective_Function(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // if (active(repl_F))
  Recruitment_Likelihood();
  Surv_Likelihood();  //-survey Deviations
  Selectivity_Likelihood();  
  catch_like = norm2(log(obs_catch(styr,endyr_r)+1e-4)-log(pred_catch+1e-4));
  if (current_phase() >= robust_phase)
    Robust_Likelihood();       //-Robust AGE  Likelihood part
  else  
    Multinomial_Likelihood();  //-Multinomial AGE  Likelihood part
  fff += ctrl_flag(1) * catch_like;
  fff += ctrl_flag(2) * sum(surv_like);
  fff += ctrl_flag(12) * cpue_like;
  fff += ctrl_flag(6) * avo_like;
  fff += ctrl_flag(3) * sum(rec_like);
  if (phase_cope>0 & current_phase()>=phase_cope)
    fff += cope_like;
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
  dvariable q_ats_tmp;
  q_ats_tmp.initialize();
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
  for ( i=1;i<=n_ats_r;i++)
  {
    iyr = yrs_ats_data(i);
    q_ats_tmp += sum(mfexp(log_q_ats + log_sel_ats(iyr)(q_amin,q_amax)));
  }
  q_ats_tmp /= ((q_amax-q_amin+1)*n_ats_r) ;
  q_all= log(q_bts_tmp + q_ats_tmp)     ;
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
  fff += 10.*square(avgsel_ats);
 /*
  if (active(wt_fut))
    for (j=1;j<=nages;j++)
    {
      dvariable res = wt_mn(j)-wt_fut(j);
      fff += res*res/ (2.*wt_sigma(j)*wt_sigma(j));
    }
 */
 // things added by Paul
 dvariable tmp6;
 dvariable tmp7;
 dvariable tmp1;
 dvariable tmp2;
  // things added by Paul
  if(do_pred==1) 
  {  
    int z;
    if(active(log_resid_M))    
      Fit_resid_M();
    if(active(log_resid_M))
    {
      ssq_cons.initialize();
      age_like_cons.initialize();
      //ssq_cpup.initialize();
      // stuff added by Paul to compute number for McAllister-Ianelli weights
      for (j=1;j<=n_pred_grp;j++)
      {
        z=0;
        for (i=1;i<=nyrs_cons_nonpoll(j);i++)
        {
          iyr                     = yrs_cons_nonpoll(j,i);
          ssq_cons(j)            += square(log(obs_cons_nonpoll(j,i)+1e-4)-log(pred_cons(j,iyr)+1e-4))/(2.*pow(consweights(j)*sqrt(0.1),2));
          fff                    += ssq_cons(j);
          cons_nr(j,i)            = (log(obs_cons_nonpoll(j,i)+1e-4)-log(pred_cons(j,iyr)+1e-4))/(sqrt(0.1));
          age_like_cons(j)       -= sam_oac_cons_nonpoll(j,i)*oac_cons_nonpoll(j,i)*log(eac_cons(j,iyr) + 1e-3);
          tmp6                    = (eac_cons(j,iyr)+0.00001)*(1.-(eac_cons(j,iyr)+0.00001));
          tmp7                    = ((oac_cons_nonpoll(j,i)+0.00001) - (eac_cons(j,iyr) + 0.00001))* ((oac_cons_nonpoll(j,i)+0.00001) - (eac_cons(j,iyr) + 0.00001));
          comp_mcian_wgt(j,i)     = (tmp6/tmp7)/sam_oac_cons_nonpoll_raw(j,i);
          comp_mcian_wgt_inv(j,i) = 1.0/comp_mcian_wgt(j,i);
          for (k=1;k<=n_pred_ages;k++)
          {
            z++;
            tmp1         = (oac_cons_nonpoll(j,i,k)+0.00001) - (eac_cons(j,iyr,k) + 0.00001);
            tmp2         = (eac_cons(j,iyr,k)+0.00001)*(1.-(eac_cons(j,iyr,k)+0.00001)  );
            comp_nr(j,z) = tmp1/sqrt(tmp2/sam_oac_cons_nonpoll(j,i));
          }
       //  for (k=1;k<=n_pred_ages;k++) {     
       //       ssq_cpup(j,k) += square(log(obs_cpup_nonpoll(j,i,k)+1e-4)-log(pred_cpup(j,iyr,k)+1e-4));
       //    }
        }   // loop over years where we have consumption estimates
      }  // predator loop
        //cout << " b4 the offset, the age_like_cons are " << age_like_cons << endl;
        //cout << " the offsets are " << oac_cons_like_offset << endl;
      for (j=1;j<=n_pred_grp;j++)
        age_like_cons(j)-=oac_cons_like_offset(j);
      //cout << " after the offset, the age_like_cons are " << age_like_cons << endl;     
      fff += sum(age_like_cons);
      ///  fff += sum(ssq_cpup);   
    }  // check if function response terms are active    
  }  // if statement to check if spatial predation is being estimated
 // +===+====+==+==+==+==+==+==+==+====+====+==+==+===+====+==+==+==+==+==+==+==+====+====+====+
}

void model_parameters::Selectivity_Likelihood(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  sel_like.initialize();
  // For logistic fishery selectivity option (sensitivity)
  if (active(sel_dif2_fsh)) 
  {
    sel_like(1) += .01 * sel_dif2_fsh*sel_dif2_fsh ;
  }
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
  for (i=styr_ats;i<= endyr_r;i++) //--This is for selectivity shape HYDROA TRAWL SURVEY
    for (j=mina_ats;j<=n_selages_ats;j++)
      if (log_sel_ats(i,j)<log_sel_ats(i,j+1))
        sel_like(3) += ctrl_flag(15) * square(log_sel_ats(i,j)-log_sel_ats(i,j+1));
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
    if (active(sel_age_one_bts_dev))
      sel_like_dev(2) += 8.*norm2(first_difference(sel_age_one_bts_dev)); // 25% CV on this
      // sel_like_dev(2) += 3.125*norm2(first_difference(sel_age_one_bts_dev)); // 40% CV on this
  }
  //////////////////////////////////////////////////////////////////////////////////
  dvar_vector like_tmp(1,4);
  like_tmp.initialize();
  like_tmp(1)  = ctrl_flag(22) * norm2(first_difference( first_difference(log_sel_ats(styr))));
  if (active(sel_devs_ats))
  {
    for (i=1;i<=nch_ats;i++)
    {
      like_tmp(1) += ctrl_flag(22) * norm2(first_difference( first_difference(log_sel_ats(yrs_ch_ats(i)))));
      like_tmp(2) += norm2(log_sel_ats(yrs_ch_ats(i)-1) - log_sel_ats(yrs_ch_ats(i))) / 
                         (2*sel_ch_sig_ats(i) * sel_ch_sig_ats(i));
    }
  }
  sel_like_dev(3)  = sum(like_tmp);
}

void model_parameters::Surv_Likelihood(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
    for (i=1;i<=n_ats_r;i++)
      surv_like(2) += .01*square(log(ot_ats(i)+.01)-log(et_ats(i)+.01))/ (2.*lvar_ats(i)) ;
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
    if (do_ats_bio)
    {
      for (i=1;i<=n_ats_r;i++) // Eq. 19
        surv_like(2) += square(log(ob_ats(i)+.01)-log(eb_ats(i)+.01))/ (2.*lvarb_ats(i)) ;
        // #surv_like(2) += square(log(ob_ats(i)+.01)-log(eb_ats(i)+.01))/ (2.*var_ob_ats(i)) ;
    } 
    else
    {
      for (i=1;i<=n_ats_r;i++) // Eq. 19
        surv_like(2) += square(log(ot_ats(i)+.01)-log(et_ats(i)+.01))/ (2.*lvar_ats(i)) ;
    }
    surv_like(2) *= ctrl_flag(2);
  }
  if (use_age1_ats) 
  {
    // Compute q for this age1 index...
    dvariable qtmp = mfexp(mean(log(oa1_ats)-log(ea1_ats)));
    if (ignore_last_ats_age1)
      surv_like(3) = 0.5*norm2(log(oa1_ats(1,n_ats_r-1)+.01)-log(ea1_ats(1,n_ats_r-1)*qtmp +.01))/(age1_sigma_ats*age1_sigma_ats) ; 
    else
      surv_like(3) = 0.5*norm2(log(oa1_ats+.01)-log(ea1_ats*qtmp +.01))/(age1_sigma_ats*age1_sigma_ats) ; 
  }
  avo_like.initialize();
  cpue_like.initialize();
  cope_like.initialize();
  dvar_vector cpue_dev = obs_cpue-pred_cpue;
  for (i=1;i<=n_cpue;i++)
    cpue_like += square(cpue_dev(i))/(2.*obs_cpue_var(i));
  dvar_vector avo_dev = obs_avo-pred_avo;
  for (i=1;i<=n_avo_r;i++)
    avo_like += square(avo_dev(i))/(2.*obs_avo_var(i));
  // if (phase_cope>0 & current_phase()>=phase_cope)
  if (last_phase())
  {
    if (phase_cope>0)
    {
    // Compute q for this age1 index...
    int ntmp = n_cope - (yrs_cope(n_cope)+3-endyr_r);
    dvariable qtmp = mfexp(mean(log(obs_cope(1,ntmp))-log(pred_cope(1,ntmp))));
    for (i=ntmp+1;i<=n_cope;i++)
      pred_cope(i) = obs_cope(i)/qtmp;
    pred_cope *= qtmp;
      // dvar_vector cope_dev = obs_cope-pred_cope;
      for (i=1;i<=n_cope;i++)
        cope_like += square(log(obs_cope(i))-log(pred_cope(i)))/ (2.*lvar_cope(i)) ;
        // cope_like += square(cope_dev(i))/(2.*square(obs_cope_std(i)));
    }
  }
  /* // This is for projecting Nage_3 but left out for now
  else
  {
    if (sd_phase())
    {
      for (i=1;i<=n_cope;i++)
      {
        if (yrs_cope(i)>endyr_r)
          Nage_3(i) = natage_future(3,yrs_cope(i),3);
        else
          Nage_3(i) = natage(yrs_cope(i),3);
      }
    }
  }
  */
  if (sd_phase())
    Nage_3 = column(natage,3);
}

void model_parameters::Robust_Likelihood(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  age_like.initialize();
  len_like.initialize();
  // dvariable robust_p(const dmatrix& obs,const dvar_matrix& pred,const dvariable& a,const dvariable& b)
  dvariable  rf=.1/nages;
  age_like(1) = robust_p(oac_fsh,eac_fsh,rf,sam_fsh);
  age_like(2) = robust_p(oac_bts,eac_bts,rf,sam_bts);
  if (current_phase() >= ats_robust_phase ) // ats robustness phase big number means do multinomial, not robust
    age_like(3) = robust_p(oac_ats,eac_ats,rf,sam_ats,mina_ats,nages);
  else // Multinomial for EIT
    for (i=1; i <= nagecomp(3); i++) 
      age_like(3) -= sam_ats(i)*oac_ats(i)(mina_ats,nages)*log(eac_ats(i)(mina_ats,nages) + MN_const);
  len_like    = robust_p(olc_fsh,elc_fsh,rf,50);
}

void model_parameters::Multinomial_Likelihood(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
          age_like(igear) -= sam_ats(i)*oac_ats(i)(mina_ats,nages)*log(eac_ats(i)(mina_ats,nages) +MN_const);
          break;
      }
    }     
    age_like(igear)-=age_like_offset(igear);
  }
  //len_like = sam_fsh(n_fsh_r)*olc_fsh*log(elc_fsh+MN_const);
  len_like = -50*olc_fsh*log(elc_fsh+MN_const) - len_like_offset ;
  // this one allows a concentrated range of ages (last two args are min and max age range)
}

dvariable model_parameters::robust_p(dmatrix& obs,dvar_matrix& pred,const dvariable& a, const data_ivector& b, const int amin, const int amax)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::robust_p(const dmatrix& obs,const dvar_matrix& pred,const dvariable& a, const data_ivector& b)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::robust_p(const dmatrix& obs, const dvar_matrix& pred, const dvariable& a, const dvariable& b)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::robust_p(const dvector& obs, const dvar_vector& pred, const dvariable& a, const dvariable& b)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::write_srec(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::write_eval(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
      if(do_temp){
        write_mceval(resid_temp_x1);
        write_mceval(resid_temp_x2);
      }
      write_mceval <<endl;
      // stuff added by Paul for posterior predictive distribution
      // write_mceval_ppl(count_mcmc);
      // write_mceval_ppl(fff);  
      // write_mceval_ppl(eb_bts);
      for (i=1;i<=n_bts_r;i++){
        double cvtmp = std_ob_bts(i)/ob_bts(i);
        double lnstd = sqrt(log(square(cvtmp) + 1.));
        double simtmp= mfexp(rnorm(log(value(eb_bts(i))) , lnstd, rng));
        mceval_ppl << "BTS,"  
                  << fff        << ","
                  << count_mcmc << ","
                  << yrs_bts_data(i)<<","
                  << ob_bts(i)<<","
                  << eb_bts(i) <<","
                  << simtmp      <<","
                  << var_ob_bts(i) <<" "
                  <<endl;
      }
      for (i=1;i<=n_ats_r;i++){
        double cvtmp = std_ob_ats(i)/ob_ats(i);
        double lnstd = sqrt(log(square(cvtmp) + 1.));
        double simtmp= mfexp(rnorm(log(value(eb_ats(i))) , lnstd, rng));
        mceval_ppl << "ATS,"  
                  << fff        << ","
                  << count_mcmc << ","
                  << yrs_ats_data(i)<<","
                  << ob_ats(i)<<","
                  << eb_ats(i) <<","
                  << simtmp      <<","
                  << var_ob_ats(i) <<" "
                  <<endl;
      }
      for (i=1;i<=n_avo;i++){
        double cvtmp = obs_avo_std(i)/obs_avo(i);
        double lnstd = sqrt(log(square(cvtmp) + 1.));
        double simtmp= mfexp(rnorm(log(value(pred_avo(i))) , lnstd, rng));
        mceval_ppl << "AVO,"  
                  << fff        << ","
                  << count_mcmc << ","
                  << yrs_avo(i)<<","
                  << obs_avo(i)<<","
                  << pred_avo(i) <<","
                  << simtmp      <<","
                  << obs_avo_var(i) <<" "
                  <<endl;
      }
      for (i=1;i<=n_cpue;i++){
        mceval_ppl << "CPUE,"  
                  << fff        << ","
                  << count_mcmc << ","
                  << yrs_cpue(i)<<","
                  << obs_cpue(i)<<","
                  << pred_cpue(i) <<","
                  << mfexp(rnorm(log(value(pred_avo(i))) , obs_avo_std(i), rng)) <<","
                  << obs_avo_var(i) <<" "
                  <<endl;
      }
  // !! write_log(sam_fsh);write_log(sam_bts);write_log(sam_ats);
  // !! write_log(oac_fsh_data);write_log(yrs_bts_data);write_log(yrs_ats_data);
      if(count_mcmc==1)
      {
        for (i=1;i<=n_fsh_r;i++)
        {
          mceval_ac_ppl << "0 oac" <<" fsh " << yrs_fsh_data(i)<<" " <<  oac_fsh(i) <<endl;
        }
        for (i=1;i<=n_bts_r;i++)
        {
          mceval_ac_ppl << "0 oac" <<" bts " << yrs_bts_data(i)<<" 0 " <<  oac_bts(i)(mina_bts,nages) <<endl;
        }
        for (i=1;i<=n_ats_r;i++)
        {
          mceval_ac_ppl << "0 oac" <<" ats " << yrs_ats_data(i)<<" 0 " <<  oac_ats(i)(mina_ats,nages) <<endl;
        }
      }
      else
      {
        for (i=1;i<=n_fsh_r;i++)
        {
          mceval_ac_ppl << count_mcmc<<" eac fsh " << yrs_fsh_data(i)<<" " <<  eac_fsh(i) <<endl;
          mceval_ac_ppl << count_mcmc<<" sim fsh " << yrs_fsh_data(i)<<" " <<  rmultinomial(value(eac_fsh(i)),sam_fsh(i)) <<endl;
        }
        for (i=1;i<=n_bts_r;i++)
        {
          mceval_ac_ppl << count_mcmc<<" eac bts " << yrs_bts_data(i)<<" 0 " <<  eac_bts(i)(mina_bts,nages)  <<endl;
          mceval_ac_ppl << count_mcmc<<" sim bts " << yrs_bts_data(i)<<" 0 " <<  rmultinomial(value(eac_bts(i)(mina_bts,nages) ),sam_bts(i)) <<endl;
        }
        for (i=1;i<=n_ats_r;i++)
        {
          mceval_ac_ppl << count_mcmc<<" eac ats " << yrs_ats_data(i)<<" 0 " <<  eac_ats(i)(mina_ats,nages)  <<endl;
          mceval_ac_ppl << count_mcmc<<" sim ats " << yrs_ats_data(i)<<" 0 " <<  rmultinomial(value(eac_ats(i)(mina_ats,nages)),sam_ats(i)) <<endl;
        }
      }
      for (i=1;i<=n_bts_r;i++){
        write_mceval_eac_bts(count_mcmc);
        write_mceval_eac_bts(fff);
        write_mceval_eac_bts(yrs_bts_data(i));
        write_mceval_eac_bts(eac_bts(i));
        write_mceval_eac_bts <<endl;
      }
      write_mceval_eb_bts(count_mcmc);
      write_mceval_eb_bts(fff);  
      write_mceval_eb_bts(eb_bts);
      write_mceval_eb_bts <<endl;
      write_mceval_eb_ats(count_mcmc);
      write_mceval_eb_ats(fff);  
      write_mceval_eb_ats(eb_ats);
      write_mceval_eb_ats <<endl;
      write_mceval_ea1_ats(count_mcmc);
      write_mceval_ea1_ats(fff);  
      write_mceval_ea1_ats(ea1_ats*mfexp(mean(log(oa1_ats)-log(ea1_ats))));
      write_mceval_ea1_ats <<endl;
      write_mceval_pred_catch(count_mcmc);
      write_mceval_pred_catch(fff);  
      write_mceval_pred_catch(pred_catch);
      write_mceval_pred_catch <<endl;
      write_mceval_mnwt(count_mcmc);
      write_mceval_mnwt(fff);  
      write_mceval_mnwt(mnwt);
      write_mceval_mnwt <<endl;
      for (i=1;i<=n_fsh_r;i++){
        write_mceval_eac_fsh(count_mcmc);
        write_mceval_eac_fsh(fff);
        write_mceval_eac_fsh(yrs_fsh_data(i));
        write_mceval_eac_fsh(eac_fsh(i));
        write_mceval_eac_fsh <<endl;
      }
      for (i=1;i<=n_bts_r;i++){
        write_mceval_eac_bts(count_mcmc);
        write_mceval_eac_bts(fff);
        write_mceval_eac_bts(yrs_bts_data(i));
        write_mceval_eac_bts(eac_bts(i));
        write_mceval_eac_bts <<endl;
      }
      for (i=1;i<=n_ats_r;i++){
        write_mceval_eac_ats(count_mcmc);
        write_mceval_eac_ats(fff);
        write_mceval_eac_ats(yrs_ats_data(i));
        write_mceval_eac_ats(eac_ats(i));
        write_mceval_eac_ats <<endl;
      }
      for (i=1;i<=nyrs_data(1);i++){
        write_mceval_fsh_wt(count_mcmc);
        write_mceval_fsh_wt(fff);
        write_mceval_fsh_wt(yrs_data(1,i));
        write_mceval_fsh_wt(wt_hat(1,i));
        write_mceval_fsh_wt <<endl;
      }
     for (i=1;i<=nyrs_data(2);i++){
        write_mceval_srv_wt(count_mcmc);
        write_mceval_srv_wt(fff);
        write_mceval_srv_wt(yrs_data(2,i));
        write_mceval_srv_wt(wt_hat(2,i));
        write_mceval_srv_wt <<endl;
      }
      write_mceval_pred_cpue(count_mcmc);
      write_mceval_pred_cpue(fff);  
      write_mceval_pred_cpue(pred_cpue);
      write_mceval_pred_cpue <<endl;
      write_mceval_pred_avo(count_mcmc);
      write_mceval_pred_avo(fff);  
      write_mceval_pred_avo(pred_avo);
      write_mceval_pred_avo <<endl;
      Profile_F();
      // eval<< "Obj_Fun steep q AvgRec SER_endyr SSBendyr_B40 1989_YC 1992_YC 1996_YC 2000YC MSYR Bmsy3+ Fmsy F35 SER_Fmsy SER_Endyr SBF40 Bcur_Bmsy Cur_Sp F40Catch Steepness Q CC1_1 CC1_2 CC1_3 CC2_1 CC2_2 CC2_3"<<endl;
      // eval <<" Future ssb"<<endl;
      // pflag=1;
      // for (j=4;j<=5;j++) eval<< future_SSB(j) << " "; eval<<endl;
      // eval << Bmsy<<" "<< future_SSB(4)<<" "<<future_SSB(5)<<" "<<future_SSB(6) <<endl;
      // eval<<"SPR: "<<SPR_OFL<<" Fmsy "<<Fmsy   <<" "<< future_catch(3,endyr+1)    <<endl;
    }
  }
}

void model_parameters::write_nofish(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::write_projout2(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::write_newproj(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::write_projout(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::SimulateData1(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
  dvector eac_ats_fut(1,nages);
  eac_fsh_fut.initialize();
  eac_bts_fut.initialize();
  eac_ats_fut.initialize();
  // simply the last year's catch expectation (e.g., since 2007 data unavailable in 2007, 2006 for 2007 projection)
  eac_fsh_fut = value(catage(endyr_r)); 
  // BTS expectation for 2007 projection
  eac_bts_fut = value(elem_prod(ntmp,mfexp(log_sel_bts(endyr_r))) * q_bts); 
  // EIT expectation for 2007 projection
  eac_ats_fut = value(elem_prod(ntmp,mfexp(log_sel_ats(endyr_r))) * q_ats); 
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
    simdat<< styr_ats         <<endl;
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
      simdat << n_ats+1       <<endl;
    // else
      // simdat << n_ats         <<endl;
    simdat << yrs_fsh_data    <<endl;
    simdat << yrs_fsh_data(n_fsh)+1   <<endl;
    simdat << yrs_bts_data             <<endl;
    simdat << yrs_bts_data(n_bts)+1    <<endl;
    simdat << yrs_ats_data             <<endl;
    // if(Sim_status==1) 
      simdat << yrs_ats_data(n_ats)+1    <<endl;// Nota
    simdat << sam_fsh         <<endl;
    simdat << sam_fsh(n_fsh)  <<endl;
    simdat << sam_bts         <<endl;
    simdat << sam_bts(n_bts)  <<endl;
    simdat << sam_ats         <<endl;
  // if(Sim_status==1) 
    simdat << sam_ats(n_ats)<<endl;
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
    // sigmasq=norm2(log(et_ats+.01)-log(ot_ats+.01))/size_count(et_ats);
    // sigma=sqrt(sigmasq);
    sigma   = 0.200;
    sigmasq = sigma*sigma;
    ran_age_vect.fill_randn(rng);
    dvector ats_tmp(1,nages);
    ats_tmp = value(mfexp(-sigmasq/2.) * elem_prod(mfexp(sigma * ran_age_vect) , eac_ats_fut));
    simdat << "# EIT Trawl survey stdevs for total N "<<endl;
    simdat <<   std_ot_ats <<" "<< sum(ats_tmp)*.2<<endl;
    simdat << "# EIT Trawl survey simulate age compositions "<<endl;
    simdat <<  oac_ats_data         <<endl;
    // Simulate next year's EIT survey age compositions and totals....TODO
    simdat << ats_tmp <<endl;
    simdat << "# EIT Biomass estimates "                    <<endl;
    simdat << obs_ats_data<<" "<<eac_ats_fut * wt_ats(n_ats)<<endl;
    simdat << "# BTS Biomass std errors "                   <<endl;
    simdat << std_ob_ats_data<<" "<<std_ob_ats_data(n_ats)<<endl; 
    simdat << "# EIT wt at age "                            <<endl;
    simdat <<   wt_ats << endl << wt_ats(n_ats)             <<endl;
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
}

dvar_matrix model_parameters::compute_selectivity(const int stsel,const dvariable& slp,const dvariable& a50)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // Single logistic, no trends....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  for (i=stsel;i<=endyr_r;i++)
    log_sel(i)  =  -1.*log( 1.0 + mfexp(-slp * ( age_vector - a50 )  ))  ;
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
}

dvar_matrix model_parameters::compute_selectivity(const int stsel,const dvariable& slp,const dvariable& a50,const dvar_vector& a50_dev)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // Single logistic, trends in inflection....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  for (i=stsel;i<=endyr_r;i++)
    log_sel(i)  =  -1.*log( 1.0 + mfexp(-slp * ( age_vector - a50*exp(a50_dev(i)) )  ))  ;
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
}

dvar_matrix model_parameters::compute_selectivity(const int stsel,const dvariable& slp,const dvariable& a50,const dvar_vector& se,const dvar_vector& ae)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // Single logistic, trends in inflection and slope....
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  for (i=stsel;i<=endyr_r;i++)
    log_sel(i)  =  -1.*log( 1.0 + mfexp(-exp(se(i)) * slp * ( age_vector - a50*exp(ae(i)) )  ))  ;
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
}

dvar_matrix model_parameters::compute_selectivity(const int stsel,const dvar_vector& slp,const dvar_vector& a50)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_matrix model_parameters::compute_selectivity1(const int stsel,const dvariable& dif,const dvariable& a50,const dvariable& trm)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_matrix model_parameters::compute_selectivity1(const int stsel,const dvariable& dif,const dvariable& a50,const dvariable& trm,const dvar_matrix& devs)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_matrix model_parameters::compute_selectivity2(const int stsel,const dvar_vector& slp,const dvar_vector& a50,const dvar_matrix& devs)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_matrix model_parameters::compute_selectivity3(const int stsel,const dvar_vector& dif,const dvar_vector& a50)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_matrix model_parameters::compute_selectivity3(const int stsel,const dvar_vector& dif,const dvar_vector& a50,const dvar_matrix& devs)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_matrix model_parameters::compute_selectivity(const int stsel,const dvar_vector& slp,const dvar_vector& a50,const dvar_matrix& devs)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_matrix model_parameters::compute_fsh_selectivity(const int nsel,const int stsel,dvariable& avgsel,const dvar_vector& coffs,const dvar_matrix& sel_devs,int  gn)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_matrix model_parameters::compute_selectivity_ats(const int nsel,const int stsel,dvariable& avgsel,const dvar_vector& coffs)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // Coefficient selectivity, withOUT deviations...
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  avgsel  = log(mean(mfexp(coffs)));
  log_sel(stsel)(mina_ats,nsel)     = coffs;
  log_sel(stsel)(nsel+1,nages)      = coffs(nsel);
  int ii;
  log_sel(stsel)-=log(mean(exp(log_sel(stsel))));
  for (i=stsel;i<endyr_r;i++)
    log_sel(i+1)=log_sel(i);
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
}

dvar_matrix model_parameters::compute_selectivity_ats(const int nsel,const int stsel,dvariable& avgsel,const dvar_vector& coffs,const dvar_matrix& sel_devs)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
    // log_sel_ats = compute_selectivity(n_selages_ats,styr_ats,avgsel_ats,sel_coffs_ats,sel_devs_ats);
  // Coefficient selectivity, with deviations...
  RETURN_ARRAYS_INCREMENT();
  dvar_matrix log_sel(styr,endyr_r,1,nages);
  log_sel.initialize();
  avgsel  = log(mean(mfexp(coffs)));
  log_sel(stsel)(mina_ats,nsel)     = coffs;
  log_sel(stsel)(nsel+1,nages)      = coffs(nsel);
  int ii;
  log_sel(stsel)-=log(mean(exp(log_sel(stsel))));
  ii=1;
  for (i=stsel+1;i<=endyr_r;i++) // Starts in 1979
  {
    // if (i==yrs_ats_data(ii)&&ii<=dim_sel_ats)
    if (i==yrs_ch_ats(ii))
    {
      // log_sel(i+1)(mina_ats,nsel) = log_sel(i)(mina_ats,nsel) + sel_devs(ii);
      // log_sel(i+1)(nsel+1,nages)  = log_sel(i+1,nsel);
      log_sel(i)(mina_ats,nsel) = log_sel(i-1)(mina_ats,nsel) + sel_devs(ii);
      log_sel(i)(nsel+1,nages)  = log_sel(i,nsel);
      // cout<<yrs_ats_data(ii)<<endl;
      if(ii<dim_sel_ats)
        ii++;
    }
    else
      log_sel(i)=log_sel(i-1);
    log_sel(i)-=log(mean(exp(log_sel(i))));
  }
  RETURN_ARRAYS_DECREMENT();
  return(log_sel);
}

dvar_matrix model_parameters::compute_selectivity(const int nsel,const int stsel,dvariable& avgsel,const dvar_vector& coffs,const dvar_matrix& sel_devs,int  gn)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvar_matrix model_parameters::compute_selectivity(const int nsel,const int stsel, dvariable& avgsel,const dvar_vector& coffs)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::SolveF2(const dvar_vector& N_tmp, double  TACin)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::Profile_F(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
 /* NOTE THis will need to be conditional on SrType too
  Function calculates used in calculating MSY and MSYL for a designated component of the
  population, given values for stock recruitment and selectivity...  Fmsy is the trial value of MSY example of the use of "funnel" to reduce the amount of storage for derivative calculations */
  dvariable Fdmsy;
  dvariable Stmp;
  dvariable Rtmp;
  dvariable Btmp;
  dvariable F1;
  dvariable yld1;
  if (do_fmort){
    cout <<"sel_fut"<<endl;
    cout <<sel_fut<<endl;
    cout <<natmort<<endl;
    cout <<p_mature<<endl;
    cout <<wt_ssb(endyr_r)     <<endl;
    cout <<sigmarsq_out<<endl;
    cout <<"Fmsy, MSY, Steepness, Rzero, Bzero, PhiZero, Alpha, Beta, SPB0, SPRBF40"<<endl;
    cout << Fmsy<<" "<<MSY<<" "<<steepness<<" "<<Rzero<<" "<<Bzero<<" "<<phizero<<" "<<alpha<<" "<<beta<<" "<<SB0/meanrec<<" "<<SBF40/meanrec<<endl;;
    cout <<endl<<endl<<"Iter  F  Stock  Yld  Recruit"<<endl;
  }
  else
    if (count_mcsave==1){
      write_mcFmort<<"Iter  F  Stock  Yld  Recruit"<<endl;
      write_mcSRR<<"Draw Stock  Recruit"<<endl;
    }
  for (int ii=1;ii<=500;ii++)
  {
    F1    = double(ii)/100;
    yld1   = get_yield(F1,Stmp,Rtmp,Btmp);
    if (do_fmort)
      cout <<ii<<" " <<F1<<" "<< Stmp <<" "<<yld1<<" "<<Rtmp<<" "<<" "<< endl; 
    else
      write_mcFmort <<ii<<" " <<F1<<" "<< Stmp <<" "<<yld1<<" "<<Rtmp<<" "<<" "<< endl; 
  } 
  if (do_fmort)
    exit(1);
  for (int ii=1;ii<=20;ii++)
    write_mcSRR << count_mcsave<<" "<<SRR_SSB(ii) <<" "<< rechat(ii) << endl; 
}

double model_parameters::mn_age(const dvar_vector& pobs)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  int lb1 = pobs.indexmin();
  int ub1 = pobs.indexmax();
  dvector av = age_vector(lb1,ub1)  ;
  double mobs = value(pobs*av);
  return mobs;
}

double model_parameters::Sd_age(const dvar_vector& pobs, const dvar_vector& phat)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  int lb1 = pobs.indexmin();
  int ub1 = pobs.indexmax();
  dvector av = age_vector(lb1,ub1)  ;
  double mobs = value(pobs*av);
  double stmp = value(sqrt(elem_prod(av,av)*pobs - mobs*mobs));
  return stmp;
}

double model_parameters::Eff_N_adj(const double, const dvar_vector& pobs, const dvar_vector& phat)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // Eq. 6
  int lb1 = pobs.indexmin();
  int ub1 = pobs.indexmax();
  dvector av = age_vector(lb1,ub1)  ;
  double mobs = value(pobs*av);
  double mhat = value(phat*av );
  double rtmp = mobs-mhat;
  double stmp = value(sqrt(elem_prod(av,av)*pobs - mobs*mobs));
  return square(stmp)/square(rtmp);
}

double model_parameters::Eff_N2(const dvar_vector& pobs, const dvar_vector& phat)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // Eq. 6
  int lb1 = pobs.indexmin();
  int ub1 = pobs.indexmax();
  dvector av = age_vector(lb1,ub1)  ;
  double mobs = value(pobs*av);
  double mhat = value(phat*av );
  double rtmp = mobs-mhat;
  double stmp = value(sqrt(elem_prod(av,av)*pobs - mobs*mobs));
  return square(stmp)/square(rtmp);
}

double model_parameters::Eff_N(const dvar_vector& pobs, const dvar_vector& phat)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // Eq. 6
  dvar_vector rtmp = elem_div((pobs-phat),sqrt(elem_prod(phat,(1-phat))));
  double vtmp;
  vtmp = value(norm2(rtmp)/size_count(rtmp));
  return 1/vtmp;
}

void model_parameters::write_R(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  adstring ad_tmp=initial_params::get_reportfile_name();
  ofstream report((char*)(adprogram_name + ad_tmp),ios::app);
  // Development--just start to get some output into R
  report <<"recent_selectivities"<<endl;
    for (int iyr=10;iyr>=1;iyr--)
    {
      sel_fut   = sel_fsh(endyr_r-iyr+1);
      sel_fut  /= mean(sel_fut); // NORMALIZE TO mean
      report<<endyr_r-iyr+1<<" "<<sel_fut<<endl;
    }
  report <<"recent_wtage"<<endl;
    for (int iyr=10;iyr>=1;iyr--)
    {
      wt_fut(3,nages) = wt_pre(endyr_r-iyr+1);
      report<<endyr_r-iyr+1<<" "<<wt_fut<<endl;
    }
  R_report(regime);
  R_report(regime.sd);
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
    sdnr_ats = sdnr(ob_ats,eb_ats,std_ob_ats_data);
  // dvar_vector avo_dev = obs_avo-pred_avo;
    sdnr_avo = sdnr(obs_avo,pred_avo,obs_avo_std);
  // std_ob_ats_data(1,n_ats)
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
    R_report(FW_ats);
  }
  R_report(dec_tab_catch);
  R_report(sam_fsh);
  R_report(sam_bts);
  R_report(sam_ats);
  R_report(sel_fsh);
  dvar_matrix sel_bts = mfexp(log_sel_bts);
  dvar_matrix sel_ats = mfexp(log_sel_ats);
  R_report(sel_bts);
  R_report(sel_ats);
  R_report(steepness);
  R_report(SR_resids);
  R_report(sigr);
  R_report(SRR_SSB);
  R_report(rechat);
  R_report(rechat.sd);
  R_report(repl_F);
  R_report(repl_yld);
  R_report(repl_SSB);
  report<<"cat_like"<<endl<< ctrl_flag(1) * catch_like      << endl;
  report<<"Fpen_like"<<endl<< ctrl_flag(4) * F_pen         << endl;
  R_report(wt_like);
  R_report(all_like);
  R_report(surv_like);
  R_report(cpue_like);
  R_report(cope_like);
  R_report(avo_like);
  R_report(sel_like);
  R_report(sel_like_dev);
  R_report(age_like);
  R_report(len_like);
  R_report(rec_like);
  R_report(resid_M_like);
  report<<"tot_like"<<endl<<fff<<endl;
  report<<"dat_like"<<endl << fff - (sum(rec_like)+sum(sel_like)+sum(sel_like_dev)+ sum(Priors)) <<endl;
  report<<"Yr"<<endl; for (i=styr;i<=endyr_r;i++) report<<i<<" "; report<<endl;
  report<<"yr_bts"<<endl; report<<yrs_bts_data<<endl;
  R_report(ob_bts);
  R_report(eb_bts);
  R_report(ot_bts);
  R_report(et_bts);
  report<<"sd_ob_bts"<<endl<<std_ob_bts<<endl;
  report<<"sd_ot_bts"<<endl<<std_ot_bts<<endl;
  report<<"yr_ats"<<endl; report<<yrs_ats_data<<endl;
  R_report(ob_ats);
  R_report(eb_ats);
  R_report(ot_ats);
  R_report(et_ats);
  report<<"sd_ob_ats"<<endl<<std_ob_ats<<endl;
  report<<"sd_ot_ats"<<endl<<std_ot_ats<<endl;
  report<<"sd_ats"<<endl<<std_ob_ats<<endl;
  report<<"future_F"<<endl;
  for (int k=1;k<=nscen;k++) 
  {
    report<< mean(F(endyr_r))<<" "; // reference year as current
    for (int i=styr_fut;i<=endyr_fut;i++) 
       report<< mean(F_future(k,i))<<" ";
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
  report<<"Nage_3"<<endl; 
  for (i=styr;i<=endyr_r;i++) 
  {
    lb=value(Nage_3(i)/exp(2.*sqrt(log(1+square(Nage_3.sd(i))/square(Nage_3(i))))));
    ub=value(Nage_3(i)*exp(2.*sqrt(log(1+square(Nage_3.sd(i))/square(Nage_3(i))))));
    report<<i<<" "<<Nage_3(i)<<" "<<Nage_3.sd(i)<<" "<<lb<<" "<<ub<<endl;
  }
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
  R_report(yrs_cope); 
  R_report(obs_cope); 
  R_report(obs_cope_std); 
  R_report(pred_cope); 
  report << "pobs_lf_fsh"<<  endl << endyr_r        <<" "<<olc_fsh    <<endl;
  report << "phat_lf_fsh"<<  endl << endyr_r        <<" "<<elc_fsh    <<endl;
  report << "pobs_fsh"<<  endl;
  for (i=1;i<=n_fsh_r;i++) 
    report << yrs_fsh_data(i)<< " "<< oac_fsh(i) << endl;
  report << "phat_fsh"<< endl;
  for (i=1;i<=n_fsh_r;i++) 
    report << yrs_fsh_data(i)<< " "<< eac_fsh(i) << endl;
  report << "phat_bts"<<endl;
  for (i=1;i<=n_bts_r;i++) 
    report << yrs_bts_data(i)<< " "<< eac_bts(i) << endl;
  report << "phat_ats"<<endl;
  for (i=1;i<=n_ats_r;i++) 
    report << yrs_ats_data(i)<< " "<< eac_ats(i) << endl;
  report << "pobs_bts"<<endl;
  for (i=1;i<=n_bts_r;i++) 
    report << yrs_bts_data(i)<< " "<< oac_bts(i) << endl;
  report << "pobs_ats"<<endl;
  for (i=1;i<=n_ats_r;i++) 
    report << yrs_ats_data(i)<< " "<< oac_ats(i) << endl;
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
  dvar_matrix eac_ats(1,n_ats_r,mina_ats,nages);
  dmatrix oac_ats(1,n_ats_r,mina_ats,nages);
  for (int i=1;i<=n_ats_r;i++)
  {
      oac_ats(i) = oac_ats(i)(mina_ats,nages);
      eac_ats(i) = eac_ats(i)(mina_ats,nages);
  }
  report <<"EffN_ats"<<endl;
  for (i=1;i<=n_ats_r;i++) 
  {
    double sda_tmp = Sd_age(oac_ats(i),eac_ats(i));
    report << yrs_ats_data(i)
             << " "<<Eff_N(oac_ats(i),eac_ats(i)) 
             << " "<<Eff_N2(oac_ats(i),eac_ats(i))
             << " "<<mn_age(oac_ats(i))
             << " "<<mn_age(eac_ats(i))
             << " "<<sda_tmp
             << " "<<mn_age(oac_ats(i)) - sda_tmp *2. / sqrt(sam_ats(i))
             << " "<<mn_age(oac_ats(i)) + sda_tmp *2. / sqrt(sam_ats(i))
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
  dvar_vector  gm_b1(1,10);
  dvar_vector  gm_b2(1,10);
  cv_b = elem_div(ABC_biom.sd , ABC_biom); 
  cv_b2= elem_div(ABC_biom2.sd , ABC_biom2); 
  gm_b1 = exp(log(ABC_biom) -elem_prod(cv_b ,cv_b )/2.); // Eq. 22
  gm_b2= exp(log(ABC_biom2)-elem_prod(cv_b2,cv_b2)/2.); // Eq. 22
  dvariable hm_f = exp(lnFmsy2 - lnFmsy2.sd*lnFmsy2.sd /2.); // Eq. 22
  dvariable am_f = exp(lnFmsy2 + lnFmsy2.sd*lnFmsy2.sd /2.); // Eq. 22
 // get spr rates for ABC and OFL
  SPR_ABC = SPR_OFL * am_f / hm_f;
  dvariable ABC  = gm_b1(1)*hm_f*adj_1(1); 
  dvariable OFL  = gm_b1(1)*am_f*adj_1(1); 
  report <<"T1"<<endl; //  yr ABC OFL SSB 3+Biom CatchFut harmeanF arithmeanF geomB SPRABC SPROFL Tier2 Tier1.5 AdjFABC AdjFOFL Adj Fmsyr
  report << 
    endyr_r+1<<" " << 
    ABC <<" " << 
    OFL <<" "<< 
    future_SSB(1,styr_fut) <<" "<< 
    age_3_plus_biom(endyr_r+1) <<" "<<
    future_catch(1,styr_fut) <<" " << 
    hm_f  <<" "<< 
    am_f <<" "<< 
    gm_b1(1) <<" "<< 
    SPR_ABC <<" "<< 
    SPR_OFL <<" "<<
    gm_b1(1)  * am_f * adj_1(1) * F40/F35 << " " << 
    gm_b1(1)  * hm_f * adj_1(1) * F40/F35 << " " << 
    hm_f * adj_1(1) << " " << 
    am_f * adj_1(1) << " " << 
    adj_1(1) << " " << 
    am_f << " " << 
    endl;
  ABC  = gm_b2(1)*hm_f*adj_2(1); 
  OFL  = gm_b2(1)*am_f*adj_2(1); 
  report << 
    endyr_r+2<<" " << 
    ABC <<" " << 
    OFL <<" "<< 
    future_SSB(1,styr_fut+1) <<" "<< 
    age_3_plus_biom(endyr_r+2) <<" "<<
    future_catch(1,styr_fut+1) <<" " << 
    hm_f  <<" "<< 
    am_f <<" "<< 
    gm_b2(1) <<" "<< 
    SPR_ABC <<" "<< 
    SPR_OFL <<" "<<
    gm_b2(1)  * am_f * adj_2(1) * F40/F35 << " " <<
    gm_b2(1)  * hm_f * adj_2(1) * F40/F35 << " " <<
    hm_f * adj_2(1) << " " << 
    am_f * adj_2(1) << " " << 
    adj_1(2) << " " << 
    am_f << " " << 
    endl;
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
  "Scen Catch  SSBNext  AdjNext  ABC1  OFL1  SSB2yrs  Adj2yrs  ABC2  OFL2 T2_ABC1 T2_OFL1 T2_ABC2 T2_OFL2 T1.5_ABC1 T1.5_ABC2"<<endl;
   for (i=1;i<=10;i++)
   {
      for_sd <<  i           << " ";
      for_sd <<  Cat_Fut(i)  << " ";
      for_sd <<  SSB_1(i)    << " ";
      for_sd <<  adj_1(i)    << " ";
      for_sd <<  gm_b1(i)   * hm_f * adj_1(i) << " ";
      for_sd <<  gm_b1(i)   * am_f * adj_1(i) << " ";
      for_sd <<  SSB_2(i)                    << " ";
      for_sd <<  adj_2(i)                    << " ";
      for_sd <<  gm_b2(i)  * hm_f * adj_2(i) << " ";
      for_sd <<  gm_b2(i)  * am_f * adj_2(i) << " ";
      for_sd <<  gm_b1(i)   * am_f * adj_1(i) * F40/F35 << " ";
      for_sd <<  gm_b1(i)   * am_f * adj_1(i) << " "; 
      for_sd <<  gm_b2(i)  * am_f * adj_1(i) * F40/F35 << " ";
      for_sd <<  gm_b2(i)  * am_f * adj_1(i) << " ";
      for_sd <<  gm_b1(i)  * hm_f * adj_1(i) * F40/F35 << " ";
      for_sd <<  gm_b2(i)  * hm_f * adj_1(i) * F40/F35 << " " <<endl; 
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
   misc_out << "low:  "<< tweaklo*gm_b1(5)   * hm_f * adjlo      << endl;
   misc_out << "mode: "<< gm_b1(5)   * hm_f * adj_1(5)           << endl;
   misc_out << "high: "<< tweakhi*gm_b1(5)   * hm_f * adjhi      << endl;
   misc_out << "No adjustment below Bmsy..."<<endl;
   misc_out << "low:  "<< tweaklo*gm_b1(5)   * hm_f              << endl;
   misc_out << "mode: "<< gm_b1(5)   * hm_f                      << endl;
   misc_out << "high: "<< tweakhi*gm_b1(5)   * hm_f              << endl;
   misc_out << "Fut_Cat ABC_biom gm_b1 "<< endl;
   for (int icat=1;icat<=10;icat++)
     misc_out<<Cat_Fut(icat)<< " "<<ABC_biom(icat)<<" "<<gm_b1(icat)<<endl;
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
   dvar_matrix Ntmp(endyr_r,endyr_r+2,1,nages);
   dvariable SSBtmp; 
   Ntmp.initialize();
   Ntmp(endyr_r) = natage(endyr_r);
   cout << endyr_r <<" "<< Ntmp(endyr_r) <<" "<<SSB(endyr_r)<<endl;
   sel_fut = sel_fsh(endyr_r);
   for (i=styr;i<=endyr_r+2;i++)
   {
    if(i<=endyr_r){
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
    } else {
     Ntmp(i)(2,nages) = ++elem_prod(Ntmp(i-1)(1,nages-1), S(endyr_r)(1,nages-1));  
     Ntmp(i,nages)  += Ntmp(i-1,nages)*S(endyr_r,nages);
     Ntmp(i,1)       = meanrec;
     SSBtmp = elem_prod(elem_prod(Ntmp(i),pow(S(endyr_r),yrfrac)),p_mature)*wt_ssb(endyr_r); // Eq. 1
      cout << i <<" "<< Ntmp(i) <<" "<<SSBtmp<<endl;
     // age_3_plus_biom(i)  = natage(i)(3,nages) * wt_ssb(i)(3,nages); 
     fshable = value(elem_prod(Ntmp(i),sel_fut) * wt_ssb(endyr_r)); // fishable biomass
     AM_fmsyr =  value(exp(lnFmsy2 + lnFmsy2.sd*lnFmsy2.sd /2.));
     get_msy();
     F40_out << i       // Year
         <<" "<< SSBtmp/Bmsy   // Fshable Bmsy
         <<" "<< (obs_catch(endyr_r)/fshable) /AM_fmsyr  // Realized harvest rate
         <<" "<< (SER(endyr_r)/SER_Fmsy)                 // SER harvest rate
         <<" "<< mean(F(endyr_r))/Fmsy
         <<" "<< Bmsy
         <<" "<< SSBtmp
         <<" "<< Bmsy2   // Fshable Bmsy
         <<" "<< fshable // fishable biomass
         <<" "<< AM_fmsyr// AM Msyr
         <<" "<< obs_catch(endyr_r)/fshable // Realized harvest rate
         <<" "<< get_spr_rates(value(SPR_OFL),sel_fut) // F at MSY
         <<" "<< Implied_SPR(F(endyr_r))    // Implied SPR Given F
         <<" "<< SPR_OFL 
         <<" "<< mean(F(endyr_r))
         <<" "<<get_spr_rates(.35,sel_fut)
         <<" "<<Fmsy 
         <<" "<<age_3_plus_biom(i) 
         <<" "<<value(age_3_plus_biom(i))/value(Bmsy2)
         <<" "<<value(SB100)*.35
         <<" "<<(obs_catch(endyr_r)/value(age_3_plus_biom(i)))/value(Fmsy2)
         <<" "<<value(avg_age_msy)
         <<" "<<value(avgwt_msy)
         <<endl; 
      }
    }
    F40_out.close();
   ofstream SelGrid("selgrid.rep");
    SelGrid << "KE_Year MSY Bmsy avgAgeMSY avgWtMSY F40 Fmsy FmsySPR"<<endl;
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
         <<" "<<get_spr_rates(.4,sel_fut)
         <<" "<< value(Fmsy2)
         <<" "<< value(spr_ratio(Fmsy,sel_fut))
         <<" NA "   // Implied SPR Given F
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
         <<" "<<get_spr_rates(.4,sel_fut)
         <<" "<< value(Fmsy2)
         <<" "<< value(spr_ratio(Fmsy,sel_fut))
         <<" "<< Implied_SPR(F(i))    // Implied SPR Given F
         <<endl; 
   }
   compute_Fut_selectivity();
   R_report(sel_fut);
   get_msy();
    SelGrid << "sel_fut"        // knife-selection
         <<" "<<value(MSY)
         <<" "<<value(Bmsy)
         <<" "<<value(avg_age_msy)
         <<" "<<value(avgwt_msy)
         <<" "<<get_spr_rates(.4,sel_fut)
         <<" "<< value(Fmsy2)
         <<" "<< value(spr_ratio(Fmsy,sel_fut))
         <<" NA "   // Implied SPR Given F
         <<endl; 
    SelGrid.close();
  }
}

dvariable model_parameters::Implied_SPR( const dvar_vector& F_age)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::Get_Replacement_Yield(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvariable model_parameters::get_repl_b(const dvariable& Ftry)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::Fit_resid_M(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  //  fit the residual M so such that the total M for an age (residual plus predation mortality) is close to Jim's fixed values
  resid_M_like.initialize();
  int k; 
  for (k=1;k<=n_pred_ages;k++){
      resid_M_like(k) = 5.0*norm2( (M_pred_avg(k) + mfexp(log_resid_M(k))) - natmort(k));
  }   
  fff   += sum(resid_M_like);
}

void model_parameters::Get_Age2length(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  // Linf=Linfprior;// Asymptotic length
  // k_coeff=kprior;
  // Lo=Loprior;// first length (corresponds to first age-group)
  // sdage=sdageprior;// coefficient of variation of length-at-age
 // if some of these are estimated.
  // L1  25.23382299 k  0.139339914 Linf  68.43045172
  double Linf    = 68.43045172 ;
  double k_coeff = 0.139339914 ;
  double Lo      = 25.23382299 ;
  double sdage   = .06;
  dvar_vector mu_age(1,nages);
  dvar_vector sigma_age(1,nages);
    int i, j;
    mu_age(1)=Lo; // first length (modal)
    for (i=2;i<=nages;i++)
      mu_age(i) = Linf*(1.-exp(-k_coeff))+exp(-k_coeff)*mu_age(i-1); // the mean length by age group
    // wt_age_vb(r) = lw_a * pow(mu_age, lw_b);
    // maturity_vb(r) = 1/(1 + exp(32.93 - 1.45*mu_age(r)));
  sigma_age = sdage*mu_age; // standard deviation of length-at-age
  age_len = value(Age_Len_Conversion( mu_age, sigma_age, lens));
  write_log(sigma_age);
}

dvar_matrix model_parameters::Age_Len_Conversion(dvar_vector& mu, dvar_vector& sig, dvector& x)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
  //RETURN_ARRAYS_INCREMENT();
  int i, j;
  dvariable z1;
  dvariable z2;
  int si,ni; si=mu.indexmin(); ni=mu.indexmax();
  int sj,nj; sj=x.indexmin(); nj=x.indexmax();
  dvar_matrix pdf(si,ni,sj,nj);
  double xs;
  pdf.initialize();
  for(i=si;i<=ni;i++) //loop over ages
  {
    for(j=sj;j<=nj;j++) //loop over length bins
    {
      if (j<nj)
        xs=0.5*(x[sj+1]-x[sj]);  // accounts for variable bin-widths...?
      z1=((x(j)-xs)-mu(i))/sig(i);
      z2=((x(j)+xs)-mu(i))/sig(i);
      pdf(i,j)=cumd_norm(z2)-cumd_norm(z1);
    }//end nbins
    pdf(i)/=sum(pdf(i));
  }//end nage
  //RETURN_ARRAYS_DECREMENT();
  return(pdf);
}

void model_parameters::Est_Fixed_Effects_wts(void)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

double model_parameters::sdnr(const dvector& obs, const dvar_vector& pred, const dvector& sig)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

dvector model_parameters::rmultinomial(const dvector ptmp, const int n_sam)
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
    int i1=ptmp.indexmin();
    int i2=ptmp.indexmax();
      dvector freq(i1,i2);
      dvector p(i1,i2);
      ivector bin(1,n_sam);
      p  = ptmp;
      p /= sum(p);
      bin.fill_multinomial(rng,p); // fill a vector v
      for (int j=1;j<=n_sam;j++)
          freq(bin(j))++;
        // Apply ageing error to samples..............
        return( freq/sum(freq) ); 
  /**
   * @brief Calculate Francis weights
   * @details this code based on equation TA1.8 in Francis(2011) should be changed so separate weights if by sex
   *
   * Produces the new weight that should be used.
  **/
}

double model_parameters::calc_Francis_weights(const dmatrix oac, const dvar_matrix eac, const ivector sam )
{
  ofstream& srecout= *pad_srecout;
  ofstream& projout= *pad_projout;
  ofstream& nofish= *pad_nofish;
  ofstream& projout2= *pad_projout2;
  ofstream& eval= *pad_eval;
  random_number_generator& rng= *pad_rng;
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
}

void model_parameters::report(const dvector& gradients)
{
 adstring ad_tmp=initial_params::get_reportfile_name();
  ofstream report((char*)(adprogram_name + ad_tmp));
  if (!report)
  {
    cerr << "error trying to open report file"  << adprogram_name << ".rep";
    return;
  }
  // if (last_phase()) Get_Replacement_Yield();
  save_gradients(gradients);
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
  if (last_phase())
    cout << endl<<"Finished last phase: "<<current_phase()<<" ============================================="<<endl<<endl;
  else
    cout << endl<<"Changing phases from: "<<current_phase()<<" ============================================="<<endl<<endl;
  cout << all_like <<endl<<"Length like: "<<len_like<<endl;;
  if (ctrl_flag(28)==0 && last_phase())
  {
  report << "N"<<endl;
  report << natage<<endl;
  report << "C"<<endl;
  report << catage<<endl;
  report << "Z"<<endl;
  report << Z <<endl;
  report << "F"<<endl;
  report << F <<endl;
  report << "M"<<endl;
  report << M <<endl;
  report << "S"<<endl;
  report << S <<endl;
    legacy_rep << "Francis weights: fishery "<<endl;
    legacy_rep <<calc_Francis_weights(oac_fsh, eac_fsh,sam_fsh )<<endl;
    legacy_rep << "Francis weights: bTS "<<endl;
    legacy_rep <<calc_Francis_weights(oac_bts, eac_bts,sam_bts )<<endl;
    legacy_rep << "Francis weights: ATS "<<endl;
    dvar_matrix eac_ats(1,n_ats_r,mina_ats,nages);
    dmatrix oac_ats(1,n_ats_r,mina_ats,nages);
    for (int i=1;i<=n_ats_r;i++)
    {
      oac_ats(i) = oac_ats(i)(mina_ats,nages);
      eac_ats(i) = eac_ats(i)(mina_ats,nages);
    }
    legacy_rep <<calc_Francis_weights(oac_ats, eac_ats,sam_ats )<<endl;
  // cout<<repl_yld<<endl; cout<<repl_SSB<<endl; cout<<SSB(endyr_r)<<endl; 
  dvariable qtmp = mfexp(mean(log(oa1_ats)-log(ea1_ats)));
  legacy_rep << model_name<<" "<< datafile_name<<" "<<q_bts<<" "<<q_ats<<" "<<q_bts*exp(log_q_std_area)<< " "<<q_all<<" "<<qtmp<<" "<<sigr<<" q's and sigmaR"<<endl;
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
  if (use_age1_ats)
    for (i=styr;i<=endyr_r;i++) legacy_rep << i<<" 0 "<<mfexp(log_sel_ats(i)(mina_ats,nages)) <<endl;
  else
    for (i=styr;i<=endyr_r;i++) legacy_rep << i<<" "<<mfexp(log_sel_ats(i)) <<endl;
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
  if (use_age1_ats) 
    for (i=1;i<=n_ats_r;i++) legacy_rep << yrs_ats_data(i)<<" 0 "<<oac_ats(i)(mina_ats,nages) <<endl;
  else
    for (i=1;i<=n_ats_r;i++) legacy_rep << yrs_ats_data(i)<<" "<<oac_ats(i) <<endl;
  if (use_last_ats_ac<=0) 
  {
    n_ats_ac_r = n_ats_r-1; 
    iyr          = yrs_ats_data(n_ats_r);
    legacy_rep<<  (elem_prod(natage(iyr),mfexp(log_sel_ats(iyr))) * q_ats)/et_ats(n_ats_r)<<endl; 
  }
  legacy_rep << "Hydro Survey Predicted P at age"<<endl;
  if (use_age1_ats) 
    for (i=1;i<=n_ats_r;i++) legacy_rep << yrs_ats_data(i)<<" 0 "<<eac_ats(i)(mina_ats,nages) <<endl;
  else
    for (i=1;i<=n_ats_r;i++) legacy_rep << yrs_ats_data(i)<<" "<<eac_ats(i) <<endl;
  if (use_last_ats_ac<=0) 
  {
    legacy_rep<<  oac_ats_data(n_ats_r)/sum(oac_ats_data(n_ats_r))  <<endl;
  }
  legacy_rep << "Pred. Survey numbers " <<endl;                 
  legacy_rep << et_bts(1,n_bts_r)  <<" "<<endl;
  legacy_rep << "Obs. Survey numbers " <<endl;
  legacy_rep << ot_bts(1,n_bts_r)  <<" "<<endl;
  legacy_rep << "Pred. hydro Survey numbers " <<endl;
  legacy_rep << et_ats(1,n_ats_r) <<endl;
  legacy_rep << "Obs. hydro Survey numbers " <<endl;   
  legacy_rep << ot_ats(1,n_ats_r) <<endl;
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
         << ctrl_flag(1) * catch_like      << endl;
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
      << 10.*square(avgsel_ats)<<endl;
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
  legacy_rep << " SST and fitted SR_resid for plotting" <<endl;  // added by Paul
  legacy_rep << fake_SST<<endl;                                    
  legacy_rep << SRresidhat<<endl;
  legacy_rep << " fake density for plotting" <<endl;   // added by Paul
  legacy_rep << fake_dens << endl;                     // added by Paul 
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
    dvar_matrix eac_ats(1,n_ats_r,mina_ats,nages);
    dmatrix oac_ats(1,n_ats_r,mina_ats,nages);
    for (int i=1;i<=n_ats_r;i++)
    {
      oac_ats(i) = oac_ats(i)(mina_ats,nages);
      eac_ats(i) = eac_ats(i)(mina_ats,nages);
    }
    FW_ats = calc_Francis_weights(oac_ats, eac_ats,sam_ats );
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
  legacy_rep << yrs_ats_data     <<endl;
  legacy_rep << oa1_ats          <<endl;
  legacy_rep << ea1_ats*qtmp     <<endl;
  legacy_rep << ea1_ats          <<endl;
  legacy_rep << "Obs_Pred_BTS_Biomass"<<endl;
  legacy_rep << yrs_bts_data     <<endl;
  legacy_rep << ob_bts           <<endl;
  legacy_rep << eb_bts           <<endl;
  legacy_rep << "Obs_Pred_EIT_Biomass"<<endl;
  legacy_rep << yrs_ats_data     <<endl;
  legacy_rep << ob_ats     <<endl;
  legacy_rep << eb_ats     <<endl;
  legacy_rep << "Pred_EIT_N_age"<<endl;
  for (i=1;i<=n_ats_r;i++)
    legacy_rep << yrs_ats_data(i)<<" "<<et_ats(i)*eac_ats(i)(2,15)     <<endl;
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
             << avail_ats(i) <<" "
             << square(ot_cmb(i)-et_cmb(i))/(2.*var_cmb(i))
             << endl;
  } 
  */ 
  legacy_rep << F<<endl;
  legacy_rep << wt_pre<<endl;
  report << "phizero" << endl << phizero << endl;
  report << "Bzero"   << endl << Bzero   << endl; 
  if (do_temp==1)
  {
    ofstream SR_sst_out("SR_sst_out.dat");
    SR_sst_out << "year SST SR_resid  SR_residuals_temp  SSB pred_rec srmod_rec  "<<endl;   //**** added by Paul
    for (i=styr_est;i<=endyr_est;i++)
      SR_sst_out << i<<" "<<SST(i-1)<<" "<<SR_resids(i) <<" "<<SR_resids_temp(i) <<" "<<SSB(i-1)<<" "<<pred_rec(i)<<" "<<srmod_rec(i)   <<endl;
  }
  if (do_pred==1)
  {
    ofstream est_cons_out("est_cons_out.dat");    // added by Paul
    est_cons_out << "predator year  obs_cons_nonpoll pred_cons"<<endl;
    for (j=1;j<=n_pred_grp;j++)
    {
      for (i=1;i<=nyrs_cons_nonpoll(j);i++) 
      {
        iyr = yrs_cons_nonpoll(j,i);
        est_cons_out <<j<<" "<<iyr<<" "<<obs_cons_nonpoll(j,i)<<" "<<pred_cons(j,iyr) <<endl;
      }
    }
    legacy_rep <<"consumption ssq are "<< endl;    // added by Paul
    legacy_rep << ssq_cons << endl;
    legacy_rep <<"the resid M like is  "<< endl;
    legacy_rep << sum(resid_M_like) << endl;
    ofstream meanM_out("meanM_out.dat");           // added by Paul
    meanM_out << " the mean M across strata are " << endl;
    meanM_out << "year  age1 age2 age3 "<< endl;
    for (i=styr;i<=endyr_r;i++)
      meanM_out <<i<<" "<<M_pred_avg(1,i) + resid_M(1) <<" "<<M_pred_avg(2,i) + resid_M(2)<<" "<<M_pred_avg(3,i) + resid_M(3)<<endl;
    for (j=1;j<=n_pred_grp;j++) 
    {                 
      legacy_rep << "the observed age comps for predator "<<j << endl;
      for (i=1;i<=nyrs_cons_nonpoll(j);i++)
      {
        iyr = yrs_cons_nonpoll(j,i);     
        legacy_rep <<iyr<<" "<<oac_cons_nonpoll(j,i)<<endl;
      }
      legacy_rep << "the estimated age comps for predator "<<j << endl;     
      for (i=1;i<=nyrs_cons_nonpoll(j);i++)
      {
        iyr = yrs_cons_nonpoll(j,i);          
        legacy_rep <<iyr<<" "<<eac_cons(j,iyr)<<endl;
      }
    }
    legacy_rep << " the predator age comps likelihood is "<<endl;  // added by Paul
    legacy_rep <<age_like_cons << endl;
    ofstream cpuppa_out("cpuppa_out.dat");              // added by Paul
    cpuppa_out <<" predator year  age strata implied_cpuppa meanN implied_prop_Cmax "<<endl; 
    for (j=1;j<=n_pred_grp;j++) 
    {
      for (i=1;i<=n_pred_ages;i++) 
      {
        for (k=styr;k<=endyr_r;k++)
        {
          for (z=1;z<=nstrata_pred;z++)
          {
            cpuppa_out << j <<" "<<k<<" "<<i<<" "<<z<<" "<<implied_cpuppa(j,k,i,z)<<" "<<mean_dens_bystrata(k,i,z)<<" "<<implied_prop_Cmax(j,k,i,z) <<endl;
          }
        }
      }
    }
    legacy_rep << " the mean density across strata are " << endl;
    legacy_rep << "Year  age1 age2 age3 "<< endl;
    for (i=styr;i<=endyr_r;i++)
      legacy_rep <<i<<" "<<mean_dens(i) <<endl;
    legacy_rep << " the function response parameters are "<< endl;
    for (j=1;j<=n_pred_grp;j++) 
    {
      legacy_rep << "predator  "<<j <<" a: "<<mfexp(log_a_II(j)) << endl;
      legacy_rep << "predator  "<<j <<" b: "<<mfexp(log_b_II(j)) << endl;
    }
    legacy_rep <<" the meannatage is "  << endl;
    for (i=styr;i<=endyr_r;i++)
      legacy_rep <<i<<" "<<meannatage(i) <<endl;
    if(active(log_resid_M))
    {
      legacy_rep << "the sd of normalized residuals for the rescaled consumption estimates are   "<< endl;
      legacy_rep <<std_dev(cons_nr(1))/consweights(1) <<" "<<std_dev(cons_nr(2))/consweights(2)<< endl;
      legacy_rep << "the sd of normalized residuals for the reweighted consumption age comps are   "<< endl;
      legacy_rep <<std_dev(comp_nr(1)) <<" "<<std_dev(comp_nr(2))<< endl;
    }
    ofstream compweightsnew_file("compweights_new.ctl");    // new comp weights McAllister-Ianelli method (TA1.1) (first comp weights, then cons weights)
    compweightsnew_file << compweightsnew <<" "<<consweightsnew << endl;
    ofstream fakeSSBfile("FakeSSB.txt");
    fakeSSBfile << SRR_SSB << endl;
  }
  if (do_yield_curve==1)
  {
    legacy_rep << " the F values and yield curve are " << endl;
    legacy_rep << F_yldcrv << endl;
    legacy_rep << yield_curve << endl;
    ofstream fakeFfile("FakeF.txt");
    fakeFfile << F_yldcrv << endl;
  }
  }
}

void model_parameters::final_calcs()
{
  write_R();
}

model_data::~model_data()
{}

model_parameters::~model_parameters()
{
  delete pad_srecout;
  pad_srecout = NULL;
  delete pad_projout;
  pad_projout = NULL;
  delete pad_nofish;
  pad_nofish = NULL;
  delete pad_projout2;
  pad_projout2 = NULL;
  delete pad_eval;
  pad_eval = NULL;
  delete pad_rng;
  pad_rng = NULL;
}

#ifdef _BORLANDC_
  extern unsigned _stklen=10000U;
#endif


#ifdef __ZTC__
  extern unsigned int _stack=10000U;
#endif

  long int arrmblsize=0;

int main(int argc,char * argv[])
{
    ad_set_new_handler();
  ad_exit=&ad_boundf;
  gradient_structure::set_MAX_NVAR_OFFSET(2600);
  gradient_structure::set_GRADSTACK_BUFFER_SIZE(200000);
  gradient_structure::set_NUM_DEPENDENT_VARIABLES(9100); 
  gradient_structure::set_CMPDIF_BUFFER_SIZE(3000000);
  arrmblsize=10000000;
    gradient_structure::set_NO_DERIVATIVES();
#ifdef DEBUG
  #ifndef __SUNPRO_C
std::feclearexcept(FE_ALL_EXCEPT);
  #endif
  auto start = std::chrono::high_resolution_clock::now();
#endif
    gradient_structure::set_YES_SAVE_VARIABLES_VALUES();
    if (!arrmblsize) arrmblsize=15000000;
    model_parameters mp(arrmblsize,argc,argv);
    mp.iprint=10;
    mp.preliminary_calculations();
    mp.computations(argc,argv);
#ifdef DEBUG
  std::cout << endl << argv[0] << " elapsed time is " << std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::high_resolution_clock::now() - start).count() << " microseconds." << endl;
  #ifndef __SUNPRO_C
bool failedtest = false;
if (std::fetestexcept(FE_DIVBYZERO))
  { cerr << "Error: Detected division by zero." << endl; failedtest = true; }
if (std::fetestexcept(FE_INVALID))
  { cerr << "Error: Detected invalid argument." << endl; failedtest = true; }
if (std::fetestexcept(FE_OVERFLOW))
  { cerr << "Error: Detected overflow." << endl; failedtest = true; }
if (std::fetestexcept(FE_UNDERFLOW))
  { cerr << "Error: Detected underflow." << endl; }
if (failedtest) { std::abort(); } 
  #endif
#endif
    return 0;
}

extern "C"  {
  void ad_boundf(int i)
  {
    /* so we can stop here */
    exit(i);
  }
}
