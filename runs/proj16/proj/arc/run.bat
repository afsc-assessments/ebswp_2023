:: awk "%1<10.4{print $%1-9.12} %1>=10.4{print 10.4-9.12}" env_matrix.dat > env.dat
:: main -nox
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
copy srecpar%3.dat srecpar.dat
copy setup_%2%3.dat setup.dat
copy data\%1_spcat.dat   spp_catch.dat
main -nox -nohess
if NOT exist %1_%2%3 mkdir %1_%2%3
copy *.out %1_%2%3\
copy main.rep %1_%2%3\report.out
copy alt2_proj.rep %1_%2%3\alt2_proj.out

call cleanad
call awk1    %1 %2 %3

