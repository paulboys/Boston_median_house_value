library(shiny)
library(MASS)

shinyUI(fluidPage(
  titlePanel("Predict median home value in Boston (~1978): adjust predictor inputs for 3 model predictions"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderRM", "How many rooms in the house?", 3.561, 8.780, value = 5),
      sliderInput("sliderCrim", "Crime rate per capita", 0.00632, 88.97620, value = 90),
      sliderInput("sliderZn", "Proportion of lots zoned >25,000 sq ft", 0, 100, value = 0),
      sliderInput("sliderIndus", "Proportion of non-retail acres per town", 0.46,27.74, value = 10),
      selectInput("sliderChas", "Propery bounds the Charles River?", choices = c(0, 1), selected = 0),
      sliderInput("sliderNox", "Nitrogen oxide concentration (ppm)", 0.385,0.871, value = 0.5),
      sliderInput("sliderAge", "Proportion of homes built prior to 1940", 2, 100, value = 50),
      sliderInput("sliderDis", "Weighted mean distance to 5 Boston employment centres", 1, 13, value = 6),
      selectInput("sliderRad", "Index of accessibility to highway", choices = c(1:24), selected = 1),
      sliderInput("sliderTax", "Full-value property-tax rate per $10k", 180, 720, value = 300),
      sliderInput("sliderPT", "Pupil-teacher ratio by town", 12, 22, value = 15),
      sliderInput("sliderBl", "Modified proportion of blacks by town", 32, 400, value = 200),
      sliderInput("sliderLS", "Lower status of the population (%)", 1, 40, value = 20)    ),
    mainPanel(
      h3("Full linear model predicted median home value:"),
      textOutput("pred1"),
      h3("Step-wise linear model predicted median home value:"),
      textOutput("pred2"),
      h3("SVM model predicted median home value:"),
      textOutput("pred3")
    )
  )
))