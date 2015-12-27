library(shiny)

shinyUI(
        pageWithSidebar(
                headerPanel("Titanic Survival Prediction"),
                sidebarPanel(
                        h4("STEP 1: Select Values"),
                        selectInput("Class", label = h3("Cabin"),
                                        c("1st","2nd","3rd","Crew")),
                        selectInput("Sex", label = h3("Sex"),
                                        c("Male","Female")),
                        selectInput("Age", label = h3("Age"),
                                        c("Adult","Child")),
                        h4("STEP 2: Click on Submit"),
                        actionButton("goButton", "Submit")
                ),
                mainPanel(
                        h2("Prediction of Survival on the Titanic based on selected data"),
                        h3("Would you survive (Yes/No)?"),
                        verbatimTextOutput("Pred")
                )
        )
)