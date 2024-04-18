#### Workspace setup ####
library(tidyverse)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")
set.seed(853)

### Model data ####
regression_model <- lm(Win_Rate ~ Proportion_Home_Games + Avg_Goals_Scored + Avg_Shots_on_Target, data = team_level_data)

#### Save model ####
saveRDS(
  regression_model,
  file = "models/model.rds"
)