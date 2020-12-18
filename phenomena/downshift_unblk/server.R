#Downshift Unblocking

output$info_downshift_unblk <- renderUI({
  includeHTML("phenomena/downshift_unblk/info/info.html")})


#Plot1
output$downshift_unblk1 <- renderPlot({
  source('phenomena/downshift_unblk/model.R', local= TRUE)
  source('phenomena/downshift_unblk/my_theme.R', local= TRUE)
  source('phenomena/downshift_unblk/downshift_unblk.R', local= TRUE)
  #Plot
  return(p)
})

#Plot1
output$downshift_unblk2 <- renderPlot({
  source('phenomena/downshift_unblk/model.R', local= TRUE)
  source('phenomena/downshift_unblk/my_theme.R', local= TRUE)
  source('phenomena/downshift_unblk/downshift_unblk.R', local= TRUE)
  #Plot
  return(q)
})

#Plot1
output$downshift_unblk3 <- renderPlot({
  source('phenomena/downshift_unblk/model.R', local= TRUE)
  source('phenomena/downshift_unblk/my_theme.R', local= TRUE)
  source('phenomena/downshift_unblk/downshift_unblk.R', local= TRUE)
  #Plot
  return(z)
})


#Simulated data for table rendering (Data Tab)
data_generator_downshift_unblk<- reactive({
  source('phenomena/downshift_unblk/model.R', local= TRUE)
  source('phenomena/downshift_unblk/my_theme.R', local= TRUE)
  source('phenomena/downshift_unblk/downshift_unblk.R', local= TRUE)
  
  names<- c('Trial', 'alpha A', 'alpha B', 'beta US1', 'beta US2', 'Type trial', 'Dataframe',
            'V A-US1', 'delta V A-US1', 'US1-A', 'delta V US1-A', 'V COMB A-US1',
            'V A-US2', 'delta V A-US2', 'US2-A', 'delta V US2-A', 'V COMB A-US2',
            'V B-US1', 'delta V B-US1', 'US1-B', 'delta V US1-B', 'V COMB B-US1',
            'V B-US2', 'delta V B-US2', 'US2-B', 'delta V US2-B', 'V COMB B-US2',
            'V A-B', 'delta V A-B', 'B-A', 'delta V B-A')
  
  data<- data.frame(df)
  #Assigning dataframe column names (differ for each phenomenon)
  data <- setNames(data, names)
  
  
})

#Data tab (uses data generated in data_generator
output$data_downshift_unblk<- renderDataTable({
  DT::datatable(data_generator_downshift_unblk(), options= list(scrollX = T))
})



#Download button (downloads data from data_generator_csv)
output$download_data_downshift_unblk <- downloadHandler(
  filename = function(){"Simulated_data.csv"},
  content = function(file) {
    write.csv(data_generator_downshift_unblk(), file, row.names = FALSE)})