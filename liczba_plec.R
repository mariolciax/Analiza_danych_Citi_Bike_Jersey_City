styczen19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201901-citibike-tripdata.csv")
head(styczen19)
luty19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201902-citibike-tripdata.csv")
head(luty19)
marzec19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201903-citibike-tripdata.csv")
head(marzec19)
styczen20 <- read.csv("~/R/BIKE_NEW_YORK/JC-202001-citibike-tripdata.csv")
head(styczen20)
luty20 <- read.csv("~/R/BIKE_NEW_YORK/JC-202002-citibike-tripdata.csv")
head(luty20)
marzec20 <- read.csv("~/R/BIKE_NEW_YORK/JC-202003-citibike-tripdata.csv")
head(marzec20)
library("data.table")
library("dplyr")
library("RColorBrewer")



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


barplot(as.matrix(pods), main="Liczba u¿ytkowników z podzia³em na p³eæ",
        names.arg = c("styczen19", "styczen20", "marzec19", "marzec20"),
        ylab="Liczba u¿ytkowników", col=c("sandybrown","lightblue4", "indianred1"))

legend(x=3.8, y=26600, cex=0.4,pch=c(15,15,15),legend=c("Nie okreœlono","Mê¿czyzna", "Kobieta"), 
       col=c("sandybrown","lightblue4", "indianred1"),)
