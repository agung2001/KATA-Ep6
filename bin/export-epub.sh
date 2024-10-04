#!/bin/bash

asciidoctor-epub3 -vwt -a stylesheet=style.css -o output/book.epub book.adoc