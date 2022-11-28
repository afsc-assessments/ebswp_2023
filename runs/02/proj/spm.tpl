 // DONT FORGET ABOU RHO!!!
 ////////////////////////////////////////////////////////////////////////////
 //   spm.tpl
 //     Version 0.6 Released Oct 2022
 //
 // NOTE: Draft subject to change
 // Conventions:
 //   nspp,  ispp = index for species/stock
 //   ngear, igear= index for gears used within age-structured species/stocks
 //                                                                           
 // Oct 2005 add ability to compute objective function for maximizing yield while minimizing variability
 // want to have the ability to compute the average first-diff squared and avg yield for each trajectory
 // Alt3b_obj_fun = avg_yield - 0.5 * sqrd_1st_diff
 //
 ////////////////////////////////////////////////////////////////////////////
DATA_SECTION
  !!CLASS ofstream means_out("means.out")
  !!CLASS ofstream alts_proj("alt_proj.out")
  !!CLASS ofstream percent_out("percentiles.out")
  !!CLASS ofstream percent_db("percentdb.out")
  // !!CLASS ofstream Alt3bstuff("alt3b.out")
  !!CLASS ofstream detail_out("spm_detail.csv")
  !!CLASS ofstream prof_F("F_profile.out");
  !!CLASS ofstream elasticity("elasticity.csv");
  int condition_SR
  int ipro
  int isim
  number kink_adj
  !! condition_SR = 0;//
  int rnseed           // Random number seed
  !! rnseed = 123;
 ////////////////////////////////////////////////////////////////////////////
  // !! ad_comm::change_datafile_name("setup.dat"); Jim changed to spm.dat file
  !!    *(ad_comm::global_datafile) >>  run_name; // Read in the name of this run
  init_int Tier
  int alt ;            // Alternative specfications (relic of PSEIS)
  vector rec_vector(1,300) // storage vector for historical and future recruitment...
  vector wtd_rec(1,25)
  vector wtd_div(1,25) // denominator of wtd recruitment
  init_int nalts
  init_ivector alt_list(1,nalts)
  init_int TAC_ABC       // Flag to set TAC equal to ABC (1 means true, otherwise false)
  init_int SrType        // Type of recruitment curve (1=Ricker, 2 Bholt)
  // Specify form of recruitment generator (1 = use observed mean and std 
  //                                        2 = use estimated SRR and estimated sigma R
  //                                        3 = use input parameters from srecpar.dat :  
  //                                        4 = use input parameters from srecpar.dat :  
  init_int Rec_Gen       
  init_int Fmsy_F35      // Specify if conditioned so that Fmsy = F35 (affects SRR fitting) may need to be species specific...
  init_number Rec_Cond   // Specify prior condition that recruitment at half and double average SSB is similar to average historical Rec
  init_int Write_Big     // Flag to write big file (of all simulations rather than a summary, 0 means don't do it, otherwise do it) 
  init_int npro          // Number of projection years
  init_int nsims         // Number of simulaions
  init_int styr          // First year of projection
  !! cout<< "First year:\t"<<styr<<endl;
  // Open species level details
  number bzero_in;
  number phizero_in;
  number alpha_in;
  number sigmar_in;
  number rho_in;
  matrix rnorms(1,nsims,1,npro+1);
  matrix unifs(1,nsims,1,npro+1);
  vector sst(1,npro);
 LOCAL_CALCS
  write_log(run_name); 
  write_log(Tier); 
  write_log(nalts); 
  write_log(alt_list); 
  write_log(TAC_ABC); 
  write_log(SrType); 
  write_log(Rec_Gen); 
  write_log(Fmsy_F35); 
  write_log(Rec_Cond); 
  write_log(Write_Big); 
  write_log(npro); 
  write_log(nsims); 
  write_log(styr); 
  write_log(bzero_in); 
  write_log(phizero_in); 
  write_log(alpha_in); 
  write_log(sigmar_in); 
  write_log(rho_in); 
 END_CALCS
  // !! ad_comm::change_datafile_name("spp_catch.dat"); Jim moved to spm.dat
  int      nyrs_catch    // Number of years that catch is specified (starting at first year: styr) 
  init_int nyrs_catch_in // Number of years that catch is specified (starting at first year: styr) 
  !! cout<<"First year, and number of years catch is pre-specified. "<<styr<<" "<<nyrs_catch_in<<endl;
  init_int nspp          // Number of species
  init_number OY_min;    // !! OY_min = 1361.521;
  init_number OY_max;
 LOCAL_CALCS
   for (int i=1;i<=nspp;i++)
     *(ad_comm::global_datafile) >>  spp_file_name(i);

  write_log(nyrs_catch_in); 
  write_log(nspp); 
  write_log(OY_min); 
  write_log(OY_max); 
  write_log(spp_file_name); 

 END_CALCS
  !! cout <<"OYMax "<<OY_max<<endl;
  init_vector ABC_Multiplier(1,nspp) // ABC_Multiplier  
  init_vector N_scalar(1,nspp)       // population scalar                           
  init_vector Alt4_SPR(1,nspp)       // SPR values for Alt 4 (spp specific)         
  vector     Alt4_Fabc(1,nspp)       // ABC values for Alt 4 (spp specific)         
  int        Alt4_Fcalc              // Recalc F for Alt 4?  (spp specific)         
  vector Alt3b_obj_fun(1,nspp)       // sum(avg_yld - half_sqrd_1st_diff)/nsims
  init_int    ntacspp
  init_ivector tac_ind(1,nspp)       // vector of tac-model indices 
  vector model_tacs(1,ntacspp)
  // !! for (int i=1;i<=nspp;i++) 
  init_matrix Obs_Catch(1,nyrs_catch_in,0,nspp) // Pre-specified catch values (year is in column 0)

 LOCAL_CALCS
  if (Rec_Gen==3)
  {
    ad_comm::change_datafile_name("srecpar.dat");
    //  Bzero,  PhiZero,  Alpha,
    *(ad_comm::global_datafile) >>  bzero_in;
    *(ad_comm::global_datafile) >>  phizero_in;
    *(ad_comm::global_datafile) >>  alpha_in;
    *(ad_comm::global_datafile) >>  sigmar_in;
    *(ad_comm::global_datafile) >>  rho_in;
    // rho_in=0.82;
  }
  // Open up tac-model parameters
  ad_comm::change_datafile_name("tacpar.dat");
 END_CALCS
  init_int nntmp
  init_int nnodes
  init_vector maxabc(1,ntacspp)
  init_matrix theta(0,nnodes,1,ntacspp)
  !! cout<<"read tacpar"<<endl;

  !! write_log(ABC_Multiplier); 
  !! write_log(N_scalar); 
  !! write_log(Alt4_SPR); 
  !! write_log(ntacspp); 
  !! write_log(tac_ind); 
  !! write_log(Obs_Catch); 
  !! write_log(maxabc); 
  !! write_log(theta); 
  vector agg_abc(1,ntacspp)
  vector agg_cat(1,ntacspp)
  vector agg_tac(1,ntacspp)
  !! cout << spp_file_name(nspp) << endl;
  !! cout << ABC_Multiplier << endl;
  !! cout << N_scalar << endl;
  !! cout << "Observed Catch "<<endl<<Obs_Catch<<endl;// exit(1);

  int i
  int k
  int dolp
  ivector SSL_spp(1,nspp)          // Flag to tell whether this species is a SSL or not...
  ivector Const_Buffer(1,nspp)     // Flag to tell whether to use the "constant buffer" option for User ABC
  number srprior_a
  number srprior_b
  !! srprior_a = 4;
  !! srprior_b = 10;

