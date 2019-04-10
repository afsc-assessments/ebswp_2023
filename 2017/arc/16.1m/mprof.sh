#!/bin/bash
# set modn=%1
# amak -ind ..\examples\atka\%1.ctl -nox -iprint 100
#for i in `seq 13 13`;
cp ../dat/16.1.ctl t1.ctl
cp pm.dat tmp.dat
awk 'NR==4{print "control.dat"} NR!=4 {print $0}' tmp.dat >pm.dat
export i=2
for i in `seq 12 19`;
do
  #awk -v rrr=$i 'NR==82{print rrr} NR!=82 {print $0}' tt.ctl >control.dat
  awk -v rrr=$i '{if(NR>=13 && NR<=25){print rrr/100} else {print $0}}' t1.ctl >control.dat
  pm -nox -iprint 500 
  cp For_R.rep arc/r_R$i.rep
  cp extra_sd.rep arc/r_ABC_$i.rep
	cp pm.std arc/r_$i.std
	cp pm.rep arc/r_$i.rep
done    
mv tmp.dat pm.dat
cp t1.ctl control.dat
