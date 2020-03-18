library(tidyverse)
library(tidytable)

# Data from https://www.kaggle.com/borismarjanovic/price-volume-data-for-all-us-stocks-etfs/data#
stocks <- list.files("data/stocks", full.names = TRUE) %>% 
  map_df(
    function(name){
      read_csv(name) %>% 
        mutate(stock = str_remove_all(name, "(\\.txt$)|(^data\\/stocks\\/)"))
    })

stocks %>% 
  janitor::clean_names() %>% 
  write_rds("data/stocks.rds") %>% 
  write_csv("data/stocks.csv")

# etfs <- list.files("data/ETFs", full.names = TRUE) %>% 
#   map_df(
#     function(name){
#       read_csv(name) %>% 
#         mutate(etf = str_remove_all(name, "(\\.txt$)|(^data\\/ETFs\\/)"))
#     })
  