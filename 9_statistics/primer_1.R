library(tidyverse)
library(readxl)

#untidy1
#visualize the relationship between year and number of sports fans by country

tidy1 <- untidy1%>%
  pivot_longer(c("2011","2012","2013"),names_to = "year", values_to = "fans")%>%
  ggplot(aes(year, fans, color = Country))+
  geom_point()+
  geom_line(aes(group = Country))

tidy1

#untidy2
#determine the mean number of units by city regardless of their size
tidy2 <- untidy2%>%
  pivot_longer(c("large","small"),names_to = "size", values_to = "units")%>%
  group_by(city)%>%
  summarise(mean_units = mean(units))


#untidy3
#figure out the state with the highest income to rent ratio
tidy3 <- untidy3%>%
  pivot_wider(names_from = variable, values_from = estimate )%>%
  group_by(NAME)%>%
  summarise(ratio = (income/rent))%>%
  arrange(desc(ratio))

tidy3 <- untidy3%>%
  pivot_wider(names_from = variable, values_from = estimate )%>%
  mutate(ratio = (income/rent))%>%
  arrange(desc(ratio))