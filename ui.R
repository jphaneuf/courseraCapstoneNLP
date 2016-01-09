library(shiny)
shinyUI(fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      textInput('inputText','label',value='')
    ),
    mainPanel(
      plotOutput("distPlot"),
      textOutput("predictedText")
    )
  )
))