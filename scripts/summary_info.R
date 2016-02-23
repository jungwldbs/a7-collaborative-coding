# A function that takes in a dataset and returns a list of info about it
summary_info <- function(data) {
  result <- list()
  result$participants <- nrow(data)
  result$num_questions <- nrol(data)
  result$questions <- colnames(data)
  return (result)
}