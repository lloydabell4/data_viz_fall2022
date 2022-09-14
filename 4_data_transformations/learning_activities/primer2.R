library(tidyverse)
library(readr)

ldt_data <- read_csv("ldt_data.csv")

dat_long <- pivot_longer(data = ldt_data, 
                         cols = rt_word:acc_nonword, 
                         names_sep = "_", 
                         names_to = c("dv_type", "condition"),
                         values_to = "dv") %>%
  pivot_wider(names_from = "dv_type", 
              values_from = "dv")

datatable(dat_long)

plot2 <- ggplot(dat_long, aes(x = rt, fill = condition)) +
  geom_density(alpha = 0.75)+
  scale_fill_discrete(name = "Condition",
                      labels = c("Non-Word", "Word"))+
  labs(x = "Reaction time (ms)",
       y = "Density (Percentage of responses at a particular reaction time)")

plot2

ggsave("primer2.jpeg",plot2)

