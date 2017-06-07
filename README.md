# DineSafe Toolkit

## Introduction
Using City of Toronto data to do something useful! Run the program by navigating
to the root directory of this repository in terminal and running the `Run`
script

## Requirements
Ensure that you have a stable internet connection and approximately 80 MB of
space to allow the data to be download from the city website. In order to
transform the data provided, R is used; you can download version 3.4.0
for free [here](https://www.r-project.org/).

Once R is installed, load the R console and runn the following command:

```
install.packages(c("methods", "readr", "XML", "plyr”, “ppls”))
```

This makes sure the the perquisite libraries are installed on your system
for the tool kit to convert and analyze the data.

Also, ensure the following command line utilities are installed: unzip and
MongoDB utilities which can be found
[here](https://www.mongodb.com/download-center) or installed through Homebrew.

## Literal Files
The following files must be present in the data folder with the following
specifications for the scripts to run.

1. destination.txt
```
<mongo_db_server_ocation>
<database_name>
<collection_name>
<username>
<password>
```

2. format.txt
```
name,class
<field1>,<type1>
<field2>,<type2>
...
```

3. source.txt
```
<url_of_data>
```
