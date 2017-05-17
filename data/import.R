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
	data <- xmlToDataFrame(connection,
		colClasses = col_types,
		stringsAsFactors = FALSE)
	names(data) <- names
	data
}