// "END: Read in dimensioning parameters and constraints"
 ////////////////////////////////////////////////////////////////////////////
  ivector ngear(1,nspp);
  ivector isit_const(1,nspp);
  vector  FABC_Adj(1,nspp);
  vector spawnmo(1,nspp);
  ivector nages(1,nspp);

  matrix Fratiotmp(1,nspp,1,5)// temp placeholder for later ragged array
  matrix M_Ftmp(1,nspp,1,69);
  matrix M_Mtmp(1,nspp,1,69);
  matrix pmaturetmp_F(1,nspp,1,69);
  matrix pmaturetmp_M(1,nspp,1,69);
  matrix wt_Ftmp(1,nspp,1,69); 
  3darray wt_gear_Ftmp(1,nspp,1,5,1,69);
  3darray wt_gear_Mtmp(1,nspp,1,5,1,69);
  3darray sel_Ftmp(1,nspp,1,5,1,69);
  3darray sel_Mtmp(1,nspp,1,5,1,69);
  matrix n0_Ftmp(1,nspp,1,69);
  matrix n0_Mtmp(1,nspp,1,69);
  matrix Rtmp(1,nspp,1,69);
  matrix SSBtmp(1,nspp,1,69);
  ivector nrec(1,nspp);
  vector Expl_Biom(1,nspp);

  int ntargspp
  vector reserved(1,nspp)
  ivector nsexes(1,nspp)
  vector avg_5yrF(1,nspp)

  vector SPR_abc(1,nspp);
  vector SPR_ofl(1,nspp);
  vector targ_SPR(1,nspp);
  !! SPR_abc = 0.40; // defaults, read in later
  !! SPR_ofl = 0.35; // defaults, read in later
  !! cout<<"ABC: "<<SPR_abc<< endl<<SPR_ofl<<endl;


 LOCAL_CALCS
  // Open species-specific level details
   for (i=1;i<=nspp;i++)
   {
     cout<<spp_file_name(i)  <<endl;
     ad_comm::change_datafile_name(spp_file_name(i));
     *(ad_comm::global_datafile) >> spname(i);               // 1
     cout<<spname(i)  <<endl;
     *(ad_comm::global_datafile) >> SSL_spp(i);              // 2
     *(ad_comm::global_datafile) >> Const_Buffer(i);         // 3
     *(ad_comm::global_datafile) >> ngear(i);                // 4
     *(ad_comm::global_datafile) >> nsexes(i);               // 6 
     *(ad_comm::global_datafile) >> avg_5yrF(i);             // 7
     *(ad_comm::global_datafile) >> FABC_Adj(i);             // 8
     *(ad_comm::global_datafile) >> SPR_abc(i);              // 9
     *(ad_comm::global_datafile) >> SPR_ofl(i);              // 10
     *(ad_comm::global_datafile) >> spawnmo(i);              // 11
     *(ad_comm::global_datafile) >> nages(i);                // 12
         cout<<"nages: "<<nages(i)<<endl;
     write_log( SSL_spp(i));              // 2
     write_log( Const_Buffer(i));         // 3
     write_log( ngear(i));                // 4
     write_log( nsexes(i));               // 6 
     write_log( avg_5yrF(i));             // 7
     write_log( FABC_Adj(i));             // 8
     write_log( SPR_abc(i));              // 9
     write_log( SPR_ofl(i));              // 10
     write_log( spawnmo(i));              // 11
     write_log( nages(i));               
     for (int j=1;j<=ngear(i);j++)                    
       *(ad_comm::global_datafile) >> Fratiotmp(i,j);        // 13
     write_log( Fratiotmp(i));               

     for (int k=1;k<=nages(i);k++)
       *(ad_comm::global_datafile) >> M_Ftmp(i,k);           // 14
     if (nsexes(i)==2)
       for (int k=1;k<=nages(i);k++)
         *(ad_comm::global_datafile) >> M_Mtmp(i,k);         // 15
     write_log( M_Ftmp(i));               

     for (int k=1;k<=nages(i);k++)
       *(ad_comm::global_datafile) >> pmaturetmp_F(i,k);       // 16
     write_log( pmaturetmp_F(i));               

     if (nsexes(i)==2)
       for (int k=1;k<=nages(i);k++)
         *(ad_comm::global_datafile) >> pmaturetmp_M(i,k);         // 15
     write_log( pmaturetmp_M(i));               
      cout << "Mature:  "<< pmaturetmp_F(i)(1,nages(i)) <<endl;

     for (int k=1;k<=nages(i);k++)
       *(ad_comm::global_datafile) >> wt_Ftmp(i,k);          // 17
     write_log( wt_Ftmp(i));               
     for (int j=1;j<=ngear(i);j++)
       for (int k=1;k<=nages(i);k++)
         *(ad_comm::global_datafile) >> wt_gear_Ftmp(i,j,k); // 18
     write_log( wt_gear_Ftmp(i));               

     if (nsexes(i)==2)
       for (int j=1;j<=ngear(i);j++)
         for (int k=1;k<=nages(i);k++)
           *(ad_comm::global_datafile) >> wt_gear_Mtmp(i,j,k);// 19
     write_log( wt_gear_Mtmp(i));               
      
     for (int j=1;j<=ngear(i);j++)
       for (int k=1;k<=nages(i);k++)
         *(ad_comm::global_datafile) >> sel_Ftmp(i,j,k);    // 20
     write_log( sel_Ftmp(i));               

     if (nsexes(i)==2)
       for (int j=1;j<=ngear(i);j++)
         for (int k=1;k<=nages(i);k++)
           *(ad_comm::global_datafile) >> sel_Mtmp(i,j,k);  // 21
     write_log( sel_Mtmp(i));               
     for (int k=1;k<=nages(i);k++)
       *(ad_comm::global_datafile) >> n0_Ftmp(i,k);         // 22
     write_log(  n0_Ftmp(i));               

     if (nsexes(i)==2)
       for (int k=1;k<=nages(i);k++)
         *(ad_comm::global_datafile) >> n0_Mtmp(i,k);       // 23
     write_log(  n0_Mtmp(i));               

         cout<<"N: "<<n0_Ftmp(i)(1,nages(i))<<endl;

     *(ad_comm::global_datafile) >> nrec(i);                // 24
         cout<<"nrec: "<<nrec(i)<<endl;
     for (int j=1;j<=nrec(i);j++)
       *(ad_comm::global_datafile) >> Rtmp(i,j);            // 25
      cout<<"Rec: "<<Rtmp(i)(1,nrec(i))<<endl;
     for (int j=1;j<=nrec(i);j++)
       *(ad_comm::global_datafile) >> SSBtmp(i,j);          // 26
      cout<<"SSB: "<<SSBtmp(i)(1,nrec(i))<<endl;
  }
	  write_log(nrec);
	  write_log(Rtmp);
	  write_log(SSBtmp);
  // cout <<FABC_Adj<<" "<<ABC_Multiplier<<endl;exit(1);
 END_CALCS
  matrix M_F(1,nspp,1,nages);
  matrix M_M(1,nspp,1,nages);
  matrix pmature_F(1,nspp,1,nages);
  matrix pmature_M(1,nspp,1,nages);
  matrix wt_F(1,nspp,1,nages); 
  matrix wt_M(1,nspp,1,nages);
  matrix Frat(1,nspp,1,ngear);
  3darray wt_gear_F(1,nspp,1,ngear,1,nages);
  3darray wt_gear_M(1,nspp,1,ngear,1,nages);
  3darray sel_F(1,nspp,1,ngear,1,nages);
  3darray sel_M(1,nspp,1,ngear,1,nages);
  matrix n0_F(1,nspp,1,nages);
  matrix n0_M(1,nspp,1,nages);
  matrix R(1,nspp,1,nrec);
  matrix SSB(1,nspp,1,nrec);
 LOCAL_CALCS
  M_F.initialize();
  M_M.initialize();
  pmature_F.initialize();
  pmature_M.initialize();
  wt_F.initialize();
  wt_M.initialize();
  wt_gear_F.initialize();
  wt_gear_F.initialize();
  sel_F.initialize();
  sel_M.initialize();
  n0_F.initialize();
  n0_M.initialize();
  R.initialize();
  SSB.initialize();
  for (int i=1;i<=nspp;i++) {
    cout<<spname(i)<<endl;
    for (int k=1;k<=nages(i);k++) {
      M_F(i,k) = M_Ftmp(i,k); 
      pmature_F(i,k) = pmaturetmp_F(i,k); 
      wt_F(i,k) = wt_Ftmp(i,k);  
      for (int j=1;j<=ngear(i);j++) {
        wt_gear_F(i,j,k) = wt_gear_Ftmp(i,j,k); 
        sel_F(i,j,k) = sel_Ftmp(i,j,k); 

        if (nsexes(i)==2) {
          wt_gear_M(i,j,k) = wt_gear_Mtmp(i,j,k); 
          sel_M(i,j,k) = sel_Mtmp(i,j,k);
        }
        else {
          wt_gear_M(i,j,k) = wt_gear_Ftmp(i,j,k); 
          sel_M(i,j,k) = sel_Ftmp(i,j,k);
        }
        wt_M(i,k) += wt_gear_M(i,j,k);  
      }
      if (nsexes(i)==2) {
        pmature_M(i,k)  = pmaturetmp_M(i,k); 
        M_M(i,k)  = M_Mtmp(i,k); 
        n0_F(i,k) = n0_Ftmp(i,k); 
        n0_M(i,k) = n0_Mtmp(i,k); 
      }
      else {
        pmature_M(i,k)  = pmaturetmp_F(i,k); 
        M_M(i,k)  = M_Ftmp(i,k); 
        n0_F(i,k) = n0_Ftmp(i,k)/ 2.; 
        n0_M(i,k) = n0_F(i,k); 
      }
    }
    cout << "M_Female: "<< spname(i)<<" "<<M_F(i) <<endl;
    cout << "M_Male:   "<< spname(i)<<" "<<M_M(i) <<endl;

    wt_M(i) /= ngear(i);
    n0_F(i) /= N_scalar(i);
    n0_M(i) /= N_scalar(i);
    for (int k=1;k<=nyrs_catch_in;k++)
      Obs_Catch(k,i) /= N_scalar(i);

    for (int k=1;k<=nyrs_catch_in;k++)
      cout <<k<<" "<<spname(i)<<" "<< Obs_Catch(k,i)<<endl;

    for (int k=1;k<=nrec(i);k++) {
      R(i,k)    =  Rtmp(i,k);
      SSB(i,k)  =  SSBtmp(i,k);
    }
    R(i) /= N_scalar(i);
    SSB(i) /= N_scalar(i);

    for (int j=1;j<=ngear(i);j++)
      Frat(i,j) = Fratiotmp(i,j);
  }
  for (int ispp=1;ispp<=nspp;ispp++) agg_cat(tac_ind(ispp))  += Obs_Catch(1,ispp);
  cout<<R<<endl;

  wtd_div.initialize(); 
  double sumtmp;
  for (int ispp=1;ispp<=nspp;ispp++) { 
    for (int i=nages(ispp)+1;i<=25;i++) { 
      sumtmp=0.;
      for (int j=1;j<i;j++) 
        sumtmp -= M_F(ispp,nages(ispp));
      wtd_div(i) +=  pmature_F(ispp,nages(ispp))*wt_F(ispp,nages(ispp))*exp(sumtmp);
    }
  }
 END_CALCS
  matrix wt_mature_F(1,nspp,1,nages)
  matrix wt_mature_M(1,nspp,1,nages)
  !! wt_mature_F =  elem_prod(wt_F,pmature_F); 
  vector yrfrac(1,nspp)        // Fraction of year prior to spawning 
  !! yrfrac= (spawnmo-1.)/12; 

  vector Actual_Catch(1,nspp)
  3darray   Rsim(1,nspp,1,nsims,1,npro+1)
  3darray   Fsim(1,nspp,1,nsims,1,npro+1)
  3darray   Bsim(1,nspp,1,nsims,1,npro+1) 
  3darray   Nsim(1,nspp,1,nsims,1,npro+1) 
  3darray  SRsim(1,nspp,1,nsims,1,npro+1) // Sex ratio
  3darray  SBsim(1,nspp,1,nsims,1,npro+1) 
  3darray SPRsim(1,nspp,1,nsims,1,npro+1) 
  3darray   Csim(1,nspp,1,nsims,1,npro+1) 
  matrix  TACs_by_yr(1,npro,1,nspp) 
  matrix  ABCs_by_yr(1,npro,1,nspp) 
  matrix  OFLs_by_yr(1,npro,1,nspp) 
  matrix  FABCs_by_yr(1,npro,1,nspp) 
  matrix  FOFLs_by_yr(1,npro,1,nspp) 

  // Inverse Gaussian Distn parameters
  number gi_beta         
  number gamma       
  vector cvrec(1,nspp)
  number delta
  vector TAC(1,nspp)
  vector ABC(1,nspp)
  vector OFL(1,nspp)

  vector AMeanSSB(1,nspp)
  vector AMeanRec(1,nspp)
  vector AMaxSSB(1,nspp)
  vector HMeanRec(1,nspp)
  vector Bcurrent(1,nspp)        
  !! for (int i=1;i<=nspp;i++) Bcurrent(i) = pmature_F(i)*elem_prod(n0_F(i),wt_F(i));

  number alpha
  !! alpha = 0.05;
  int ii;
  int m;
  int j;
  number alphaCI
  !! alphaCI = 0.1;
  int UCI;
  int LCI;
  !! LCI = ( 1.0 + (      alphaCI *0.5  * 1.*nsims));
  !! UCI = (((1.-alphaCI*0.5)*(nsims+1)) - 1.0);

  !! cout<< "UCI "<< (1.-alphaCI*0.5) <<" "<<UCI <<" "<<LCI<<endl;

  matrix  N_F(1,nspp,1,nages)
  matrix  N_M(1,nspp,1,nages) 
  matrix Nnext_F(1,nspp,1,nages) ;
  matrix Nnext_M(1,nspp,1,nages) ;
  number chi_prev
  number chi
  matrix Z_F(1,nspp,1,nages) ;
  matrix Z_M(1,nspp,1,nages) ;
  matrix S_F(1,nspp,1,nages) ;
  matrix S_M(1,nspp,1,nages) ;
  vector Cabc(1,nspp)        // Catch at equilibrium abc level
  vector Cofl(1,nspp)        // Catch at equilibrium ofl level
  vector F35(1,nspp)
  vector Ftarg(1,nspp)       // Option to set target to the Fofl, Fabc, or F35
  number Btmp;
  number SBtmp;
  3darray C_F(1,nspp,1,ngear,1,nages) ;
  3darray C_M(1,nspp,1,ngear,1,nages) ;
  vector F_yr_one(1,nspp) ; // F that gives TAC in TAC year
  matrix F_begin_yr(1,nyrs_catch_in,1,nspp) ; // F that gives TAC in TAC year
  vector Fabc(1,nspp)
  vector F40(1,nspp)
  vector Fofl(1,nspp)
  matrix Ftotabc(1,nspp,1,nages);
  matrix Ftot40(1,nspp,1,nages);
  matrix Ftotofl(1,nspp,1,nages);
  matrix N(1,nspp,1,nages) ;
  matrix NsprF0(1,nspp,1,nages)
  matrix NsprM0(1,nspp,1,nages)
  matrix NsprFabc(1,nspp,1,nages)
  matrix NsprMabc(1,nspp,1,nages)
  matrix NsprF40(1,nspp,1,nages)
  matrix NsprM40(1,nspp,1,nages)
  matrix NsprFofl(1,nspp,1,nages)
  matrix NsprMofl(1,nspp,1,nages)
  vector SB100(1,nspp)
  vector SBzero(1,nspp)
  vector SBFabc(1,nspp)
  vector SBF40(1,nspp)
  vector SBKink(1,nspp)
  vector SBFofl(1,nspp)
  vector Avg_Age_Mabc(1,nspp)
  vector Avg_Age_M0(1,nspp)
  vector Avg_Age_Fabc(1,nspp)
  vector Avg_Age_F0(1,nspp)
  vector Avg_Age_End(1,nspp)
  vector Avg_Age_Mat(1,nspp)
  vector Avg_Age_sum(1,nspp)
  vector BFabc(1,nspp)
  vector BF40(1,nspp)
  vector BFofl(1,nspp)
  vector B100(1,nspp)
 LOCAL_CALCS
   N_F.initialize();
   N_M.initialize(); 
   Nnext_F.initialize(); 
   Nnext_M.initialize(); 
   chi = 0.;
   chi_prev = 0.;
   Z_F.initialize(); 
   Z_M.initialize(); 
   S_F.initialize(); 
   S_M.initialize(); 
   Cabc.initialize();        // Catch at equilibrium abc level
   Cofl.initialize();        // Catch at equilibrium ofl level
   F35.initialize();
   Ftarg.initialize();
   Btmp=0.0;
   SBtmp=0.0;
   C_F.initialize(); 
   C_M.initialize(); 
   F_yr_one.initialize();  // F that gives TAC in TAC year
   F_begin_yr.initialize(); // F that gives TAC in TAC year
   Fabc.initialize();
   F40.initialize();
   Fofl.initialize();
   Ftotabc.initialize();
   Ftot40.initialize();
   Ftotofl.initialize();
   N.initialize(); ;
   BF40.initialize();
   NsprF0.initialize();
   NsprFabc.initialize();
   NsprF40.initialize();
   NsprFofl.initialize();
   NsprM0.initialize();
   NsprMabc.initialize();
   NsprM40.initialize();
   NsprMofl.initialize();
   SB100.initialize();
   SBzero.initialize();
   SBFabc.initialize();
   SBF40.initialize();
   SBKink.initialize();
   SBFofl.initialize();
   Avg_Age_Fabc.initialize();
   Avg_Age_F0.initialize();
   BFabc.initialize();
   BFofl.initialize();
   B100.initialize();
   Alt4_Fabc.initialize();
 END_CALCS
   number R_guess
 // Compute an initial Rzero value based on exploitation 
 LOCAL_CALCS
   double btmp=0.;
   double ctmp=0.;
   for (int ispp=1;ispp<=nspp;ispp++)
   {
     dvector ntmp(1,nages(ispp));
     ntmp(1) = 1.;
     for (int a=2;a<=nages(ispp);a++)
       ntmp(a) = ntmp(a-1)*exp(-M_F(ispp, a)-.05);

     btmp += wt_F(ispp) * ntmp;
     cout << "Mean Catch"<<endl;
     ctmp += (Obs_Catch(1,ispp));
     cout << ctmp <<endl;
     R_guess = log((ctmp/.02 )/btmp) ;
     cout << "R_guess "<<endl;
     cout << R_guess <<endl;
   }
 END_CALCS
  number phase_sr
  !! if (Rec_Gen==3||Rec_Gen==4) phase_sr = -3; else phase_sr=1;



INITIALIZATION_SECTION
  steepness 0.78
  sigr      0.5
  // log_Rzero 6.1
  log_Rzero R_guess

PARAMETER_SECTION
  // init_bounded_vector Fabc(1,nspp,0.00001,5)
  // init_bounded_vector F40(1,nspp,0.00001,5)
  // init_bounded_vector Fofl(1,nspp,0.00001,5)
  init_bounded_vector log_Rzero(1,nspp,0,13,phase_sr)
  init_bounded_vector steepness(1,nspp,0.2,1.0,phase_sr+1)
  init_bounded_vector sigr(1,nspp,0.1,1.5,phase_sr+2)
  init_number dummy(1)

  vector sr_alpha(1,nspp);
  vector beta(1,nspp);
  vector Rzero(1,nspp);
  vector rec_like(1,nspp);
  // matrix pred_rec(1,nspp,1,nrec);
  sdreport_vector Bzero(1,nspp);
  vector phizero(1,nspp)
  vector phi(1,nspp)
  vector sigmaRsq(1,nspp);

  vector MSY(1,nspp);
  vector Fmsy(1,nspp);
  vector Bmsy(1,nspp);
  vector Rmsy(1,nspp);


  vector sigmar(1,nspp)

  objective_function_value obj_fun   

 LOCAL_CALCS 
   // Fill out R matrix (dimensioned species, sims, proj_yr)
  cout<<"finished random numbers"<<endl;
  rnorms.fill_randn(rnseed);
  unifs.fill_randu(rnseed);
  cout<<"finished random numbers"<<endl;
  for (int ispp=1;ispp<=nspp;ispp++)
  {
   // Get parameter values for InvGauss

    if (nsexes(ispp)==1) 
      AMeanRec(ispp) = mean(R(ispp));  // Arithmetic mean
    else
      AMeanRec(ispp) = 2.*mean(R(ispp));  // Arithmetic mean

    AMeanSSB(ispp) = mean(SSB(ispp));  // Arithmetic mean
    AMaxSSB(ispp) = max(SSB(ispp));  // Arithmetic mean
    HMeanRec(ispp) = 1./ mean(1./R(ispp));   // Harmonic mean

   // Given Amean and Hmean, solve for parameters of inv gaussian
    gamma = AMeanRec(ispp) / HMeanRec(ispp) ;
    gi_beta  = AMeanRec(ispp) ;
    delta = 1./(gamma - 1.);
    cvrec(ispp) = sqrt(1./delta);

  // Simulate inv-gaussian RV's
    ifstream envin("envmat.dat"); // note can't have comments in top
    for (int i=1;i<=nsims;i++)
    {
      for (j=1;j<=npro;j++)
      {
        double psi   = (square( rnorms(i,j) ));
        double omega = gi_beta*(1.+(psi-sqrt(4.*delta*psi+square(psi)))/ (2.*delta));
        double zeta  = gi_beta*(1.+(psi+sqrt(4.*delta*psi+square(psi)))/ (2.*delta));
        double gtheta = gi_beta/(gi_beta+omega);
        if (unifs(i,j) <= gtheta)
          Rsim(ispp,i,j) = omega;
        else 
          Rsim(ispp,i,j) = zeta;
        if (Rec_Gen==4)// environmental index
        {
          envin >>  Rsim(ispp,i,j);
          Rsim(ispp,i,j) *= exp(rnorms(i,j)*.375); // about 15% CV to get historical mean
        }
       if (nsims<=5) Rsim(ispp,i,j) = AMeanRec(ispp); // XXX constant recruitment
      }
    }
    envin.close();
    AMeanRec(ispp) *= .5;  // Arithmetic mean
    cout <<"recruits"<<endl;
    // cout<< " Solving spp "<<ispp<<" "<<spname(ispp)<<" "<<yr_one_catch(ispp)<<" "; // <<N_F*wt_mature(ispp)<<" "<<N_F*wt_F(ispp)+N_M(ispp)*wt_F(ispp)<<" ";
    for (int k=1;k<=nyrs_catch_in;k++)
    {
      if (Obs_Catch(k,ispp) > 0 )
        F_begin_yr(k,ispp) = SolveF2(n0_F(ispp), n0_M(ispp), Obs_Catch(k,ispp),ispp); // F_yr_one(ispp) = SolveF2(n0_F(ispp), n0_M(ispp), yr_one_catch(ispp),ispp);
      else
        F_begin_yr(ispp) = 0; // F_yr_one(ispp) = 0; // cout<<spname(ispp)<<" "<<F_yr_one(ispp)<<" "<<yr_one_catch(ispp)<<endl;
    }
  } 

  if (ad_comm::argc > 1) // Debugging if LP to be done or not
  {
    int on=0;
    if ( (on=option_match(ad_comm::argc,ad_comm::argv,"-nolp"))>-1)
      dolp=0;
    else
      dolp=1;
  }
 END_CALCS


PRELIMINARY_CALCS_SECTION
  double tmp1;
  write_alts_hdr();
  get_SB100();
  cout<<"SSB, Biomass at unfished: "<<endl<<SB100<<endl<<B100<<endl;
  for (int ispp=1;ispp<=nspp;ispp++)
  {
    cout <<ispp<<" SPR F35 = "<<get_spr_rates(0.35,ispp)<<" "<< spname(ispp)<<endl;
    Fabc(ispp) = (get_spr_rates(SPR_abc(ispp),ispp));
    cout<<"Alt4 SPR "<<Alt4_SPR(ispp)<<endl;
    Alt4_Fabc(ispp) = get_spr_rates(Alt4_SPR(ispp),ispp);
    cout<<"Alt4 Fabc: "<<Alt4_Fabc(ispp)<<endl;

     F40(ispp) = (get_spr_rates(0.4,ispp));
    Fofl(ispp) = (get_spr_rates(SPR_ofl(ispp),ispp));
    F35(ispp)  = (get_spr_rates(.35,ispp));
    Ftarg(ispp)= Fofl(ispp); 
    targ_SPR(ispp) = SPR_ofl(ispp);
  }

