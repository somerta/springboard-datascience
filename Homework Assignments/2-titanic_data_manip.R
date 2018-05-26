library(readr)
library(dplyr)

set_wd("C:\Users\shirtzel\Documents\gits\springboard-datascience\Homework Assignments")

titan <- read.csv("titanic_original.csv")
##View(titan)
##str(titan)

titan %>% 
  mutate(embarked = ifelse(embarked == "", "S", as.character(embarked))) %>% 
  select_all %>% 
  arrange(embarked)
  