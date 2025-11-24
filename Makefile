# Makefile to automatically convert Markdown files
# into either a handout pdf (if filename ends with "-handout.md")
# or a slides pdf (if filename ends with "-slides.md")
#
# This uses pandoc, which needs to be installed.

slidessrc=$(shell find . -iname '*-slides.md' | sed 's/ /\\ /g')
handoutssrc=$(shell find . -iname '*-handout.md' | sed 's/ /\\ /g')

slides=$(subst .md,.pdf,$(slidessrc))
handouts=$(subst .md,.pdf,$(handoutssrc))

all : slides handouts

slides : $(slides)
handouts : $(handouts)



%-slides.pdf: %-slides.md
	pandoc -i -t beamer -V theme:Warsaw $< -o $@

%-handout.pdf: %-handout.md
	pandoc -N -V geometry=height=10in,width=7.5in --pdf-engine=xelatex $< -o $@