PROCEDURE_SECTION
  compute_obj_fun();
  if (mceval_phase()) cout<<log_Rzero<<" "<<steepness<<" "<<sigr<<" "<<endl;

FUNCTION Run_Sim
  detail_out<<"Stock,Alt,Sim,Yr,SSB,Rec,Tot_biom,SPR_Implied,F,Ntot,Catch,ABC,OFL,AvgAge,AvgAgeTot,SexRatio,B0,B40,B35"<<endl;
  for (int ispp=1;ispp<=nspp;ispp++)
  {
    Get_SPR_Catches(ispp);
    percent_out <<endl;
    write_sim_hdr(ispp);
  }
  for (int ialt=1;ialt<=nalts;ialt++)
  {
    alt = alt_list(ialt);

    if (alt==2 && nyrs_catch_in >1) 
      nyrs_catch = nyrs_catch_in;
    else 
      nyrs_catch = 1;// NOTA BUENO: this is changed under the new EIS Alternatives (May 06)
    Do_Sims();
    // if (alt==2) write_alts();
    write_alts();
  }

FUNCTION  compute_obj_fun
  dvariable tmp1;
  dvariable tmp2;
  tmp1.initialize();
  for (int ispp=1;ispp<=nspp;ispp++)
  {
    Get_Bzero(ispp);
   // write_srec();exit(1);
    if(Fmsy_F35>0) 
    {
      get_msy(ispp);
      switch (current_phase())
      {
        case 1 : tmp1 =  1.e1*square(log(Fmsy(ispp))-log(F35(ispp))); break;
        case 2 : tmp1 =  1.e2*square(log(Fmsy(ispp))-log(F35(ispp))); break;
        case 3 : tmp1 =  1.e2*square(log(Fmsy(ispp))-log(F35(ispp))); break;
        case 4 : tmp1 =  1.e3*square(log(Fmsy(ispp))-log(F35(ispp))); break;
        default: tmp1 =  1.e3*square(log(Fmsy(ispp))-log(F35(ispp))); break;
      }
      if(Fmsy_F35==2) 
      switch (current_phase())
      {
        case 1 : tmp1 +=  1.e1*square(log(Bmsy(ispp))-log(0.35 * SB100(ispp))); break;
        case 2 : tmp1 +=  1.e2*square(log(Bmsy(ispp))-log(0.35 * SB100(ispp))); break;
        case 3 : tmp1 +=  1.e2*square(log(Bmsy(ispp))-log(0.35 * SB100(ispp))); break;
        case 4 : tmp1 +=  1.e3*square(log(Bmsy(ispp))-log(0.35 * SB100(ispp))); break;
        default : tmp1+=  1.e3*square(log(Bmsy(ispp))-log(0.35 * SB100(ispp))); break;
      }
      obj_fun += tmp1;
    }
    if (Rec_Cond>0.)
    {
      // More conditioning here--make mean recruitment consistent with half and double 
      // recruitment at avg spawning biomass...
      double vartmp = 2.*Rec_Cond*Rec_Cond;
      /* 
      double ssb1 = AMeanSSB(ispp) * 0.5;
      double ssb2 = AMeanSSB(ispp)      ;
      double ssb3 = AMeanSSB(ispp) * 2.0;
      // double ssb4 = value(Bzero(ispp)) ;
      tmp2.initialize();
      tmp2 +=      square(log(AMeanRec(ispp)) - log(SRecruit( ssb1, ispp)))/ vartmp;
      tmp2 +=      square(log(AMeanRec(ispp)) - log(SRecruit( ssb2, ispp)))/ vartmp;
      tmp2 +=      square(log(AMeanRec(ispp)) - log(SRecruit( ssb3, ispp)))/ vartmp;
      // tmp2 += 24.* square(log(AMeanRec(ispp)) - log(SRecruit( ssb4, ispp)));
      // tmp2 += 24.* square(log(AMeanSSB(ispp)) - log( ssb4 ));
      */
      tmp2 =      square(log(Bzero(ispp)) - log(SB100(ispp)))/ vartmp;
      obj_fun += tmp2;
      // cout << "SSB "<<ssb1<<" " <<ssb2<<" "<< ssb3<<" "<<ssb4<< " "<<tmp2<<endl;
    }
    Recruitment_Likelihood(ispp);
    // cout<<"Tmp1 "<<tmp1<<" "<<rec_like<<" "<<obj_fun<<endl;

    // Add a diffuse prior on steepness...
    /* if (active(steepness)) {
      dvariable steeptmp;
      steeptmp = (steepness(ispp) - .2) /.8 ;
      obj_fun -= ((srprior_a-1.)*log(steeptmp) + (srprior_b-1)*log(1.-steeptmp));
    }
    */
  }
  obj_fun += dummy*dummy;

FUNCTION Do_Sims
  /* Have to do in steps: 1) find TAC value for catch 2) compute constraint vector 3) optimize given those constraints 4) get realized catches based on optimization 5) project population to next year, restart from step 3) */
  Avg_Age_End.initialize();
  Avg_Age_sum.initialize();
  OFLs_by_yr.initialize();
  TACs_by_yr.initialize();
  ABCs_by_yr.initialize();
  for (int ispp=1;ispp<=nspp;ispp++) 
  {
    Get_Bzero(ispp);
    get_msy(ispp);
  }
  for (isim=1;isim<=nsims;isim++)         // +++++++++++Sim
  {
    N_F = n0_F       ;  // Initialize N's only once per simulation
    N_M = n0_M       ;
   // Loop over projection years
   for (ipro=1;ipro<=npro;ipro++) 
   { // call and get TAC's fo this species in this year...
     //////////////////////////////////////////////////////////////////////////////
     //  TAC_ABC=1; // need to put bck
     //////////////////////////////////////////////////////////////////////////////
     TAC.initialize();
     Expl_Biom.initialize();
     for (int ispp=1;ispp<=nspp;ispp++) 
     {
       // cout<<rec_vector<<endl;
       rec_vector(1,nrec(ispp)) = R(ispp);
       // cout<<rec_vector<<endl;

       // cout<< rec_vector(nrec(ispp)+1,nrec(ispp)+npro).indexmin()<<endl;
       // cout<< rec_vector(nrec(ispp)+1,nrec(ispp)+npro+1).indexmax()<<endl;

       // cout<<( Rsim(ispp,isim).shift(nrec(ispp)+1)).indexmin()<<endl;
       // cout<<( Rsim(ispp,isim).shift(nrec(ispp)+1)).indexmax()<<endl;

       rec_vector((nrec(ispp)+1),(nrec(ispp)+npro+1)) = Rsim(ispp,isim).shift(nrec(ispp)+1);
       Rsim(ispp,isim).shift(1); 
       // cout<<rec_vector<<endl;
       
       ABC(ispp)       =   ABC_Multiplier(ispp) * Get_Catch(alt,ispp); // ABC_multiplier is from setup.dat
       OFL(ispp)       =    Get_Catch(6,ispp); 
       // if (alt!=2) 
        ABCs_by_yr(ipro,ispp) += Get_Catch(1,ispp);
       // else 
        // ABCs_by_yr(ipro,ispp) = ABC(ispp);  // Cumulate ABCs here for printout later...
     }
     // Now get actual catch...  
     if (ipro <= nyrs_catch && !(alt == 6 || alt == 7)) // use observed catches from setup file for the first year(s)
     {
       for (int ispp=1;ispp<=nspp;ispp++) 
       {
         Actual_Catch(ispp) = Obs_Catch(ipro,ispp); 
         // Actual_Catch(ispp) = min(ABC(ispp),Obs_Catch(ipro,ispp)); // NOTA BUENO: May 06 change
         // cout<< alt<<" "<<spname(ispp)<<" "<< ABC(ispp)<<" "<<Obs_Catch(ipro,ispp)<<" "<<Actual_Catch(ispp)<<endl; // NOTA BUENO: May 06 change
       }
     }
     else  // Build in condition to get TAC different than ABC...
     {
       if (ipro==1)
       {
         for (int ispp=1;ispp<=nspp;ispp++) 
           Actual_Catch(ispp) = Obs_Catch(ipro,ispp); 
       }
       else // not the first year... for 7 and 6
       {
         if (TAC_ABC==1)
         {
           TAC = ABC;
           if (alt == 4)
             Alt4_TAC();       
           if (alt == 6 || alt == 7) 
             Status_Determ();
           else // Most alternatives fall here...
           {
             if ((alt==2 ||alt==98||alt==97) && sum(TAC)>OY_max)
               Actual_Catch   = TAC/sum(TAC)*OY_max; 
             else
               Actual_Catch   = TAC; 
           }
         /* ////////////////////////////////////////////////////////////////////////////// //int use_max = 1; // Need to move this into the setup file...  double max_catch=1500.;// EBS POllock special case (CHANGE THIS) //if (use_max==1) for (int ispp=1;ispp<=nspp;ispp++) Actual_Catch(ispp)   = min(TAC(ispp),max_catch); // cout<<"AC: "<<Actual_Catch(1,6)<<endl;; TAC_ABC=0; ////////////////////////////////////////////////////////////////////////////// */
         }
         else
         {
           Fit_TAC();
         }
       }
     }

     TACs_by_yr(ipro) += TAC; // Cumulate TACs here for printout later...
     OFLs_by_yr(ipro) += OFL; // Cumulate OFLs here for printout later...
     Project_Pops(isim,ipro); //cout << "Done projection"<<endl; //cout <<"Csim: "<<isim<<" "<<i<<" "<<Csim(1,isim,i) <<" "<< endl; //cout << "Yr_"<<i+styr-1<<"_Expl "<< Expl_Biom<<endl;
   // OjO, looping for long term projections...need to compute the average coefficients from past
    // Mainloop(npro+1,npro+15,isim);
    Avg_Age();

     for (int ispp=1;ispp<=nspp;ispp++) 
       detail_out     <<      spname(ispp) 
                      <<","<< alt        
                      <<","<< isim        
                      <<","<< styr+ipro-1
                      <<","<<SBsim(ispp,isim,ipro)
                      <<","<< Rsim(ispp,isim,ipro)
                      <<","<<Bsim(ispp,isim,ipro)
                      <<","<<SPRsim(ispp,isim,ipro)
                      <<","<<Fsim(ispp,isim,ipro)  
                      <<","<<Nsim(ispp,isim,ipro) 
                      <<","<<Actual_Catch(ispp)
                      <<","<<ABC(ispp)
                      <<","<<OFL(ispp)
                      <<","<<Avg_Age_Mat(ispp)
                      <<","<<Avg_Age_End(ispp)
                      <<","<<SRsim(ispp,isim,ipro)
                      <<","<<SB100(ispp)
                      <<","<<SB100(ispp)*.4
                      <<","<<SB100(ispp)*.35
											<< endl;
   } // Loop over projection years

  }  // Loop over Sims
  for (int ispp=1;ispp<=nspp;ispp++)
  {
      // Get_SPR_Catches(ispp);
    if (nsims>2)
       write_sim("Alternative ",ispp);
  }
  write_by_time();


FUNCTION Alt4_TAC
  // Return vector of Alt4 TACs (given Alt4_Fabc, and the SSL prey condition to be at least up to SSL MaxPerm)
  // Get all ABCs under Alt4_Fabc
  // Sum and test if below OY_min
     double sumabc;
     sumabc = sum(ABC);
     if (sumabc<OY_min&&nspp>3)
     {
       Alt4_Fcalc = 1;
       double diff;
       double ssl_sum=0.;
       diff = OY_min-sumabc;
       // if so, sum up SSL ABCs
       ssl_sum = SSL_spp*ABC;
       for (int ispp=1;ispp<=nspp;ispp++) 
       {
         // then apportion them to difference between current ABC and target (OY_min) difference
         if (SSL_spp(ispp))
         {
           TAC(ispp) = ABC(ispp) + diff * ABC(ispp)/ssl_sum;
           // Special for BSAI Pcod to subtract off 3%...and get the totals to match up
           // if (ispp==2) TAC(ispp) /= 0.97; For EIS work
         }
         else
         {
           TAC(ispp) = ABC(ispp);
         }
       }
       // cout << ipro<<" "<<sum(TAC)<<" "<<sumabc<<" "<<diff+sumabc<<endl;
     }
     else
     {
       Alt4_Fcalc = 0;
       TAC = ABC;
     }

  // Then given new "catches" solve for Fabc for that species
     // Ftmp = SolveF2(N_F(ispp),N_M(ispp),Actual_Catch(ispp),ispp);
     // for (int ispp=1;ispp<=nspp;ispp++) Actual_Catch(ispp) = Obs_Catch(ipro,ispp); dd=   ABC_Multiplier(ispp) * Get_Catch(alt,ispp); // ABC_multiplier is from setup.dat

 // Get_Catch ==============================================================================------------------
FUNCTION double Get_Catch(const int& thisalt, const int& ispp)
  double Ftmp;
  dvector Ftottmp_F(1,nages(ispp));
  dvector Ftottmp_M(1,nages(ispp));
  // Set a good starting guess for spawning biomass 
  SBtmp = (N_F(ispp) * elem_prod( wt_mature_F(ispp), mfexp( -yrfrac(ispp)*(M_F(ispp) + Ftotabc(ispp) )))); 

  // Calls Get_F_t to compute the current year's F (as a function of stock size, species etc)
  Ftmp = 0.0; 
  Ftmp = Get_F(thisalt, ispp);
  Ftottmp_F.initialize();
  Ftottmp_M.initialize();
  for (m=1;m<=ngear(ispp);m++)
  {
    Ftottmp_F += Ftmp*Frat(ispp,m)*sel_F(ispp,m);
    Ftottmp_M += Ftmp*Frat(ispp,m)*sel_M(ispp,m);
  }
  SBtmp = N_F(ispp) * elem_prod( wt_mature_F(ispp), mfexp( -yrfrac(ispp)*(M_F(ispp) + Ftottmp_F))); 
  
  Z_F(ispp) = Ftottmp_F  + M_F(ispp); 
  Z_M(ispp) = Ftottmp_M  + M_M(ispp); 
  S_F(ispp) = mfexp( -Z_F(ispp) );
  S_M(ispp) = mfexp( -Z_M(ispp) );
  
  // Get catch-at-age for each fishery (since avg wts may be different)...
  double ctmp;
  ctmp = 0.;
  Ftottmp_F.initialize();
  Ftottmp_M.initialize();
  for (m=1;m<=ngear(ispp);m++)
  {
    Ftottmp_F = Ftmp*Frat(ispp,m)*sel_F(ispp,m);
    Ftottmp_M = Ftmp*Frat(ispp,m)*sel_M(ispp,m);
    ctmp += wt_gear_F(ispp,m) * elem_prod(elem_div(Ftottmp_F,  Z_F(ispp)),elem_prod(1.-S_F(ispp),N_F(ispp))); // Catch equation (vectors)
    ctmp += wt_gear_M(ispp,m) * elem_prod(elem_div(Ftottmp_M,  Z_M(ispp)),elem_prod(1.-S_M(ispp),N_M(ispp))); // Catch equation (vectors)
  }
  // cout<< ipro<<" "<<ctmp<<" "<<wt_gear_M(ispp,1) * elem_prod(elem_div(Ftottmp_M,  Z_M(ispp)),elem_prod(1.-S_M(ispp),N_M(ispp))) ; cout<<" "<< wt_gear_F(ispp,1) * elem_prod(elem_div(Ftottmp_F,  Z_F(ispp)),elem_prod(1.-S_F(ispp),N_F(ispp)))<<endl;
  // if (ipro==3) {cout<<"New "<<mean(wt_gear_F(ispp,1))<<" "<<N_F(ispp)<<endl;exit(1);}
  // cout<<spname(2)<<" Ftotabc c "<<Ftotabc(2)(1,3)<<endl;
  return(ctmp);
  
 // Get F and catch givent ALT==============================================================================
