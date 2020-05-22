library("shiny")
library("dplyr")

marzec20_JC<-read.csv("JC-202003-citibike-tripdata.csv")
marzec20_JC<-mutate(marzec20_JC,gender=ifelse(gender==1,"mezczyzna",gender))
marzec20_JC<-mutate(marzec20_JC,gender=ifelse(gender==2,"kobieta",gender))
marzec20_JC<-mutate(marzec20_JC,gender=ifelse(gender==0,"nie podano", gender))
marzec20_JC<-rename(marzec20_JC, plec = gender)
marzec20_JC<-rename(marzec20_JC,czas=tripduration)
marzec20_JC<-mutate(marzec20_JC, wiek=2020-birth.year)

shinyServer(function(input, output) {
  output$wyjscieHistogram <- renderPlot({
    wybrane <- marzec20_JC[
      marzec20_JC$plec == input$plec &
        marzec20_JC$czas >= input$zakres[1] &
        marzec20_JC$czas <= input$zakres[2], ]
    hist(wybrane$wiek, xlim=c(0,100), main=paste("Wiek w zaleznosci od czasu podrozy", input$plec))
  })
  output$wyjscieTabela <- renderPrint({
    wybrane <- marzec20_JC[
      marzec20_JC$plec == input$plec &
        marzec20_JC$czas >= input$zakres[1] &
        marzec20_JC$czas <= input$zakres[2], ]
    summary(wybrane$wiek)
  })
})
