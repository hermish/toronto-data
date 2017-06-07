#!/bin/bash
# Downloads and unzips the data, address found in the source file

location=$(sed -n '1p' < literals/source.txt)
curl "$location" -o data/dinesafe.zip
unzip data/dinesafe -d data
