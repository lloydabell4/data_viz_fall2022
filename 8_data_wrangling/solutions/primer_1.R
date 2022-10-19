diamonds%>%
  filter(cut %in% c("Fair","Good"))%>%
  filter(carat < 1.5)%>%
  ggplot(aes(carat,price))+
  geom_point(aes(color =  carat > 1), 
             show.legend = "FALSE")+
  geom_smooth(method = "lm")+
  facet_wrap(~clarity, scales = "free_y")+
  labs(title ="Carat Size and Price Are Positively Correlated for All Clarity Levels",
       x = "Carat",
       y = "Price ($)",
       caption = "Data from Diamonds tidyverse dataset")+
  theme_minimal()+
  theme(
    plot.title = element_text(face = "bold")
  )

data1 <- diamonds
