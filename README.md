# A Data Project

## Introduction
Using City of Toronto data to do something useful! Run the program by navigating
to the root directory of this repository in terminal and running:

```
./run.sh
```

## Requirements
Ensure that you have a stable internet connection and approximately 80 MB of
space to allow the data to be download from the city website. In order to
transform the data provided, R is used; you can download version 3.4.0
for free [here](https://www.r-project.org/). Once R is downloaded, you can
install the required packages with the following command in the R console:

```
install.packages(c("methods", "readr", "XML"))
```

Also, ensure the following command line utilities are installed: unzip and the
MongoDB utilities which can be found [here](https://www.mongodb.com/download-
center) or installed through Homebrew.
