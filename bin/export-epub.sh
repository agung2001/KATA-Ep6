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
    asciidoctor-epub3 -vwt -o output/book.epub free.adoc
    asciidoctor-epub3 -vwt -o output/book.epub book.adoc
elif [ "$BUNDLE" = "FREE" ]; then
    asciidoctor-epub3 -vwt -o output/book.epub free.adoc
else
    asciidoctor-epub3 -vwt -o output/book.epub book.adoc
fi
