library(tidyverse)
library(readxl)

#visualize the relationship between year and number of sports fans by country
untidy1 <- read_excel("9_statistics/untidy1.xlsx")%>%
  pivot_longer("2011":"2013", names_to = "year", values_to = "count")%>%
  ggplot(aes(year, count, color = Country))+
  geom_line(aes(group = Country))

untidy1

#determine the total mean number of units by city regardless of their size
untidy2 <- read_csv("9_statistics/untidy2.csv")%>%
  pivot_longer(large:small, names_to = "type", values_to = "values")%>%
  group_by(city)%>%
  summarise(mean_value = mean(values))
  

#figure out the state with the highest income to rent ratio
untidy3 <- read_csv("9_statistics/untidy3.csv")%>%
  pivot_wider(names_from = variable, values_from = estimate)%>%
  mutate(income_rent_ratio = income / rent)%>%
  arrange(desc(income_rent_ratio))%>%
  slice(1:5)

