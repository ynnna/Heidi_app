# Relative validity


output$info_rel_val <- renderUI({
  includeHTML("phenomena/rel_val/info/info.html")})


#Plot1
output$rel_val1 <- renderPlot({
  source('phenomena/rel_val/model.R', local= TRUE)
  source('phenomena/rel_val/my_theme.R', local= TRUE)
  source('phenomena/rel_val/rel_val.R', local= TRUE)
  #Plot
  return(p)
})

#Plot1
output$rel_val2 <- renderPlot({
  source('phenomena/rel_val/model.R', local= TRUE)
  source('phenomena/rel_val/my_theme.R', local= TRUE)
  source('phenomena/rel_val/rel_val.R', local= TRUE)
  #Plot
  return(q)
})




#Simulated data for table rendering (Data Tab)
data_generator_rel_val<- reactive({
  source('phenomena/rel_val/model.R', local= TRUE)
  source('phenomena/rel_val/my_theme.R', local= TRUE)
  source('phenomena/rel_val/rel_val.R', local= TRUE)
  
  names<-  c('Trial', 'alpha A',  'alpha B',  'alpha C',  'beta', 'Type trial', 'Discrimination',
              'A-US', 'delta  V A-US', 'US-A', 'delta  V US-A', 
              'B-US', 'delta  V B-US', 'US-B', 'delta  V US-B',
              'C-US', 'delta  V C-US', 'US-C', 'delta  V US-C',
              'A-B', 'delta V A-B', 'B-A', 'delta V B-A',
              'B-C', 'delta V B-C', 'C-B', 'delta V C-B',
              'A-C', 'delta V A-C', 'C-A', 'delta V C-A')
  
  data<- data.frame(df)
  #Assigning dataframe column names (differ for each phenomenon)
  data <- setNames(data, names)
  
  
})

#Data tab (uses data generated in data_generator
output$data_rel_val<- renderDataTable({
  DT::datatable(data_generator_rel_val(), options= list(scrollX = T))
})



#Download button (downloads data from data_generator_csv)
output$download_data_rel_val <- downloadHandler(
  filename = function(){"Simulated_data.csv"},
  content = function(file) {
    write.csv(data_generator_rel_val(), file, row.names = FALSE)})