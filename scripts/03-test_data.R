# Purpose: test data
# Author: Jeongwoo Kim
# Date: 16 Apr 2024
# Contact: jwoo.kim@mail.utoronto.ca

library(tidyverse)
library(lubridate)

# load the dataset
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

# check if all the teams are the premier league division teams
premierleague_teams <- c("Arsenal", "Aston Villa", "Bournemouth", "Brentford", "Brighton", "Burnley", "Chelsea", 
                         "Crystal Palace", "Everton", "Fulham", "Liverpool", "Luton", "Man City", "Man United", 
                         "Newcastle", "Nott'm Forest", "Sheffield United", "Tottenham", "West Ham", "Wolves")
all(analysis_data$`Home Team` %in% premierleague_teams)
all(analysis_data$`Away Team` %in% premierleague_teams)

# Check if goals are non-negative integers
all(analysis_data$`Full Time Home Team Goals` >= 0 & (analysis_data$`Full Time Home Team Goals` == floor(analysis_data$`Full Time Home Team Goals`)))
all(analysis_data$`Full Time Away Team Goals` >= 0 & (analysis_data$`Full Time Away Team Goals` == floor(analysis_data$`Full Time Away Team Goals`)))

# Check if the result is one of 'H':Home win, 'D':Draw, or 'A':Away win
all(analysis_data$`Full Time Result` %in% c('H', 'D', 'A'))

# Check if shots on target are non-negative integers
all(analysis_data$`Home Team Shots on Target` >= 0 & (analysis_data$`Home Team Shots on Target` == floor(analysis_data$`Home Team Shots on Target`)))
all(analysis_data$`Away Team Shots on Target` >= 0 & (analysis_data$`Away Team Shots on Target` == floor(analysis_data$`Away Team Shots on Target`)))

# check if there are any missing data 
colSums(is.na(analysis_data)) 

# check if the match results match with goals scored 
with(analysis_data, {
  all((`Full Time Result` == 'H' & `Full Time Home Team Goals` > `Full Time Away Team Goals`) | 
        (`Full Time Result` == 'D' & `Full Time Home Team Goals` == `Full Time Away Team Goals`) | 
        (`Full Time Result` == 'A' & `Full Time Home Team Goals` < `Full Time Away Team Goals`)
  )
})
