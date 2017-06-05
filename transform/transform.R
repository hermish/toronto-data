source("transform/core.R")

file <- "data/dinesafe.xml"
format <- "literals/format.txt"
destination <- "data/dinesafe.csv"

data <- load_xml(file, format)
export(data, destination)
