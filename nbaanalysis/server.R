
shinyServer(function(input, output, session) {
  output$plot1 <- renderPlot({
    df %>% 
      filter(Year == input$year & Pos == input$position) %>% 
      ggplot() + geom_point(aes(x = get(input$stat_cat), y = salary)) +
      ggtitle(paste("Salary vs", input$stat_cat)) +
      xlab(input$stat_cat) + theme_bw() + theme(plot.title = element_text(size=30))
  })
  output$mytable <- DT::renderDataTable(df,
                                        options = list(scrollX = TRUE),
                                        rownames = FALSE,
                                        filter = list(position = "top"))
  output$difftable <- DT:: renderDataTable(apply(filter(newdf, Player == as.character(input$player))[, c(-1)], 2, diff),
                                           options = list(scrollX = TRUE),
                                           rownames = FALSE) 
  output$twoplayer <- DT:: renderDataTable(filter(df, (Player == as.character(input$player1) | Player == as.character(input$player2)) & Year == input$season),
                                           options = list(scrollX = TRUE),
                                           rownames = FALSE)
  output$gg <- renderPlot({
    filter(df, (Player == as.character(input$player1) | Player == as.character(input$player2)) & Year == input$season)%>%
      ggplot() + geom_bar(aes(x = Player, y = get(input$stat1), fill = Player), position = "dodge", stat = "identity")
  })
  
  output$ggg <- renderPlot({
    filter(df, (Player == as.character(input$player1) | Player == as.character(input$player2)) & Year == input$season)%>%
      ggplot() + geom_bar(aes(x = Player, y = get(input$stat2), fill = Player), position = "dodge", stat = "identity")
  })
  
  output$salary <- renderPlot({
    filter(df, (Player == as.character(input$player1) | Player == as.character(input$player2)) & Year == input$season)%>%
      ggplot() + geom_bar(aes(x = Player, y = salary, fill = Player), position = "dodge", stat = "identity")
  })
  
  
})


