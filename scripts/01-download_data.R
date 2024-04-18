# Purpose: download the data 
# Author: Jeongwoo Kim
# Date: 14 Apr 2024
# Contact: jwoo.kim@mail.utoronto.ca

library(tidyverse)

#### Download data ####
raw_data <- read_csv(file = "https://www.football-data.co.uk/mmz4281/2324/E0.csv")

#### Save data into csv file ####
write_csv(raw_data, "data/raw_data/raw_data.csv") 

### Save data into parquet file ####
install.packages("arrow", repos = "https://cran.r-project.org")
library(arrow)
write_parquet(raw_data, "data/raw_data/raw_parquet_data.parquet")
