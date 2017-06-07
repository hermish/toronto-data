# Loads library and other functions defined
library("readr")
source("transform/core.R")
source("transform/analysis.R")

# Declaring project file constants
file <- "data/dinesafe.xml"
format <- "literals/format.txt"
destination <- "data/dinesafe.csv"
output <- "data/"

# Executes data operations 
data <- load_xml(file, format)
analyze(data, destination)
export(data, destination)
