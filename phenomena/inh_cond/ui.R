#Inhibitory conditioning

fluidPage(
  tabBox(width = 12,
  tabPanel("Info",
           
             htmlOutput('info_inh_cond')),
  tabPanel("Simulations", 
        fluidPage( 
           column(width = 4, align = "center",
              box(width= 12,
                   sliderInput("trial_no_inh_cond", 'Number of trials', min= 2, max=100, value= 20,  step = 2),
                   helpText("Use the slider to the number of trials)")),
              box(width= 12,
                        sliderInput("alpha_A_inh_cond", 'α A', min= 0, max= 1, value= 0.5),
                        helpText("Use the slider to choose a value for α A (CS value)")),
              box(width= 12,
                        sliderInput("alpha_B_inh_cond", 'α B', min= 0, max= 1, value= 0.5),
                        helpText("Use the slider to choose a value for α B (CS value)")),
              box(width= 12,
                        sliderInput("beta_inh_cond", 'β', min= 0, max= 1, value= 0.5), 
                        helpText("Use the slider to choose a value for β (US value)")),
              box(width = 12, downloadButton('download_data_inh_cond', 'Download data')), br(),
              box(width = 12, actionButton(inputId='github', label="Code", icon = icon("link"), 
                                           onclick ="window.open('https://github.com/ynnna89/modelling', '_blank')"))
           ), # column
           
           column(width = 8, 
              box(width = 12,plotOutput('inh_cond', height = 800))
           ) #column
        ) # fluiPage
        ), # tab simulations
 
  tabPanel("Data",
           value = 2,
           fluidRow(
             box(width=12, div(style = 'overflow-x: scroll',
                               DT::dataTableOutput('data_inh_cond'))), id = "tabselected"))
  ) # tabset panel
) # fluidPage





