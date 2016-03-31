# LaTeX Makefile

all: reportDraft.pdf

.PHONY: clean

%.pdf: %.tex
	mkdir -p ~/texmf/tex/latex/local/
	cp packages/* ~/texmf/tex/latex/local/
	texhash
	pdflatex $<
	pdflatex $<
	bibtex $(subst .pdf,.aux,$@)
	pdflatex $<
	pdflatex $<

clean:
	@rm -f *.aux *.blg *.out *.bbl *.log
