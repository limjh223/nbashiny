


# Define UI for application that draws a histogram
dashboardPage(
  dashboardHeader(title = "NBA in Shiny"),
  dashboardSidebar(
    sidebarUserPanel("NYC DSA"),
    sidebarMenu(
      menuItem("Player Vs", tabName = "playervs", icon = icon("people-arrows"), startExpanded = FALSE,
               menuSubItem(selectInput(inputId =  'season', label = "Select Season", choices = unique(df$Year))),
               menuSubItem(selectInput(inputId =  'PlayerOne', label = "Select Player 1", choices = unique(df$Player))),
               menuSubItem(selectInput(inputId =  'PlayerTwo', label = "Select Player 2", choices = unique(df$Player)))),
      menuItem("League Trends", tabName = "leaguetrends", icon = icon("basketball-ball"), startExpanded = FALSE,
               menuSubItem(selectInput(inputId = "select_year",
                                       label = "Select Season",
                                       choices = unique(df$Year))),
               menuSubItem(selectInput(inputId = 'stat_cat',
                                       label = "Select Statistic",
                                       choices = names(df)[6:29])),
               menuSubItem(selectInput(inputId = "position",
                                       label = "Select Position",
                                       choices = unique(df$Pos)))),
      menuItem("Data Table", tabName = "dataset", icon = icon("file-excel")),
      checkboxInput("checkbox", label = "Choice A", value = TRUE)

  
    
  )),
  dashboardBody(
    fluidPage(
      fluidRow(
        column(width = 12,
               box(plotOutput("plot1"),
                   title = "Salary Correlation",
                   width = NULL))
      )
  ),
    fluidPage(titlePanel("YOU KNOW THE FUCKING VIBES"),
              mainPanel(width = 12,
                        DT::dataTableOutput("mytable")))))

#Given a season, select two players and compare stats and salary
#Given a season and position, graph salary vs whatever stat
