#Downshift unblocking

fluidPage(
  tabBox(width = 12,
  tabPanel("Info",
           fluidPage(
             htmlOutput('info_downshift_unblk'))),
  tabPanel("Simulations", 
      fluidPage(
           column(width = 4, align = "center",
                box(width= 12,
                               sliderInput("trial_no_downshift_unblk", 'Number of trials', min= 2, max=100, value= 20, step = 2),
                               helpText("Use the slider to the number of trials")),
                box(width= 12,
                        sliderInput("alpha_A_downshift_unblk", 'α A', min= 0.1, max= 1, value= 0.5),
                        helpText("Use the slider to choose a value for αA (CS A value)")),
                box(width= 12,
                        sliderInput("alpha_B_downshift_unblk", 'α B', min= 0.1, max= 1, value= 0.5),
                        helpText("Use the slider to choose a value for αB (CS B value)")),
                box(width= 12,
                        sliderInput("beta_1_downshift_unblk", 'β 1', min= 0.1, max= 1, value= 0.5), 
                        helpText("Use the slider to choose a value for β1 (US1 value)")),
                box(width= 12,
                        sliderInput("beta_2_downshift_unblk", 'β 2', min= 0.1, max= 1, value= 0.5), 
                        helpText("Use the slider to choose a value for β1 (US2 value).
                                 Set to 0 for the second phase of Downshift Unblocking")),
                box(width = 12, downloadButton('download_data_downshift_unblk', 'Download data')), br(),
                box(width = 12, actionButton(inputId='github', label="Code", icon = icon("link"), 
                                             onclick ="window.open('https://github.com/ynnna89/modelling', '_blank')"))
       ) ,#column
           column(width = 8, 
                  box(width= 12, plotOutput('downshift_unblk1', height = 600)),
                  box(width= 12, plotOutput('downshift_unblk2', height = 600)),
                  box(width= 12, plotOutput('downshift_unblk3', height = 600))
                    
                  
      )#column
      ) #fluiPage
      ), #tab simulations
  tabPanel("Data",
           value = 2,
           fluidRow(
             box(width=12, div(style = 'overflow-x: scroll',
                               DT::dataTableOutput('data_downshift_unblk'))), id = "tabselected"))
) # tabset panel
)#row