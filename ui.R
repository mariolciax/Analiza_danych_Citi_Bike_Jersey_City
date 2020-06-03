library("shiny")
library("dplyr")
shinyUI(pageWithSidebar(
  headerPanel("Czas podrozy"),
  sidebarPanel(
    selectInput(inputId = "plec",
                label = "Wybierz plec",
                choices = c("kobieta", "mezczyzna","nie podano"),
                selected = "mezczyzna"),
    sliderInput("zakres", "Jaki czas (sekundy):",
                min = 0, max = 36000, value = c(0,36000), step= 300)),
  mainPanel(
    tabsetPanel(
      tabPanel("Histogram", plotOutput("wyjscieHistogram")),
      tabPanel("Podsumowanie", verbatimTextOutput("wyjscieTabela"))
    ))
))
