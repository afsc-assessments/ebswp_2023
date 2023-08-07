#!/bin/bash
#mv -f pm.dat tmp.dat
# unalias cp
/bin/cp -f control.dat t1.ctl
#awk 'NR==4{print "control.dat"} NR!=4 {print $0}' tmp.dat >pm.dat
for i in `seq $2 $1`;
do
  awk -v rrr=$i 'NR==157{print rrr} NR!=157 {print $0}' t1.ctl >control.dat
  ./pm -nox -iprint 500 
	/bin/cp -f pm.std retro/r_$i.std
	/bin/cp -f pm.rep retro/r_$i.rep
	/bin/cp -f mcFmort.rep retro/r_Fmort_$i.rep
	/bin/cp -f mcSRR.rep retro/r_SRR_$i.rep
done    
/bin/cp -f t1.ctl control.dat

