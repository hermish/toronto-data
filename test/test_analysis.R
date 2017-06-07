library(testthat)
library(tibble)

test_that("Test histogram", {
    data <- frame_data(
        ~establishment_name,
        "Pizza Nova", "Chatime", "Pizza Nova", "Chatime", "Pizza Nova",
        "Pizza Pizza", "Masters", "Tim Hortons", "Burger King")

    expected <- c(1, 2, 1, 3, 1, 1)
    output <- inspection_histogram(data, "test/")

    expect_that(output, equals(expected))
})