FUNCTION double Get_F(const int& thisalt,const int& ispp)
  double ftmp;
  dvector F_age_tmp(1,nages(ispp));
  F_age_tmp.initialize(); // THIS is for selectivity for combined gears...
  for (m=1;m<=ngear(ispp);m++)
    F_age_tmp += Frat(ispp,m) * sel_F(ispp,m);

  if (Tier==1)
  {
    SBKink(ispp) = value(Bmsy(ispp));
    SBzero(ispp) = value(Bzero(ispp));
    // cout<<SBKink(ispp)<<endl;exit(1);
  }
  else
  {
    SBKink(ispp)=(SBF40(ispp));
    SBzero(ispp) = SB100(ispp);
  }
  double F1;
  double F2;
  double temp_F;
  // Test for FMP species else do basic F
  {
    switch (thisalt) 
    {
      case 1 : // Max ABC
        ftmp = Get_F_t( F_age_tmp, N_F(ispp), ispp); 
        break;

      case 2 : // Auth ABC
        if (Const_Buffer(ispp)) // Dorn's constant buffer (data file option)
        {
          // FABC_Adj is from the Species file
          SBKink(ispp) = SBF40(ispp)*Fofl(ispp)/F40(ispp);
          ftmp = FABC_Adj(ispp) * Get_F_t( F_age_tmp, N_F(ispp), ispp); 
          SBKink(ispp) = SBF40(ispp);
        }
        else
          ftmp = FABC_Adj(ispp) * Get_F_t( F_age_tmp, N_F(ispp), ispp); 

        ftmp *= ABC_Multiplier(ispp); // use the multiplier in _spcat.dat file also...
        break;

      // Old case 3 : // Half max F ftmp = 0.5 * Get_F_t( F_age_tmp, N_F(ispp), ispp); 
      case 3 :  // Old alt 4
        ftmp = avg_5yrF(ispp); 
        break;

      case 4 : // New Alt 4
        temp_F = Fabc(ispp);
        F1 = Alt4_Fabc(ispp);// SolveF2(N_F(ispp),N_M(ispp),TAC(ispp),ispp);
        F2 = Get_F_t( F_age_tmp, N_F(ispp), ispp); 
        if (F1<F2)
          ftmp = F1;
        else
          ftmp = F2;
         // cout <<ipro<<" "<<spname(ispp)<<" "<<ftmp<<" "<<F1<<" "<<TAC(ispp)<<" "<<Actual_Catch(ispp)<<" "<<F2<<" "<<SBF40(ispp)<<" "<<SBtmp<<endl;
        // Fabc(ispp) = Alt4_Fabc(ispp);
        // Need to get minimum for SSL species...
        if (Alt4_Fcalc && SSL_spp(ispp))
        {
         if (TAC(ispp)>0.01) ftmp = SolveF2(N_F(ispp),N_M(ispp),TAC(ispp),ispp);
         // cout <<ipro<<" "<<spname(ispp)<<" "<<ftmp<<" "<<F1<<" "<<TAC(ispp)<<" "<<Actual_Catch(ispp)<<" "<<F2<<" "<<SBF40(ispp)<<" "<<SBtmp<<endl;
        }
        break;

      case 5 : 
        ftmp = 0.0;
        break;

      case 6:  //  Threshold Determination Note: uses TAC=ABC 
        ftmp = Get_Fofl_t( F_age_tmp, N_F(ispp), ispp); 
        break;
      case 66:  //  Threshold Determination Note: uses TAC=ABC 
        ftmp = Get_Fofl_t2( F_age_tmp, N_F(ispp), ispp); 
        break;

      case 7:  //  Threshold Determination Note: does NOT use TAC=ABC 
        ftmp = Get_Fofl_t( F_age_tmp, N_F(ispp), ispp); 
        break;

      case 32 : 
        // Alt 3.2 affects here (Grant's correction)
        // Returns value of F for specified Fofl OR Ammendment 56 value, whichever is lower
        // Risk-averse ARY Fabc level
        // F1 = FABC_Adj(ispp) * value(Fofl(ispp));  // This is unadjusted
        F1 = FABC_Adj(ispp) * Get_Fofl_t( F_age_tmp, N_F(ispp), ispp); // Apply adjustment to Amm56 OFL
        F2 = Get_F_t( F_age_tmp, N_F(ispp), ispp); // Simply Amm 56 F with SSL protection
        if (F1<F2)
          ftmp = F1;
        else
          ftmp = F2;
        break;
      case 41 : 
        ftmp = FABC_Adj(ispp) * Get_F_t( F_age_tmp, N_F(ispp), ispp); 
        break;
      case 42 : 
        ftmp = .0;
        break;
      case 97 : 
      // Teresa's wtd rec mean
         
        wtd_rec.initialize();
        double sumtmp; 
        for (int ii=1;ii<=nages(ispp);ii++)
        {
          sumtmp=0.;
          for (int j=1;j<ii;j++) 
            sumtmp -= M_F(ispp,j);
          wtd_rec(ii) += pmature_F(ispp,ii)*wt_F(ispp,ii)*
                         rec_vector(nrec(ispp)+1+ipro-ii)*exp(sumtmp);
        }
        for (int ii=nages(ispp)+1;ii<=25;ii++)
        {
          for (int j=1;j<ii;j++) 
            sumtmp -= M_F(ispp,nages(ispp));
          wtd_rec(ii) += pmature_F(ispp,nages(ispp))*wt_F(ispp,nages(ispp))*
                         rec_vector(nrec(ispp)+1+ipro-ii)*exp(sumtmp);
        }
        kink_adj = .5*(sum(wtd_rec) / sum(wtd_div)) /AMeanRec(ispp);
        // cout<<"Teresa "<<kink_adj<<endl;
        SBKink(ispp) = kink_adj*SBF40(ispp);
        SBzero(ispp) = kink_adj*SB100(ispp);
        ftmp = Get_F_t( F_age_tmp, N_F(ispp), ispp); 
        break;

      // Special case to adjust kink by recent recruitments...
      case 98 : 
        kink_adj = .5*mean(rec_vector(nrec(ispp)+1+ipro-20,nrec(ispp)+ipro)) /AMeanRec(ispp);
        // cout << "Isim "<<isim<<" "<<ipro<<" "<<kink_adj<<endl;// Rsim(ispp,isim,ipro)<<" "<<mean(R(ispp))<<" "<< mean(rec_vector(nrec(ispp)+1+ipro-20,nrec(ispp)+ipro)) <<" "<<AMeanRec(ispp)<<endl; // cout<<rec_vector<<endl;exit(1);
        SBKink(ispp) = kink_adj*SBF40(ispp);
        SBzero(ispp) = kink_adj*SB100(ispp);
        ftmp = Get_F_t( F_age_tmp, N_F(ispp), ispp); 
        break;
      case 99 : 
        // Simply a constant rate--equals the ABC, no cap?
        ftmp = (Fabc(ispp));
        break;

      default  :
        if (Const_Buffer(ispp)) // Constant Dorn buffer 
        {
          SBKink(ispp) = SBF40(ispp)*Fofl(ispp)/F40(ispp);
          ftmp = FABC_Adj(ispp) * Get_F_t( F_age_tmp, N_F(ispp), ispp); 
          SBKink(ispp) = SBF40(ispp);
        }
        else
          ftmp = FABC_Adj(ispp) * Get_F_t( F_age_tmp, N_F(ispp), ispp); 
        break;
    }
  }
  return(ftmp);

FUNCTION double Get_F_SSL_prey(const dvector& F_age, const dvector& N_females, const int ispp )
  double Ftmp; // cout<< spname(ispp)<< endl;
  for (ii=1;ii<=3;ii++) // Iterate to get month of spawning correct
  {
    if (SBtmp < 0.2*SBzero(ispp))  // NOTE 20% of SB100%
      Ftmp = 0.;
    if (SBtmp >= 0.2 *SBzero(ispp) & SBtmp < SBKink(ispp) )  // NOTE Same as Am 56 here (until 20% bzero reached)
      Ftmp = (Fabc(ispp)*(1/(1-alpha ))*(SBtmp/SBKink(ispp) - alpha ));
    if (SBtmp > SBKink(ispp) )
      Ftmp = (Fabc(ispp));
    SBtmp = N_females * elem_prod( wt_mature_F(ispp), mfexp( -yrfrac(ispp)*(M_F(ispp) + Ftmp*F_age ))); 
  }
  return(Ftmp);

FUNCTION double Get_F_Am56(const dvector& F_age, const dvector& N_females, const int ispp )
  double Ftmp; // cout<< spname(ispp)<< endl;
  {
    for (ii=1;ii<=3;ii++) // Iterate to get month of spawning correct
    {
      if (SBtmp < alpha*SBKink(ispp))
        Ftmp = 0.;
      if (SBtmp >= alpha*SBKink(ispp) & SBtmp < SBKink(ispp) )
        Ftmp = (Fabc(ispp)*(1/(1-alpha))*(SBtmp/SBKink(ispp) - alpha));
      if (SBtmp > SBKink(ispp) )
        Ftmp = (Fabc(ispp));
      SBtmp = N_females * elem_prod( wt_mature_F(ispp), mfexp( -yrfrac(ispp)*(M_F(ispp) + Ftmp*F_age ))); 
    }
  }
  return(Ftmp);

FUNCTION double Get_Fofl_t2(const dvector& F_age, const dvector& N_females, const int ispp )
  double Ftmp; // cout<< spname(ispp)<< endl;
  {
    for (ii=1;ii<=3;ii++) // Iterate to get month of spawning correct
    {
      if (SBtmp < alpha*SBKink(ispp))
        Ftmp = 0.;
      if (SBtmp >= alpha*SBKink(ispp) & SBtmp < SBKink(ispp) )
        Ftmp = (Fofl(ispp)*(1/(1-alpha))*(SBtmp/SBKink(ispp) - alpha));
      if (SBtmp > SBKink(ispp) )
        Ftmp = (Fofl(ispp));
      SBtmp = N_females * elem_prod( wt_mature_F(ispp), mfexp( -yrfrac(ispp)*(M_F(ispp) + Ftmp*F_age ))); 
    }
  }
  return(Ftmp);

FUNCTION double Get_Fofl_t(const dvector& F_age, const dvector& N_females, const int ispp )
  double Ftmp; // cout<< spname(ispp)<< endl;
  {
    for (ii=1;ii<=3;ii++) // Iterate to get month of spawning correct
    {
      if (SBtmp < alpha*SBKink(ispp))
        Ftmp = 0.;
      if (SBtmp >= alpha*SBKink(ispp) & SBtmp < SBKink(ispp) )
        Ftmp = (Fofl(ispp)*(1/(1-alpha))*(SBtmp/SBKink(ispp) - alpha));
      if (SBtmp > SBKink(ispp) )
        Ftmp = (Fofl(ispp));
      SBtmp = N_females * elem_prod( wt_mature_F(ispp), mfexp( -yrfrac(ispp)*(M_F(ispp) + Ftmp*F_age ))); 
    }
  }
  return(Ftmp);


FUNCTION double Get_F_t(const dvector& F_age, const dvector& N_females, const int ispp )
  double Ftmp; // cout<< spname(ispp)<< endl;
  if (SSL_spp(ispp))
  {
    Ftmp = Get_F_SSL_prey(F_age, N_females, ispp);
  }
  else
  {
    Ftmp = Get_F_Am56(F_age, N_females, ispp);
  }
  return(Ftmp);

FUNCTION void Project_Pops(const int& isim, const int& i)
  double ctmp;
  if ( i == npro && isim%int(nsims/4)==0) cout << "Year "<<styr + i -1<<" Sim: "<< isim <<" Alternative "<<alt<<endl;
  // This is where the populations get updated (after ACTUAL catches and F's have been figured out)
  for (int ispp=1;ispp<=nspp;ispp++) // ++++++++++++++Species
  {
    // if ( ! isit_const(ispp) )
    {
      double Ftmp;
      Ftmp=0.0;
      dvector Ftottmp_spr(1,nages(ispp));
      dvector Ftottmp_F(1,nages(ispp));
      dvector Ftottmp_M(1,nages(ispp));
      SBtmp = (N_F(ispp) * elem_prod( wt_mature_F(ispp), mfexp( -yrfrac(ispp)*(M_F(ispp) + Ftotabc(ispp) )))); 
      
      if (Actual_Catch(ispp) > 0)
      {
        if (i <= nyrs_catch || TAC_ABC==0) // Use TAC setting  algorithm for alt 2 only, for all others, set TAC==ABC
        {
          Ftmp = SolveF2(N_F(ispp),N_M(ispp),Actual_Catch(ispp),ispp);
        }
        else
        {
          if (alt==7 && i<=3)
            Ftmp = Get_F(1,ispp); // Set to the F rather than solving every time...
          else
            if (alt==77 && i<=2)
              Ftmp = Get_F(1,ispp); // Set to the F rather than solving every time...
            else
          {
            // if (alt==2 && sum(TAC)>OY_max)
             if ((alt==2 ||alt==98||alt==97) && sum(TAC)>OY_max)
            {
              Ftmp = SolveF2(N_F(ispp),N_M(ispp),OY_max*TAC(ispp)/sum(TAC),ispp);
              // cout<<"HERE "<< Ftmp<<" "<<OY_max*TAC(ispp)/sum(TAC)<<endl;
            }
            else
              Ftmp = Get_F(alt,ispp); // Set to the F rather than solving every time...
          }
        }
      }
      else
      {
        Ftmp = 0.;
        SPRsim(ispp,isim,i) =  1.0;
      }
      
      Ftottmp_F.initialize();
      Ftottmp_M.initialize();
      SBtmp = 0.;
      Btmp = 0.;
      for (m=1;m<=ngear(ispp);m++)
      {
        Ftottmp_F += Ftmp*Frat(ispp,m)*sel_F(ispp,m);
        Ftottmp_M += Ftmp*Frat(ispp,m)*sel_M(ispp,m);
      }
      SBtmp = (N_F(ispp) * elem_prod( wt_mature_F(ispp), mfexp( -yrfrac(ispp)*(M_F(ispp) + Ftottmp_F)))); 
      Btmp = (N_F(ispp) * wt_F(ispp) + N_M(ispp) * wt_M(ispp));
      
      Z_F(ispp) = Ftottmp_F  + M_F(ispp); 
      Z_M(ispp) = Ftottmp_M  + M_M(ispp); 
      S_F(ispp) = mfexp( -Z_F(ispp) );
      S_M(ispp) = mfexp( -Z_M(ispp) );
      
      // Graduate to next year...
      Nnext_F(ispp)(2,nages(ispp))= ++elem_prod(N_F(ispp)(1,nages(ispp)-1), S_F(ispp)(1,nages(ispp)-1));
      Nnext_M(ispp)(2,nages(ispp))= ++elem_prod(N_M(ispp)(1,nages(ispp)-1), S_M(ispp)(1,nages(ispp)-1));
      
      Nnext_F(ispp)(nages(ispp))  += N_F(ispp)(nages(ispp))*S_F(ispp)(nages(ispp));
      Nnext_M(ispp)(nages(ispp))  += N_M(ispp)(nages(ispp))*S_M(ispp)(nages(ispp));
      
      // Set populations in next year according to SRR (option 2) or standard approach (past recruitment levels and variation, option 1)
      if (Rec_Gen==1||Rec_Gen==4)
      {
        Nnext_F(ispp)(1) = Rsim(ispp,isim,i)/2.;
        Nnext_M(ispp)(1) = Rsim(ispp,isim,i)/2.;
      }
      else // use the curve...
      {
        // cout<<sigr(ispp)<<endl<<Bzero(ispp)<<endl<<SBtmp<<endl<<rnorms(isim,i)<<endl;
        // Nnext_F(ispp)(1) = value(exp(rnorms(isim,i)*sigr(ispp)) *SRecruit( SBtmp, ispp))/2.;
        chi = value(rho_in*chi_prev + sqrt(1.-rho_in*rho_in)*rnorms(isim,i)*sigr(ispp));
        Rsim(ispp,isim,i) = value(exp(chi) * SRecruit(SBtmp, ispp));
        // Rsim(ispp,isim,i) = value(exp(rnorms(isim,i)*sigr(ispp)) *SRecruit( SBtmp, ispp));
        // cout<<SRecruit(SBtmp,ispp)<<" "<<Rsim(ispp,isim,i)<<" "<<sigr<<" "<<chi<<" "<<chi_prev<<" "<<rho_in<<endl;
        Nnext_F(ispp)(1)  = Rsim(ispp,isim,i)/2;
        Nnext_M(ispp)(1)  = Nnext_F(ispp)(1); 
        chi_prev=chi;
      }
      // Get catch-at-age for each fishery (since avg wts may be different)...
      Ftottmp_F.initialize();
      Ftottmp_spr.initialize();
      Ftottmp_M.initialize();
      ctmp = 0.;
      SPRsim(ispp,isim,i) =  1.0;
      if (Ftmp > 0.)
      {
        for (m=1;m<=ngear(ispp);m++)
        {
          Ftottmp_F  = Ftmp*Frat(ispp,m)*sel_F(ispp,m);
          Ftottmp_spr += Ftottmp_F ; 
          Ftottmp_M  = Ftmp*Frat(ispp,m)*sel_M(ispp,m);
          ctmp += (wt_gear_F(ispp,m) * elem_prod(elem_div(Ftottmp_F,  Z_F(ispp)),elem_prod(1.-S_F(ispp),N_F(ispp)))); // Catch equation (vectors)
          ctmp += (wt_gear_M(ispp,m) * elem_prod(elem_div(Ftottmp_M,  Z_M(ispp)),elem_prod(1.-S_M(ispp),N_M(ispp)))); // Catch equation (vectors)
        }
        SPRsim(ispp,isim,i) =  Implied_SPR(Ftottmp_spr,ispp);
        // cout <<spname(ispp)<<" "<<i<< " "<<SPRsim(ispp,isim,i)<<endl;
      }
      /* cout << spname(ispp) <<endl << elem_prod(elem_div(Ftottmp_F,  Z_F(ispp)),elem_prod(1.-S_F(ispp),N_F(ispp))) <<endl << N_F(ispp)<<endl << Ftottmp_F<<endl;;//<<" "<<Csim(ispp,isim,i)<<" "<<N_F(ispp)<<endl; */
  
      // Store results 
      Csim(ispp,isim,i)   = ctmp ;
      // if (nsims < 5) if ( ispp <=3 ) cout <<"solving "<< spname(ispp)<<" Act_Catch "<< Actual_Catch(ispp)<<" Csim_Catch "<< Csim(ispp,isim,i) <<endl;
      Fsim(ispp,isim,i)   = Ftmp; 
      SBsim(ispp,isim,i)  = SBtmp; 
      double ntot_tmp_F   = pmature_F(ispp) * N_F(ispp); 
      double ntot_tmp_M   = pmature_M(ispp) * N_M(ispp); 
      Nsim(ispp,isim,i)  = ntot_tmp_F + ntot_tmp_M; // sum(N_F + N_M) ; 
      SRsim(ispp,isim,i)  = ntot_tmp_F / Nsim(ispp,isim,i) ; 
      // cout <<isim<<" "<<i<<" "<<Btmp<<" "<<N_F<<" "<<N_M<<" "<< wt_F <<" "<< wt_M<<endl;
      Bsim(ispp,isim,i)   = Btmp; 
      Expl_Biom(ispp)     = Btmp;
  
      // Since this is the projection part, make sure to store next year's numbers...
      N_F(ispp) = Nnext_F(ispp);
      N_M(ispp) = Nnext_M(ispp);
    }
  }   // Loop over species ending Projection Part

