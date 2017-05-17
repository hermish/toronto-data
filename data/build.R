source("import.R")
source_name <- "source.txt"

url <- readLines(source_name, n = 1)
format <- read.csv(source_name,
	skip = 1,
	stringsAsFactors = FALSE)

col_names <- format[["name"]]
col_classes <- format[["class"]]

connection <- download_compressed(url)
data <- read_xml(connection, col_names, col_classes)
