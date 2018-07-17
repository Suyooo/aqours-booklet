all: download nobg print
download: output/booklet.pdf
nobg: output/booklet-nobg.pdf
print: output/booklet-print.pdf

.PRECIOUS: output/.d
.SUFFIXES:

# Calling xelatex twice because sometimes the background are misaligned on the first compile, but they're fine on the second...
output/booklet.pdf: booklet.tex definitions.tex images/*.pdf images/*.png infopages/*.tex songs/*.tex output/.d
	xelatex '\input{booklet.tex}'
	xelatex '\input{booklet.tex}'
	mv booklet.pdf output/booklet.pdf
output/booklet-nobg.pdf: booklet.tex definitions.tex images/*.pdf images/*.png infopages/*.tex songs/*.tex output/.d
	xelatex '\def\nobackground{yes} \input{booklet.tex}'
	xelatex '\def\nobackground{yes} \input{booklet.tex}'
	mv booklet.pdf output/booklet-nobg.pdf
output/booklet-print.pdf: booklet.tex definitions.tex images/*.pdf images/*.png infopages/*.tex songs/*.tex output/.d
	xelatex '\def\bleed{yes} \input{booklet.tex}'
	xelatex '\def\bleed{yes} \input{booklet.tex}'
	mv booklet.pdf output/booklet-print.pdf

*.pdf *.png *.tex:

output/.d:
	-mkdir output
	touch output/.d

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc
dist-clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc
	rm output/*.pdf
