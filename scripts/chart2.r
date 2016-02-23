library(dplyr)
#data


visited_countries <- function(data){
  data_year <- data %>% group_by(What.is.your.current.class.standing.)
  
  seahawk_group <- data %>% group_by(Are.you.a.Seahawks.fan.)
  
  #seahawks_fan <- seahawk_group %>% summarise(Yes = sum(Are.you.a.Seahawks.fan. == 'Yes'),
  #                                           YES = sum(Are.you.a.Seahawks.fan. == 'YES!'),
  #                                            No = sum(Are.you.a.Seahawks.fan. == 'No'))
  
  countries_visited <- data_year %>% summarise(visited_countries = mean(How.many.countries.have.you.visited.in.your.life.))
  
  library(plotly)
  p <- plot_ly(
    countries_visited,
    x = What.is.your.current.class.standing.,
    y = visited_countries,
    name = "",
    type = "bar",
    filename="r-docs/simple-bar"
  )
  p
  
  #library(plotly)
  #p2 <- plot_ly(
  #  x = seahawk_fan$,
  #  y = year_programming$visited_countries,
  #  name = "",
  #  type = "bar",
  #  filename="r-docs/simple-bar"
  #)
  #p2
}





