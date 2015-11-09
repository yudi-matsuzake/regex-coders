PROJECT:=./regex-coders
FILES:=$(shell find . -regextype awk -regex '.*\.(tex|bib)')

all: ${PROJECT}.pdf clean see
#------------------------------------------------
${PROJECT}.pdf:	${PROJECT}.tex $(FILES)
		pdflatex ${PROJECT}
		-bibtex ${PROJECT}
		pdflatex ${PROJECT}
		pdflatex ${PROJECT}

clean:	.gitignore
	@while read regex;\
	do \
		regex=$$(find . -name "$$regex") ;\
                echo Removendo... [ $${regex} ] ;\
		rm -f $${regex} ;\
	done < .gitignore

see:	${PROJECT}.pdf
	xdg-open ${PROJECT}.pdf