FUNCTION Status_Determ
  if (alt == 6)
    for (int ispp=1;ispp<=nspp;ispp++) 
      Actual_Catch   = Get_Catch(alt,ispp);
  if (alt == 7)
  {
    if (ipro<=3)
    {
      for (int ispp=1;ispp<=nspp;ispp++) 
        Actual_Catch = Get_Catch(1,ispp); // Fish 2 years at max permissible rate 
    }
    else 
      for (int ispp=1;ispp<=nspp;ispp++) 
        Actual_Catch = Get_Catch(7,ispp);
  }



FUNCTION Fit_TAC
  int use_fit = 1; // Need to move this into the setup file...
  //option to use "fit" program results (requires obtaining theta coef)
  if (use_fit==1)
  {
    // Aggregate ABCs into main groups.....
    agg_abc.initialize();
    agg_tac.initialize();
    TAC.initialize();
    TAC = ABC;
    for (int ispp=1;ispp<=nspp;ispp++) 
      agg_abc(tac_ind(ispp))  += ABC(ispp)/1000;
  
    // Compute aggregate TACs based on aggregate ABCs from model
    for (int itacspp=1;itacspp<=ntacspp;itacspp++) 
    {
      double abctmp = agg_abc(itacspp) / maxabc(itacspp) ;
      int ijunk = min(nnodes,int(abctmp * nnodes)) ;
      agg_tac(itacspp) = abctmp * mfexp(theta(ijunk,itacspp)) ;
    }
    agg_tac /= sum(agg_tac);
    agg_tac *= 1945.; // Total catch in first year
 
    // Now dis-aggregate TACs to individual spp
    for (int ispp=1;ispp<=nspp;ispp++) 
    {
      TAC(ispp) = agg_tac(tac_ind(ispp)) * Obs_Catch(1,ispp)/agg_cat(tac_ind(ispp));  // Just break out TAC by fractions of ABCs
      Actual_Catch(ispp)   = min(TAC(ispp),ABC(ispp));
    }
  }
  else // use generic "write_tac.bat"
  {
   // Given ABC's, what is the TAC?  // Go get actual catches (with constraints)
   //  First write out ABC to file
     ofstream abc("abc.dat");
     abc<<ABC<<endl;
     abc.close();
   //  Then run TAC job as function of ABC
     system("write_tac.bat >NUL ");
     ifstream tac("tac.dat");
     tac>>TAC;
     tac.close(); /* */
     for (int ispp=1;ispp<=nspp;ispp++) 
       Actual_Catch(ispp)   = min(TAC(ispp),ABC(ispp));
  }
 

FUNCTION Avg_Age
    Avg_Age_End.initialize();
    Avg_Age_Mat.initialize();
    for (int ispp=1;ispp<=nspp;ispp++) 
    {
      // if(!isit_const(ispp) )
      {
        dvector age_seq(1,nages(ispp));
        age_seq.initialize();
        age_seq.fill_seqadd(1,1);
        dvector ntmp(1,nages(ispp));
        ntmp = N_F(ispp);
        Avg_Age_End(ispp) += age_seq * ntmp /sum(ntmp);
        Avg_Age_sum(ispp) += Avg_Age_End(ispp) ;
        ntmp = elem_prod(ntmp,pmature_F(ispp)) ;
        Avg_Age_Mat(ispp) += elem_prod(ntmp,pmature_F(ispp)) * age_seq/sum(ntmp);
        // cout<<age_seq<<endl<<ntmp<<endl<<elem_prod(ntmp,pmature_F(ispp)) <<endl<<pmature_F(ispp)<<endl;exit(1);
      }
    }

 //Begin SPR calc functions===================================================================================
FUNCTION get_SB100
  SB100.initialize();
   B100.initialize();
  Avg_Age_F0.initialize() ;
  Avg_Age_M0.initialize() ;
  for (int ispp=1;ispp<=nspp;ispp++)
  {
    NsprF0(ispp,1)    = 1.;
    NsprM0(ispp,1)    = 1.;
    for (j=2;j<nages(ispp);j++)
    {
      NsprF0(ispp,j)   = NsprF0(ispp,j-1)  * mfexp(-M_F(ispp,j-1));
      NsprM0(ispp,j)   = NsprM0(ispp,j-1)  * mfexp(-M_M(ispp,j-1));
    }
  
    NsprF0(ispp,nages(ispp))   = NsprF0(ispp,nages(ispp)-1)* mfexp(-M_F(ispp,nages(ispp)-1) )/ (1.- mfexp(-M_F(ispp,nages(ispp))));
    NsprM0(ispp,nages(ispp))   = NsprM0(ispp,nages(ispp)-1)* mfexp(-M_M(ispp,nages(ispp)-1) )/ (1.- mfexp(-M_M(ispp,nages(ispp))));
    {
      dvector age_seq(1,nages(ispp)); // Note: need to sequence this to reflect actual ages modeled (rather than convenience)
      age_seq.initialize();
      age_seq.fill_seqadd(1,1);
      Avg_Age_F0(ispp)  = age_seq * NsprF0(ispp)/sum(NsprF0(ispp)) ;
      Avg_Age_M0(ispp)  = age_seq * NsprM0(ispp)/sum(NsprM0(ispp)) ;
    }
  
    for (j=1;j<=nages(ispp);j++)
    {
    // Kill them off till spawning 
      SB100(ispp)    += NsprF0(ispp,j)*pmature_F(ispp,j)*wt_F(ispp,j) * mfexp(-yrfrac(ispp) *M_F(ispp,j));
    }
    SB100(ispp)  *= AMeanRec(ispp) ;

    // SB100(ispp)  *= .5 * AMeanRec(ispp) ;
    //cout<<"SB100  " <<SB100(ispp)<<endl;
    B100(ispp)   = (NsprF0(ispp)*wt_F(ispp) + NsprM0(ispp)*wt_M(ispp)) * AMeanRec(ispp);
  }
  // cout << setprecision(2) <<Fabc<<endl

FUNCTION compute_spr_rates
  SBFabc.initialize();
  SBF40.initialize();
  SBKink.initialize();
  SBFofl.initialize();
  BFabc.initialize();
  BF40.initialize();
  BFofl.initialize();
  Ftotabc.initialize();
  Ftot40.initialize();
  Ftotofl.initialize();
  Avg_Age_Fabc.initialize();
  for (int ispp=1;ispp<=nspp;ispp++)
  {
    NsprFabc(ispp,1)   = 1.;
    NsprF40(ispp,1)   = 1.;
    NsprFofl(ispp,1)   = 1.;
    NsprMabc(ispp,1)   = 1.;
    NsprM40(ispp,1)   = 1.;
    NsprMofl(ispp,1)   = 1.;
    for (m=1;m<=ngear(ispp);m++)
    {
      Ftotabc(ispp) += Fabc(ispp)*Frat(ispp,m)*sel_F(ispp,m);
      Ftot40(ispp)  +=  F40(ispp)*Frat(ispp,m)*sel_F(ispp,m);
      Ftotofl(ispp) += Fofl(ispp)*Frat(ispp,m)*sel_F(ispp,m);
    }
  
    for (j=2;j<nages(ispp);j++)
    {
      NsprFabc(ispp,j) = NsprFabc(ispp,j-1)* mfexp(-1.*(M_F(ispp,j-1) + Ftotabc(ispp,j-1) ));
      NsprF40(ispp,j)  = NsprF40(ispp,j-1) * mfexp(-1.*(M_F(ispp,j-1) +  Ftot40(ispp,j-1) ));
      NsprFofl(ispp,j) = NsprFofl(ispp,j-1)* mfexp(-1.*(M_F(ispp,j-1) + Ftotofl(ispp,j-1) ));
      NsprMabc(ispp,j) = NsprMabc(ispp,j-1)* mfexp(-1.*(M_M(ispp,j-1) + Ftotabc(ispp,j-1) ));
      NsprM40(ispp,j)  = NsprM40(ispp,j-1) * mfexp(-1.*(M_M(ispp,j-1) +  Ftot40(ispp,j-1) ));
      NsprMofl(ispp,j) = NsprMofl(ispp,j-1)* mfexp(-1.*(M_M(ispp,j-1) + Ftotofl(ispp,j-1) ));
    }
    NsprFabc(ispp,nages(ispp)) = NsprFabc(ispp,nages(ispp)-1)* mfexp(-(M_F(ispp,nages(ispp)-1) + Ftotabc(ispp,nages(ispp)-1)))/ (1.- mfexp(-(M_F(ispp,nages(ispp)) + Ftotabc(ispp,nages(ispp)) )));
    NsprF40(ispp,nages(ispp))  = NsprF40(ispp,nages(ispp)-1) * mfexp(-(M_F(ispp,nages(ispp)-1) +  Ftot40(ispp,nages(ispp)-1)))/ (1.- mfexp(-(M_F(ispp,nages(ispp)) +  Ftot40(ispp,nages(ispp)) )));
    NsprFofl(ispp,nages(ispp)) = NsprFofl(ispp,nages(ispp)-1)* mfexp(-(M_F(ispp,nages(ispp)-1) + Ftotofl(ispp,nages(ispp)-1)))/ (1.- mfexp(-(M_F(ispp,nages(ispp)) + Ftotofl(ispp,nages(ispp)) )));
    NsprMabc(ispp,nages(ispp)) = NsprMabc(ispp,nages(ispp)-1)* mfexp(-(M_M(ispp,nages(ispp)-1) + Ftotabc(ispp,nages(ispp)-1)))/ (1.- mfexp(-(M_M(ispp,nages(ispp)) + Ftotabc(ispp,nages(ispp)) )));
    NsprM40(ispp,nages(ispp))  = NsprM40(ispp,nages(ispp)-1) * mfexp(-(M_M(ispp,nages(ispp)-1) +  Ftot40(ispp,nages(ispp)-1)))/ (1.- mfexp(-(M_M(ispp,nages(ispp)) +  Ftot40(ispp,nages(ispp)) )));
    NsprMofl(ispp,nages(ispp)) = NsprMofl(ispp,nages(ispp)-1)* mfexp(-(M_M(ispp,nages(ispp)-1) + Ftotofl(ispp,nages(ispp)-1)))/ (1.- mfexp(-(M_M(ispp,nages(ispp)) + Ftotofl(ispp,nages(ispp)) )));

    // if(!isit_const(ispp) )
    {
      dvector age_seq(1,nages(ispp));
      age_seq.initialize();
      age_seq.fill_seqadd(1,1);
      Avg_Age_Fabc(ispp) = age_seq * NsprFabc(ispp)/sum(NsprFabc(ispp)) ;
      Avg_Age_Mabc(ispp) = age_seq * NsprMabc(ispp)/sum(NsprMabc(ispp)) ;
    }
  
    for (j=1;j<=nages(ispp);j++)
    {
    // Kill them off till spawning 
      SBFabc(ispp) += NsprFabc(ispp,j)*pmature_F(ispp,j)*wt_F(ispp,j)* mfexp(-yrfrac(ispp) *( M_F(ispp,j) + Ftotabc(ispp,j) ));
      SBF40(ispp)  +=  NsprF40(ispp,j)*pmature_F(ispp,j)*wt_F(ispp,j)* mfexp(-yrfrac(ispp) *( M_F(ispp,j) + Ftot40(ispp,j) ));
      SBFofl(ispp) += NsprFofl(ispp,j)*pmature_F(ispp,j)*wt_F(ispp,j)* mfexp(-yrfrac(ispp) *( M_F(ispp,j) + Ftotofl(ispp,j) ));
    }
    // 
    double sexratio_tmp=1.0;
    SBFabc(ispp) = AMeanRec(ispp) * SBFabc(ispp);
    SBF40(ispp)  = AMeanRec(ispp) *  SBF40(ispp);
    SBFofl(ispp) = AMeanRec(ispp) * SBFofl(ispp);
    BFabc(ispp)  = AMeanRec(ispp) * (NsprFabc(ispp)*wt_F(ispp) + NsprMabc(ispp)*wt_M(ispp) ) ;
    BF40(ispp)   = AMeanRec(ispp) *  (NsprF40(ispp)*wt_F(ispp) +  NsprM40(ispp)*wt_M(ispp) ) ;
    BFofl(ispp)  = AMeanRec(ispp) * (NsprFofl(ispp)*wt_F(ispp) + NsprMofl(ispp)*wt_M(ispp) ) ;
  }
  // cout << setprecision(2) <<Fabc<<endl

