#!/bin/bash
server=$(sed -n '1p' < literals/destination.txt)
dbname=$(sed -n '2p' < literals/destination.txt)
colname=$(sed -n '3p' < literals/destination.txt)
dbuser=$(sed -n '4p' < literals/destination.txt)
dbpassword=$(sed -n '5p' < literals/destination.txt)

mongoimport -h "$server" -u "$dbuser" -p "$dbpassword" \
	-d "$dbname" -c "$colname" \
	--file "data/dinesafe.csv" \
	--type csv --headerline

rm -f dinesafe.xml dinesafe.zip
