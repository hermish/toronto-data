# File containing functions integral to importing and exporting data
# independant of analysis methods.
library("methods")
library("readr")
library("XML")

read_xml <- function(file, col_names, col_types) {
    # Reads a rectangular xml file into a data frame 
    #
    # @param file: Filename ending in .xml
    # @param col_names: Character vector containing the names of the columns
    # @param col_types: Character vector containting the types of each of
    #   the columns
    # @return: a data frame containing the data in the xml file

    # Converts all factors columns into character ones for the import
    factors <- col_types == "factor"
    import_types <- col_types
    import_types[factors] <- "character"

    data <- xmlToDataFrame(file,
        colClasses = import_types,
        stringsAsFactors = FALSE)

    # Converts all intended factor columns back into factor columns from 
    # character ones
    data[factors] <- lapply(data[factors], factor)
    names(data) <- col_names
    data
}

load_xml <- function(source_name, format_name) {
    # Loads an xml file using a format file which contains the names and types
    # of each of the columns 
    #
    # @param source_name: Name of the source xml file
    # @param format_name: Name of the format file
    # @return: a data frame containing the data

    format <- read.csv(format_name, stringsAsFactors = FALSE)

    col_names <- format[["name"]]
    col_classes <- format[["class"]]

    data <- read_xml(source_name, col_names, col_classes)
    data
}

export <- function(data, destination) {
    # Exports a data frame as a csv into the specificied destination
    # 
    # @param data: the data frame to be saved
    # @param destination: the filename of the destination
    
    write_csv(data, destination)
}
