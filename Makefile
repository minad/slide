# Package:     gridslides
# Description: LaTeX package to create free form slides with blocks placed on a grid
# File:        Makefile
# Author:      Daniel Mendler <mail@daniel-mendler.de>
# Version:     0.1
# Date:        2017/11/11
# License:     GPL2 or LPPL1.3 at your option
# Homepage:    https://github.com/minad/gridslides

example.pdf: example.tex
	./compile.pl --once example.tex

clean:
	rm -rf auto output example.pdf gridslides.zip gridslides

dist: clean example.pdf *.cls *.sty README.md
	for i in $$(git ls-files | grep -v .gitignore); do mkdir -p gridslides/$$(dirname $$i); cp $$i gridslides/$$i; done
	zip -r gridslides.zip gridslides
	rm -rf gridslides
