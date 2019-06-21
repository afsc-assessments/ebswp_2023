JOBS = 16.0 V1 fitsrv bholt


.PHONY: all ${JOBS} clean

all: ${JOBS} ; echo "$@ success" ${JOBS} 
${JOBS}: job%: ; cd $* ; make ${ARGS} ; cd ..;