FUNCTION double Implied_SPR( const dvector& F_age, const int& ispp)
  // Function that returns SPR percentage given a realized value of F...
    dvector ntmp0(1,nages(ispp));
    dvector ntmp1(1,nages(ispp));
    ntmp0(1) = 1.;
    ntmp1(1) = 1.;
    for (j=2;j<nages(ispp);j++)
    {
      ntmp0(j)  = ntmp0(j-1)* exp(-M_F(ispp,j-1));
      ntmp1(j)  = ntmp1(j-1)* exp(-1.*(M_F(ispp,j-1) + F_age(j-1) ));
    }
    ntmp0(nages(ispp))  =  ntmp0(nages(ispp)-1)* exp(-M_F(ispp,nages(ispp)-1) )/ (1.- exp(-M_F(ispp,nages(ispp))));
    ntmp1(nages(ispp))  =  ntmp1(nages(ispp)-1)* exp(-(M_F(ispp,nages(ispp)-1) + F_age(nages(ispp)-1)))/ (1.- mfexp(-(M_F(ispp,nages(ispp)) + F_age(nages(ispp)) )));
    double sb0_tmp=0.;
    double sb1_tmp=0.;
    for (j=1;j<=nages(ispp);j++)
    {
    // Mortality till spawning 
      sb0_tmp      += ntmp0(j)*pmature_F(ispp,j)*wt_F(ispp,j) * mfexp(-yrfrac(ispp) * M_F(ispp,j));
      sb1_tmp      += ntmp1(j)*pmature_F(ispp,j)*wt_F(ispp,j) * mfexp(-yrfrac(ispp) * ( M_F(ispp,j) + F_age(j) ));
    }
    return(sb1_tmp / sb0_tmp);

 // Solve for F given catch=================================================================================
FUNCTION double SolveF2(const dvector& N_F, const dvector& N_M, const double&  TACin, const int& ispp)
  double dd = 10.;
  double cc;
  cc = TACin;
  dmatrix Fratsel_F(1,ngear(ispp),1,nages(ispp));
  dmatrix Fratsel_M(1,ngear(ispp),1,nages(ispp));
  dvector Z_F(1,nages(ispp)) ;
  dvector Z_M(1,nages(ispp)) ;
  dvector S_F(1,nages(ispp)) ;
  dvector S_M(1,nages(ispp)) ;
  for (m=1;m<=ngear(ispp);m++)
  {
    Fratsel_F(m)=Frat(ispp,m)*sel_F(ispp,m);
    Fratsel_M(m)=Frat(ispp,m)*sel_M(ispp,m);
  }

  dvector Ftottmp_F(1,nages(ispp));
  dvector Ftottmp_M(1,nages(ispp));
  //dvariable btmp =  n0_M(ispp) * wt_M(ispp) + n0_F(ispp) * wt_F(ispp);
  double btmp ;
  btmp =  N_M * elem_prod(sel_M(ispp,1),wt_M(ispp)) + N_F * elem_prod(sel_M(ispp,1),wt_F(ispp));
  double ftmp;
  ftmp = TACin/btmp;
  int iter=0;
  while (dd > 1e-6)
  {
    iter++;
    ftmp += (TACin-cc) / btmp;
    Ftottmp_F.initialize();
    Ftottmp_M.initialize();
    for (m=1;m<=ngear(ispp);m++)
    {
      Ftottmp_F += ftmp*Fratsel_F(m);
      Ftottmp_M += ftmp*Fratsel_M(m);
    }
    Z_F = Ftottmp_F  + M_F(ispp); 
    Z_M = Ftottmp_M  + M_M(ispp); 
    S_F = mfexp( -Z_F );
    S_M = mfexp( -Z_M );
    cc = 0.0;
    for (m=1;m<=ngear(ispp);m++)
    {
      cc += (wt_gear_F(ispp,m) * elem_prod(elem_div(ftmp*Fratsel_F(m),  Z_F),elem_prod(1.-S_F,N_F))); // Catch equation (vectors)
      cc += (wt_gear_M(ispp,m) * elem_prod(elem_div(ftmp*Fratsel_M(m),  Z_M),elem_prod(1.-S_M,N_M))); // Catch equation (vectors)
    }
    dd = cc / TACin - 1.;
    //cout << ispp<<" "<< ftmp << " "<< cc << " "<<TACin<<endl; //cout << sel_F << endl << sel_M << endl << endl; //cout << Fratsel_F << endl << Fratsel_M << endl; //exit(1);
    if (dd<0.) dd *= -1.;
    // cout<<"CC Ftmp btmp "<<cc<<" "<< ftmp<<" "<<btmp<<" "<<dd<<endl;
    if (iter>100) {cerr<<"Bombed on catch solver--check scales for "<<spname(ispp)<<" Catch was "<<TACin<<endl<<" Biomass: "<<btmp<<endl<<" Catch, F trial was: "<<cc<<" "<<ftmp<<" "<<dd<<endl<<sel_F(ispp);exit(1);}
  }
  return(ftmp);

FUNCTION void Get_SPR_Catches(const int& ispp)
  Cabc(ispp) = 0.0;
  Cofl(ispp) = 0.0;
  // Compute catch at spr rates
  for (m=1;m<=ngear(ispp);m++)
  {
    Cabc(ispp) += ( wt_gear_F(ispp,m) * AMeanRec(ispp)*elem_prod(elem_div( Fabc(ispp)*Frat(ispp,m)*sel_F(ispp,m) ,
                  M_F(ispp) + Ftotabc(ispp)),elem_prod(1.- mfexp(-(M_F(ispp)+Ftotabc(ispp))),NsprFabc(ispp))));
    Cabc(ispp) += ( wt_gear_M(ispp,m) * AMeanRec(ispp)*elem_prod(elem_div( Fabc(ispp)*Frat(ispp,m)*sel_M(ispp,m) , 
                  M_M(ispp) + Ftotabc(ispp)),elem_prod(1.- mfexp(-(M_M(ispp)+Ftotabc(ispp))),NsprMabc(ispp))));

    Cofl(ispp) += ( wt_gear_F(ispp,m) * AMeanRec(ispp)*elem_prod(elem_div( Fofl(ispp)*Frat(ispp,m)*sel_F(ispp,m) , 
                  M_F(ispp) + Ftotofl(ispp)),elem_prod(1.- mfexp(-(M_F(ispp)+Ftotofl(ispp))),NsprFofl(ispp))));
    Cofl(ispp) += ( wt_gear_M(ispp,m) * AMeanRec(ispp)*elem_prod(elem_div( Fofl(ispp)*Frat(ispp,m)*sel_M(ispp,m) , 
                  M_M(ispp) + Ftotofl(ispp)),elem_prod(1.- mfexp(-(M_M(ispp)+Ftotofl(ispp))),NsprMofl(ispp))));
  }

FINAL_SECTION
    write_srec();
    do_elasticity();
    Run_Sim();
    cout<< "---- Finished simulations using stochastic stock-recruitment relationship -----"<<endl;

REPORT_SECTION
 /*
  if (last_phase())
	{
    do_elasticity();
    if (Rec_Gen==1||Rec_Gen==4) {
     Run_Sim();  cout<< "Finished simulations using standard (avg, var) stochastic approach"<<endl;
    }
   }
 */


  cout <<endl<< "Report section, phase: "<<current_phase()<<endl;
  cout <<"===========================================  "<<endl;

  report << "__ ";
  for (int ispp=1;ispp<=nspp;ispp++) report<< spname(ispp)<<" ";
  report<<endl;
  report << "EquilAvgAgeF0  " ;
    for (int ispp=1;ispp<=nspp;ispp++) report << Avg_Age_F0(ispp)<< " "; report << endl;
  report << "EquilAvgAgeFabc  " ;
    for (int ispp=1;ispp<=nspp;ispp++) report << Avg_Age_Fabc(ispp)<< " "; report << endl;
  report << "Generation_Time_(assumes_recruitment_age=1)"<< " ";
  for (int ispp=1;ispp<=nspp;ispp++) 
  {
    double Tg=0.;
    double tmp=0.;
    double ntmp=1.;
    for (int ii=1;ii<=4*nages(ispp);ii++)
    {
      if (ii>nages(ispp))
      {
        Tg += double(ii) * wt_mature_F(ispp,nages(ispp)) * ntmp;
        tmp +=  wt_mature_F(ispp,nages(ispp)) * ntmp;
        ntmp *= exp(-M_F(ispp,nages(ispp)));
      }
      else
      {
        Tg += double(ii) * wt_mature_F(ispp,ii) * ntmp;
        tmp +=  wt_mature_F(ispp,ii) * ntmp;
        ntmp *= exp(-M_F(ispp,ii));
      }
    }
    // Tg /= value(phizero(ispp));
    Tg /= tmp;
    report << Tg<<  " "; 
  }
  report << endl;
  report << "Options SR_Type Project_Recr_Assmption SR_Condition"<<endl<<"  ";
  report <<           SrType<<" "<< Rec_Gen<<" "<<Fmsy_F35<<" "<<Rec_Cond<<endl;



  if (last_phase())
  {
    // do_elasticity();
    // Run_Sim();
    cout<< "---- Finished simulations using stochastic stock-recruitment relationship -----"<<endl;
    report<<endl<<endl;
    report << "Stock B100 B40 B35 F40 F35  F_"<<styr<<endl;
    for (int ispp=1;ispp<=nspp;ispp++) report<< spname(ispp)<<" "<< SB100(ispp)<<" "<<.4*SB100(ispp)<<" "<<.35*SB100(ispp)<<" "<<F40(ispp)
                                                          <<" "<<F35(ispp)<<" "<<Fsim(ispp,1,1)<<" "<<endl;
    report<<endl<<endl;

  }
  // srec_out << Fabc << endl;
  // srec_out<<"Selectivity " <<endl;
  // report<<sel_F<<endl;

FUNCTION write_srec
  ofstream srec_out("srec.out");
  srec_out << "S-r Parameters"<<endl;
  srec_out << "Steepness Rzero Alpha Beta SigmaR Bzero Phi "<<endl;
  srec_out << steepness<< " "
           << sr_alpha << " "
           << beta     << " "
           << sigr     << " "
           << Bzero    << " "
           << phizero  << " "
           << endl<<endl;
  srec_out << "Stock Run Source SSB Rec"<<endl;
  for (int i=1;i<=nspp;i++)
  {
    if(last_phase()) 
    {
      Profile_F(i);
      cout <<spname(i)<<" "<< Fmsy(i)<<" "<<Fofl(i)<<" "<<get_spr_rates(0.35,i)<<" "<<get_spr_rates(0.4,i)<<endl;
    }
    for (int ii=1;ii<=nrec(i);ii++)
    {
      srec_out <<spname(i)<<" "<<run_name<< " Data "<<SSB(i,ii)<<" "<< R(i,ii)<<endl;
    }
  }
  for (int i=1;i<=nspp;i++)
  {
    for (int ii=0;ii<=30;ii++)
    {
      double ssbtmp = double(ii) * value(Bzero(i)) * 1.5 / 30. ;
      srec_out <<spname(i)<<" "<<run_name<< " Fit "<<ssbtmp<<" "<<SRecruit(ssbtmp,i)<<endl;
    }
    // cout <<spname(i)<<" "<< Fmsy(i)<<" "<<Fofl(i)<<" "<<get_spr_rates(0.35,i)<<" "<<get_spr_rates(0.4,i)<<endl;
  }
  srec_out <<endl;
  // srec_out << "Bzero "<<Bzero << endl;
  // srec_out << "B100 "<<SB100 << endl;
  srec_out.close();

    // Writing routines here ....
FUNCTION write_by_time
  write_sim("Catch",            Csim,Cabc);  // Total Catch
  write_ABCs("ABCs"            );            // ABC Catch
  write_TACs("TACs"            );            // ABC Catch
  write_sim("Sp_Biomass",      SBsim,SBFabc);  // Spawn Biomass
  write_sim("Fishing Mortality",Fsim,Fabc);  // Total Fishing mortality
  write_sim("Biomass",          Bsim);       // Total Biomass
  write_sim("Implied SPR rate ",SPRsim,SPR_abc);  // Total Fishing mortality

  write_avg_age("Alternative ") ;

FUNCTION void write_avg_age(const adstring& Title) 
  means_out << "  ";
  for (int ispp=1;ispp<=nspp;ispp++) means_out << spname(ispp)<< " "; means_out << endl;

  means_out << "EquilAvgAgeF0  " ;
    for (int ispp=1;ispp<=nspp;ispp++) means_out << Avg_Age_F0(ispp)<< " "; means_out << endl;
  means_out << "EquilAvgAgeFabc  " ;
    for (int ispp=1;ispp<=nspp;ispp++) means_out << Avg_Age_Fabc(ispp)<< " "; means_out << endl;
  means_out << "AvgAgeYr"<< styr + npro -1 << " ";
    for (int ispp=1;ispp<=nspp;ispp++) means_out << Avg_Age_sum(ispp)/nsims<< " "; means_out << endl;


FUNCTION write_alts 
  for (int ispp=1;ispp<=nspp;ispp++)
  {
    dmatrix ccc = trans(Csim(ispp));
    dmatrix mtmp= trans(SBsim(ispp));
    dmatrix btmpx = trans(Bsim(ispp));
    for (int i=2;i<=npro;i++)
    {
      alts_proj << spname(ispp)<<" "<<alt<<" "<< i+styr-1 <<" "<<mean(ccc(i))
                <<" "<<(ABCs_by_yr(i,ispp))/nsims<<" "<<
                    OFLs_by_yr(i,ispp)/nsims<<" "<<mean(mtmp(i))<<" "<<mean(btmpx(i))<<endl;
    }
  }
FUNCTION write_alts_hdr
  alts_proj << "Stock Alt Year Catch ABC OFL SSB TotBiom"<<endl;

FUNCTION void write_ABCs(const adstring& Title) 
  // This one prints out species over time (means only), but without headings
  means_out <<"Alternative "<<alt<<" "<<Title << endl; 
  means_out << "     " ; for (int ispp=1;ispp<=nspp;ispp++) means_out << spname(ispp)<< " " ; means_out <<endl;
  means_out << endl<< "Year " <<endl;

  for (int i=1;i<=npro;i++)
  {
    means_out << i+styr-1 <<" ";
    for (int ispp=1;ispp<=nspp;ispp++)
    {
      double mean_value = (ABCs_by_yr(i,ispp))/nsims;
      if (mean_value > 1e-6) 
        means_out << mean_value <<" "; 
      else
        means_out << " NA "; 
    }
    means_out << endl;
  }
  means_out << endl;

FUNCTION void write_TACs(const adstring& Title) 
  // This one prints out species over time (means only), but without headings
  means_out <<"Alternative "<<alt<<" "<<Title << endl; 
  means_out << "     " ; for (int ispp=1;ispp<=nspp;ispp++) means_out << spname(ispp)<< " " ; means_out <<endl;
  means_out << endl<< "Year " <<endl;
  for (int i=1;i<=npro;i++)
  {
    means_out << i+styr-1 <<" ";
    for (int ispp=1;ispp<=nspp;ispp++)
    {
      double mean_value = (TACs_by_yr(i,ispp))/nsims;
      if (mean_value > 1e-6) 
        means_out << mean_value <<" "; 
      else
        means_out << " NA "; 
    }
    means_out << endl;
  }
  means_out << endl;
  


FUNCTION void write_sim(const adstring& Title, d3_array& Outtmp) 
  // This one prints out species over time (means only), but without headings
  d3_array mtmp(1,nspp,1,npro,1,nsims);
  for (int ispp=1;ispp<=nspp;ispp++) for (int i=1;i<=npro;i++) for (int k=1;k<=nsims;k++)
    mtmp(ispp,i,k)=Outtmp(ispp,k,i);
  means_out <<"Alternative "<<alt<<" "<<Title << endl; 
  means_out << "     " ; for (int ispp=1;ispp<=nspp;ispp++) means_out << spname(ispp)<< " " ; means_out <<endl;
  means_out << endl<<"Year " <<endl;
  for (int i=1;i<=npro;i++)
  {
    means_out << i+styr-1 <<" ";
    double mean_value;
    for (int ispp=1;ispp<=nspp;ispp++)
    {
      mean_value = mean(mtmp(ispp,i)) ;
      if (mean_value > 1e-6) 
        means_out << mean_value <<" "; 
      else
        means_out << " NA "; 
    }
    means_out << endl;
  }
  means_out << endl;
  
