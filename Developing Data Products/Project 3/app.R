library(shiny)

# Define the UI
ui <- fluidPage(
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
)

# Define the server logic
server <- function(input, output) {
  getBmiCategory <- function(bmi) {
    if (bmi < 18.5) {
      return("Underweight")
    } else if (bmi >= 18.5 && bmi < 25) {
      return("Normal weight")
    } else if (bmi >= 25 && bmi < 30) {
      return("Overweight")
    } else {
      return("Obese")
    }
  }
  
  getHealthRisks <- function(bmi) {
    if (bmi < 18.5) {
      return("Increased risk of nutritional deficiencies and osteoporosis.")
    } else if (bmi >= 18.5 && bmi < 25) {
      return("Lowest risk of chronic diseases.")
    } else if (bmi >= 25 && bmi < 30) {
      return("Increased risk of type 2 diabetes, hypertension, and cardiovascular diseases.")
    } else {
      return("High risk of type 2 diabetes, hypertension, cardiovascular diseases, and certain cancers.")
    }
  }
  
  observeEvent(input$calculate, {
    height_m <- input$height / 100
    bmi <- input$weight / (height_m ^ 2)
    bmi_category <- getBmiCategory(bmi)
    health_risks <- getHealthRisks(bmi)
    
    output$result <- renderPrint({
      paste("Your BMI is:", round(bmi, 2))
    })
    
    output$category <- renderText({
      paste("BMI Category:", bmi_category)
    })
    
    output$health_risks <- renderText({
      paste("Health Risks:", health_risks)
    })
  })
}

# Run the application
shinyApp(ui = ui, server = server)