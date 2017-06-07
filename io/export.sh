#!/bin/bash
# Exports the data onto the online database, and cleans up

# Collects credentials and destination from the destination.txt file
name="literals/destination.txt"
server=$(sed -n '1p' < "$name")
dbname=$(sed -n '2p' < "$name")
colname=$(sed -n '3p' < "$name")
dbuser=$(sed -n '4p' < "$name")
dbpassword=$(sed -n '5p' < "$name")

# Exports the data onto the server (verbose)
mongoimport -h "$server" -u "$dbuser" -p "$dbpassword" \
	-d "$dbname" -c "$colname" \
	--file "data/dinesafe.csv" \
	--type csv --headerline

# Deletes raw data files
rm -f data/dinesafe.xml data/dinesafe.zip
