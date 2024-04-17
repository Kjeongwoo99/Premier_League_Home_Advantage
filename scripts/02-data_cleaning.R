# Purpose: clean the raw data 
# Author: Jeongwoo Kim
# Date: 14 Apr 2024
# Contact: jwoo.kim@mail.utoronto.ca

library(tidyverse)
library(dplyr)
library(readr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

analysis_data <- raw_data |>
  select(HomeTeam, AwayTeam, FTHG, FTAG, FTR, HST, AST) |>
  rename(
    `Home Team` = HomeTeam,
    `Away Team` = AwayTeam,
    `Full Time Home Team Goals` = FTHG,
    `Full Time Away Team Goals` = FTAG,
    `Full Time Result` = FTR,
    `Home Team Shots on Target` = HST,
    `Away Team Shots on Target` = AST
  ) |> mutate(`Home Win` = if_else(`Full Time Result` == 'H', 1, 0), 
              `Away Win` = if_else(`Full Time Result` == 'A', 1, 0))

#### Save data ####
write_csv(analysis_data, "data/analysis_data/analysis_data.csv")
