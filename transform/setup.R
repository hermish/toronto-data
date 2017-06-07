# A scrip which installs all the required packages for the process

core_libs <- ["methods", "readr", "XML"]
analysis_libs <- get_libraries("analysis.R")
install.packages(c(core_libs, analysis_libs))

function <- get_libraries(filename) {
	# TODO(hermish): Implement a true method which reads the analysis file and
	# grabs the name of the packages which need to be installed.
	output <- ["plyr", "ppls"]
	output
}
