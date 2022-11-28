SUBDIRS = 01 02 03 04 05 06 07 08 00
#SUBDIRS = 01/proj 02/proj 03/proj 04/proj 05/proj 06/proj 07/proj 08/proj 00/proj
#SUBDIRS = withoutce withce Mmatrix Mmatrixce cope copece copeceMmat
#SUBDIRS = base usv usv_vast CA sr1 sr2 sr0 sr3
JOBS:=$(SUBDIRS)

MODS_DESC=Models to be run
ARGS:=

.PHONY: all ${JOBS} 

all: ${JOBS} ; echo "$@ success" ${JOBS} 
	
${JOBS}: job%: ; cd $* ; make ${ARGS} ; cd ..;


