#!/bin/bash

Rscript data/build.R
export COUCH_URL="https://hermisdm:moonlanding@hermisdm.cloudant.com"
export COUCH_DATABASE="dinesafe"
export COUCH_DELIMITER=","
cat dinesafe.csv | couchimport
rm -f dinesafe.xml dinesafe.csv
