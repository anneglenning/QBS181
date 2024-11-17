library(shiny)
library(plotly)

# Define UI
ui <- fluidPage(
  titlePanel("SAL County Data Project Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Select a variable:", 
                  choices = colnames(mtcars), selected = "mpg"),
      sliderInput("bins", "Number of bins:", 
                  min = 1, max = 50, value = 30)
    ),
    mainPanel(
      plotlyOutput("distPlot"),
      plotlyOutput("scatterPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  # Reactive expression to create a histogram
  output$distPlot <- renderPlotly({
    data <- mtcars[[input$variable]]
    
    p <- plot_ly(x = ~data, type = "histogram", 
                 xbins = list(size = (max(data) - min(data)) / input$bins)) %>%
      layout(title = paste("Histogram of", input$variable),
             xaxis = list(title = input$variable),
             yaxis = list(title = "Count"))
    
    p
  })
  
  # Additional scatter plot
  output$scatterPlot <- renderPlotly({
    p <- plot_ly(data = mtcars, x = ~mpg, y = ~wt, 
                 type = 'scatter', mode = 'markers') %>%
      layout(title = "Scatter plot of MPG vs WT",
             xaxis = list(title = "Miles Per Gallon"),
             yaxis = list(title = "Weight"))
    
    p
  })
}

# Run the application 
shinyApp(ui = ui, server = server)