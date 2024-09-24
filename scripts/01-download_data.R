#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto package.
# Author: Shuangyuan Yang
# Date: 20 September 2024
# Contact: shuangyuan.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the opendatatoronto and the tidyverse packages.
# Any other information needed? None.


#### Workspace setup ####

#install.packages("opendatatoronto")
#install.packages("tidyverse")
library(opendatatoronto)
library(tidyverse)

#### Download data ####

Observations_raw_data <- 
  search_packages("Toronto Beaches Observations") |>
  list_package_resources() |>
  filter(name == "toronto-beaches-observations") |>
  get_resource()

#### Save data ####

write_csv(Observations_raw_data, "inputs/raw_data/observations_raw_data.csv")

