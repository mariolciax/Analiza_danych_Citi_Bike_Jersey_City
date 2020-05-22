library("dplyr")
library("RColorBrewer")
marzec20_JC<-read.csv("JC-202003-citibike-tripdata.csv")
marzec19_JC<-read.csv("JC-201903-citibike-tripdata.csv")
marzec18_JC<-read.csv("JC-201803-citibike-tripdata.csv")

wiek1<-function(df1=marzec19_JC,df2=marzec20_JC,...){
  library("dplyr")
  marzec20_JC<-read.csv("JC-202003-citibike-tripdata.csv")
  marzec19_JC<-read.csv("JC-201903-citibike-tripdata.csv")
  marzec18_JC<-read.csv("JC-201803-citibike-tripdata.csv")
  m18<-arrange(marzec18_JC,desc(birth.year))
  wszyscy_18<-nrow(m18)
  starsi60_18<-nrow(filter(m18, birth.year<=1959))
  procent_starsi_18<-(starsi60_18/wszyscy_18)*100
  m19<-arrange(marzec19_JC,desc(birth.year))
  wszyscy_19<-nrow(m19)
  starsi60_19<-nrow(filter(m19, birth.year<=1959))
  procent_starsi_19<-(starsi60_19/wszyscy_19)*100
  m20<-arrange(marzec20_JC,desc(birth.year))
  wszyscy_20<-nrow(m20)
  starsi60_20<-nrow(filter(m20, birth.year<=1959))
  procent_starsi_20<-(starsi60_20/wszyscy_20)*100
  par(mfcol=c(1,3))
  barplot(c(wszyscy_18,wszyscy_19,wszyscy_20), main="Liczba użytkowników",names.arg = c("2018","2019","2020"),ylab="Liczba użytkowników",col=c("mediumaquamarine","plum3","tan2"))
  barplot(c(starsi60_18,starsi60_19,starsi60_20),main="Liczba użytkowników powyżej 60 roku życia",names.arg = c("2018","2019","2020"),ylab="Liczba użytkowników",col=c("mediumaquamarine","plum3","tan2"))
  barplot(c(procent_starsi_18,procent_starsi_19,procent_starsi_20),main="Procentowy udział użytkowników \n powyżej 60 roku życia",names.arg = c("2018","2019","2020"),ylab = "Procentowy udział",col=c("mediumaquamarine","plum3","tan2"))
}
