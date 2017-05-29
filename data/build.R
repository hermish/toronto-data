source("import.R")
source_name <- "source.txt"
raw_output_name <- "dinesafe.rda"
location_name <- "locations.rda"

data <- build_databse(source_name)
save(data, file = raw_output_name)

locations <- find_locations(data)
save(locations, file = location_name)
