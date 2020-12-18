#Relative validity


fluidPage(
  tabBox(width = 12,
  tabPanel("Info",
           fluidPage(
             htmlOutput('info_rel_val'))),
  tabPanel("Simulations", 
           fluidPage(
           column(width = 4, align = "center",
           
                  box(width = 12, sliderInput("trial_no_rel_val", 'Number of trials', min= 4, max=100, value= 20, step = 4),
                               helpText("Use the slider to the number of trials")),
                  
                  box(width = 12, sliderInput("alpha_A_rel_val", 'α A', min= 0.1, max= 1, value= 0.5),
                        helpText("Use the slider to choose a value for α A (CS A value)")),
                  
                  box(width = 12,
                      sliderInput("alpha_B_rel_val", 'α B', min= 0.1, max= 1, value= 0.5),
                      helpText("Use the slider to choose a value for α B (CS B value)")),
                
                  box(width = 12,
                      sliderInput("alpha_C_rel_val", 'α C', min= 0.1, max= 1, value= 0.5),
                      helpText("Use the slider to choose a value for α C (CS C value)")),
                
                  box(width = 12,
                      sliderInput("beta_rel_val", 'β', min= 0.1, max= 1, value= 0.5), 
                      helpText("Use the slider to choose a value for β (US value)")),
                
                
                  box(width = 12, downloadButton('download_data_rel_val', 'Download data')), br(),
                
                  box(width = 12, actionButton(inputId='github', label="Code", icon = icon("link"), 
                               onclick ="window.open('https://github.com/ynnna89/modelling', '_blank')"))
                  ), #column
         
           
          column(width = 8, 
                    box(width=12, plotOutput('rel_val1', height = 600)),
                    box(width=12, plotOutput('rel_val2', height = 600))
                 )#column
                    
                  
           ) #fluidPage
          ), #tab simulations
  tabPanel("Data",
           value = 2,
           fluidRow(
             box(width=12, div(style = 'overflow-x: scroll',
                               DT::dataTableOutput('data_rel_val'))), id = "tabselected"))
) # tabset panel
) #fluidPage


