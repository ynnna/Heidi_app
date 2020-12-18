


output$info_inh_cond <- renderUI({
  includeHTML("phenomena/inh_cond/info/info.html")})


#Associative strenght plot
output$inh_cond <- renderPlot({
  source('phenomena/inh_cond/model.R', local= TRUE)
  source('phenomena/inh_cond/my_theme.R', local= TRUE)
  source('phenomena/inh_cond/inh_cond.R', local= TRUE)
  #Plot
  return(p)
  
  
})




#Simulated data for table rendering (Data Tab)
data_generator_inh_cond<- reactive({
  source('phenomena/inh_cond/model.R', local= TRUE)
  source('phenomena/inh_cond/my_theme.R', local= TRUE)
  source('phenomena/inh_cond/inh_cond.R', local= TRUE)
  


    names<- c('Trial', 'alpha A', 'beta', 'alpha B', 'Type trial', 
              'V A-US', 'deltaV A-US', 'V US-A', 'deltaV US-A', 'V COMB A', 
              'V B-US', 'deltaV B-US', 'V US-B', 'deltaV US-B', 'V COMB B',
              'V COMB AB', 'R CS A', 'R US A',  'R CS B', 'R US B',
              'R CS AB', 'R US AB')
    
  
  data<- data.frame(df)
  #Assigning dataframe column names (differ for each phenomenon)
  data <- setNames(data, names)
  
  
})

#Data tab (uses data generated in data_generator
output$data_inh_cond<- renderDataTable({
  DT::datatable(data_generator_inh_cond(), options= list(scrollX = T))
})






#Download button (downloads data from data_generator_csv)
output$download_data_inh_cond <- downloadHandler(
  filename = function(){"Simulated_data.csv"},
  content = function(file) {
    write.csv(data_generator_inh_cond(), file, row.names = FALSE)})