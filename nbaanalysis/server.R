
shinyServer(function(input, output, session) {
  output$plot1 <- renderPlot({
    df %>% 
      filter(Year == input$select_year & Pos == input$position) %>% 
      ggplot() + geom_point(aes(x = get(input$stat_cat), y = salary)) +
      ggtitle(paste("Salary vs", input$stat_cat)) +
      xlab(input$stat_cat) + theme_bw() + theme(plot.title = element_text(size=30))
  })
  if(input$checkbox == TRUE){
  output$mytable <- DT::renderDataTable(df,
                                        options = list(scrollX = TRUE),
                                        rownames = FALSE)
  }
  
  })


