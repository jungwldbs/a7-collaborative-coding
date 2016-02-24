# plot for  different Seahawk Fan responses and class standing
seahawks_plot <- function(data){
  
  #change current class standing to Class_Standing
  names(data)[names(data) == 'What.is.your.current.class.standing.'] <- "Class_Standing"
  
  #group data my class standing
  data_year <- data %>% group_by(Class_Standing)
  
  # summarize grouped data by different Seahawk fan responses
  seahawks_fan <- data_year %>% summarise(Yes = sum(Are.you.a.Seahawks.fan. == 'Yes'),
                                             YES = sum(Are.you.a.Seahawks.fan. == 'YES!'),
                                              No = sum(Are.you.a.Seahawks.fan. == 'No'))
  #plot for Yes response and class standing
  yes_plot <- plot_ly(
    seahawks_fan,
    x = Class_Standing,
    y = Yes,
    type = "bar",
    name = "Yes",
    filename="r-docs/simple-bar"
  )
  
  # add plot for YES! response
  yesyes_plot <- add_trace(
    yes_plot,
    x = Class_Standing,
    y = YES,
    type = "bar",
    name = "YES!",
    filename="r-docs/simple-bar"
  )
  
  # add plot for No response
  no_plot <- add_trace(
    yesyes_plot,
    x = Class_Standing,
    y = No,
    type = "bar",
    name = "No",
    filename="r-docs/simple-bar"
  )
  
  #Stack all the plots for Seahawk Response
  layout(no_plot, barmode = "stack")
  
  #rename title to Seahawk Fans
  layout(title = "Seahawk Fans", margin = list(l = 100))
}





