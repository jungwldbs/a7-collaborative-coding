build_plot <- function(data) {
  
  # Renaming columns
  names(data)[names(data) == 'What.is.your.current.class.standing.'] <- "Class_Standing"
  names(data)[names(data) == 'What.is.your.programming.experience.'] <- "Programming_Experience"
  names(data)[names(data) == 'What.operating.system.do.you.typically.use.'] <- "Operating_System"
  
  # Split by year and OS System
  OS_Usage_by_class <- group_by(data, Class_Standing) %>%
      summarise(
        Mac = sum(Operating_System == "Mac"),
        Linux = sum(Operating_System == "Linux"),
        Windows= sum(Operating_System == "Windows"),
        Other = sum(Operating_System == "Other: Windows at home, Linux (Ubuntu) at work")
      ) 
  
  # Creates a Mac Usage Graph
  mac_plot <- plot_ly(OS_Usage_by_class,
                      x = Class_Standing,
                      y = Mac,
                      name = "Mac Users",
                      type = "bar",
                      filename="r-docs/simple-bar"
                    )
  
  # Adds linux data to graph
  linux_plot <- add_trace(mac_plot,
                            x = Class_Standing,
                            y = Linux,
                            name = "Linux Users",
                            filename="r-docs/simple-bars"
                          )
  
  # Adds Windows data to graph
  windows_plot <- add_trace(linux_plot,
                              x = Class_Standing,
                              y = Windows,
                              name = "Windows Users",
                              filename="r-docs/simple-bars"
                            )
  
  # Adds other data to graph
  other_plot <- add_trace(windows_plot,
                            x = Class_Standing,
                            y = Other,
                            name = "Other User",
                            filename="r-docs/simple-bars"
                          ) 
  final_plot <- layout(other_plot, barmode = "stack") %>%
    
  # Adds the title OS Usage
  layout(title = "OS Usage", margin = list(l = 100))
  return(final_plot)
}
  
  
