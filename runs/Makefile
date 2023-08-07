#SUBDIRS = base22 AgeErr avon1 avon2 avon3 ssb0 ssb1 ssb2 diag gengam
SUBDIRS = base22/proj avon1/proj avon2/proj avon3/proj ssb0/proj ssb1/proj ssb2/proj diag/proj gengam/proj
#SUBDIRS = 01 02 03 04 05 06 07 08 00
#SUBDIRS = 01/proj 02/proj 03/proj 04/proj 05/proj 06/proj 07/proj 08/proj 00/proj
#SUBDIRS = withoutce withce Mmatrix Mmatrixce cope copece copeceMmat
#SUBDIRS = base usv usv_vast CA sr1 sr2 sr0 sr3
JOBS:=$(SUBDIRS)

MODS_DESC=Models to be run
ARGS:=

.PHONY: all ${JOBS} 

all: ${JOBS} ; echo "$@ success" ${JOBS} 
	
${JOBS}: job%: ; cd $* ; make ${ARGS} ; cd ..;


