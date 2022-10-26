library(tidyverse)
library(broom)

sleep_reaction <- read_csv("9_statistics/simple_data/sleep.csv")

sleep_reaction$Days <- as.factor(sleep_reaction$Days)
sleep_reaction$Subject <- as.factor(sleep_reaction$Subject)
sleep_reaction$Group <- as.factor(sleep_reaction$Group)

