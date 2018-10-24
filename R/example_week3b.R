library(faraway)
library(ggplot2)
library(dplyr)

data("nepali")

nepali <- nepali %>% 
  tbl_df() %>% 
  select(id, sex, wt, ht, age) %>% 
  mutate(id = factor(id), 
         sex = factor(sex, levels = c(1, 2),
                      labels = c("Male", "Female"))) %>% 
  distinct(id, .keep_all = TRUE) %>% 
  mutate(is_male = sex == "Male")