FUNCTION void write_sim(const adstring& Title,const  d3_array& Outtmp,const dvar_vector& bb) 
  // This one prints out species over time (means only)
  d3_array mtmp(1,nspp,1,npro,1,nsims);
  for (int ispp=1;ispp<=nspp;ispp++) for (int i=1;i<=npro;i++) for (int k=1;k<=nsims;k++)
    mtmp(ispp,i,k)=Outtmp(ispp,k,i);
  means_out <<"Alternative "<<alt<<" "<<Title << endl; 
  means_out << "     " ; for (int ispp=1;ispp<=nspp;ispp++) means_out << spname(ispp)<< " " ; means_out <<endl;
  means_out << "Equil_Fabc " ; 
  for (int ispp=1;ispp<=nspp;ispp++) 
  {
    {
      means_out << bb(ispp) << " " ; 
    }
  }
  means_out << endl;
  means_out << "Year " <<endl; 
  for (int i=1;i<=npro;i++)
  {
    means_out << i+styr-1 <<" ";
    double mean_value;
    for (int ispp=1;ispp<=nspp;ispp++)
    {
      mean_value = mean(mtmp(ispp,i)); 
      if (mean_value>1e-6)
        means_out << mean_value <<" "; 
      else
        means_out << " NA "; 
    }
    means_out << endl;
  }
  means_out << endl;
  
FUNCTION void write_sim(const adstring& Title,const int& ispp) 
  // For each species separately
  percent_out <<"Alternative "<<alt<<" "<<Title << " Stock: "<<spname(ispp)<< endl;
  write_spp(ispp);

FUNCTION void write_sim_hdr(const int& ispp) 
  percent_out <<"SB0 SB40 SB35 MeanRec HarMeanRec Bnow"<<endl;
  percent_out << SB100(ispp)       <<" "<<
            SBF40(ispp)      <<" "<<
            SBFofl(ispp)      <<" "<<
            AMeanRec(ispp) <<" "<<
            HMeanRec(ispp) <<" "<<
            Bcurrent(ispp) <<" "<<
            endl;
  percent_out <<"CV Recruit" <<endl;
  percent_out << cvrec(ispp)  <<" "<<endl;

FUNCTION void write_spp(const int& ispp) 
  // Write out afsd objective function
  // for (int i=1;i<=nsims;i++)
  // {
    // // double avg_yld       = mean(Csim(ispp,i)); double sqrd_1st_diff = mean(square(first_difference(Csim(ispp,i)))); Alt3bstuff << ispp<<" "<<spname(ispp)<<" "<< alt<<" "<<i<<" "<< avg_yld <<" " << sqrd_1st_diff<<" "<<avg_yld - sqrd_1st_diff<<endl;
  // }
  // Write out each species individually (with confidence bounds)
  percent_out <<"Catch "<<spname(ispp)<< endl<< "Year C0 Cabc Cofl LowCI_Catch Median_Catch Mean_Catch UpperCI_Catch Stdev_Catch "<<endl;
  dmatrix mtmp = TranSort(Csim(ispp));
  for (int i=1;i<=npro;i++)
  {
    int iyr=i+styr-1;
    double sd_cat_tmp =      sqrt(norm2(mtmp(i)-mean(mtmp(i)))/nsims)          ;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" Cabc " << Cabc(ispp)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" Cofl " << Cofl(ispp)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" CLCI " << mtmp(i,LCI)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" CUCI " << mtmp(i,UCI)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" CMedian " << mtmp(i,int((UCI+LCI)/2))<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" CMean " << mean(mtmp(i))<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" CStdn " << sd_cat_tmp <<endl;

   percent_out << i+styr-1                  <<" "
          << " 0"                       <<" "
          << Cabc(ispp)                 <<" "
          << Cofl(ispp)                 <<" "
          << mtmp(i,LCI)                <<" "
          << mtmp(i,int((UCI+LCI)/2))   <<" "
          << mean(mtmp(i))              <<" "
          << mtmp(i,UCI)                <<" "
          << sd_cat_tmp           <<" "
          << endl;
  }
  percent_out << endl;

  percent_out <<"Spawning_Biomass "<<spname(ispp)<< endl<< "Year SSB100 SSBabc SSBofl LowCI_SSB Median_SSB Mean_SSB UpperCI_SSB Stdev_SSB "<<endl;
  mtmp = TranSort(SBsim(ispp));
  for (int i=1;i<=npro;i++)
   {
    int iyr=i+styr-1;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" SSBF100 " << SB100(ispp)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" SSBFabc " << SBFabc(ispp)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" SSBFofl " << SBFofl(ispp)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" SSBLCI " << mtmp(i,LCI)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" SSBUCI " << mtmp(i,UCI)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" SSBMedian " << mtmp(i,int((UCI+LCI)/2))<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" SSBMean " << mean(mtmp(i))<<endl;

   percent_out << i+styr-1                         <<" ";
     percent_out      << SB100(ispp)               <<" ";
     percent_out      << SBFabc(ispp)              <<" ";
     percent_out      << SBFofl(ispp)              <<" ";
     percent_out      << mtmp(i,LCI)               <<" ";
     percent_out      << mtmp(i,int((UCI+LCI)/2))  <<" ";
     percent_out      << mean(mtmp(i))             <<" ";
     percent_out      << mtmp(i,UCI)               <<" ";
     percent_out      << sqrt(norm2(mtmp(i)-mean(mtmp(i)))/nsims)           <<" ";
     percent_out      << endl;
   }
  percent_out << endl;

  percent_out << "Fishing_mortality"<<spname(ispp)<< endl<< "Year F0 Fabc Fofl LowCI_F Median_F Mean_F UpperCI_F Stdev_F "<<endl;
  mtmp = TranSort(Fsim(ispp));
  for (int i=1;i<=npro;i++)
   {
    int iyr=i+styr-1;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" F0 0 "<<endl; 
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" Fabc " << Fabc(ispp)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<" Fofl " << Fofl(ispp)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<"  F_LCI " << mtmp(i,LCI)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<"  F_UCI " << mtmp(i,UCI)<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<"  F_Median " << mtmp(i,int((UCI+LCI)/2))<<endl;
    percent_db << spname(ispp)<<" "<< alt<<" "<< iyr<<"  F_Mean " << mean(mtmp(i))<<endl;
   percent_out << i+styr-1                  <<" "
          << " 0"                       <<" "
          << Fabc(ispp)                 <<" "
          << Fofl(ispp)                 <<" "
          << mtmp(i,LCI)                <<" "
          << mtmp(i,int((UCI+LCI)/2))   <<" "
          << mean(mtmp(i))              <<" "
          << mtmp(i,UCI)                <<" "
          << sqrt(norm2(mtmp(i)-mean(mtmp(i)))/nsims)           <<" "
          << endl;
   }
  percent_out << endl;
  
  percent_out << "Total_Biomass"<<spname(ispp)<< endl<< "Year B100 Babc Bofl LowCI_Biom Median_Biom Mean_Biom UpperCI_Biom Stdev_Biom "<<endl;
  mtmp = TranSort(Bsim(ispp));
  for (int i=1;i<=npro;i++)
  {
   percent_out << i+styr-1                          <<" ";
     percent_out      << B100(ispp)                 <<" ";
     percent_out      << BFabc(ispp)                <<" ";
     percent_out      << BFofl(ispp)                <<" ";
     percent_out      << mtmp(i,LCI)                <<" ";
     percent_out      << mtmp(i,int((UCI+LCI)/2))   <<" ";
     percent_out      << mean(mtmp(i))              <<" ";
     percent_out      << mtmp(i,UCI)                <<" ";
     percent_out      << sqrt(norm2(mtmp(i)-mean(mtmp(i)))/nsims)           <<" ";
     percent_out      << endl;
   }
  
GLOBALS_SECTION
  #include <admodel.h>
  adstring xspname;
  adstring_array targsppname(1,20);
  adstring_array spp_file_name(1,20);
  adstring_array gearname(1,8);
  adstring_array spname(1,90);
  adstring_array areaname(1,8);
  adstring       run_name;
 
  ofstream write_log("Input_Log.rep");
  #undef write_log
  #define write_log(object) write_log << #object "\n" << object << endl;

  // A routine to get transpose, sort and return a matrix ---- 
  dmatrix TranSort (const dmatrix m1)
  {
  RETURN_ARRAYS_INCREMENT();
    dmatrix vtmp=trans(m1);
    int npro=m1.colmax();
    int nsim=m1.rowmax();
    for (int i=1;i<=npro;i++)
      vtmp(i) = sort(vtmp(i),nsim);

    RETURN_ARRAYS_DECREMENT();
    return(vtmp);
  }
  // #include <lpcode.cpp>

FUNCTION dvariable SRecruit(const dvariable& Stmp,const int& ispp)
  RETURN_ARRAYS_INCREMENT();
  dvariable RecTmp;
  switch (SrType)
  {
    case 1:
      RecTmp = (Stmp / phizero(ispp)) * mfexp( sr_alpha(ispp) * ( 1. - Stmp / Bzero(ispp) )) ; //Ricker form from Dorn
      break;
    case 2:
      RecTmp = Stmp / ( sr_alpha(ispp) + beta(ispp) * Stmp);        //Beverton-Holt form
      break;
    case 3:
      // RecTmp = mfexp(log_avgrec);                    //Avg recruitment
      break;
    case 4:
      RecTmp = Stmp * mfexp( sr_alpha(ispp)  - Stmp * beta(ispp)) ; //old Ricker form
      break;
  }

  RETURN_ARRAYS_DECREMENT();
  return RecTmp;


FUNCTION dvar_vector SRecruit(const dvar_vector& Stmp,const int& ispp)
  RETURN_ARRAYS_INCREMENT();
  dvar_vector RecTmp(Stmp.indexmin(),Stmp.indexmax());
  switch (SrType)
  {
    case 1:
      RecTmp = elem_prod((Stmp / phizero(ispp)) , mfexp( sr_alpha(ispp) * ( 1. - Stmp / Bzero(ispp) ))) ; //Ricker form from Dorn
      break;
    case 2:
      RecTmp = elem_prod(Stmp , 1. / ( sr_alpha(ispp) + beta(ispp) * Stmp)); //Beverton-Holt form
      break;
    case 3:
      // RecTmp = mfexp(log_avgrec);                              //Avg recruitment
      break;
    case 4:
      RecTmp = elem_prod(Stmp ,mfexp( sr_alpha(ispp) - Stmp * beta(ispp)));  //old Ricker form
      break;
  }
  RETURN_ARRAYS_DECREMENT();
  //cout <<RecTmp<<endl;
  return RecTmp;

 
FUNCTION dvariable Requil(const dvariable& phi,const int& ispp)
  dvariable RecTmp;
  switch (SrType)
  {
    case 1:
      RecTmp =  Bzero(ispp) * (sr_alpha(ispp) + log(phi) - log(phizero(ispp)) ) / (sr_alpha(ispp)*phi);
      break;
    case 2:
      RecTmp =  (phi-sr_alpha(ispp))/(beta(ispp)*phi);
      break;
    case 3:
      // RecTmp =  mfexp(log_avgrec);
      break;
    case 4:
      RecTmp =  (log(phi)+sr_alpha(ispp)) / (beta(ispp)*phi); //RecTmp =  (log(phi)/sr_alpha + 1.)*beta/phi;
      break;
  }
  return RecTmp;

 //=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
FUNCTION void Get_Bzero(const int& ispp) 
  Bzero(ispp).initialize();
  Rzero(ispp)    =  mfexp(log_Rzero(ispp)); 
  dvar_vector Ntmp(1,nages(ispp));
  dvar_vector survtmp = mfexp(-M_F(ispp));
  Ntmp.initialize();

  Ntmp(1) = Rzero(ispp);
  for ( j=1 ; j < nages(ispp); j++ )
  {
    Ntmp(j+1)  =   Ntmp(j) * survtmp(j); // Begin numbers in the next year/age class
    // cout <<Ntmp(j)<< " ";
  }
  Ntmp(nages(ispp))  /= (1.- survtmp(nages(ispp))); 
  for ( j=1 ; j <= nages(ispp); j++ )
    Ntmp(j) *= pow(survtmp(j),yrfrac(ispp));
  // cout <<Ntmp(nages)<< endl;

  if (nsexes(ispp)==1) 
    Bzero(ispp) = 0.5* wt_mature_F(ispp)  * Ntmp ; // p_mature is of Females (half of adults)
  else
    Bzero(ispp) = wt_mature_F(ispp)  * Ntmp ; // p_mature 

  switch (SrType)
  {
    case 1:
      if (Rec_Gen==3)
      {
        sr_alpha(ispp) = alpha_in;
        phizero(ispp)  = phizero_in;
        Bzero(ispp)    = bzero_in;
        sigr(ispp)    = sigmar_in;
      }
      else
      {
        if (Rec_Gen==4)
        {
        }
        else
        {
          sr_alpha(ispp) = log(-4.*steepness(ispp)/(steepness(ispp)-1.));
          phizero(ispp) = Bzero(ispp)/Rzero(ispp);
        }
      }
      break;
    case 2:
      sr_alpha(ispp)  =  Bzero(ispp) * (1. - (steepness(ispp) - 0.2) / (0.8*steepness(ispp)) ) / Rzero(ispp);
      beta(ispp)   = (5. * steepness(ispp) - 1.) / (4. * steepness(ispp) * Rzero(ispp));
      phizero(ispp) = Bzero(ispp)/Rzero(ispp);
      break;
    case 4:
    // R = S * EXP(sr_alpha - beta * S))
      beta(ispp)  = log(5.*steepness(ispp))/(0.8*Bzero(ispp)) ;
      sr_alpha = log(Rzero(ispp)/Bzero(ispp))+beta(ispp)*Bzero(ispp);
      break;
  }

FUNCTION void Recruitment_Likelihood(const int& ispp)
  sigmaRsq(ispp) = sigr(ispp)*sigr(ispp);
  rec_like(ispp).initialize();
  // Tune recruits to spawners via functional form of Srec (to estimate srec params) RAM's exp. value form of -ln like
    rec_like(ispp) = (norm2( log(R(ispp)+1.e-8) - 
                             log(SRecruit(SSB(ispp),ispp) +1.e-8) + sigmaRsq(ispp)/2. ) / 
                             (2.*sigmaRsq(ispp))) + nrec(ispp) * log(sigr(ispp));
  obj_fun += sum(rec_like);

FUNCTION void Profile_F(const int& ispp)
  cout << "Profiling over F for " <<spname(ispp)<<endl;
 /* NOTE THis will need to be conditional on SrType too Function calculates used in calculating MSY and MSYL for a designated component of the
  population, given values for stock recruitment and selectivity...  Fmsy is the trial value of MSY example of the use of "funnel" to reduce the amount of storage for derivative calculations */
 dvariable sumF=0.;
  dvariable Stmp;
  dvariable Rtmp;
  double df=1.e-7;
  dvariable F1=.05;
  dvariable F2;
  dvariable F3;
  dvariable yld1;
  dvariable yld2;
  dvariable yld3;
  dvariable dyld;
  dvariable dyldp;
  // if (ispp==1) prof_F <<"Profile of stock, yield, and recruitment over F"<<endl;
  // prof_F << spname(ispp)<<" "<<endl;
  if (ispp==1) prof_F <<"Stock Run SSB F Yield SPR Recruit "<<endl;
  prof_F <<spname(ispp)<<" "<<run_name<<" "<< Bzero(ispp) <<" 0.0 0.0 1.0 " <<Rzero(ispp)<<endl; 
  dvar_vector ttt(1,5);
  for (int ii=0;ii<=150;ii++)
  {
    F1    = double(ii)/100;
    yld1  = yield(F1,Stmp,Rtmp,ispp);
    if (yld1<0) {yld1=0.; Stmp=0.; Rtmp=0.;}
    // ttt   = yld(Frat(ispp),F1);
  //         "Stock                 Run         SSB         F         Yield         SPR                         Recruit "<<endl;
    prof_F <<spname(ispp)<<" "<< run_name<<" "<<Stmp<<" "<<F1<<" "<<  yld1<<" "<<phi(ispp)/phizero(ispp)<<" "<< Rtmp<< endl; ;       // SPR
  } 

