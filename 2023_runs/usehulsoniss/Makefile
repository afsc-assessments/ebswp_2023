EXEC = pm
PROJ = spm
	PROJDIST = ~/_mymods/afsc-assessments/spmR/src/
ifeq ($(SAFE),TRUE)
	DIST = ../../source/
else
	DIST = ../../source/
endif
ARGS = -nox -iprint 150 
ARGS2 = -nox -iprint 150 -binp pm.bar -phase 22 -sdonly

ifdef ComSpec
    RM=del /F /Q
else
    RM=rm -rf
endif

all: mpd $(DIST)$(EXEC).tpl
$(EXEC): $(DIST)$(EXEC).tpl
	ln -sf $(DIST)$(EXEC) $@
	ln -sf $(DIST)$(EXEC).tpl $@.tpl
	ln -sf $(PROJDIST)$(PROJ) $(PROJ)

$(DIST)$(EXEC).tpl:
	$(MAKE) --directory=../../src


mpd: $(EXEC)
	./$(EXEC) $(ARGS)
	@$(RM) $(EXEC).*[0123456789] *.rpt *.log variance gradient.* *tmp admodel.* *.eva

mcmc: $(EXEC)
	./$(EXEC) $(ARGS) -mcmc 3000000 -mcsave 600
	./$(EXEC) -mceval 
	
proj: $(EXEC)
	./$(EXEC) $(ARGS2)
	$(MAKE) --directory=proj

debug: $(EXEC)
	./$(EXEC) $(ARGS)

plot:
	R CMD BATCH plot.R

clean:
	@$(RM) $(EXEC)
	@$(RM) $(EXEC)  $(EXEC).[brces]* $(EXEC).*[0123456789] *.rpt *.log variance gradient.* *tmp
	@$(RM) admodel.*
	@$(RM) checkfile.rep
	@$(RM) mcout.rep
	@$(RM) plot.Rout
	@$(RM) Rplots.pdf
	@$(RM) *.rep
	@$(RM) Fprof.yld
	@$(RM) *.prj
	@$(RM) pm.par
	@$(RM) SIS_out.rep
	@$(RM) mceval.dat
