#vaje09 21.5.2020


library(dplyr)
library(tidyverse)
library(readxl)

filename="~/BIF1/PPROG/R/Vaje/SportsDatabase.xlsx"
sheetnames<-readxl::excel_sheets(filename)
L<-lapply(sheetnames, function(X) readxl::  read_excel(filename, sheet = X))
L<-lapply(L, as.data.frame)
names(L)<-sheetnames

#A
#Naredi inner_join med L$Teams in L$Players
dfA<-L$Teams%>%inner_join(L$Players, by=c("TeamID"="TeamID"))

#Vrni stolpec z ekipami in stolpec s stevilom igralcev v vsaki ekipi.
dfA%>%group_by(Nickname)%>%summarise(n())
#Kateri igralci nosijo vsaj delno moder dres? Vrni ime in priimek.
dfA%>%filter(grepl("Blue", Colors))%>%select(FirstName, LastName)

#B
#Naredi dvojni inner_join: L$Teams inner_join L$Games inner_join
#L$Teams, prvic preko HomeTeamID drugic preko VisitTeamID.

a<-L$Teams%>%inner_join(L$Games, by=c("TeamID"="HomeTeamID"))%>%inner_join(L$Teams,by=c("VisitTeamID"="TeamID"))

#Katere ekipe so igrale na dan 2005-09-12?
  b<-a%>%filter(grepl("2005-09-12", DatePlayed))%>%select(Nickname.x,Nickname.y)
  
  
#Uporabi pivot_longer ali gather in vrni 1. stolpec z 
#vrednostmi "domaca" ali "gostujoca" in 2. stolpec z imeni ekip.

c<-b%>%rename(Home=Nickname.x, Host=Nickname.y)%>%pivot_longer(cols = c("Home", "Host"), names_to = "Home/Host",
                                                            values_to="Teams")

#C
# Naredi tabelo ekipe x ekipe z NA ce niso igrale, in datumom tekme drugace. 
# Uporabi pivot_wider ali spread.
 a%>%select(DatePlayed, Nickname.x, Nickname.y)%>%pivot_wider(names_from = Nickname.x, values_from=DatePlayed)%>%as.data.frame()

 a%>%select(DatePlayed, Nickname.x, Nickname.y)%>%spread(Nickname.x,DatePlayed)

# Napisi funkcijo z uporabo case_when, ki za dve vhodne numericne vrednosti, 
# vrne 3 ce je prva>druga, vrne 2 ce prva=druga in vrne 0 drugace.

 tocke<-function(x,y){
   case_when(x>y~3, x==y~1, TRUE~0)
 }
 
 
 #D
 
#Koliko tekem je vsak Coach odigral doma?
L$Coaches%>%left_join(L$Games, by=c("TeamID"="HomeTeamID"))%>%group_by(FirstName, LastName)%>%
  summarise(sum(!is.na(TeamID)))
   
#Za vsako ekipo vrni skupno stevilo tock od vseh tekem, 
#kjer je zmaga vredna 3, remi 1 in poraz 0. Uporabi user
#defined function iz prejsnje naloge skupaj z rowwise().


d<-a%>%mutate(HomePoints=tocke(HomeScore,VisitScore))%>%
  mutate(VisitPoints=tocke(VisitScore,HomeScore))%>%
  select(contains("points"), contains("Nickname"))
rbind(d%>%select(Nickname=Nickname.x,Points=HomePoints),
      d%>%select(Nickname=Nickname.y,Points=VisitPoints))%>%
  group_by(Nickname)%>%summarise(sum(Points))

