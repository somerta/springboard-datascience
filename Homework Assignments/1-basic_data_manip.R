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
  
##add product category column
  mutate(product_category = product_code) %>% 
  mutate(product_category = str_replace(product_category, "p", "Smartphone")) %>% 
  mutate(product_category = str_replace(product_category, "x", "Laptop")) %>% 
  mutate(product_category = str_replace(product_category, "v", "TV")) %>% 
  mutate(product_category = str_replace(product_category, "q", "Tablet")) %>% 
  
##create a column with full address
#  mutate(full_address = paste(address, city, country, sep=', ')) %>% 
  
##create dummy variables for company
  mutate(company_philips = ifelse(grepl("Philips", company), 1, 0)) %>% 
  mutate(company_akzo = ifelse(grepl("Akzo", company), 1, 0)) %>% 
  mutate(company_van_houten = ifelse(grepl("Van Houten", company), 1, 0)) %>% 
  mutate(company_unilever = ifelse(grepl("Unilever", company), 1, 0)) %>% 

##create dummy variables for product
  mutate(product_smartphone = ifelse(grepl("p", product_code), 1, 0)) %>%
  mutate(product_tv = ifelse(grepl("v", product_code), 1, 0)) %>%
  mutate(product_laptop = ifelse(grepl("x", product_code), 1, 0)) %>%
  mutate(product_tablet = ifelse(grepl("q", product_code), 1, 0)) %>%
  print
       