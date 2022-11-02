library(tidyverse)
library(broom)

sleep_reaction <- read_csv("9_statistics/simple_data/sleep.csv")

sleep_reaction$Days <- as.factor(sleep_reaction$Days)
sleep_reaction$Subject <- as.factor(sleep_reaction$Subject)
sleep_reaction$Group <- as.factor(sleep_reaction$Group)


ggplot(filter_sleep, aes(Days, Reaction, fill = Group))+
  geom_boxplot()

filter_sleep <- sleep_reaction%>%
  filter(Days %in% c(0,9))

t.test(Reaction~Group, data = filter_sleep)

?t.test
aov_output <- aov(Reaction ~ Days * Group, data = sleep_reaction)

summary(aov_output)
