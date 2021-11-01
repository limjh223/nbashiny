stats <- read.csv("PlayersStats.csv")
salaries <- read.csv("nba-salaries2000-21.csv")
View(stats)
View(salaries)
stats_complete <- stats[!is.na(stats$Age),]

View(stats_complete)

library(tidyverse)

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

salaries_complete <- salaries %>%
  rename(
    Player = name,
    Year = season
  )

View(salaries_complete)

stats_complete$Player <- gsub("\\*|,", "", stats_complete$Player)

View(stats_complete)

compressed_stats <- stats_complete %>% group_by(Year)
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
df$Pos[df$Pos== "C-PF"] <- "C"
df$Pos[df$Pos== "SF-SG"] <- "SF"
df$Pos[df$Pos== "SF-PF"] <- "SF"
df$Pos[df$Pos== "PF-SF"] <- "PF"
df$Pos[df$Pos== "PF-C"] <- "PF"
df$Pos[df$Pos== "PG-SG"] <- "PG"
df$Pos[df$Pos== "SG-PG"] <- "SG"
df$Pos[df$Pos== "SG-SF"] <- "SG"
df$Pos[df$Pos== "SF-SG"] <- "SF"
df$Pos[df$Pos== "SF-C"] <- "PF"
df$Pos[df$Pos== "PG-SF"] <- "SG"
df$Pos[df$Pos== "SG-PF"] <- "SF"
unique(df$Pos)

write_csv(df, 'final1.csv')
