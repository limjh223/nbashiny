stats <- read.csv("PlayersStats.csv")
salaries <- read.csv("nba-salaries2000-21.csv")
View(stats)
View(salaries)
stats_complete <- stats[!is.na(stats$Age),]

View(stats_complete)

library(tidyverse)

# renaming columns
stats_complete <- stats_complete %>% 
  rename(
    ThrMade = X3P,
    ThrPct = X3P.,
    ThrAtt = X3PA,
    TwoMade = X2P,
    TwoPct = X2P.,
    TwoAtt = X2PA,
    FTPct = FT.,
    FGPct = FG.,
    EFGPct = eFG.
)

# renaming more columns
salaries_complete <- salaries %>%
  rename(
    Player = name,
    Year = season
  )

View(salaries_complete)

# removed the stars from names with stars.
stats_complete$Player <- gsub("\\*|,", "", stats_complete$Player)

View(stats_complete)

compressed_stats <- stats_complete %>% group_by(Year)

# removing rows that had subsection of stats of players recorded for different teams in the same season
# only kept the total count of each statistic for the whole season
compressed_stats <- distinct(compressed_stats, Player, .keep_all = TRUE)
View(compressed_stats)

final1 <- compressed_stats %>% 
  inner_join(salaries_complete,
             by = c("Player", "Year"))
is.numeric(salaries_complete$Year)
is.numeric(compressed_stats$Year)
class(salaries_complete$Player)
class(compressed_stats$Player)
salaries_complete$Player <- as.character(salaries_complete$Player) 

View(final1)

final2 <- compressed_stats %>% 
  left_join(salaries_complete,
            by = c("Player", "Year"))
View(final2)

drop <- c("team", "position", "rank")
final1 <- final1[,!(names(final1) %in% drop)]
final2 <- final2[,!(names(final2) %in% drop)]

write_csv(final1, 'final1.csv')
write_csv(final2, 'final2.csv')

View(df)
# I edited the positions for players who were listed multiple positions
# I just labeled their position as the first position they were listed.
df$Pos[df$Pos== "C-PF"] <- "C"
df$Pos[df$Pos== "SF-SG"] <- "SF"
df$Pos[df$Pos== "SF-PF"] <- "SF"
df$Pos[df$Pos== "PF-SF"] <- "PF"
df$Pos[df$Pos== "PF-C"] <- "PF"
df$Pos[df$Pos== "PG-SG"] <- "PG"
df$Pos[df$Pos== "SG-PG"] <- "SG"
df$Pos[df$Pos== "SG-SF"] <- "SG"
df$Pos[df$Pos== "SF-SG"] <- "SF"

# I edited these positions a little differently. 
# In the basketball world, PG are considered the 1, SG <- 2, SF <- 3, PF <- 4, and C <- 5.
# With that being said I modified their position to be the average of the two listed positions.
df$Pos[df$Pos== "SF-C"] <- "PF"
df$Pos[df$Pos== "PG-SF"] <- "SG"
df$Pos[df$Pos== "SG-PF"] <- "SF"
unique(df$Pos)

write_csv(df, 'final1.csv')
