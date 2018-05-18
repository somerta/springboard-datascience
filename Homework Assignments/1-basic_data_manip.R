library(readr)
library(dplyr)
library(stringr)

refine <- read_csv("c:/users/shirtzel/documents/gits/springboard-datascience/Homework Assignments/refine_original.csv")
View(refine)

##List all occurrences of each spelling of each brand name

# refine %>% 
#   select(company) %>% 
#   group_by(company) %>% 
#   tally()

##replace values to clean up brand names

refine %>% 
  mutate(company = str_replace(company, regex("^a.*$", ignore_case=TRUE), "Akzo")) %>% 
  mutate(company = str_replace(company, regex("^(p|f).*$", ignore_case=TRUE), "Philips")) %>%
  mutate(company = str_replace(company, regex("^u.*$", ignore_case=TRUE), "Unilever")) %>% 
  mutate(company = str_replace(company, regex("^v.*$", ignore_case=TRUE), "Van Houten")) %>% 

##separate product code and number
  mutate(product_code = str_match(refine$'Product code / number', ".")) %>% 
  mutate(product_number = str_match(refine$'Product code / number', "[:digit:]*$")) %>% 
  print
       