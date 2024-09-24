#### Preamble ####
# Purpose: Simulate the dataset of Toronto beaches observations and make sure 
# the simulated data is good and reasonable by testing.
# Author: Shuangyuan Yang
# Date: 20 September 2024
# Contact: shuangyuan.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the janitor (Firke 2023) and tidyverse
# Any other information needed? None.


#### Workspace setup ####

#install.packages("janitor")
library(janitor)
library(tidyverse)

#### Simulate data ####

set.seed(917)

# Simulate 1000 rows of environmental data
simulated_observations_data <- tibble(
  # Simulating 1000 IDs
  "ID" = 1:1000,
  
  # Simulating wind speed between 0 and 40 km/h, randomly generated 1000 times
  "Wind speed in km/h" = runif(1000, min = 0, max = 40),
  
  # Simulating wave action with 1000 random values with replacement
  "Wave Action" = sample(
    x = c("High", "Moderate", "Low", "None"),
    size = 1000,
    replace = TRUE),
  
  # Simulating waterfowl population between 0 and 300, randomly generated 
  # 1000 times
  "Waterfowl population" = runif(1000, min = 0, max = 300),
  
  # Simulating turbidity levels between 0 NTUs and 100 NTUs, randomly generated 
  # 1000 times
  "Turbidity of water (NTUs)" = runif(1000, min = 0, max = 100)
)

#### Test simulated data ####

# Checking the class of some of the columns
simulated_observations_data$`Wind speed in km/h` |> class() == "numeric"
simulated_observations_data$`Waterfowl population` |> class() == "numeric"
simulated_observations_data$`Turbidity of water (NTUs)` |> class() == "numeric"
simulated_observations_data$`Wave Action` |> class() == "character"

# Checking that the minimum value in the ID column is at least 1
simulated_observations_data$ID |> min() >= 1

# Checking that the minimum wind speed is at least 0
simulated_observations_data$`Wind speed in km/h` |> min() >= 0

# Checking that the minimum waterfowl population is at least 0
simulated_observations_data$`Waterfowl population` |> min() >= 0

# Checking that only four wave action types
simulated_observations_data$`Wave Action` |>
  unique() |>
  length() == 4

# Checking the only four types of wave actions are high, 
# moderate, low, and none.
simulated_observations_data$`Wave Action` |>
  unique() |>
  sort() == sort(c("High", "Moderate", "Low", "None"))

