#SUBDIRS = AgeErr avon1 avon2 avon3 ssb0 ssb1 ssb2 diag gengam
#SUBDIRS = ProcTune AgeErr avon1 avon2 avon3 ssb0 ssb1 ssb2 diag gengam
#SUBDIRS = base22/proj avon1/proj avon2/proj avon3/proj ssb0/proj ssb1/proj ssb2/proj diag/proj gengam/proj
SUBDIRS = m1/proj m2/proj m3/proj m4/proj m5/proj m6/proj m7/proj m8/proj 
#SUBDIRS = m1 m2 m3 m4 m5 m6 m7 m8 
#SUBDIRS = 01/proj 02/proj 03/proj 04/proj 05/proj 06/proj 07/proj 08/proj 00/proj
#SUBDIRS = withoutce withce Mmatrix Mmatrixce cope copece copeceMmat
#SUBDIRS = base usv usv_vast CA sr1 sr2 sr0 sr3
JOBS:=$(SUBDIRS)

MODS_DESC=Models to be run
ARGS:=

.PHONY: all ${JOBS} 

all: ${JOBS} ; echo "$@ success" ${JOBS} 
	
${JOBS}: job%: ; cd $* ; make ${ARGS} ; cd ..;


