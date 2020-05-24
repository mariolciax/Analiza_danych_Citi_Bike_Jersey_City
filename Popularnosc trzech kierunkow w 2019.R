library(ggplot2)
library(gganimate)
library(tidyr)
library(dplyr)
library("tidyverse")
styczen19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201901-citibike-tripdata.csv")

luty19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201902-citibike-tripdata.csv")

marzec19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201903-citibike-tripdata.csv")
kwiecien19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201904-citibike-tripdata.csv")

maj19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201905-citibike-tripdata.csv")


czerwiec19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201906-citibike-tripdata.csv")

lipiec19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201907-citibike-tripdata.csv")

sierpien19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201908-citibike-tripdata.csv")

wrzesien19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201909-citibike-tripdata.csv")

pazdziernik19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201910-citibike-tripdata.csv")

listopad19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201911-citibike-tripdata.csv")
grudzien19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201912-citibike-tripdata.csv")
library("directlabels")
library("transformr") # devtools::install_github("thomasp85/transformr")
styczen19_trip <- as.data.frame(styczen19)
styczen19_trip <- styczen19_trip %>%
  group_by(tripduration) %>%
  tally()

luty19_trip<- as.data.frame(luty19)
luty19_trip<- luty19_trip %>%
  group_by(tripduration) %>%
  tally()

marzec19_trip<- as.data.frame(marzec19)
marzec19_trip<- marzec19_trip %>%
  group_by(tripduration) %>%
  tally()


kwiecien19_trip<- as.data.frame(kwiecien19)
kwiecien19_trip<- kwiecien19_trip %>%
  group_by(tripduration) %>%
  tally()
maj19_trip<- as.data.frame(maj19)
maj19_trip<- maj19_trip %>%
  group_by(tripduration) %>%
  tally()

czerwiec19_trip<- as.data.frame(czerwiec19)
czerwiec19_trip<- czerwiec19_trip %>%
  group_by(tripduration) %>%
  tally()

lipiec19_trip<- as.data.frame(lipiec19)
lipiec19_trip<- lipiec19_trip %>%
  group_by(tripduration) %>%
  tally()
sierpien19_trip<- as.data.frame(sierpien19)
sierpien19_trip<- sierpien19_trip %>%
  group_by(tripduration) %>%
  tally()
wrzesien19_trip<- as.data.frame(wrzesien19)
wrzesien19_trip<- wrzesien19_trip %>%
  group_by(tripduration) %>%
  tally()
pazdziernik19_trip<- as.data.frame(pazdziernik19)
pazdziernik19_trip<- pazdziernik19_trip %>%
  group_by(tripduration) %>%
  tally()
listopad19_trip<- as.data.frame(listopad19)
listopad19_trip<- listopad19_trip %>%
  group_by(tripduration) %>%
  tally()
grudzien19_trip<- as.data.frame(grudzien19)
grudzien19_trip<- grudzien19_trip %>%
  group_by(tripduration) %>%
  tally()


najczestsze <- as.vector(top_n(styczen19_trip, 3))

a <-data.frame(styczen19_trip, frame=rep(01))
b <- data.frame(luty19_trip, frame=rep(02))
c <- data.frame(marzec19_trip, frame = rep(03))
d<- data.frame(kwiecien19_trip, frame = rep(04))
e <- data.frame(maj19_trip, frame = rep(05))

f<- data.frame(czerwiec19_trip, frame = rep(06))
g<- data.frame(lipiec19_trip, frame = rep(07))
h<-data.frame(sierpien19_trip, frame = rep(08))
i<- data.frame(wrzesien19_trip, frame = rep(09))
j<- data.frame(pazdziernik19_trip, frame = rep(10))
k<- data.frame(listopad19_trip, frame = rep(11))
l<- data.frame(grudzien19_trip, frame = rep(12))

sklejone <- rbind(a, b, c, d, e, f, g, h, i, j, k, l )
 

# Keep only 3 names
don <- sklejone %>% 
  filter(tripduration %in% c("235", "246", "256")) 

# Plot
don %>%
  ggplot( aes(x=frame(), y=n, group=tripduration, color=as.factor(tripduration))) +
  geom_line() +
  geom_point() +
  viridis::scale_color_viridis(discrete = TRUE)+
  ggtitle("Popularnoœæ trzech najczêsciej wybieranych \n
          kierunków w roku 2019") +
  theme_ipsum() +
  ylab("Liczba") +
  transition_reveal(frame)



# Save at gif:
anim_save("Popular_direction.gif")
