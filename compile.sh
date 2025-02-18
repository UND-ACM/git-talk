#!/bin/sh
# requires pandoc and pdflatex
set -e
pandoc -f markdown -t beamer UND_ACM_GitTalk.md --highlight-style tango -o UND_ACM_GitTalk.pdf
