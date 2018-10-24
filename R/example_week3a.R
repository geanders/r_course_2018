library(faraway)
library(ggplot2)
library(dplyr)

data("worldcup")
data("nepali")

nepali <- nepali %>% 
  tbl_df() %>% 
  select(id, sex, wt, ht, age) %>% 
  mutate(id = factor(id), 
         sex = factor(sex, levels = c(1, 2),
                      labels = c("Male", "Female"))) %>% 
  distinct(id, .keep_all = TRUE)

nepali <- nepali %>% 
  mutate(is_male = sex == "Male", 
         very_tall = ht > 100, 
         not_tall = !(ht > 100))

nepali %>% 
  filter(!is_male)


max(nepali$ht, na.rm = T)
cor(nepali$wt, nepali$ht, use = "complete.obs")
cor(nepali[ , c("wt", "ht", "age")], 
    use = "complete.obs")

 nepali %>% 
   summarize(mean_wt = mean(wt, na.rm = TRUE),
             median_ht = median(ht, na.rm = TRUE), 
             youngest = min(age, na.rm = TRUE), 
             oldest = max(age, na.rm = TRUE))
