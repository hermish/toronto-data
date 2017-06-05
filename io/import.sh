#!/bin/bash

location=$(sed -n '1p' < literals/source.txt)
curl "$location" -o data/dinesafe.zip
unzip data/dinesafe -d data
