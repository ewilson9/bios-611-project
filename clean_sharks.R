library(tidyverse)
library(dplyr)
source("utils.R")

dat <- read_csv("source_data/shark_attacks.csv")
dat <- rename(dat, ID='Case Number...1') %>% rename(Fatal='Fatal (Y/N)')

names(dat) <- simplify_strings(names(dat))
nrow(dat)

#  Simplify strings, replace NAs (I couldn't figure out how to do all columns at once), filter out rows with bad info
tidy_sharks <-  dat %>% mutate(across(everything(), simplify_strings)) %>%
  replace_na(list(sex = "unknown", age = "unknown", injury = "unknown", fatal = "unknown", species = "unknown")) %>%
  filter(date != "NA") %>%
  filter(sex == "f" | sex == "m" | sex == "unknown") %>%
  filter(fatal == "y" | fatal == "n" | fatal == "unknown")
tidy_sharks$type <- str_replace(tidy_sharks$type, "boating|boatomg|boat", "boating")
nrow(tidy_sharks)

#head(sort(table(tidy_sharks$country), decreasing=TRUE))
#just_usa <- filter(tidy_sharks, country=="usa")
#head(sort(table(just_usa$area), decreasing=TRUE))


#head(sort(table(tidy_sharks$species), decreasing=TRUE))
# Need to clean up species column

# Need to normalize tidy_sharks, possibly drop 100+ year old cases
# tidy_sharks are either "11-Jan-18" or "Reported 11-Jan-2018"

#sort(table(tidy_sharks$type), decreasing=TRUE)
# Change "Boat" and "Boatomg" to "Boating", otherwise seems standardized

#head(sort(table(tidy_sharks$name), decreasing=TRUE), n=50)
# I thought to see if any names came up more than once but the names column does not seem to be very helpful, perhaps ignore for now. 

#head(sort(table(tidy_sharks$injury), decreasing=TRUE), n=20)
# Eek, need to standardize this. Maybe make categories "Fatal" "Leg/Foot" "None" "Arm/Hand" "Minor Injury" ...

#sort(table(tidy_sharks$fatal, decreasing=TRUE))

#head(sort(table(tidy_sharks$activity), decreasing=TRUE, n=20))
# Remove smaller count activities?

ensure_directory("derived_data")
write_csv(tidy_sharks, "derived_data/tidy_sharks.csv")

