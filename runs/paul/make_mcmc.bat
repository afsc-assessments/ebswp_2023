if exist ..\..\src\pm.exe (
  copy ..\..\src\pm.exe 
  pm -nox -iprint 200 -mcmc 1000 -mcsave 100
  pm -mceval
) else (
  pushd ..\..\src
  admb pm
  popd
  copy ..\..\src\pm.exe 
  pm -nox -iprint 200 -mcmc 1000 -mcsave 100
  pm -mceval
)
