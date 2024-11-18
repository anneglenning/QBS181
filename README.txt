README for SAL Project QBS 181 24F

### MaricopaCase.Rmd - published by Alexandra Treml
Key skills addressed in this notebook:
•	Use an API for data collection
•	Use relational data (left joins)
•	Overcome data errors with a leading 0
•	Using the tidyverse package
•	Using plotly to create interactive visualizations
•	Searching API data using grep and regex

## Data
The data from this R markdown comes from the cleaned and aggregated county-level health data called ‘final_data.Rdata’ as well as from the US Census data API. 
## Purpose
•	The purpose of this markdown notebook is to explore the county-level data to discover interesting patterns in the data to do further analysis on. 
•	After exploring the data, the notebook covers an in-depth view of Maricopa County, AZ to determine if AQI in that region correlates to poor health outcomes 
## Conclusion
•	Maricopa County, AZ has above average health outcomes, likely due to excellent year-round sunshine, access to medical care, higher than average median incomes, access to exercise, access to great food. This is despite having some of the worst median air quality in the US due to winter inversion and ozone. 
Overview of tasks done in this notebook: 
•	Read in libraries (dplyr, tidyverse, ggplot2, sf, tigris, plotly, corrplot)
•	Data Cleaning
  o	make FIPS numeric
  o	Summarize across all numeric variables by mean and group by State
•	Exploratory scatterplots by rurality
•	Create correlation matrix
•	Use tigris and sf packages to load shapefile maps and create geopoints to plot county and state-level data by Median AQI on a map in R **using relational data**
  o	Static county-level map in US regions using ggplot2
  o	Dynamic county-level map, whole USA, using ggplot2 and plotly
  o	Dynamic, aggregated state-level map USA, using ggplot and plotly
•	Use US Census API to grab population and job identifiers for Maricopa County, AZ. 
  o	Filter US census data by Maricopa County’s GEOID
  o	Filter the US census to GEOID 04013 and clean up, compare census data with health data
  o	Create boxplots to compare Maricopa county to the medians of other metrics for ppt
•	Find the life expectancy outliers for counties > the median using dplyr




