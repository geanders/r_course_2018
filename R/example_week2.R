# Load required packages
library(readr)
library(dplyr)
library(stringr)
library(lubridate)

######################################################
## Shipwreck data
######################################################

# Read in ship wreck data
shipwrecks_url <- paste0("https://raw.githubusercontent.com/",
                         "geanders/RProgrammingForResearch/",
                         "master/data/AWOIS_Wrecks_KnownYear.tab")
shipwrecks <- read_tsv(shipwrecks_url) 

######################################################
## Daily Show data
######################################################

# Read in Daily Show data
daily_show <- read_csv("data/daily_show_guests.csv",
                       skip = 4)

# Clean up and pull out scientists
daily_show %>% 
  rename(year       = YEAR,
         job        = GoogleKnowlege_Occupation,
         date       = Show, 
         category   = Group, 
         guest_name = Raw_Guest_List) %>% 
  select(job:guest_name) %>% 
  mutate(job = str_to_lower(job)) %>% 
  mutate(date = mdy(date),
         show_day = wday(date, label = TRUE)) %>% 
  arrange(desc(date)) %>% 
  filter(category == "Science") -> scientists
                          
