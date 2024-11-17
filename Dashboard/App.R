# R Shiny Dashboard File
# Sabin Hart
# Nov 17th


# Packages and Data Import ------------------------------------------------

library(shiny)
library(plotly)
library(rsconnect)
library(plotly)

setwd("/Users/sabinhart/Desktop/Data Wrangling/Final Project")
load("Data/final_data.Rdata")
load("Data/map_data.Rdata")


# Graph Prep --------------------------------------------------------------


y_var_names <- c(
  access_to_exercise_2020 = "Access to Exercise",
  adult_obesity_2020 = "Adult Obesity",
  age_adj_mortality_2020 = "Age-Adjusted Mortality",
  child_poverty_2020 = "Child Poverty",
  driving_mortality_2020 = "Driving Mortality",
  excess_drinking_2020 = "Excess Drinking",
  food_insecure_2020 = "Food Insecurity",
  free_reduced_lunch_2020 = "Free or Reduced Lunch Rate",
  injury_death_rate_2020 = "Injury Death Rate",
  life_expectancy_2020 = "Life Expectancy",
  limited_healthy_food_2020 = "Limited Access to Healthy Food",
  low_birthweight_2020 = "Low Birthweight",
  ment_unhealthy_days_2020 = "Mentally Unhealthy Days",
  phys_inactive_2020 = "Physical Inactivity",
  phys_unhealthy_days_2020 = "Physically Unhealthy Days",
  rural_2020 = "Rural Population Percentage",
  smoking_rate_2020 = "Smoking Rate",
  unemployment_2020 = "Unemployment Rate",
  violent_crime_rate_2020 = "Violent Crime Rate"
)


# UI ----------------------------------------------------------------------


# Define UI
ui <- fluidPage(
  titlePanel("SAL County Data Project Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "y_var",
        label = "Select Y-axis Variable:",
        choices = y_var_names,
        selected = "violent_crime_rate_2020"
      )
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Scatter Plots", plotOutput("scatterPlot")),
        tabPanel("US County Map", plotlyOutput("mapPlot"))  
      )
    )
  )
)


# Server ------------------------------------------------------------------


# Define server logic
server <- function(input, output) {
  
  # Scatter Plots
  output$scatterPlot <- renderPlot({
    # Get variable name and label
    y_var <- names(y_var_names)[y_var_names == input$y_var]
    y_label <- input$y_var
    
    # Create plot
    ggplot(county_data, aes_string(x = "median_aqi", y = y_var)) +
      geom_point(size = 2, color = "#4A5859") +
      labs(
        title = "Median AQI by Selected Variable 2020",
        x = "Median AQI",
        y = y_label
      ) +
      geom_smooth(method = "lm", se = FALSE, color = "#C83E4D") +
      theme_minimal()
  })
  
  # County Map Plot
  output$mapPlot <- renderPlotly({
    p <- ggplot(map_data) +
      geom_sf(aes(fill = median_aqi, 
                  text = paste("County:", County, "<br>State:", State, "<br>AQI:", median_aqi, "%")), 
              color = "white", size = 0.1) +
      scale_fill_gradientn(colors = c("green", "yellow", "red")) +
      labs(title = "Median AQI by County in 2020") +
      coord_sf(xlim = c(-125, -66), ylim = c(24, 50), expand = FALSE) +
      theme_minimal() +
      theme(
        legend.position = "bottom",
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank()
      )
    ggplotly(p, tooltip = "text")
  })
}


# Main --------------------------------------------------------------------

# Run the application 
shinyApp(ui = ui, server = server)

# run this to cloud deploy dashboard !!!!
# rsconnect::deployApp("/Users/sabinhart/Desktop/Data Wrangling/Final Project/Dashboard")

