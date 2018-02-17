library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Presidential Approval - Brazil"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "select",
                    choices = c("Sarney", "Collor", "Itamar", "FHC", "Lula",
                                "Dilma", "Temer"),
                    label = "selecione",
                    multiple = T
      )),
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("plot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$plot <- renderPlot({
     aprovacao %>% 
       ggplot() +
       geom_line(aes(x = date, y = otimo_bom, col = presidente)) +
       scale_color_manual(values = c("#53868B", "#CD2626", "#0000EE", "#CDAD00", "#EE2C2C", "#8B6508", "#FFC125")) + 
       theme_bw() 
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

