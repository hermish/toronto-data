library("XML")
library("methods")
library(dplyr)

download_compressed <- function(address) {
	temporary <- tempfile()
	download.file(address, temporary)
	connection <- unzip(temporary)
	unlink(temporary)
	connection
}

read_xml <- function(connection, col_names, col_types) {
	factors <- col_types == "factor"
	import_types <- col_types
	import_types[factors] <- "character"

	data <- xmlToDataFrame(connection,
		colClasses = import_types,
		stringsAsFactors = FALSE)

	data[factors] <- lapply(data[factors], factor)
	names(data) <- col_names
	data
}

build_database <- function(source_name) {
  url <- readLines(source_name, n = 1)
  format <- read.csv(source_name,
                     skip = 1,
                     stringsAsFactors = FALSE)

  col_names <- format[["name"]]
  col_classes <- format[["class"]]

  connection <- download_compressed(url)
  data <- read_xml(connection, col_names, col_classes)
}
