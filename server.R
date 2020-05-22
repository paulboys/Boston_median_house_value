library(shiny)
library(MASS)
library(e1071)

shinyServer(function(input, output) {
  model1 <- lm(medv ~ ., data = Boston)
  model2 <- step(model1, direction = "both")
  model3 <- svm(medv ~., type = 'eps-regression', kernel = 'radial', gamma = 1/nrow(Boston), data = Boston)
  
  model1pred <- reactive({
    RMInput <- input$sliderRM
    CrimInput <- input$sliderCrim
    ZnInput <- input$sliderZn
    IndusInput <- input$sliderIndus
    ChasInput <- input$sliderChas
    NoxInput <- input$sliderNox
    AgeInput <- input$sliderAge
    DisInput <- input$sliderDis
    RadInput <- input$sliderRad
    TaxInput <- input$sliderTax
    PTInput <- input$sliderPT
    BlInput <- input$sliderBl
    LSInput <- input$sliderLS
    
    predict(model1, newdata = data.frame(cbind(rm = as.numeric(RMInput), 
                                               crim = as.numeric(CrimInput),
                                               zn = as.numeric(ZnInput),
                                               indus = as.numeric(IndusInput),
                                               chas = as.integer(ChasInput),
                                               nox = as.numeric(NoxInput),
                                               age = as.numeric(AgeInput),
                                               dis = as.numeric(DisInput),
                                               rad = as.integer(RadInput),
                                               tax = as.numeric(TaxInput),
                                               ptratio = as.numeric(PTInput),
                                               black = as.numeric(BlInput),
                                               lstat = as.numeric(LSInput))))
    })
  
  model2pred <- reactive({
    RMInput <- input$sliderRM
    CrimInput <- input$sliderCrim
    ZnInput <- input$sliderZn
    IndusInput <- input$sliderIndus
    ChasInput <- input$sliderChas
    NoxInput <- input$sliderNox
    AgeInput <- input$sliderAge
    DisInput <- input$sliderDis
    RadInput <- input$sliderRad
    TaxInput <- input$sliderTax
    PTInput <- input$sliderPT
    BlInput <- input$sliderBl
    LSInput <- input$sliderLS
    
    predict(model2, newdata = data.frame(cbind(rm = as.numeric(RMInput),
                                               crim = as.numeric(CrimInput),
                                               zn = as.numeric(ZnInput),
                                               chas = as.integer(ChasInput),
                                               nox = as.numeric(NoxInput),
                                               dis = as.numeric(DisInput),
                                               rad = as.integer(RadInput),
                                               tax = as.numeric(TaxInput),
                                               ptratio = as.numeric(PTInput),
                                               black = as.numeric(BlInput),
                                               lstat = as.numeric(LSInput))))
  })
  
  model3pred <- reactive({
    RMInput <- input$sliderRM
    CrimInput <- input$sliderCrim
    ZnInput <- input$sliderZn
    IndusInput <- input$sliderIndus
    ChasInput <- input$sliderChas
    NoxInput <- input$sliderNox
    AgeInput <- input$sliderAge
    DisInput <- input$sliderDis
    RadInput <- input$sliderRad
    TaxInput <- input$sliderTax
    PTInput <- input$sliderPT
    BlInput <- input$sliderBl
    LSInput <- input$sliderLS
    
    predict(model3, newdata = data.frame(cbind(rm = as.numeric(RMInput), 
                                               crim = as.numeric(CrimInput),
                                               zn = as.numeric(ZnInput),
                                               indus = as.numeric(IndusInput),
                                               chas = as.integer(ChasInput),
                                               nox = as.numeric(NoxInput),
                                               age = as.numeric(AgeInput),
                                               dis = as.numeric(DisInput),
                                               rad = as.integer(RadInput),
                                               tax = as.numeric(TaxInput),
                                               ptratio = as.numeric(PTInput),
                                               black = as.numeric(BlInput),
                                               lstat = as.numeric(LSInput))))
  })
  
  output$pred1 <- renderText({
    paste0('$', round(model1pred()*1000,digits = 2))
  })
  
  output$pred2 <- renderText({
    paste0('$', round(model2pred()*1000,digits = 2))
  })

  output$pred3 <- renderText({
    paste0('$', round(model3pred()*1000,digits = 2))
  })
  
  
})
