# NBA SHINY 

## Objectives

- To create a tool for:
  - NBA players, team owners, and GMs to compare different players' salaries in different seasons
  - fans to visualize and compare different player's statistics for a given season range
  - NBA workers to see how the overall league statistics are evolving season by season

## Gathering Data

- used Python code from https://medium.com/@osanchez2323/web-scraping-nba-stats-4b4f8c525994 to scrape NBA players' season statistics
- tweaked the code to: 
  - run a for loop to scrape data from 1999-2000 season to 2020-2021 and concat the dataframes to create one big dataframe
  - scrape season total statistics instead per game averages
- used R code from https://unboxed-analytics.com/data-technology/web-scraping-nba-salaries/ to scrape players' yearly salaries
- used inner join the two resulting dataframes by Player and Year to get rid of rows that contained players' stats but no statstics and vice versa
  - future work would include scraping from another website to get a bigger dataset to get all the players' salaries for every season
- cleaned the dataframe to get rid of stars on certain players' names and get rid of rows that included players' statistics that were recorded separately for different teams when the player played for those teams in the same season and only kept the season totals

## Attributes
- **Player** : Player's name   
- **Pos**: Player's position       
- **Age**: Player's age     
- **Tm**: Team Player played for
  - (TOT means that player played for multiple teams and the statistics for each team were summed up)        
- **G**: Total # of games played      
- **GameStart**: # of games started (there are a lot of players who come off the bench so they do not count)
- **MinPlayed**: # of minutes played
- **FieldGoal**: # of 2 pointers and 3 pointers made
- **FGA**: # of 2 pointers and 3 pointers attempted      
- **FGPct**: ratio of FieldGoal to FGA   
- **ThrMade**: # of 3 pointers made   
- **ThrAtt**: # of 3 pointers attempted   
- **ThrPct**: ratio of ThrMade to ThrAtt    
- **TwoMade**: # of 2 pointers made  
- **TwoAtt**: # of 2 pointers attempted   
- **TwoPct**: ratio of TwoMade to TwoAtt   
- **EFGPct**: effective field goal percentage   
- **FT**: # of free throws made        
- **FTA**: # of free throws attempted     
- **FTPct**: ratio of FT to FTA    
- **ORB**: # of offensive rebounds       
- **DRB**: # of defensive rebounds      
- **TotReb**: sum of ORB and DRB    
- **Assists**: # of assists   
- **Steals**: # of steals   
- **Blocks**: # of blocks    
- **TOV**: # of turnovers       
- **PF**: # of fouls committed        
- **Points**: # of points scored    
- **Year**: season of the above statistics recorded     
- **salary**: salary of the player for the above year   

## Future Work
- use per game stats as opposed to total seasonal stats
- use a different website to scrape salaries as a lot of data from the early to mid 2000s were missing
- render plots to show different statistical and salary correlations are changing over time for certain positions
- scrape different statistics that effectively evaluates players better to get a better picture of player comparison
- create a meaningful metric that is able to determine whether a player was:
  - overpaid
  - underpaid
  - paid the right amount
