library(shiny)
shinyUI(fluidPage(
  titlePanel("Text Prediction"),
  sidebarLayout(
    sidebarPanel(
      textInput('inputText','Input',value='')
    ),
    mainPanel(
      textOutput("predictedText")
    )
  )
))