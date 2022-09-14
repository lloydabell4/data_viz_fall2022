library(tidyverse)
library(gapminder)

df <- gapminder

mean_df <- df%>%
  group_by(continent, year)%>%
  summarise(mean_lifeExp = mean(lifeExp),
            sum_pop = sum(pop))

datatable(mean_df)

plot_primer <- ggplot(data = mean_df, mapping = aes(x = year, y = mean_lifeExp, color = continent))+
  geom_point(aes(size = sum_pop))+
  geom_line()+
  labs(title = "Life Expectancy Increased Over the Last 60 Years",
       x = "Year",
       y = "Life Expectancy")

plot_primer

ggsave("primer1.jpeg",plot_primer)

