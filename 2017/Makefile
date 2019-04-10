# make -j N will do N simultaneous mods (in this case 3...)
NMODS:=4
NUMBERS:=$(shell seq 0 ${NMODS})
JOBS:=$(addprefix m,${NUMBERS})
DEL:=admodel.cov admodel.dep admodel.hes checkfile.rep fmin.log amak.b0* amak.bar amak.cor amak.eva amak.log amak.p0* amak.par amak.r0* amak.rep amak.std macs_files_in.dat amak_in.ctl amak_in.dat gradient.* mcout.rep variance
MODS_DESC=Models to be run
ARGS:=

ifdef ComSpec
    RM=del /F /Q
else
    RM=rm -rf
endif

.PHONY: all ${JOBS} clean

all: ${JOBS} ; echo "$@ success" ${JOBS} 
${JOBS}: job%: ; cd $* ; make ${ARGS} ; cd ..;

