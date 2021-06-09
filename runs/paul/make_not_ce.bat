if exist ..\..\src\pm.exe (
  copy ..\..\src\pm.exe
  copy control_not_ce.dat control.dat  
  pm -nox -iprint 200

  copy pm.rep pm_not_ce.rep
  copy pm.par pm_not_ce.par
  copy pm.std pm_not_ce.std
  copy old_rep.rep old_rep_not_ce.rep
  copy srec_Ass_out.rep srec_Ass_out_not_ce.rep
  copy FakeF.txt FakeF_not_ce.txt  

  copy pm_not_ce.rep ..\..\..\pm_not_ce.rep
  copy pm_not_ce.par ..\..\..\pm_not_ce.par
  copy pm_not_ce.std ..\..\..\pm_not_ce.std
  copy old_rep_not_ce.rep ..\..\..\old_rep_not_ce.rep
  copy srec_Ass_out_not_ce.rep ..\..\..\srec_Ass_out_not_ce.rep
  copy FakeF_not_ce.txt ..\..\..\FakeF_not_ce.txt  

) else (
  pushd ..\..\src
  admb pm
  popd
  copy ..\..\src\pm.exe 
  copy control_not_ce.dat control.dat 
  pm -nox -iprint 200

  copy pm.rep pm_not_ce.rep
  copy pm.par pm_not_ce.par
  copy pm.std pm_not_ce.std
  copy old_rep.rep old_rep_not_ce.rep
  copy srec_Ass_out.rep srec_Ass_out_not_ce.rep
  copy FakeF.txt FakeF_not_ce.txt  

  copy pm_not_ce.rep ..\..\..\pm_not_ce.rep
  copy pm_not_ce.par ..\..\..\pm_not_ce.par
  copy pm_not_ce.std ..\..\..\pm_not_ce.std
  copy old_rep_not_ce.rep ..\..\..\old_rep_not_ce.rep
  copy srec_Ass_out_not_ce.rep ..\..\..\srec_Ass_out_not_ce.rep
  copy FakeF_not_ce.txt ..\..\..\FakeF_not_ce.txt  
)
