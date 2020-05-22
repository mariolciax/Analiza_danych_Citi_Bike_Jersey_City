library("dplyr")
library("RColorBrewer")
styczen20_JC<-read.csv("JC-202001-citibike-tripdata.csv")
luty20_JC<-read.csv("JC-202002-citibike-tripdata.csv")
marzec20_JC<-read.csv("JC-202003-citibike-tripdata.csv")
styczen19_JC<-read.csv("JC-201901-citibike-tripdata.csv")
luty19_JC<-read.csv("JC-201902-citibike-tripdata.csv")
marzec19_JC<-read.csv("JC-201903-citibike-tripdata.csv")


wiek1<-function(df1=marzec19_JC,df2=marzec20_JC,...){
  library("dplyr")
  marzec20_JC<-read.csv("JC-202003-citibike-tripdata.csv")
  marzec19_JC<-read.csv("JC-201903-citibike-tripdata.csv")
  m19<-arrange(marzec19_JC,desc(birth.year))
  wszyscy_19<-nrow(m19)
  starsi60_19<-nrow(filter(m19, birth.year<=1959))
  procent_starsi_19<-(starsi60_19/wszyscy_19)*100
  m20<-arrange(marzec20_JC,desc(birth.year))
  wszyscy_20<-nrow(m20)
  starsi60_20<-nrow(filter(m20, birth.year<=1959))
  procent_starsi_20<-(starsi60_20/wszyscy_20)*100
  par(mfcol=c(1,3))
  barplot(c(wszyscy_19,wszyscy_20), main="Liczba u¿ytkowników",names.arg = c("2019","2020"),ylab="Liczba u¿ytkowników",col=c("mediumaquamarine","plum3"))
  barplot(c(starsi60_19,starsi60_20),main="Liczba u¿ytkowników powy¿ej 60 roku ¿ycia",names.arg = c("2019","2020"),ylab="Liczba u¿ytkowników",col=c("mediumaquamarine","plum3"))
  barplot(c(procent_starsi_19,procent_starsi_20),main="Procentowy udzia³ u¿ytkowników \n powy¿ej 60 roku ¿ycia",names.arg = c("2019","2020"),ylab = "Procentowy udzia³",col=c("mediumaquamarine","plum3"))
}