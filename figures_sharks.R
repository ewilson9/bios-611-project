library(tidyverse)
library(dplyr)
library(ggplot2)
source("utils.R")

tidy_sharks <- read_csv("derived_data/tidy_sharks.csv")

fatal_counts <- tidy_sharks %>%
  group_by(sex, fatal) %>%
  tally()
fatal_counts

sex_counts <- tidy_sharks %>%
  group_by(sex) %>%
  tally()
sex_counts

fatal_probs <- fatal_counts %>%
  left_join(sex_counts, by="sex", suffix=c("",".sex")) %>%
  mutate(p=n/n.sex)

fatal_sex_status <- fatal_probs %>%
  filter(sex %in% c("m","f") & fatal %in% c("y","n")) %>%
  arrange(desc(p))
fatal_sex_status

sex_stats_plot <- ggplot(data=fatal_sex_status, aes(x=sex, y=p, fill=fatal)) +
  geom_bar(stat="identity", color="black", position=position_dodge()) + 
  labs(x="Sex of Victim", y="p-value", fill="Fatality?")

ensure_directory("figures")
ggsave("figures/shark_sex_fatality.png", sex_stats_plot)

fatal_type_counts <- tidy_sharks %>%
  group_by(type, fatal) %>%
  tally()
fatal_type_counts

type_counts <- tidy_sharks %>%
  group_by(type) %>%
  tally()
type_counts

fatal_type_probs <- fatal_type_counts %>%
  left_join(type_counts, by="type", suffix=c("",".type")) %>%
  mutate(p=n/n.type)

fatal_type_status <- fatal_type_probs %>%
  filter(type %in% c("unprovoked", "provoked", "boating", "sea_disaster") & fatal %in% c("y","n")) %>%
  arrange(desc(type))
fatal_type_status

# Rearrange x axis
fatal_type_status$type <- factor(fatal_type_status$type,levels = c("unprovoked", "provoked", "boating", "sea_disaster"))

type_stats_plot <- ggplot(data=fatal_type_status, aes(x=type, y=p, fill=fatal)) +
  geom_bar(stat="identity", color="black", position=position_dodge()) + 
  labs(x="Accident Type", y="p-value", fill="Fatality?")

ggsave("figures/shark_type_fatality.png", type_stats_plot)












