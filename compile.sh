#!/bin/sh
# requires pandoc and pdflatex
set -e
pandoc -f markdown -t beamer 01-git-and-github.md --highlight-style tango -o 01-git-and-github.pdf
pandoc -f markdown -t beamer 02-github-ci.md --highlight-style tango -o 02-github-ci.pdf
