library(shiny)

# Shiny app with year and measurement and plot of temperatures as output
shinyUI(fluidPage(
    
    # Title of the app
    titlePanel("Temperatures in the Twente, The Netherlands by year"),
    
    # Create a sidebar with two inputs: select list with years and
    # a radio buttons to select te measurement
    sidebarLayout(
        sidebarPanel(
            p("Select a year and a measurement type to display the related
                temperatures in Twente (The Netherlands)"),
            selectInput("year",
                        "Year:",
                        choices = 1951:2013,
                        selected = 2013),
            radioButtons("type", "Measurement:", 
                         c("Minimum temperature" = "min",
                           "Average temperature" = "avg",
                           "Maximum temperature" = "max"), 
                         "avg")
        ),
        
        # Show a plot of the temperature in celcius
        mainPanel(
            plotOutput("temperaturePlot")
        )
    )
))