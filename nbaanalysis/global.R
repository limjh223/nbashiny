library(shiny)
library(tidyverse)
library(shinydashboard)
library(dplyr)
library(plotly)
iris
df <- read.csv("final1.csv")

#a little more data cleaning
df <- df %>% 
  rename(
    Assists = AST,
    Blocks = BLK,
    Steals = STL,
    FieldGoal = FG,
    TotReb = TRB,
    MinPlayed = MP,
    GameStart = GS,
    Points = PTS)
  

#creating data for player progression
newdf <- df %>% select(-(2:4))