FUNCTION void get_msy(const int& ispp)
 /*Function calculates used in calculating MSY and MSYL for a designated component of the
  population, given values for stock recruitment and selectivity...  Fmsy is the trial value of MSY example of the use of "funnel" to reduce the amount of storage for derivative calculations */
  dvariable Stmp;
  dvariable Rtmp;
  double df=1.e-6;
  dvariable F1;
  F1 = F35(ispp);
  dvariable F2;
  dvariable F3;
  dvariable yld1;
  dvariable yld2;
  dvariable yld3;
  dvariable dyld;
  dvariable dyldp;
  // Newton Raphson stuff to go here //cout <<endl<<endl<<"Iter  F  Stock  1Deriv  Yld  2Deriv"<<endl; //for (int ii=1;ii<=500;ii++)
  for (int ii=1;ii<=5;ii++)
  {
    // if (mceval_phase()&&(F1>5||F1<0.01)) 
    // {
      // ii=5;
      // F1=M(ispp,nages(ispp)); // When things bomb (F <0 or F really big then just set it to F35...)
    // }
    // else
    {
      F2     = F1 + df*.5;
      F3     = F2 - df; //F1    = double(ii)/100;
      yld1   = yield(F1,Stmp,Rtmp,ispp); //cout <<ii<<" " <<F1<<" "<< Stmp <<" "<<yld1<<" "<<Rtmp<<" "<<" "<< endl; } exit(1);/*
      yld2   = yield(F2,Stmp,Rtmp,ispp);
      yld3   = yield(F3,Stmp,Rtmp,ispp);
      dyld   = (yld2 - yld3)/df;                          // First derivative (to find the root of this)
      dyldp  = (yld2 + yld3 - 2.*yld1)/(.25*df*df);   // Second derivative (for Newton Raphson)
      F1    -= dyld/dyldp;
      // cout <<F1<<" "<<yld1<<" "<<endl;
    }
  }
  Fmsy(ispp)  = F1;
  dvariable msytmp;
  msytmp =  yield(Fmsy(ispp),Stmp,Rtmp,ispp);
  MSY(ispp)   = msytmp;
  Bmsy(ispp)  = Stmp;
  Rmsy(ispp)  = Rtmp;

//+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+ 
FUNCTION dvariable yield(const dvariable& Ftmp, dvariable& Stmp,dvariable& Rtmp,const int& ispp)
  // cout<<spname(ispp)<<" "<<Ftmp<<" "<<Stmp<<" "<<Rtmp<<endl;
  dvariable yldtmp;
  dvariable phitmp;
  dvariable Req;
  
  dvar_vector Ntmp_F(1,nages(ispp));
  dvar_vector Ntmp_M(1,nages(ispp));

  dvar_vector Fatmp_F(1,nages(ispp));
  dvar_vector Fatmp_M(1,nages(ispp));

  dvar_vector Ztmp_F(1,nages(ispp));
  dvar_vector Ztmp_M(1,nages(ispp));

  dvar_vector survtmp_F(1,nages(ispp));
  dvar_vector survtmp_M(1,nages(ispp));

  dvar_vector Ctmp(1,nages(ispp));

  phitmp.initialize();
  Ntmp_F.initialize();
  Ntmp_M.initialize();
  Ntmp_F(1) = 0.5;
  Ntmp_M(1) = 0.5;
  Fatmp_F.initialize();
  Fatmp_M.initialize();
  Ctmp.initialize();
  int nagestmp=nages(ispp);
  // Need catch of females and males separate since weights and selectivities are different...
  // Catch equations needs to know total F (by sex) 
  for ( j=1 ; j < nages(ispp); j++ )
  {
    for (m=1;m<=ngear(ispp);m++)
    {
      Fatmp_F(j) += Frat(ispp,m)* Ftmp*sel_F(ispp,m,j);
      Fatmp_M(j) += Frat(ispp,m)* Ftmp*sel_M(ispp,m,j);
    }
    Ztmp_F(j)     = Fatmp_F(j) + M_F(ispp,j);
    Ztmp_M(j)     = Fatmp_M(j) + M_M(ispp,j);
    survtmp_F(j) = mfexp(-Ztmp_F(j));
    survtmp_M(j) = mfexp(-Ztmp_M(j));

    Ntmp_F(j+1)  =   Ntmp_F(j) * survtmp_F(j); // Begin numbers in the next year/age class
    Ntmp_M(j+1)  =   Ntmp_M(j) * survtmp_M(j); // Begin numbers in the next year/age class
  }
  for (m=1;m<=ngear(ispp);m++)
  {
    Fatmp_F(nagestmp) += Frat(ispp,m)* Ftmp*sel_F(ispp,m,nagestmp);
    Fatmp_M(nagestmp) += Frat(ispp,m)* Ftmp*sel_M(ispp,m,nagestmp);
  }
  Ztmp_F(nagestmp)     = Fatmp_F(nagestmp) + M_F(ispp,nagestmp);
  Ztmp_M(nagestmp)     = Fatmp_M(nagestmp) + M_M(ispp,nagestmp);
  survtmp_F(nagestmp) = mfexp(-Ztmp_F(nagestmp));
  survtmp_M(nagestmp) = mfexp(-Ztmp_M(nagestmp));


  Ntmp_F(nagestmp   )  /= (1.- survtmp_F(nagestmp   )); 
  Ntmp_M(nagestmp   )  /= (1.- survtmp_M(nagestmp   )); 
  //. for ( j=1 ; j <= nagestmp   ; j++ )
  //. //. {
    for (m=1;m<=ngear(ispp);m++)
    {
      // vector
      Ctmp += elem_prod( wt_gear_F(ispp,m)  , elem_prod(elem_div( Ftmp*Frat(ispp,m)*sel_F(ispp,m) , Ztmp_F ),elem_prod(1.- survtmp_F,Ntmp_F)));
      Ctmp += elem_prod( wt_gear_M(ispp,m)  , elem_prod(elem_div( Ftmp*Frat(ispp,m)*sel_M(ispp,m) , Ztmp_M ),elem_prod(1.- survtmp_M,Ntmp_M)));
    }
  //. }
  // Ctmp(j)     = Ntmp(j) * Fatmp(j) * (1. - survtmp(j)) / Ztmp(j);

  yldtmp = sum(Ctmp); //phi    = elem_prod(Ntmp , wttmp) * p_mature; // Kill these off till april as well!
  phitmp = elem_prod( Ntmp_F , pow(survtmp_F,yrfrac(ispp)) ) * wt_mature_F(ispp)  ; //Req    = Requil(phi);
  Req    = Requil(phitmp,ispp); 
  yldtmp*= Req;
  Stmp   = phitmp*Req;
  Rtmp   = Req;   //cout<<Ntmp<<" "<<Ctmp<<" "<<wttmp; // cout<< Ftmp<<" "<<yldtmp<<" "<<phitmp<<endl;
  phi(ispp) = phitmp;
  return yldtmp;
//+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+==+ 
  /* FUNCTION dvar_vector yld(const dvar_vector& Fratio, const dvariable& Ftmp)
  RETURN_ARRAYS_INCREMENT();
  // dvariable utmp=1.-mfexp(-(Ftmp)); dvariable Ntmp; dvariable Btmp; dvariable yield; dvariable survtmp=exp(-1.*natmort); dvar_vector seltmp=sel_fsh(endyr); Ntmp = 1.; Btmp = Ntmp*wt(1)*seltmp(1); Stmp = .5*Ntmp*wt(1)*maturity(1); yield= 0.; for ( j=1 ; j < nages ; j++ ) { Ntmp  *= (1.-utmp*seltmp(j))*survtmp; Btmp  += Ntmp*wt(j+1)*seltmp(j+1); Stmp  += .5 * Ntmp *wt(j+1)*maturity(j+1); } //Max Age - 1 yr yield   += utmp * Btmp; Ntmp    /= (1-survtmp*(1.-utmp*seltmp(nages))); Btmp    += Ntmp*wt(nages)*seltmp(nages); Stmp    += 0.5 *wt(nages)* Ntmp *maturity(nages); yield   += utmp * Btmp; //cout<<yield<<" "<<Stmp<<" "<<Btmp<<" ";
  dvar_vector msy_stuff(1,5);
  dvariable phi;
  dvar_vector Ntmp(1,nages);
  dvar_vector Ctmp(1,nages);
  msy_stuff.initialize();

  dvar_matrix seltmp(1,nfsh,1,nages);
  for (k=1;k<=nfsh;k++)
   seltmp(k) = sel_fsh(k,endyr); // NOTE uses last-year of fishery selectivity for projections.

  dvar_matrix Fatmp(1,nfsh,1,nages);
  dvar_vector Ztmp(1,nages);

  Ztmp = natmort;
  for (k=1;k<=nfsh;k++)
  { 
    Fatmp(k) = Fratio(k) * Ftmp * seltmp(k);
    Ztmp    += Fatmp(k);
  } 
  dvar_vector survtmp = exp(-Ztmp);

  Ntmp(1) = 1.;
  for ( j=1 ; j < nages; j++ )
    Ntmp(j+1)  =   Ntmp(j) * survtmp(j); // Begin numbers in the next year/age class
  Ntmp(nages)  /= (1.- survtmp(nages)); 

  for (k=1;k<=nfsh;k++)
  {
    Ctmp.initialize();
    for ( j=1 ; j <= nages; j++ )
      Ctmp(j)      = Ntmp(j) * Fatmp(k,j) * (1. - survtmp(j)) / Ztmp(j);

    msy_stuff(2)  += wt_fsh(k,endyr) * Ctmp;
  }
  phi    = elem_prod( Ntmp , pow(survtmp,spmo_frac ) ) * wt_mature_F;
  // Req    = Requil(phi) * exp(sigmarsq/2);
  msy_stuff(5)  = Ntmp * wt_pop;      
  msy_stuff(4)  = phi/phizero ;       // SPR
  msy_stuff(3)  = Requil(phi) ;       // Eq Recruitment
  msy_stuff(5) *= msy_stuff(3);       // BmsyTot
  msy_stuff(2) *= msy_stuff(3);       // MSY
  msy_stuff(1)  = phi*(msy_stuff(3)); // Bmsy
  RETURN_ARRAYS_DECREMENT();
  return msy_stuff;
  */ 


FUNCTION double get_spr_rates(double spr_percent,int& ispp)
  dmatrix sel_tmp_F(1,nages(ispp),1,ngear(ispp));
  double df=1.e-4;
  double F1 ;

  sel_tmp_F.initialize();
  sel_tmp_F = trans(sel_F(ispp));
  F1 = 0.0; 
  F1 = .8*(0.35/spr_percent)*M_F(ispp,2); // Start at some fraction of natural mortality
  double F2;
  double F3;
  double yld1;
  double yld2;
  double yld3;
  double dyld;
  double dyldp;
  // Newton Raphson stuff to go here, need to add gear type
  for (int ii=1;ii<=9;ii++)
  {
    F2     = F1 + df;
    F3     = F1 - df;
    yld1   = -1000*square(log(spr_percent/spr_ratio(F1, sel_tmp_F, ispp)));
    yld2   = -1000*square(log(spr_percent/spr_ratio(F2, sel_tmp_F, ispp)));
    yld3   = -1000*square(log(spr_percent/spr_ratio(F3, sel_tmp_F, ispp)));
    // cout<<F1<<" "<<F2<<" "<<F3<<" "<<yld1<<" "<<yld2<<endl;
    // cout <<spr_percent<<" "<<spr_ratio(F1,sel_tmp)<<endl;
    dyld   = (yld2 - yld3)/(2*df);                          // First derivative (to find the root of this)
    dyldp  = (yld3-(2*yld1)+yld2)/(df*df);  // Newton-Raphson approximation for second derivitive
    F1    -= dyld/dyldp;
  }
  return(F1);


FUNCTION double spr_ratio(double& trial_F,dmatrix& sel_tmp_F, int& ispp)
  double SBtmp;
  dvector Ntmp(1,nages(ispp));
  dvector srvtmp_F(1,nages(ispp));
  dmatrix Ftmp_F(1,nages(ispp),1,ngear(ispp));
  SBtmp = 0.0;
  Ntmp.initialize();
  srvtmp_F.initialize();
  Ftmp_F.initialize();
  Ftmp_F = sel_tmp_F;
  for (j=1;j<=nages(ispp);j++) 
  {
    Ftmp_F(j) = elem_prod(Ftmp_F(j), trial_F * Frat(ispp));
    srvtmp_F(j)  = mfexp(-sum(Ftmp_F(j)) - M_F(ispp,j));
  }
  Ntmp(1)=1.;
  j=1;
  SBtmp  += Ntmp(j)*wt_mature_F(ispp,j)*pow(srvtmp_F(j),yrfrac(ispp));
  for (j=2;j<nages(ispp);j++)
  {
    Ntmp(j) = Ntmp(j-1)*srvtmp_F(j-1);
    SBtmp  += Ntmp(j)*wt_mature_F(ispp,j)*pow(srvtmp_F(j),yrfrac(ispp));
  }
  Ntmp(nages(ispp))=Ntmp(nages(ispp)-1)*srvtmp_F(nages(ispp)-1)/(1.-srvtmp_F(nages(ispp)));

  SBtmp  += Ntmp(nages(ispp))*wt_mature_F(ispp,nages(ispp))*pow(srvtmp_F(nages(ispp)),yrfrac(ispp));
  SBtmp *=  AMeanRec(ispp) ;
  // cout<<"Trial= "<<trial_F<<endl<<SBtmp/SB100(ispp)<<endl<<Ntmp(1,5)<<endl<<srvtmp_F(6,nages(ispp))<<endl;
  return(SBtmp/SB100(ispp));

FUNCTION void do_elasticity()
  cout << "starting elasticities" << endl;

  elasticity << "species,sex,age,parameter,value,elasticity" << endl;
  int ispp=1;

  int igear=1;
  double lambda=exp(0.000001);
  double x0, xminus, xplus, elas;
  for(int ispp=1; ispp<=nspp; ispp++){
    for(int a=1;a<=nages(ispp);a++){
      // mortality
      x0=M_F(ispp,a);
      M_F(ispp,a)*=lambda;	  
      xminus  = (get_spr_rates(.35,ispp));
      M_F(ispp,a)/=lambda*lambda;
      xplus  = (get_spr_rates(.35,ispp));
      elas= (log(xplus)-log(xminus))/(2*log(lambda));
      M_F(ispp,a)=x0;		// Reset parameter
      elasticity << spname(ispp) << "," << "female," << a << "," << "M_F,"<< x0<< "," << elas << endl;
      // Selectivity
      x0=sel_F(ispp,igear,a);
      sel_F(ispp,igear,a)*=lambda;	  
      xminus  = (get_spr_rates(.35,ispp));
      sel_F(ispp,igear,a)/=lambda*lambda;
      xplus  = (get_spr_rates(.35,ispp));
      elas= (log(xplus)-log(xminus))/(2*log(lambda));
      sel_F(ispp,igear,a)=x0;     // Reset parameter
      elasticity << spname(ispp) << "," << "female," << a << "," << "sel_F,"<< x0<< "," << elas << endl;
      // // maturity
      // x0=pmature_F(ispp,a);
      // pmature_F(ispp,a)*=lambda;	  
      // xminus  = (get_spr_rates(.35,ispp));
      // pmature_F(ispp,a)/=lambda*lambda;
      // xplus  = (get_spr_rates(.35,ispp));
      // elas= (log(xplus)-log(xminus))/(2*log(lambda));
      // pmature_F(ispp,a)=x0;     // Reset parameter
      // elasticity << spname(ispp) << "," << "female," << a << "," << "pmature_F,"<< x0<< "," << elas << endl;
      // spawning WAA
      x0=wt_mature_F(ispp,a);
      wt_mature_F(ispp,a)*=lambda;	  
      xminus  = (get_spr_rates(.35,ispp));
      wt_mature_F(ispp,a)/=lambda*lambda;
      xplus  = (get_spr_rates(.35,ispp));
      elas= (log(xplus)-log(xminus))/(2*log(lambda));
      wt_mature_F(ispp,a)=x0;     // Reset parameter
      elasticity << spname(ispp) << "," << "female," << a << "," << "wt_mature_F,"<< x0<< "," << elas << endl;
    }
  }
  // */ 
RUNTIME_SECTION
   maximum_function_evaluations 100,200,5000
   convergence_criteria .1,.01,1e-5

TOP_OF_MAIN_SECTION
  /*
  gradient_structure::set_MAX_NVAR_OFFSET(1000);
  gradient_structure::set_GRADSTACK_BUFFER_SIZE(100000);
  gradient_structure::set_CMPDIF_BUFFER_SIZE(1000000);
  */
  arrmblsize  = 10000000 ;

