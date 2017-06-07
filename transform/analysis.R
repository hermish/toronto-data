library("plyr")
library("ppls")

analyze <- function(data, output) {
    # High-level function which runs the sample functions which are used to
    # analyze the data provided. This function should be changed to
    # utilize the desired functions for analysis.
    #
    # @param data: the data frame which contains the information to be analyzed
    # @param output: a character which represents rgw directory of all output
    #   files; must end with '/'

    inspection_histogram(data, output)
    pie_chart(data, output)
    pizza_comparison(data, output)
}


inspection_histogram <- function(data, output) {
    # Plots an histogram of the number of inspections restaurants receive
    #
    # @param data: the data frame
    # @param output: the output directory
    # @return: vector of frequencies

    freqs <- count(data, "establishment_name")
    to_plot <- freqs[["freq"]]

    # Writes file
    file_output <- paste(output, "inspection_histogram.jpg", sep = "")
    jpeg(file_output)
    hist(to_plot)
    dev.off()

    freqs
}

pie_chart <- function(data, output) {
    # Creates a pie chart which compares the amount of passes, conditional
    # passes and fails.
    #
    # @param data: the data frame
    # @param output: the output directory
    # @return: a vector corresponding to the sixe of the slices

    results <- count(data, "establishment_status")
    slices <- results[["freq"]]
    lbls <- results[["establishment_status"]]

    # Writes file
    file_output <- paste(output, "pie_chart.jpg", sep = "")
    jpeg(file_output)
    pie(slices, labels = lbls,
      main = "Inspection Outcomes")
    dev.off()

    slices
}

pizza_comparison <- function(data, output) {
    # A more compelx analytical function which compares the inspection outcomes
    # of pizza places to non-pizza places, producing a double bar graph based
    # which looks at each of the possible outcomes and the relative abundance
    # of outcomes from pizza and other palces.
    #
    # @param data: the data frame
    # @param output: the output directory
    # @return: a dataframe which represnts the data to be plotted

    # Sort out pizza and non-pizza places
    pizza_names <- grep("PIZZA", data[["establishment_name"]], value = TRUE)

    pizza_rows <- subset(data, establishment_name %in% pizza_names)
    non_pizza_rows <- subset(data, !(establishment_name %in% pizza_names))

    # Determines the outcome proportions for each dataset
    pizza_counts <- count(pizza_rows, "establishment_status")
    non_pizza_counts <- count(non_pizza_rows, "establishment_status")
    pizza_props <- normalize.vector(pizza_counts[["freq"]])
    non_pizza_props <- normalize.vector(non_pizza_counts[["freq"]])

    # Prepares data to be plotted
    to_plot <- rbind(pizza_props, non_pizza_props)
    colnames(to_plot) <- pizza_counts[["establishment_status"]]
    rownames(to_plot) <- c("Pizza", "Other")

    # Writes file
    file_output <- paste(output, "comparison.jpg", sep = "")
    jpeg(file_output)
    par(mar = c(5.1, 4.1, 4.1, 7.1), xpd = TRUE)
    barplot(to_plot,
            col=terrain.colors(length(rownames(to_plot))),
            width=2, beside=TRUE)
    legend("topright", inset = c(-0.25,0),
           fill=terrain.colors(length(rownames(to_plot))),
           legend=rownames(to_plot))
    dev.off()

    to_plot
}
