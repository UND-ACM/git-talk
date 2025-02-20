#!/bin/sh
# requires pandoc and pdflatex
set -e
pandoc -f markdown -t beamer UND_ACM_GitTalk.md --highlight-style tango -o UND_ACM_GitTalk.pdf
pandoc -f markdown -t beamer github-ci.md --highlight-style tango -o github-ci.pdf
