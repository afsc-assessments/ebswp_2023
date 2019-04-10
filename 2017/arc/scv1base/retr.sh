#!/bin/bash
# set modn=%1
# amak -ind ..\examples\atka\%1.ctl -nox -iprint 100
#for i in `seq 13 13`;
for i in `seq 0 10`;
do
  #awk -v rrr=$i 'NR==82{print rrr} NR!=82 {print $0}' tt.ctl >control.dat
  awk -v rrr=$i 'NR==99{print rrr} NR!=99 {print $0}' tt.ctl >control.dat
  pm -nox -iprint 400
  cp For_R.rep arc/r_R$i.rep
  cp extra_sd.rep arc/r_ABC_$i.rep
	cp pm.std arc/r_$i.std
	cp pm.rep arc/r_$i.rep
done    

