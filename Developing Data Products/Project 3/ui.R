library(shiny)

shinyUI(fluidPage(
  titlePanel("BMI Calculator"),
  sidebarLayout(
    sidebarPanel(
      numericInput("height", "Height (in cm)", value = 170, min = 100, max = 250),
      numericInput("weight", "Weight (in kg)", value = 70, min = 30, max = 200),
      selectInput("gender", "Gender", choices = c("Male", "Female")),
      numericInput("age", "Age", value = 30, min = 18, max = 120),
      actionButton("calculate", "Calculate BMI")
    ),
    mainPanel(
      h3("Result"),
      verbatimTextOutput("result"),
      h4("BMI Category"),
      textOutput("category"),
      h4("Health Risks"),
      textOutput("health_risks")
    )
  )
))