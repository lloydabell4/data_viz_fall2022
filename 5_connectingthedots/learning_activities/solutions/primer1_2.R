tuition_income <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-10/tuition_income.csv') 

#create code required to build this table
df <- tuition_income%>%
  group_by(year)%>%
  summarise(mean_price = mean(total_price))

#create code required to build this visualization
tuition_income%>%
  group_by(year, state, income_lvl)%>%
  summarise(mean_price = mean(total_price),
            mean_cost = mean(net_cost))%>%
  ggplot(mapping = aes(x = year, y = mean_cost, fill = income_lvl))+
  geom_col(position = "dodge")

#critique this visualization