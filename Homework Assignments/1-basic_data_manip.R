library(readr)
library(dplyr)
library(stringr)

refine <- read_csv("c:/users/shirtzel/documents/gits/springboard-datascience/Homework Assignments/refine_original.csv")
View(refine)

refine %>% 
  select(company) %>% 
  group_by(company) %>% 
  tally()

##not done with this yet. looks like I'm going to need to bust out some mad string identification skillz
#refine <- read_csv("c:/users/shirtzel/documents/gits/springboard-datascience/Homework Assignments/refine_original.csv")