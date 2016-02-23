# A function that takes in a dataset and returns a list of info about it
summary_info <- function(data) {
  result <- list()
  names(data) <- gsub(x = names(data), pattern = "\\.", replacement = " ")
  result$participants <- nrow(data)
  result$num_questions <- ncol(data)
  result$questions <- colnames(data)
  return (result)
}