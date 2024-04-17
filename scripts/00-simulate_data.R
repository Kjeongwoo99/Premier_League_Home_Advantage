# Purpose: simulate data
# Author: Jeongwoo Kim
# Date: 16 Apr 2024
# Contact: jwoo.kim@mail.utoronto.ca

library(tidyverse)
set.seed(853)

n <- 1000 # the number of games 

# assign 20 different team names 
teams <- paste("Team", LETTERS[1:20])

# simulate team names by 20 names
Hometeam <- sample(teams, n, replace = TRUE)
Awayteam <- sample(teams, n, replace = TRUE)

# ensures no team is playing against itself 
while(any(Hometeam == Awayteam)) {
  Awayteam[Hometeam == Awayteam] <- sample(teams, sum(Hometeam == Awayteam), replace = TRUE)
}

# simulate goals scored based on a poisson distribution
Homegoals <- rpois(n, lambda = 1.5)  # Higher average for home teams
Awaygoals <- rpois(n, lambda = 1.2)

# simulate shots on target based on normal distribution
Homeshots <- rnorm(n, mean = 5, sd = 2) # higher avearge for home teams 
Awayshots<- rnorm(n, mean = 3.5, sd = 2)

# if the home team wins 
Homewin <- as.integer(Homegoals > Awaygoals)

# create a dataframe
sim_data <- data.frame(
  Hometeam,
  Awayteam,
  Homegoals,
  Awaygoals,
  Homeshots,
  Awayshots,
  Homewin
)

# Output the first few rows of the dataframe
head(sim_data)

