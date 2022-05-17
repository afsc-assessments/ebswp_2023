EXEC = main
	DIST = ~/OneDrive/Models/Atka/src/
ARGS = -nox -iprint 50 -nohess

ifdef ComSpec
    RM=del /F /Q
else
    RM=rm -rf
endif

all: proj plot.R
$(EXEC): $(DIST)$(EXEC).tpl
	ln -sf $(DIST)$(EXEC) $@

$(DIST)$(EXEC).tpl:
	$(MAKE) --directory=~/OneDrive/Models/Atka/src/

proj: $(EXEC)
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
	@$(RM) For_R.rep
	@$(RM) Fprof.yld
	@$(RM) amak.prj
	@$(RM) amak.par
	@$(RM) SIS_out.rep
	@$(RM) mceval.dat

