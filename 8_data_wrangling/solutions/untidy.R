#untidy_1 exercise
untidy_1 <- read_csv("data/untidy_1.csv")

untidy_1%>%
  pivot_longer(c("Trial_1_Cortisol","Trial_2_Cortisol","Trial_3_Cortisol"),
               names_to = "Trial", values_to = "Cortisol_Levels")%>%
  group_by(Trial)%>%
  summarise(mean_cortisol = mean(Cortisol_Levels, na.rm = TRUE))