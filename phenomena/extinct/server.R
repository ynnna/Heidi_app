#Extinction

output$info_extinct <- renderUI({
  includeHTML("phenomena/extinct/info/info.html")})


#Plot
output$extinct <- renderPlot({
  source('phenomena/extinct/model.R', local= TRUE)
  source('phenomena/extinct/my_theme.R', local= TRUE)
  source('phenomena/extinct/extinct.R', local= TRUE)
  #Plot
  return(p)
})




#Simulated data for table rendering (Data Tab)
data_generator_extinct<- reactive({
  source('phenomena/extinct/model.R', local= TRUE)
  source('phenomena/extinct/my_theme.R', local= TRUE)
  source('phenomena/extinct/extinct.R', local= TRUE)
  
  names<- c('Trial', 'alpha', 'beta', 'Trial type', 'V COMB', 
            'V CS-US', 'deltaV CS-US', 
            'V US-CS', 'deltaV US-CS', 
            'R CS', 'R US')
  
  data<- data.frame(df)
  #Assigning dataframe column names (differ for each phenomenon)
  data <- setNames(data, names)
  
  
})

#Data tab (uses data generated in data_generator
output$data_extinct<- renderDataTable({
  DT::datatable(data_generator_extinct(), options= list(scrollX = T))
})



#Download button (downloads data from data_generator_csv)
output$download_data_extinct <- downloadHandler(
  filename = function(){"Simulated_data.csv"},
  content = function(file) {
    write.csv(data_generator_extinct(), file, row.names = FALSE)})