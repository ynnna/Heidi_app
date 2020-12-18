
#Compoud conditiioning

output$info_comp_cond <- renderUI({
  includeHTML("phenomena/comp_cond/info/info.html")})


#Associative strenght plot
output$comp_cond <- renderPlot({
  source('phenomena/comp_cond/model.R', local= TRUE)
  source('phenomena/comp_cond/my_theme.R', local= TRUE)
  source('phenomena/comp_cond/comp_cond.R', local= TRUE)
  #Plot
  return(p)
  
  
})




#Simulated data for table rendering (Data Tab)
data_generator<- reactive({
  source('phenomena/comp_cond/model.R', local= TRUE)
  source('phenomena/comp_cond/my_theme.R', local= TRUE)
  source('phenomena/comp_cond/comp_cond.R', local= TRUE)
  


  names<- c('Trial', 'alpha A', 'alpha B', 'beta', 'Type trial', 
                'V A-US', 'deltaV A-US', 'V US-A', 'deltaV US-A', 'V COMB A', 
                'V B-US', 'deltaV B-US', 'V US-B', 'deltaV US-B', 'V COMB B',
                'V C-US', 'V US-C', 'V D-US', 'V US-D',
                'V AD-US', 'V US-AD', 'V BC-US', 'V US-BC', 'V COMB AD', 'V COMB BC',
                'R CS AD', 'R CS BC',  'R US AD', 'R US BC')
    
  
  data<- data.frame(df)
  #Assigning dataframe column names (differ for each phenomenon)
  data <- setNames(data, names)
  
  
})

#Data tab (uses data generated in data_generator
output$data_comp_cond<- renderDataTable({
  DT::datatable(data_generator(), options= list(scrollX = T))
})






#Download button (downloads data from data_generator_csv)
output$download_data_comp_cond <- downloadHandler(
  filename = function(){"Simulated_data.csv"},
  content = function(file) {
    write.csv(data_generator(), file, row.names = FALSE)})