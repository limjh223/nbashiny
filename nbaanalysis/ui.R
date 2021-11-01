dashboardPage(
  dashboardHeader(title = "SHINY NBA"),
  dashboardSidebar(
    sidebarMenu(
      #Creating different menu items on the side
      menuItem("League Trends", tabName = "leaguetrends"),
      menuItem("Dataset", tabName = "dataset"),
      menuItem("Player Comparison", tabName = "playervs"),
      menuItem("Player Progression", tabName = "playerprog")
      
    )
  ),
  dashboardBody(
    
    #rendering my original dataset in the dataset menuitem
    tabItems(
      tabItem(tabName = "dataset",
              fluidRow(
                column(12, DT::dataTableOutput('mytable'))
              )
              
      ),
      
      tabItem(tabName = "leaguetrends",
              #create a row of inputs for plot1
              fluidRow(
                column(4, selectInput(inputId = "year",
                                      label = "Select Year",
                                      choices = unique(df$Year))),
                column(4, selectInput(inputId = "position",
                                      label = "Select Position",
                                      choices = unique(df$Pos))),
                column(4, selectInput(inputId = "stat_cat",
                                      label = "Select Statistic",
                                      choices = names(df)[6:29]))),
              
              #rendering plot1 in one row
              fluidRow(
                column(12, plotOutput('plot1'))),
              
              #creating a row of inputs for plot2
              fluidRow(
                column(3, selectInput(inputId = "stat_cat2",
                                      label = "Select Statistic",
                                      choices = names(df)[6:31])),
                column(3, selectInput(inputId = "stat_cat3",
                                      label = "Select Statistic",
                                      choices = names(df)[6:31])),
                column(3, selectInput(inputId = "Year",
                                      label = "Select Year",
                                      choices = unique(df$Year))),
                column(3, selectInput(inputId = "position2",
                                      label = "Select Position",
                                      choices = unique(df$Pos)))
              ),
              
              #rendering plot2 in the row below
              fluidRow(
                column(12, plotOutput('plot2')))
              
              

              ),
      
      tabItem(tabName = "playerprog",
              #creating an input for player
              selectInput(inputId = "player",
                          label = "Select Player",
                          choices = unique(df$Player)),
              
              #rendering the progress datatable for the player selected above
              fluidRow(
                column(12, DT::dataTableOutput("difftable"))),
              
              #creating inputs for statistics
              fluidRow(
                column(3, selectInput(inputId = "stat4",
                                      label = "Select Statistic",
                                      choices = names(df)[6:31])),
                column(3, sliderInput("slider", label = "Season Range",
                                      min = min(df$Year),
                                      max = max(df$Year),
                                      value = c(min(df$Year), max(df$Year)),
                                      step = 1)),
                column(3, selectInput(inputId = "stat5",
                                      label = "Select Another Statistic",
                                      choices = names(df)[6:31])),
                column(3, sliderInput("slider2", label = "Season Range",
                                      min = min(df$Year),
                                      max = max(df$Year),
                                      value = c(min(df$Year), max(df$Year)),
                                      step = 1))
              ),
              
              #rendering scatter-line plots for the career statistics  
              #for player selected at the top 
              fluidRow(
                column(6, plotOutput("playprog1")),
                column(6, plotOutput("playprog2"))
              )
              
              ),

      tabItem(tabName = "playervs",
              
              #creating a series of player inputs for comparison
              fluidRow(
                column(4, selectInput(inputId = "player1",
                                      label = "Select Player 1",
                                      choices = unique(df$Player))),
                column(4, selectInput(inputId = "player2",
                                      label = "Select Player 2",
                                      choices = unique(df$Player))),
                column(4, selectInput(inputId = "season",
                                      label = "Select Season",
                                      choices = unique(df$Year)))
              ),
              
              #rendering the players statistics for the year selected
              fluidRow(
                column(12, DT::dataTableOutput('twoplayer'))),
              
              #creating a series of statistics for bar plot
              fluidRow(
                column(3, selectInput(inputId = "stat1",
                                      label = "Select One Statistic",
                                      choices = names(df)[6:29])),
                column(3, selectInput(inputId = "stat2",
                                      label = "Select Another Statistic",
                                      choices = names(df)[6:29])),
                column(3, selectInput(inputId = "stat3",
                                      label = "Select Another Statistic",
                                      choices = names(df)[6:29]))
              ),
              #rendering the comparison barplots of statistics and salary
              fluidRow(
                column(3, plotOutput('gg')),
                column(3, plotOutput('ggg')),
                column(3, plotOutput('gggg')),
                column(3, plotOutput('salary'))
              )
              )

    )
  )
)
  



