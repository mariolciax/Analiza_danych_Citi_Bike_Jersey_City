
styczen20<-read.csv("JC-202001-citibike-tripdata.csv")
luty20<-read.csv("JC-202002-citibike-tripdata.csv")
marzec20<-read.csv("JC-202003-citibike-tripdata.csv")
styczen19<-read.csv("JC-201901-citibike-tripdata.csv")
luty19<-read.csv("JC-201902-citibike-tripdata.csv")
marzec19<-read.csv("JC-201903-citibike-tripdata.csv")


library("data.table")
library("dplyr")
marzec19_station <- select(marzec19, start.station.name, end.station.name)
marzec19_station_a<- as.vector(select(marzec19, start.station.name))
marzec19_station_b<- as.vector(select(marzec19, end.station.name))
vector<-unlist( c(marzec19_station_a,marzec19_station_b))
d<- as.data.frame(vector)
d<- d %>%
  group_by(vector) %>%
  tally()
marzec19_station <- as.vector(top_n(d, 1))

marzec20_station <- select(marzec20, start.station.name, end.station.name)
marzec20_station_a<- as.vector(select(marzec20, start.station.name))
marzec20_station_b<- as.vector(select(marzec20, end.station.name))
vector<-unlist( c(marzec20_station_a,marzec20_station_b))
d<- as.data.frame(vector)
d<- d %>%
  group_by(vector) %>%
  tally()
marzec20_station <- as.vector(top_n(d, 1))

styczen20_station <- select(styczen20, start.station.name, end.station.name)
styczen20_station_a<- as.vector(select(styczen20, start.station.name))
styczen20_station_b<- as.vector(select(styczen20, end.station.name))
vector<-unlist( c(styczen20_station_a,styczen20_station_b))
d<- as.data.frame(vector)
d<- d %>%
  group_by(vector) %>%
  tally()
styczen20_station <- as.vector(top_n(d, 1))


dane <- c(marzec20_station$n, marzec19_station$n, styczen20_station$n)

names(dane) <- c("marzec 2020","marzec 2019","styczen 2020")
pie(dane,main=as.character(unlist(marzec19_station[1,1])))