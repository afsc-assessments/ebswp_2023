:: copy data\%1_setup.dat   setup.dat
:: copy data\%1_tacpar.dat tacpar.dat
@echo off

if NOT exist data\%1_spcat.dat   ( echo ---------------
echo. 
echo   Oops...Error!!!!   
echo. 
echo   File data\%1_spcat.dat appears to be missing...  
echo. 
echo   Exiting....
echo ---------------
exit /B
)
copy data\%1_spcat.dat   spp_catch.dat
main -nox -nohess
if NOT exist %1_out mkdir %1_out
copy *.out %1_out\
copy main.rep %1_out\report.out
copy alt2_proj.rep %1_out\alt2_proj.out

call cleanad
call bin\awk1    %1
