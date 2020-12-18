#Extinction

fluidPage(
  tabBox(width = 12,
    tabPanel("Info",
           fluidPage(
             htmlOutput('info_extinct'))),
    tabPanel("Simulations", 
       fluidPage(
           column(width = 4, align = "center",
             box(width= 12,
                     sliderInput("trial_no_extinct", 'Number of trials', min= 1, max=100, step = 2,
                                 value= 20),
                     helpText("Use the slider to choose a value for α (CS value)")),
             box(width= 12,
                  sliderInput("alpha_extinct", 'α', min= 0, max= 1, value= 0.5),
                  helpText("Use the slider to the number of trials")),
             box(width= 12,
                  sliderInput("beta_extinct", 'β', min= 0, max= 1, value= 0.5), 
                  helpText("Use the slider to choose a value for β (US value)")),
             box(width= 12, 
                  downloadButton('download_data_extinct', 'Download data')), br(),
             box(width = 12, actionButton(inputId='github', label="Code", icon = icon("link"), 
                                          onclick ="window.open('https://github.com/ynnna89/modelling', '_blank')"))
     ), #column
     
     column(width = 8, 
           box(width=12, plotOutput('extinct', height = 800))
            
     ) #column
     ) #fluidPage
     ), #simulations tab
  tabPanel("Data",
           value = 2,
           fluidRow(
             box(width=12, div(style = 'overflow-x: scroll',
                               DT::dataTableOutput('data_extinct'))), id = "tabselected"))
  ) # tabset panel
) #row