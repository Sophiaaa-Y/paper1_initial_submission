#### Preamble ####
# Purpose: Cleans the raw data of the observations of Toronto beaches that we 
# get in "01-download_data.R".
# Author: Shuangyuan Yang
# Date: 20 September 2024
# Contact: shuangyuan.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Complete and run the file named "01-download_data.R".
# Any other information needed? None.

#### Workspace setup ####

library(tidyverse)

#### Clean data ####

Observations_raw_data <- read_csv("inputs/raw_data/observations_raw_data.csv")

Observations_cleaned_data <-
  Observations_raw_data |>
  
  # Only select columns we interested in
  select(`_id`, `windSpeed`, `waterFowl`, 
         `waveAction`, `turbidity`) |>
  
  # Renaming the column names
  rename(`ID` = `_id`,
         `Wind speed in km/h` = `windSpeed`, 
         `Waterfowl population` = `waterFowl`, 
         `Wave Action` = `waveAction`,
         `Turbidity of water (NTUs)` = `turbidity`) |>
  
  mutate(`Wave Action` =
           case_match(`Wave Action`,
                      "LOW" ~ "Low",
                      "MOD" ~ "Moderate",
                      "HIGH" ~ "High",
                      "None" ~ "None"))

#### Saving the Cleaned Dataset ####

write_csv(Observations_cleaned_data, "outputs/analysis_data/observations_cleaned_data.csv")

