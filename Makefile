TARGET=BoMSA_review

all: 
	pdflatex $(TARGET).tex
	detex $(TARGET).tex | grep -v '^$$' > $(TARGET).txt
	bibtex $(TARGET)
	pdflatex $(TARGET).tex
	pdflatex $(TARGET).tex


quick:
	pdflatex $(TARGET).tex

clean:
	rm -f $(TARGET).synctex $(TARGET).aux $(TARGET).pdf $(TARGET).log $(TARGET).bbl $(TARGET).blg $(TARGET).brf $(TARGET).txt
	rm -f *.log
	find . -name '*.eps' -exec rm -v {} \; 

show: all
	okular $(TARGET)-view.pdf
