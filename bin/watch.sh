#!/bin/bash

# Determine which script to run based on the parameter
case "$1" in
  epub)
    find . -name '*.adoc' | entr bin/export-epub.sh
    ;;
  html)
    find . -name '*.adoc' | entr bin/export-html.sh
    ;;
  pdf)
    find . -name '*.adoc' | entr bin/export-pdf.sh
    ;;
  *)
    echo "❌ error: Invalid format."
    exit 1
    ;;
esac