library("dplyr")
library("data.table")
library("plotly")
library("RColorBrewer")
library("rCharts")
options(repr.plot.width = 7)
options(repr.plot.height = 5)
options(jupyter.rich_display = FALSE)
options(width = 120)

styczen20<-read.csv("JC-202001-citibike-tripdata.csv")
luty20<-read.csv("JC-202002-citibike-tripdata.csv")
marzec20<-read.csv("JC-202003-citibike-tripdata.csv")
styczen19<-read.csv("JC-201901-citibike-tripdata.csv")
luty19<-read.csv("JC-201902-citibike-tripdata.csv")
marzec19<-read.csv("JC-201903-citibike-tripdata.csv")

marzec19_station <- select(marzec19, start.station.name, end.station.name)
marzec19_station_a<- as.vector(select(marzec19, start.station.name))
marzec19_station_b<- as.vector(select(marzec19, end.station.name))
vector<-unlist( c(marzec19_station_a,marzec19_station_b))
a<- as.data.frame(vector)
a<- a %>%
  group_by(vector) %>%
  tally()
marzec19_station <- top_n(a, 2)
marzec19_station<-rename(marzec19_station,start.station.name=vector)
m19<-inner_join(marzec19_station,marzec19,by="start.station.name")
m19<-as.data.frame(m19)
x<-nrow(m19)
m19_sz1<-m19[1,7]
m19_dl1<-m19[1,8]
m19_sz2<-m19[x-1,7]
m19_dl2<-m19[x-1,8]

marzec20_station <- select(marzec20, start.station.name, end.station.name)
marzec20_station_a<- as.vector(select(marzec20, start.station.name))
marzec20_station_b<- as.vector(select(marzec20, end.station.name))
vector<-unlist( c(marzec20_station_a,marzec20_station_b))
b<- as.data.frame(vector)
b<- b %>%
  group_by(vector) %>%
  tally() 
marzec20_station <-top_n(b, 2)
marzec20_station<-rename(marzec20_station,start.station.name=vector)
m20<-inner_join(marzec20_station,marzec20,by="start.station.name")
m20<-as.data.frame(m20)
y<-nrow(m20)
m20_sz1<-m20[1,7]
m20_dl1<-m20[1,8]
m20_sz2<-m20[y-1,7]
m20_dl2<-m20[y-1,8]


styczen20_station <- select(styczen20, start.station.name, end.station.name)
styczen20_station_a<- as.vector(select(styczen20, start.station.name))
styczen20_station_b<- as.vector(select(styczen20, end.station.name))
vector<-unlist( c(styczen20_station_a,styczen20_station_b))
c<- as.data.frame(vector)
c<- c %>%
  group_by(vector) %>%
  tally() 
styczen20_station <- top_n(c, 2)
styczen20_station<-rename(styczen20_station,start.station.name=vector)
styczen20_station<-mutate(styczen20_station,start.station.name=as.character(start.station.name))
s20<-inner_join(styczen20_station,styczen20,by="start.station.name")
s20<-as.data.frame(s20)
z<-nrow(s20)
s20_sz1<-s20[1,7]
s20_dl1<-s20[1,8]
s20_sz2<-s20[z-1,7]
s20_dl2<-s20[z-1,8]

dane <- c(marzec20_station$n, marzec19_station$n, styczen20_station$n)

names(dane) <- c("marzec 2020","marzec 2019","styczen 2020")

map3 <- Leaflet$new()
map3$setView(c(40.715, -74.05), zoom = 13)
map3$marker(c(m19_sz1,m19_dl1), bindPopup = "<p> marzec19_1stacja </p>")
map3$marker(c(m19_sz2,m19_dl2), bindPopup = "<p> marzec2019_2stacja </p>")
map3$marker(c(m20_sz1,m20_dl1), bindPopup = "<p> marzec2020_1stacja </p>")
map3$marker(c(m20_sz2,m20_dl2), bindPopup = "<p> marzec2020_2stacja </p>")
map3$marker(c(s20_sz1,s20_dl1), bindPopup = "<p> styczen2020_1stacja </p>")
map3$marker(c(s20_sz2,s20_dl2), bindPopup = "<p> styczen2020_2stacja </p>")
