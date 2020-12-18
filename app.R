#Load libraries (packages)
source('load_packages.R')

js <- '.nav-tabs-custom .nav-tabs li.active {
    border-top-color: #d73925;
}"
nav-tabs-custom>.nav-tabs>li.active:hover>a, .nav-tabs-custom>.nav-tabs>li.active>a {
    background-color: #fff;
    color: #d73925; /* HeiDI red */
}"'



ui <- fluidPage(dashboardPage(skin= 'red',
                    
                                  
dashboardHeader(title = "HeiDI"),

dashboardSidebar (disable =  TRUE),
  
   dashboardBody(
     #Link with the css in the www folder
     tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
     tags$head(tags$style(HTML('.wrapper {height: auto !important; position:relative; overflow-x:hidden; overflow-y:hidden}'))),
     tags$style(js),
     fluidPage(
     tabBox(width = 12, 
        tabPanel("Overview", br(),
                htmlOutput("overview")),
        
       
        tabPanel("Simulations",
                 fluidPage(
                          boxPlus(div(style = "font-size:15;", selectInput("pheno", label =  "", choices =
                                     c("Excitatory conditioning"="excit_cond", "Extinction"="extinct", "Inhibitory conditioning"="inh_cond", 
                                       'Compound conditioning' = 'comp_cond', 'Downshift unblocking' = 'downshift_unblk',
                                       'Relative validity' = 'rel_val'), selected= 'excit_cond'
                        )))),
                

                 
            conditionalPanel(condition = "input.pheno == 'excit_cond'", 
            #Excitatory conditioning
            source('phenomena/excit_cond/ui.R', local= TRUE)$value),    

            conditionalPanel(condition = "input.pheno == 'extinct'",
            #Extinction  
            source('phenomena/extinct/ui.R', local= TRUE)$value),
            
            conditionalPanel(condition = "input.pheno == 'inh_cond'",
            #Conditioned inhibition 
            source('phenomena/inh_cond/ui.R', local= TRUE)$value),
            
            conditionalPanel(condition = "input.pheno == 'comp_cond'",
             # Compound conditioning
             source('phenomena/comp_cond/ui.R', local= TRUE)$value),
            
            # Dowshift unblocking
            conditionalPanel(condition = "input.pheno == 'downshift_unblk'",
            source('phenomena/downshift_unblk/ui.R', local= TRUE)$value),
          
            
            conditionalPanel(condition = "input.pheno == 'rel_val'",
             # Relative validity
             source('phenomena/rel_val/ui.R', local= TRUE)$value)
)
            , #Simulations

           
                  
        
     tabPanel ("HeiDI@lab", value = 2,
               htmlOutput("heidi_lab"))
))
   )#body
)#dahsboardpage
)
server <- function(input, output) {
  
  output$overview <- renderUI({
    includeHTML("tabs/overview/info.html")})
  
  output$heidi_lab<- renderUI({
    includeHTML("tabs/heidi_lab/info.html")})
  
  # Exitatory conditioning
 source('phenomena/excit_cond/server.R', local= TRUE)$value
  
  # Extinction
  source('phenomena/extinct/server.R', local= TRUE)$value
  
  # Conditioned inhibition
  source('phenomena/inh_cond/server.R', local= TRUE)$value

  # Compound conditioning
  source('phenomena/comp_cond/server.R', local= TRUE)$value
   

  #  Downshift unblocking
  source('phenomena/downshift_unblk/server.R', local= TRUE)$value
  
  # Relative validity
  source('phenomena/rel_val/server.R', local= TRUE)$value
  
  
  
}

shinyApp(ui, server)