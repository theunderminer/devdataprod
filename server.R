library(shiny)

# Load the temparature data from de csv
temperatures <- read.csv("temperatures.csv")
temperatures[,1] <- as.Date(as.character(temperatures[,1]), format="%Y%m%d")

# Define measurement types for proper labeling
types <- list(avg = "Average", max = "Maximum", 
             min = "Minimum", all="Min/Avg/Max")

# Server logic
shinyServer(function(input, output) {
    
    # The output of the server is a plot with temperatures
    output$temperaturePlot <- renderPlot({
        # Calculate the start and end date of a year
        startDate <- as.Date(paste(input$year, "-01-01", sep=""))
        endDate <- as.Date(paste(input$year, "-12-31", sep=""))
        
        # Filter the date of the selected year
        yearTemperatures <- temperatures[temperatures$date >= startDate & 
                                     temperatures$date <= endDate,]
        
        # Plot the temperatures of the selected year and measurement type
        # (avg, min, max)
        plot(yearTemperatures$date, yearTemperatures[,input$type], 
             main=paste(types[input$type], "temperatures in", 
                        input$year),
             xlab="Month", ylab="Temperature (degrees celsius)",
             type="l")
    })
})