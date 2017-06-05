library("readr")
source("transform/core.R")
source("transform/analysis.R")

file <- "data/dinesafe.xml"
format <- "literals/format.txt"
destination <- "data/dinesafe.csv"
output <- "data/"

data <- load_xml(file, format)
analyze(data, destination)
export(data, destination)
