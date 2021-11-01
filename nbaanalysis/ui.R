dashboardPage(
  dashboardHeader(title = "SHINY NBA"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("League Trends", tabName = "leaguetrends"),
      menuItem("Dataset", tabName = "dataset"),
      menuItem("Player Comparison", tabName = "playervs"),
      menuItem("Player Progression", tabName = "playerprog")
      
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dataset",
              fluidRow(
                column(12, DT::dataTableOutput('mytable'))
              )
              
      ),

      tabItem(tabName = "leaguetrends",
              fluidRow(
                column(12, plotOutput('plot1'))),
                
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
              
              fluidRow(
                column(12, plotOutput('plot2'))),
              
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
              )

              ),
      
      tabItem(tabName = "playerprog",
              
              selectInput(inputId = "player",
                          label = "Select Player",
                          choices = unique(df$Player)),
              
              fluidRow(
                column(12, DT::dataTableOutput("difftable"))),
              
              fluidRow(
                column(6, selectInput(inputId = "stat4",
                                      label = "Select Statistic",
                                      choices = names(df)[6:31])),
                column(6, selectInput(inputId = "stat5",
                                      label = "Select Another Statistic",
                                      choices = names(df)[6:31]))
              ),
              
              fluidRow(
                column(6, plotOutput("playprog1")),
                column(6, plotOutput("playprog2"))
              )
              
              ),

      tabItem(tabName = "playervs",
              
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
              
              fluidRow(
                column(12, DT::dataTableOutput('twoplayer'))),
              
              fluidRow(
                column(4, selectInput(inputId = "stat1",
                                      label = "Select One Statistic",
                                      choices = names(df)[6:29])),
                column(4, selectInput(inputId = "stat2",
                                      label = "Select Another Statistic",
                                      choices = names(df)[6:29]))
              ),
              
              fluidRow(
                column(4, plotOutput('gg')),
                column(4, plotOutput('ggg')),
                column(4, plotOutput('salary'))
              )
              )

    )
  )
)
  



