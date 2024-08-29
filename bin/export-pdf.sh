#!/bin/bash

# Load .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "❌ .env file not found!"
    exit 1
fi

# Use the variables in conditions
if [ "$BUNDLE" = "ALL" ]; then
    asciidoctor-pdf -vwt -a pdf-theme=theme.yml -o output/free.pdf free.adoc
    asciidoctor-pdf -vwt -a pdf-theme=theme.yml -o output/book.pdf book.adoc
elif [ "$BUNDLE" = "FREE" ]; then
    asciidoctor-pdf -vwt -a pdf-theme=theme.yml -o output/free.pdf free.adoc
else
    asciidoctor-pdf -vwt -a pdf-theme=theme.yml -o output/book.pdf book.adoc
fi