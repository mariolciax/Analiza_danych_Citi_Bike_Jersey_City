library("shiny")
library("dplyr")
shinyUI(pageWithSidebar(
  headerPanel("Czas podrozy"),
  sidebarPanel(
    selectInput(inputId = "plec",
                label = "Wybierz plec",
                choices = c("kobieta", "mezczyzna","nie podano"),
                selected = "mezczyzna"),
    sliderInput("zakres", "Jaki czas:",
                min = 0, max = 2000000, value = c(0,2000000), step= 50)),
  mainPanel(
    tabsetPanel(
      tabPanel("Histogram", plotOutput("wyjscieHistogram")),
      tabPanel("Podsumowanie", verbatimTextOutput("wyjscieTabela"))
    ))
))
