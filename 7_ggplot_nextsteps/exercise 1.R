# Timeseries of reported bike shares on weekend days
bikes%>%
  filter(is_weekend == TRUE)%>%
  ggplot(aes(date, count, color = day_night))+
  geom_point(aes(shape = day_night))+
  geom_line(alpha = .2)+
  labs(
    x = "Date",
    y = "Number of Rides",
    title = "The Change in Bike Rides Across Time",
    color = "Day or Night:",
    shape = "Day or Night:"
    
  )+
  theme_minimal()+
  theme(
    plot.title = element_text(face = "bold"), 
    legend.position = "top"
  )

