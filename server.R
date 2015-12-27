library(shiny)
library(caret)
library(epitools)
library(randomForest)
library(e1071)

##Use the Titanic dataset
titanic_DF <- expand.table(Titanic)
##Create Prediction Model
modelFit <- randomForest(Survived ~., data=titanic_DF)

shinyServer(
        function(input, output){
                
                ##Call Prediction Model and predict 'Survival' based on input data
                predSurvival <- reactive({
                        df <- data.frame(Class=as.factor(input$Class), 
                                         Sex=as.factor(input$Sex), 
                                         Age=as.factor(input$Age),
                                         Survived=as.factor("NA"))
                        combi <- rbind(titanic_DF, df)
                        userData <- combi[nrow(combi),]
                        pred <- predict(modelFit, userData)
                        if (pred == "Yes") {
                                return("Yes")
                        }
                        else {return("No")}
                })
                
                output$Pred <- renderText({
                                if (input$goButton == 0) {
                                        return("Select data and click on Submit")
                                }
                                else {
                                        isolate(return(print(predSurvival())))
                                }
                })
        }
)