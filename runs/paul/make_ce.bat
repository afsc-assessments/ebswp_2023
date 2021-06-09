if exist ..\..\src\pm.exe (
  copy ..\..\src\pm.exe
  copy control_ce.dat control.dat  
  pm -nox -iprint 200

copy pm.rep pm_ce.rep
  copy pm.par pm_ce.par
  copy pm.std pm_ce.std
  copy old_rep.rep old_rep_ce.rep
  copy SR_sst_out.dat SR_sst_out_ce.dat
  copy srec_Ass_out.rep srec_Ass_out_ce.rep
  copy FakeF.txt FakeF_ce.txt   

  copy pm_ce.rep ..\..\..\pm_ce.rep
  copy pm_ce.par ..\..\..\pm_ce.par
  copy pm_ce.std ..\..\..\pm_ce.std
  copy old_rep_ce.rep ..\..\..\old_rep_ce.rep
  copy SR_sst_out_ce.dat ..\..\..\SR_sst_out_ce.dat
  copy srec_Ass_out_ce.rep ..\..\..\srec_Ass_out_ce.rep
  copy FakeF_ce.txt ..\..\..\FakeF_ce.txt  

) else (
  pushd ..\..\src
  admb pm
  popd
  copy ..\..\src\pm.exe 
  copy control_ce.dat control.dat 
  pm -nox -iprint 200

  copy pm.rep pm_ce.rep
  copy pm.par pm_ce.par
  copy pm.std pm_ce.std
  copy old_rep.rep old_rep_ce.rep
  copy SR_sst_out.dat SR_sst_out_ce.dat
  copy srec_Ass_out.rep srec_Ass_out_ce.rep
  copy FakeF.txt FakeF_ce.txt   

  copy pm_ce.rep ..\..\..\pm_ce.rep
  copy pm_ce.par ..\..\..\pm_ce.par
  copy pm_ce.std ..\..\..\pm_ce.std
  copy old_rep_ce.rep ..\..\..\old_rep_ce.rep
  copy SR_sst_out_ce.dat ..\..\..\SR_sst_out_ce.dat
  copy srec_Ass_out_ce.rep ..\..\..\srec_Ass_out_ce.rep
  copy FakeF_ce.txt ..\..\..\FakeF_ce.txt  
)
