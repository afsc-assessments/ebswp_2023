ifdef ComSpec
    RM=del /F /Q
else
    RM=rm -rf
endif

all: EBSpollock 

R_OPTS=--no-save --no-restore --no-init-file --no-site-file
#PANDOC_OPTS=-V geometry:margin=1in --to latex --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash --output text.tex --template ms.tex --highlight-style tango --pdf-engine=xelatex
#PANDOC_OPTS=-V geometry:margin=1in --template ms.tex --highlight-style tango --latex-engine=xelatex
#PANDOC_OPTS=-V geometry:margin=1in --highlight-style tango --latex-engine=xelatex #--template ms.tex 
#PANDOC_OPTS=-V geometry:margin=1in --highlight-style tango  --latex-engine=xelatex --template my.tex 
PANDOC_OPTS=-V geometry:margin=1in --latex-engine=xelatex --template my.tex 

pdf: pm.Rmd 
#	cp pm.R pm.Rmd
	R ${R_OPTS} -e 'library(knitr); knit("pm.Rmd");'
	pandoc pm.md -o pm.pdf ${PANDOC_OPTS}

text: text.Rmd 
	R ${R_OPTS} -e 'library(knitr); knit("text.Rmd");'
	pandoc text.md -o text.pdf  ${PANDOC_OPTS}
# --natbib --bibliography /Users/jim/Dropbox/master.bib
#	--latex-engine=xelatex
	open text.pdf

pm1: pm1.Rmd 
	R ${R_OPTS} -e 'library(knitr); knit("pm1.Rmd");'
	pandoc pm1.md -o pm1.pdf  ${PANDOC_OPTS}
	#open pm1.pdf

ref: ref.Rmd 
	R ${R_OPTS} -e 'library(knitr); knit("ref.Rmd");'
	pandoc ref.md -o ref.pdf  ${PANDOC_OPTS}
	#open ref.pdf

tab: tab.Rmd 
	R ${R_OPTS} -e 'library(knitr); knit("tab.Rmd");'
	pandoc tab.md -o tab.pdf  ${PANDOC_OPTS}
	#open tab.pdf

figs: figs.Rmd 
	R ${R_OPTS} -e 'library(knitr); knit("figs.Rmd");'
	pandoc figs.md -o figs.pdf ${PANDOC_OPTS}
	#open figs.pdf

model: model.Rmd 
	R ${R_OPTS} -e 'library(knitr); knit("model.Rmd");'
	pandoc model.md -o model.pdf  ${PANDOC_OPTS}
	#open model.pdf

EBSpollock: EBSpollock.Rmd 
	R ${R_OPTS} -e 'library(knitr); knit("EBSpollock.Rmd");'
	pandoc EBSpollock.md -o EBSpollock.pdf ${PANDOC_OPTS}

clean:
	$(RM) pm.md 
	$(RM) figs.md 
	$(RM) tab.md 
	$(RM) model.md 
	$(RM) text.md 
	$(RM) figs.pdf 
	$(RM) tab.pdf 
	$(RM) model.pdf 
	$(RM) text.pdf 
	$(RM) ref.pdf 
	$(RM) ref.md 
