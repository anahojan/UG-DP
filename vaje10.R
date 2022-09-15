#vaje10 29.5.2020
library(tidyverse)
library(dplyr)
library(readxl)

sports<-excel_sheets("~/BIF1/PPROG/R/Vaje/SportsDatabase.xlsx")
View(sports)
# A: lead, lag
 dfB<-data.frame(Day=1:50,Infected=round(1.2^(1:50)))

 
# belezi skupno okuzenih v posameznih dnevih. Dodaj stolpec, ki kaze stevilo novih okuzb.
 dfB%>%mutate(lead=lead(Infected), lag=lag(Infected), new=lead(Infected)-Infected)
# V osnovnemu dfB obrni vrstni red glede na dneve, in nato ponovno izracunaj stevilo novih okuzb.
dfB%>%arrange(desc(Day))%>%mutate(lead=lead(Infected), new=Infected-lead(Infected))

#B
# V L$Coaches zdruzi/unite() ime in priimek v en stolpec s presledkom vmes.
# V L$Teams loci/seperate() barve in vrni stolpec, ki vsebuje nastopajoce barve brez ponovitev 
# in stolpca s stevilom ponovitve vsake kot primarna barva in kot sekundarna barva. Uporabi
# pivot_longer ali gather.





L$Coaches%>%unite(Name,c(2,3),sep = " ")%>%select(Name)

L$Teams%>%select(Colors)%>%separate(Colors,into=c("PrimaryColor", "SecondaryColor"), sep = "/")%>%gather("PS", "Color")%>%group_by(Color)%>%
  summarise(Primary=sum(PS=="PrimaryColor"),Secondary=sum(PS=="SecondaryColor"))


L$Players
#C
# Za vsako ekipo, vrni leto rojstva najstarejsega igralca v njej.
L$Teams%>%inner_join(L$Players, by=c("TeamID"))%>%select(Nickname, BirthDate)%>%
  separate(BirthDate,into = c("m", "d", "y"))%>%group_by(Nickname)%>%summarise(min(y))
# Loci domaci naslov iz L$Players na tri stoplce, prvi s stevilko,
# drugi z imeni (jih je lahko vec) in tretji z tipom ceste (road,drive,lane, .).
L$Players%>%select(Address)%>%separate(Address, into = c("AddNum", "Rest"), sep = " ", extra = "merge")%>%
  separate(Rest, into = c("1", "2", "3"), sep=" ", fill = "left")%>%unite("AddName", c(2,3), sep = " ", na.rm=TRUE)


#D
# Spremeni vrstici z lapply() pri Uvodu s primerno funkcijo.
# Prikazi prve 2 vrstici iz vsakega dataframa v seznamu L.
L<-map(sports, function(x) read_excel("~/BIF1/PPROG/R/Vaje/SportsDatabase.xlsx", sheet = x))
L<-map(L, as.data.frame)
names(L)<-sports

L%>%map(head, n=2)
# V dataframu L$Games, izracunaj aritmeticno sredino vseh numericnih stolpcev. 
# Nato pa se casovno razliko med najstarejsim 
# in najnovejsim dnevom. Namig: lubridate::is.POSIXct()
L$Games%>%map_if(is.numeric, mean)%>%map_if(lubridate::is.POSIXct,function(X)max(X)-min(X))

























