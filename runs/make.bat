@echo off
setlocal

REM List of directories to loop through
set "directories=base22 AgeErr avon1 avon2 avon3 ssb0 ssb1 ssb2 diag gengam "

REM Loop through each directory
for %%d in (%directories%) do (
    echo Currently processing: %%d
    REM Add your desired commands or operations here for each directory
		cd %%d
	rem	..\..\src\pm.exe -nox -iprint 750
		cd proj
		..\..\..\src\spm.exe
		cd ..\..\
)
endlocal
