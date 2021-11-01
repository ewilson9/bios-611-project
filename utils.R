library(tidyverse)

simplify_strings <- function(s){
  s %>% 
    str_to_lower() %>%
    str_trim() %>%
    str_replace_all("[^a-z1-9]+","_") %>%
    str_replace_all("^_+","") %>% # added these lines after looking at the data
    str_replace_all("_+$","");
}

ensure_directory <- function(directory){
  if(!dir.exists(directory)){
    dir.create(directory);
  }
}