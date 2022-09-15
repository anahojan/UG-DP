#VAJE IMPORT EXPORT
library("readxl")
library("writexl")
dfA<-read_xls(path = "../DataVaje/file_example_XLS_50.xls", skip = 2)
#skipamo prvi dve vrstici
dfA2<-read.csv(file = "data_csv.txt")
write_xlsx(dfA2,path = "data_cvs.xlsx")

getwd()
list.files(path = ".")

#BBBBBBBBBBBBBBBBBBBBBB
dfB1<-read.csv(file = "time_series_covid19_confirmed_global.csv")
dfB2<-dfB1[dfB1$Country.Region=="Slovenia", (ncol(dfB1)-6): ncol(dfB1)]
dfB2
#3
sum(dfB1[,ncol(dfB1)])

dfB3<-dfB1[, c(2,ncol(dfB1))]
dfB3
write.csv(dfB3, file = gzfile("dfB3.csv.gz"))

#CCCCCCCCCCCCCCCCCCCC
dfC1<-read.table(file = "SI.txt", sep = "\t")
dfC2<-dfC1[, -(4:9)]

#2 grepl
dfC2[grepl("z", dfC2$V3), 3, drop=F]
dfC2[grepl("h" , dfC2$V3, ignore.case = T), 3]


dfC2[grepl("r$", dfC2$V3),3]

dfC3<-dfC2[dfC2$V2>=6000 & dfC2$V2<7000, 2:3]

write.table(dfC3, file="dfC3.txt", sep="\t")

#DDDDDDDDDDDDDDDDDDDDDD

library("readxl")
dfD1<-read_xls(path = "../DataVaje/Sample.xls")

stoti<-seq(100, nrow(dfD1), 100)

dfD1[stoti,1:7]

#2
dfD2<-levels(factor(dfD1$`Customer Name`))
write_xlsx(dfD2, path = "dfD2.xlsx")

#3
imena<-levels(factor(dfD1$`Customer Name`))
grepl(".* .* .*", imena)

#pika pomeni enkrat karkoli
