if exist ..\..\src\pm.exe (
  copy ..\..\src\pm.exe
  copy control_ce.dat control.dat  
  pm -nox -iprint 200 -mcmc 500000 -mcsave 1000
  pm -mceval
) else (
  pushd ..\..\src
  admb pm
  popd
  copy ..\..\src\pm.exe
  copy control_ce.dat control.dat 
  pm -nox -iprint 200 -mcmc 500000 -mcsave 1000
  pm -mceval
)
  copy mceval.rep ..\..\..\get_ppl\mceval_rep_ce.rep
  copy mceval_ea1_eit.rep ..\..\..\get_ppl\mceval_ea1_eit_ce.rep
  copy mceval_eac_bts.rep ..\..\..\get_ppl\mceval_eac_bts_ce.rep
  copy mceval_eac_eit.rep ..\..\..\get_ppl\mceval_eac_eit_ce.rep
  copy mceval_eac_fsh.rep ..\..\..\get_ppl\mceval_eac_fsh_ce.rep
  copy mceval_eb_bts.rep ..\..\..\get_ppl\mceval_eb_bts_ce.rep
  copy mceval_eb_eit.rep ..\..\..\get_ppl\mceval_eb_eit_ce.rep
  copy mceval_fsh_wt.rep ..\..\..\get_ppl\mceval_fsh_wt_ce.rep
  copy mceval_mnwt.rep ..\..\..\get_ppl\mceval_mnwt_ce.rep
  copy mceval_pred_avo.rep ..\..\..\get_ppl\mceval_pred_avo_ce.rep
  copy mceval_pred_catch.rep ..\..\..\get_ppl\mceval_pred_catch_ce.rep
  copy mceval_pred_cpue.rep ..\..\..\get_ppl\mceval_pred_cpue_ce.rep
  copy mceval_srv_wt.rep ..\..\..\get_ppl\mceval_srv_wt_ce.rep