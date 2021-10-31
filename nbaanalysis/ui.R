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
                column(12, plotOutput('plot1')),

                selectInput(inputId = "year",
                            label = "Select Year",
                            choices = unique(df$Year)),
                selectInput(inputId = "position",
                            label = "Select Position",
                            choices = unique(df$Pos)),
                selectInput(inputId = "stat_cat",
                            label = "Select Statistic",
                            choices = names(df)[6:29])

              )),
      
      tabItem(tabName = "playerprog",
              
              selectInput(inputId = "player",
                            label = "Select Player",
                            choices = unique(df$Player)),
              
              fluidRow(
                column(12, DT::dataTableOutput("difftable")))
                
              
              
              ),

      tabItem(tabName = "playervs",
              fluidRow(
                column(12, plotOutput('time')),

                selectInput(inputId = "player1",
                            label = "Select Player 1",
                            choices = unique(df$Player)),
                selectInput(inputId = "player2",
                            label = "Select Player 2",
                            choices = unique(df$Player)),
                selectInput(inputId = "season",
                            label = "Select Season",
                            choices = unique(df$Year))
              ))





    )
  )
)
  



