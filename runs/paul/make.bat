if exist ..\..\src\pm.exe (
  copy ..\..\src\pm.exe 
  pm -nox -nohess -iprint 200
) else (
  pushd ..\..\src
  admb pm
  popd
  copy ..\..\src\pm.exe 
  pm -nox -nohess -iprint 200
)
