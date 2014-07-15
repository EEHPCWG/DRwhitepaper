# Makefile but currently more like a batch file
# Issue a make clean and then a make
#

TARGETS: whitepaper.pdf

.PHONY: all clean complete whitepaper

all: whitepaper.pdf
whitepaper: whitepaper.pdf

tex_files = $(wildcard *.tex)
bib_files = $(wildcard */*.bib)
pdf_files = $(wildcard *.pdf)


whitepaper.pdf: $(tex_files) $(bib_files) $(pdf_files)
	pdflatex -shell-escape whitepaper | tee latex.out ; \
	bibtex whitepaper; \
	bibtex whitepaper; \
	pdflatex -shell-escape whitepaper | tee latex.out; \
	pdflatex -shell-escape whitepaper | tee latex.out; \
	cp whitepaper.pdf ../downloadPDF/whitepaperMASTER.pdf

clean:
	find .  -name '*.blg' -print  | xargs rm -f; \
	find . 	-name '*.aux' -print  | xargs rm -f; \
	find . 	-name '*.bbl' -print  | xargs rm -f; \
	find . 	-name '*.log' -print  | xargs rm -f; \
	find . 	-name '*.out' -print  | xargs rm -f; \
	rm -f whitepaper.pdf
