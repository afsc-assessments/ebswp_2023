#!/bin/bash
# set modn=%1
# amak -ind ..\examples\atka\%1.ctl -nox -iprint 100
#for i in `seq 13 13`;
# for i in `seq 3 10`;
#do
  #awk -v rrr=$i 'NR==82{print rrr} NR!=82 {print $0}' tt.ctl >control.dat
  awk -v rrr=$1 'NR==82{print rrr} NR!=82 {print $0}' tt.ctl >control.dat
  pm -nox -iprint 400
  cp For_R.rep arc/p_R$1.rep
  cp extra_sd.rep arc/p_ABC_$1.rep
	cp pm.std arc/p_$1.std
	cp pm.rep arc/p_$1.rep
#done    

