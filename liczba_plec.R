liczba_plec <- function(){  

styczen19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201901-citibike-tripdata.csv")

  luty19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201902-citibike-tripdata.csv")

  marzec19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201903-citibike-tripdata.csv")

  styczen20 <- read.csv("~/R/BIKE_NEW_YORK/JC-202001-citibike-tripdata.csv")

  luty20 <- read.csv("~/R/BIKE_NEW_YORK/JC-202002-citibike-tripdata.csv")

  marzec20 <- read.csv("~/R/BIKE_NEW_YORK/JC-202003-citibike-tripdata.csv")

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
  barplot(as.matrix(pods),
    main="Liczba u¿ytkowników z podzia³em na p³eæ", 
    names.arg = c("styczen19","luty19", "marzec19","styczen20","luty20", "marzec20"),
    ylab="Liczba u¿ytkowników", col=c("sandybrown","lightblue4", "indianred1"),
    ylim = c(0, 26000), xlim = c(0,7))

  legend(x=5.43, y= 34000, pch=c(15,15,15), legend=c("Nie okreœlono","Mê¿czyzna", "Kobieta"), 
      xpd=NA, bty = "n", col=c("sandybrown","lightblue4", "indianred1"))

}
