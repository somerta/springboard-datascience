library(readr)
library(dplyr)

set_wd("C:\Users\shirtzel\Documents\gits\springboard-datascience\Homework Assignments")
titan <- read.csv("titanic_original.csv")
##View(titan)
##str(titan)

#edit columns: embarked: convert all blank cells to S // age: convert all NAs to the mean population age

titan %>% 
  mutate(embarked = ifelse(embarked == "", "S", as.character(embarked))) %>% 
  mutate(age = ifelse(is.na(age), 29.88113, age)) %>% 
  select_all %>% 
  arrange(embarked)

#find the mean age
mean(titan$age, na.rm=TRUE) ## 29.88113


