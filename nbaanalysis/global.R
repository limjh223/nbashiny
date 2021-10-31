library(shiny)
library(tidyverse)
library(shinydashboard)
library(dplyr)
library(plotly)
iris
df <- read.csv("final1.csv")

df <- df %>% 
  rename(
    Assists = AST,
    Blocks = BLK,
    Steals = STL,
    FieldGoal = FG,
    TotReb = TRB,
    MinPlayed = MP,
    GameStart = GS,
    Points = PTS
  )

newdf <- df %>% select(-(2:4))

apply(filter(newdf, Player == "LeBron James")[, c(-1)], 2, diff)
# bron_diff <- apply(bron[, c(-1)],2, diff)
# bron_diff
