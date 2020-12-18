


output$info_excit_cond <- renderUI({
  includeHTML("phenomena/excit_cond/info/info.html")})


#Associative strenght plot
output$excit_cond <- renderPlot({
  source('phenomena/excit_cond/model.R', local= TRUE)
  source('phenomena/excit_cond/my_theme.R', local= TRUE)
  source('phenomena/excit_cond/excit_cond.R', local= TRUE)
  #Plot
  return(p)
  
  
})




#Simulated data for table rendering (Data Tab)
data_generator_excit_cond<- reactive({
  source('phenomena/excit_cond/model.R', local= TRUE)
  source('phenomena/excit_cond/my_theme.R', local= TRUE)
  source('phenomena/excit_cond/excit_cond.R', local= TRUE)
  
names<- c('Trial', 'alpha', 'beta', 'V COMB', 
              'V CS-US', 'deltaV CS-US', 
              'V US-CS', 'deltaV US-CS', 
              'R CS', 'R US')
    
  data<- data.frame(df)
  #Assigning dataframe column names (differ for each phenomenon)
  data <- setNames(data, names)
  
  
})

#Data tab (uses data generated in data_generator
output$data_excit_cond<- renderDataTable({
  DT::datatable(data_generator_excit_cond(), options= list(scrollX = T))
})


#Download button (downloads data from data_generator_csv)
output$download_data_excit_cond <- downloadHandler(
  filename = function(){"Simulated_data.csv"},
  content = function(file) {
    write.csv(data_generator_excit_cond(), file, row.names = FALSE)})