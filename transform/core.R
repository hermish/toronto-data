library("methods")
library("readr")
library("XML")

read_xml <- function(file, col_names, col_types) {
	factors <- col_types == "factor"
	import_types <- col_types
	import_types[factors] <- "character"

	data <- xmlToDataFrame(file,
		colClasses = import_types,
		stringsAsFactors = FALSE)

	data[factors] <- lapply(data[factors], factor)
	names(data) <- col_names
	data
}

load_xml <- function(source_name, format_name) {
  format <- read.csv(format_name, stringsAsFactors = FALSE)

  col_names <- format[["name"]]
  col_classes <- format[["class"]]

  data <- read_xml(source_name, col_names, col_classes)
  data
}

export <- function(data, destination) {
	write_csv(data, destination)
}
