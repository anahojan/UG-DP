#vaje 16/4/2020
# A. 1. Kak??sen je dana??snji datum?
library(lubridate)
today()
#   2. Katerega meseca smo, z imenom?
month(today(), label = TRUE, abbr = FALSE)

#   3. Kateri dan v tednu je danes, z imenom?
wday(today(), label = TRUE, abbr=FALSE)

#   4. Zapi??si vektor v1< ???c("13.1.2021","3.Jan.2011","4 March
#                             14") in ga parsaj v R kot datum.

v1<??? c("13.1.2021","3.Jan.2011","4 March 14")
dmy(v1)

# 5. Koliko dni je preteklo od 1.Feb.2020?

a<-today()-dmy("1.Feb.2020")
a #75
#   6. Koliko dni je v tem letu?
dA1<-dmy("1.1.2020")
dA2<-dA1+years(1)-dA1
dA2

#   7. Zapi??si vektor z imeni v tednu na Bo??zic za leta 2010:2019.
# Katera leta je padel Bo??zi??c na delovnik?

dA3<-dmy("25.12.2010")
v3<-dA3+years(0:9)
wday(dA3+years(0:9),label = T,abbr=F)
year(v3[wday(v3)<7& wday(v3)>1])


#   8. Za leta 2021:2121 povej kateri dan v januarju spet za??cnemo
# ??solo po novoletnih po??citnicah(1:2 so prazniki, in ne moremo
#                                 za??ceti za vikend).
dA5<-dmy("3.1.2021")
v2<-dA5+years(0:100)
v2[wday(v2)==1]<-v2[wday(v2)==1]+days(1)
v2[wday(v2)==7]<-v2[wday(v2)==7]+days(2)
wday(v2)
#BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
# 1. Parsaj spodnje stringe v R kot datum: dB1< ???"April 5th 22",
# dB2< ???"30.1.2020", dB3< ???"2/14/00",
# dB4< ???"2010-6-19", dB5< ???"4. Jan 1999"
dB1<??? "April 5th 22"
dB2<??? "30.1.2020"
dB3<??? "2/14/00"
dB4<??? "2010-6-19"
dB5<??? "4. Jan 1999"
mdy(dB1)
dmy(dB2)
mdy(dB3)
ymd(dB4)
dmy(dB5)

# 2. Formatiraj zgornje datume, tako da se poka??zejo v formatu
# naslednjega(zapi??si dB1 v formatu dB2, dB2 v formatu dB3,
#             dB3 v dB4, dB4 v dB5)
format(mdy(dB1), "%d.%m.%y")

format(dmy(dB2), "%m/%d/%y")

format(mdy(dB3), "%Y-%m-%d")

format(ymd(dB4), "%d. %b %y")


# 3. Importaj "Sample - Superstore.xls" v R in dodaj stolpec
# "Order delay", ki name pove koliko dni je preteklo od datuma
# naro??cila do datuma po??siljke.
library(readxl)
Sample <- read_excel("Sample.xls")
v2<-(Sample$`Ship Date`-Sample$`Order Date`)/86400
v3<-seconds_to_period(Sample$`Ship Date`-Sample$`Order Date`)
cbind(Sample, "order delay"=v3)


#cCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
# 1. Parsaj "2009-1-14 18:30:00 " v R kot datum.
ymd_hms("2009-1-14 18:30:00")


# 2. Razcepi "24.10.1999" na vektor s ??stevili 24,10 in 1999.
library(stringr)
date<-"24.10.1999"
str_split(date, pattern =fixed("."))

# 3. Parsaj "9:15:00 5 Jan 2020" in "1/1/2017 9:15" v R kot
# datum.
dC1<-"9:15:00 5 Jan 2020"
dC2<- "1/1/2017 9:15"
dmy_hm(dC2)
l1<-str_split(dC1,pattern = " ", n=2)
l1[[1]][1]
l2<-paste(l1[[1]][2], l1[[1]][1])
l2
dmy_hms(l2)

# 4. Importaj time series covid19 confirmed global.csv v R.
# Odstrani stolpce 1,3,4. Uporabi funkcijo
# aggregate(df[,-1], by=list(df$Country.Region),FUN=sum) in
# zdru??zi/se??stej ??stevilo oku??zenih za dr??zave s provincami.
# Transponiraj dataframe, pri tem zamenjaj vlogo imena
# stolpcev(dnevi) z dr??zavami. Pravlino parsaj dneve v R.

covid19 <- read_csv("time_series_covid19_confirmed_global.csv")

df2<-covid19[,-c(1,3,4)]
df3<-aggregate(df2[,-1], by=list(df2$`Country/Region`),FUN=sum)

t(df3)
datumi<-colnames(df3)[-1]
datumi
datumi<-as.Date(datumi, "%m/%d/%y")
drzave<-df3$Group.1
df4<-as.data.frame(t(df3[,-1]))
colnames(df4)<-drzave
df4<-cbind("Datumi"=datumi, df4)


#DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
# 1. Koliko znakov(characterjev) in koliko besed je v slovenski
# himni?
library(stringr)
a<-"Zive naj vsi narodi, ki hrepene docakat dan, da koder sonce hodi, prepir iz sveta bo pregnan, da koder sonce hodi, prepir iz sveta bo pregnan, da rojak prost bo vsak, ne vrag, le sosed bo mejak."
sapply(strsplit(a, " "), length) #37
sapply(strsplit(a, "."), length) #194
str_count(a)


#   2. Importaj word.txt in poi??s??ci besede, ki vsubujejo niz "age".
# Kako pogosto se ??crke a-z pojavijo? Razvrsti jih po frekvenci.
word<-read.table(file="word.txt")

word$V1[grepl("age", word$V1)]


result<-numeric(26)
for(i in 1 : 26){
  result[i]<-sum(str_count(word$V1,letters[i]))
}
names(result)=letters
result[order(result)]
sum(str_count(word$V1, "a"))







# 3. V Superstore dataframe Dodaj stolpec z imeni "C.N." kjer iz
# pravega imena iz stolpca "Customer Name" izre??zemo za??cetnici
# prvega in zadnjega imena (za vmesno ime ??ce obstaja ne
#                           napisati ni??c, primer "John Fitzgerald Kennedy"??? >"J.K."






