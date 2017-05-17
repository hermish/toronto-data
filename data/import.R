library("XML")
library("methods")

download_compressed <- function(address) {
	temporary <- tempfile()
	download.file(address, temporary)
	connection <- unzip(temporary)
	unlink(temporary)
	connection
}

read_xml <- function(connection, col_names, col_types) {
	factors <- col_types == "factor"
	col_types[factors] <- "factor"

	data <- xmlToDataFrame(connection,
		colClasses = col_types,
		stringsAsFactors = FALSE)

	data[factors] <- lapply(data[factors], factor)
	names(data) <- col_names
	data
}
