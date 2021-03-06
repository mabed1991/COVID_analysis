
library(shiny)

shinyServer(function(input, output) {
    
    # summerized data
    
    data<- read.csv(text="month,country,confirmed,deaths,recovered
    1,Mainland China,9783,213,214
    1,US,6,0,0
    2,Egypt,1,0,1
    2,Mainland China,79251,2835,39279
    2,US,70,1,7
    3,Egypt,710,46,157
    3,Mainland China,81524,3305,76062
    3,US,188172,3873,7024
    4,Egypt,5537,392,1381
    4,Mainland China,82874,4633,77900
    4,US,1069424,62996,153947
    5,Egypt,24985,959,6037
    5,Mainland China,83017,4634,78307
    5,US,1790172,104381,444758
    6,Egypt,68311,2953,18460
    6,Mainland China,83534,4634,78480
    6,US,2635417,127417,720631
    7,Egypt,88402,4352,28924
    7,Mainland China,83613,4634,78719
    7,US,3773260,140534,1131121
    ")
    
    #get country and target data
    chosen_country<- reactive({input$country})
    target<- reactive({input$target})
    
    #generate target data summary
    target_sum<- reactive({
        data= data[data$country==chosen_country(),]
        max(data[,target()])
    })
    
    
    output$target_sum<- renderText(paste('Total',target(), 'Cases in',chosen_country(),': ',target_sum()))
    
    
    # generate plot
    output$plot1 <- renderPlot({
        
        data= data[data$country==chosen_country(),]
        x <- data[, "month"]
        y <- data[,target()]


        if (target()=="confirmed") 
            plot(x,y,type='l',col=1,lwd=4,xlab='Month',ylab="No. of Confirmed Cases")
        else if (target()=="deaths")
            plot(x,y,type='l',col=2,lwd=4,xlab='Month',ylab="No. of Deaths")
        else   plot(x,y,type='l',col=3,lwd=4,xlab='Month',ylab="No. of Recovered Cases")

    })

})
