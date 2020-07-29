
library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("COVID Trends"),
    h5(" COVID Trends is an application to present data about New Corona Virus Panademic."),
    h5(' '),
    h5('Application uses data from this kaggle link https://www.kaggle.com/sudalairajkumar/novel-corona-virus-2019-dataset?select=covid_19_data.csv '),
    h5('You can choose desired country from the list below and choose type of cases of analysis (ex. confirmed). Then, a plot will be drawn to represent data. Also a summation of the number of cases will appear below.'),
    
    #side bar to choose required data
        sidebarLayout(
        sidebarPanel(
    #select country
         
            selectInput("country",label = "Choose Country:",choices =c("US","Egypt","Mainland China") , selected = "US"),
    #select target data
            selectInput("target",label = "Choose type of cases",choices= c("confirmed","deaths","recovered")),
    #submit button
            submitButton("Submit")
        ),

        # Show a plot of the target data
        mainPanel(
            plotOutput("plot1"), 
        #write the result
            textOutput("target_sum")
        )
    )
))
