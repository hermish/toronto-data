library(testthat)
source("/transform/analysis.R")

test_results <- test_dir("/test/test_analysis.R", reporter = "summary")
