styczen20<-read.csv("JC-202001-citibike-tripdata.csv")
luty20<-read.csv("JC-202002-citibike-tripdata.csv")
marzec20<-read.csv("JC-202003-citibike-tripdata.csv")
styczen19<-read.csv("JC-201901-citibike-tripdata.csv")
luty19<-read.csv("JC-201902-citibike-tripdata.csv")
marzec19<-read.csv("JC-201903-citibike-tripdata.csv")

library("data.table")
library("dplyr")
library("RColorBrewer")
library("plotly")

styczen19_gender <- select(styczen19, gender)
styczen19_gender<- styczen19_gender %>%
  group_by(gender) %>%
  tally()
styczen19_gender<- select(styczen19_gender, n)
styczen19_gender <- rename(styczen19_gender, styczen19_plec = n)


styczen20_gender <- select(styczen20, gender)
styczen20_gender<- styczen20_gender %>%
  group_by(gender) %>%
  tally()
styczen20_gender<- select(styczen20_gender, n)
styczen20_gender <- rename(styczen20_gender, styczen20_plec = n)


marzec20_gender <- select(marzec20, gender)
marzec20_gender<- marzec20_gender %>%
  group_by(gender) %>%
  tally()
marzec20_gender<- select(marzec20_gender, n)
marzec20_gender <- rename(marzec20_gender, marzec20_plec = n)


marzec19_gender <- select(marzec19, gender)
marzec19_gender<- marzec19_gender %>%
  group_by(gender) %>%
  tally()
marzec19_gender<- select(marzec19_gender, n)
marzec19_gender <- rename(marzec19_gender, marzec19_plec = n)


luty20_gender <- select(luty20, gender)
luty20_gender<- luty20_gender %>%
  group_by(gender) %>%
  tally()
luty20_gender<- select(luty20_gender, n)
luty20_gender <- rename(luty20_gender, luty20_plec = n)


luty19_gender <- select(luty19, gender)
luty19_gender<- luty19_gender %>%
  group_by(gender) %>%
  tally()
luty19_gender<- select(luty19_gender, n)
luty19_gender <- rename(luty19_gender, luty19_plec = n)

pods <- cbind(styczen19_gender, luty19_gender, marzec19_gender,
              styczen20_gender, luty20_gender, marzec20_gender)
plot.window(4.5,2.5)
par(mar=c(1,1,0.5,1), mfrow=c(1,2),oma=c(1,1,1,5),xpd=NA)
barplot(as.matrix(pods),
        main="Liczba uzytkowników z podzialem na plec", 
        names.arg = c("styczen19","luty19", "marzec19","styczen20","luty20", "marzec20"),
        ylab="Liczba uzytkowników", col=c("sandybrown","lightblue4", "indianred1"),
        ylim = c(0, 26000), xlim = c(0,7))
legend(7.5,20000,legend=c("Nie okreslono","Mezczyzna", "Kobieta"),fill=c("sandybrown","lightblue4", "indianred1"),bty = "n")


