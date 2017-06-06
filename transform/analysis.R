library("plyr")
library("ppls")

analyze <- function(data, output) {
  inspection_histogram(data, output)
  pie_chart(data, output)
	pizza_comparison(data, output)
}


inspection_histogram <- function(data, output) {
	freqs <- count(data, "establishment_name")
	
	file_output <- paste(output, "inspection_histogram.jpg", sep = "")
	jpeg(file_output)
	hist(freqs[["freq"]])
	dev.off()
}

pie_chart <- function(data, output) {
  results <- count(data, "establishment_status")
  slices <- results[["freq"]]
  lbls <- results[["establishment_status"]]
  
  file_output <- paste(output, "pie_chart.jpg", sep = "")
  jpeg(file_output)
  pie(slices, labels = lbls, 
      main = "Inspection Outcomes")
  dev.off()
}

pizza_comparison <- function(data, output) {
	pizza_names <- grep("PIZZA", data[["establishment_name"]], value = TRUE)

	pizza_rows <- subset(data, establishment_name %in% pizza_names)
	non_pizza_rows <- subset(data, !(establishment_name %in% pizza_names))
	
  pizza_counts <- count(pizza_rows, "establishment_status")
  non_pizza_counts <- count(non_pizza_rows, "establishment_status")
  
	pizza_props <- normalize.vector(pizza_counts[["freq"]])
	non_pizza_props <- normalize.vector(non_pizza_counts[["freq"]])
	
	to_plot <- rbind(pizza_props, non_pizza_props)
	colnames(to_plot) <- pizza_counts[["establishment_status"]]
	rownames(to_plot) <- c("Pizza", "Other")
    
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
}
