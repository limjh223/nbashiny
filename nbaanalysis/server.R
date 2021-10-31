
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
                                        rownames = FALSE)
  output$difftable <- DT:: renderDataTable(apply(filter(newdf, Player == as.character(input$player))[, c(-1)], 2, diff),
                                           options = list(scrollX = TRUE),
                                           rownames = FALSE) 
  
  }
  
  )


