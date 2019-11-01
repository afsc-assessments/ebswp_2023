#!/bin/bash
# set modn=%1
# amak -ind ..\examples\atka\%1.ctl -nox -iprint 100
#for i in `seq 13 13`;
#mv pm.dat tmp.dat
#cp control.dat t1.ctl
#awk 'NR==4{print "control.dat"} NR!=4 {print $0}' tmp.dat >pm.dat
for i in `seq -w 1.  5 `;
do
	echo t$i.dat
  #awk -v rrr=$i 'NR==82{print rrr} NR!=82 {print $0}' tt.ctl >control.dat
  #awk -v rrr=$i 'NR==99{print rrr} NR!=99 {print $0}' t1.ctl >control.dat
	cp t$i.dat control.dat
  pm -nox -iprint 500
	cp pm.std prof/r_$i.std
  cp pm.cor prof/r_$i.cor
  cp pm.par prof/r_$i.par
  cp pm.rep prof/r_$i.rep
  cp extra_sd.rep prof/r_ABC_$i.rep
done    
#mv tmp.dat pm.dat
#cp t1.ctl control.dat
