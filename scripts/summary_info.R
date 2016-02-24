# A function that takes in a dataset and returns a list of info about it
summary_info <- function(data) {
  result <- list()
  # Number of students who are intended to apply informatics
  result$apply <- nrow(data %>%
                         filter(Are.you.interested.in.applying.to.the.Informatics.major.
                                == "Yes"))
  
  # Number of students who have no previous experience with R programming language
  result$noR <-  nrow(data %>%
                        filter(What.is.your.familiarity.with..Using.the.R.programming.language
                               == "Never used it"))
  
  # counts number of participants of this survey 
  result$participants <- nrow(data)
  
  # counts number of questions asked during this survey
  result$num_questions <- ncol(data)
  
  # substitute dots in column names with spaces
  names(data) <- gsub(x = names(data), pattern = "\\.", replacement = " ")
  
  # list of questions asked during survey
  result$questions <- colnames(data)
  return (result)
}