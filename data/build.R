source("data/import.R")

source_name <- "data/source.txt"

data <- build_database(source_name)
write.csv(data, "dinesafe.csv")
