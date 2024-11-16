# Sabin Hart
# Oct 27th, 2024
# Analysis for Data Wrangling Final Project


# Libraries and Imports ---------------------------------------------------

library(tidyverse)

setwd("~/Desktop/Data Wrangling/Final Project")

load("final_data.Rdata")


# Analysis ----------------------------------------------------------------

d <- county_data %>% 
  filter(!is.na(life_expectancy_2020)) %>% 
  group_by(State) %>% 
  mutate(ha_corr = cor(life_expectancy_2020, median_aqi)) %>% 
  summarize(correlation = mean(ha_corr))


# Data Patching -----------------------------------------------------------

load("2020data.Rdata")



