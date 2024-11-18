# Sabin Hart
# Oct 27th, 2024
# Analysis for Data Wrangling Final Project


# Libraries and Imports ---------------------------------------------------

library(tidyverse)

setwd("~/Desktop/Data Wrangling/Final Project")

load("Data/final_data.Rdata")


# Missing Data Analysis ---------------------------------------------------

# view missing values by row and col
sort(colSums(is.na(county_data)), decreasing=T)
hist(colSums(is.na(county_data)), main = "# of missing values by column",xlab="NAs")

sort(rowSums(is.na(county_data)), decreasing=T)
hist(rowSums(is.na(county_data)), main = "# of missing values by row",xlab="NAs")

# plots show that vast majority of cols/rows are complete

# subset into
na_counties <- county_data[rowSums(is.na(county_data)) > 0, ]

complete_counties <- county_data[rowSums(is.na(county_data)) == 0, ]

sum(complete_counties$population_2020)/(sum(complete_counties$population_2020) + sum(na_counties$population_2020))

# > 94% of the population remains with only complete cases so we are going to 
# ignore missing values and let the default behavior of row removal be sufficient


