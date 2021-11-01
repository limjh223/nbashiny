shinyServer(function(input, output, session) {
  
  #render a plot to see how each statistic correlates with salary
  #for each year and position
  output$plot1 <- renderPlot({
    df %>% 
      filter(Year == input$year & Pos == input$position) %>% 
      ggplot() + geom_point(aes(x = get(input$stat_cat), y = salary), size = 4) +
      ggtitle(paste("Salary vs", input$stat_cat)) +
      xlab(input$stat_cat) + theme_bw() + theme(plot.title = element_text(size=30))
  })
  
  #render a plot to see how 2 sets of statistics correlate with 
  #each other for each year and position
  output$plot2 <- renderPlot({
    df %>% 
      filter(Year == input$Year & Pos == input$position2) %>% 
      ggplot() + geom_point(aes(x = get(input$stat_cat2), y = get(input$stat_cat3)), size = 4) +
      ggtitle(paste(input$stat_cat2, "vs", input$stat_cat)) +
      xlab(input$stat_cat2)+ ylab(input$stat_cat3) + theme_bw() + theme(plot.title = element_text(size=30))
  })
  
  #render the datatable I used
  output$mytable <- DT::renderDataTable(df,
                                        options = list(scrollX = TRUE),
                                        rownames = FALSE,
                                        filter = list(position = "top"))
  
  #render a datatable that shows how a player's stat 
  #progresses between consecutive seasons
  output$difftable <- DT:: renderDataTable(apply(filter(newdf, Player == as.character(input$player))[, c(-1)], 2, diff),
                                           options = list(scrollX = TRUE),
                                           rownames = FALSE)
  #render a datatable that shows 2 players' stats in a certain year
  output$twoplayer <- DT:: renderDataTable(filter(df, (Player == as.character(input$player1) | Player == as.character(input$player2)) & Year == input$season),
                                           options = list(scrollX = TRUE),
                                           rownames = FALSE)
  
  #render a barplot that shows the differences in a certain stat in a certain year
  output$gg <- renderPlot({
    filter(df, (Player == as.character(input$player1) | Player == as.character(input$player2)) & Year == input$season)%>%
      ggplot() + geom_bar(aes(x = Player, y = get(input$stat1), fill = Player), position = "dodge", stat = "identity") +
      ylab(input$stat1)
  })
  
  #render the same barplot above with a different stat
  output$ggg <- renderPlot({
    filter(df, (Player == as.character(input$player1) | Player == as.character(input$player2)) & Year == input$season)%>%
      ggplot() + geom_bar(aes(x = Player, y = get(input$stat2), fill = Player), position = "dodge", stat = "identity") +
      ylab(input$stat2)
  })
  
  #render a barplot that shows the salary differences
  output$salary <- renderPlot({
    filter(df, (Player == as.character(input$player1) | Player == as.character(input$player2)) & Year == input$season)%>%
      ggplot() + geom_bar(aes(x = Player, y = salary, fill = Player), position = "dodge", stat = "identity")
  })
  
  #render a scatter-line plot that shows how a player progressed 
  #in a certain statistic throughout the years
  output$playprog1 <- renderPlot({
    filter(df, Player == as.character(input$player)) %>% 
      ggplot(aes(x = Year, y = get(input$stat4)))+ geom_point(size = 4) +
      geom_line(color = "grey") + ylab(input$stat4)
  })
  
  #render the same plot above with a different statistic
  output$playprog2 <- renderPlot({
    filter(df, Player == as.character(input$player)) %>% 
      ggplot(aes(x = Year, y = get(input$stat5)))+ geom_point(size = 4) +
      geom_line(color = "grey") + ylab(input$stat5)
  })
  
  
})


