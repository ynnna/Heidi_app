#Compound conditioning: stimuli with different associative histories

fluidPage(
  tabBox(width = 12,
  tabPanel("Info",
           fluidPage(
             htmlOutput('info_comp_cond'))),
  tabPanel("Simulations", 
       fluidPage(    
           column(width = 4, align = "center",
                box(width= 12,
                               sliderInput("trial_no_comp_cond", 'Number of trials', min= 1, max=100, value= 20),
                               helpText("Use the slider to the number of trials")),
                
                box(width= 12,
                        sliderInput("alpha_A_comp_cond", 'α A', min= 0.1, max= 1, value= 0.3),
                        helpText("Use the slider to choose a value for α A (CS value)")),
                box(width= 12,
                        sliderInput("alpha_B_comp_cond", 'α B', min= 0.1, max= 1, value= 0.3),
                        helpText("Use the slider to choose a value for α B (CS value)")), 
                box(width= 12,
                        sliderInput("beta_comp_cond", 'β', min= 0.1, max= 1, value= 0.5), 
                        helpText("Use the slider to choose a value for β (US value)")),
                box(width= 12, downloadButton('download_data_comp_cond', 'Download data')), br(),
                box(width = 12, actionButton(inputId='github', label="Code", icon = icon("link"), 
                                             onclick ="window.open('https://github.com/ynnna89/modelling', '_blank')"))
          ),  #column
           
           column(width = 8, 
                box(width=12, plotOutput('comp_cond', height = 800))
          ) #column
          
        ) # fluidPage
       ), # tab simulations
  tabPanel("Data",
           value = 2,
           fluidRow(
             box(width=12, div(style = 'overflow-x: scroll',
                               DT::dataTableOutput('data_comp_cond'))), id = "tabselected"))
  ) # tabset panel
) # fluidPage





