  styczen19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201901-citibike-tripdata.csv")
  luty19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201902-citibike-tripdata.csv")
  marzec19 <- read.csv("~/R/BIKE_NEW_YORK/JC-201903-citibike-tripdata.csv")
  styczen20 <- read.csv("~/R/BIKE_NEW_YORK/JC-202001-citibike-tripdata.csv")
  luty20 <- read.csv("~/R/BIKE_NEW_YORK/JC-202002-citibike-tripdata.csv")
  marzec20 <- read.csv("~/R/BIKE_NEW_YORK/JC-202003-citibike-tripdata.csv")
  
  library(dplyr)
  library(ggplot2)
  library(gganimate)
  library(gapminder)
  library(gifski)
  
  # Make 2 basic states and concatenate them:
  
  
  data_a<- data.frame(select(luty20, usertype))
  data_a <- data_a %>%
    group_by(usertype) %>%
    tally()
  data_a <- data.frame(data_a, frame=rep('a',2))
  
  data_b<- data.frame(select(marzec20, usertype))
  data_b <- data_b %>%
    group_by(usertype) %>%
    tally()
  data_b<- data.frame(data_b, frame=rep('b',2))
  data <- rbind(data_a, data_b)
  
  data_c<- data.frame(select(styczen20, usertype))
  data_c <- data_c %>%
    group_by(usertype) %>%
    tally()
  data_c<- data.frame(data_c, frame=rep('c',2))
  
  data2<- rbind(data_c, data_a, data_b)
  
  
  # Make a ggplot, but add frame=year: one image per year
  ggplot(data2, aes(x=usertype, y=n, fill=usertype)) + 
    geom_bar(stat='identity') +
    theme_bw() +
    # gganimate specific bits:
    transition_states(
      frame,
      transition_length = 2,
      state_length = 1
    ) +
    ease_aes('sine-in-out')
  
  # Save at gif:
  anim_save("animacja.gif")
  ?ggplot
