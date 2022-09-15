#vaje 2. 26.03.2020

#1. Zapi??si matriko m1 in dataframe df1

    # ??? df1 =   "Peter" "Mursic" TRUE "Klavdija" "Kutnar" FALSE "Uros" "Godnov" TRUE
    
    m1<-matrix(c(1:9), ncol=3, byrow = TRUE)
    m1
    df1<-data.frame(A=c("Peter", "Mursic", TRUE),B= c( "Klavdija", "Kutnar", FALSE), C=c("Uros", "Godnov", TRUE))
    df2<-t(df1)
    df2
    
    #2. Matriki m1 poimenuj stolpce z
    colnames(m1)<-c("stolpec1", "stolpec2", "stolpec3")
    rownames(m1)<-c("vrstica1", "vrstica2", "vrstica3")
    m1
    
    
    
    #3. Preimenuj "vrstico2" z "mi??ska"
    rownames(m1)[2]<-"miska"
    m1
    
    
    #4. Katera vrednost je v stoplcu "stopec3" in vrstici "mi??ska"?
     # Zamenjaj ga z 100.
    
    m1["miska", "stolpec3"]
    m1["miska", "stolpec3"]<-100
    m1
    
    
    #5. Zamenjaj vrednosti v stolpcu "stolpec2" z 10,11,12.
    m1["stolpec2"<-10:12]
    
    
    
    #6. Dataframeu df1 poimenuj stolpce z "Ime","Priimek","Spol"
    colnames(df2)<-c("ime", "Priimek", "spol")
    df2
    
    
    #7. Dataframeu df1 dodaj stolpec "Letnik" z vrednostmi 88,80,75,
    nato dodaj ??se vrstico "Ademir","Hujdurovic",TRUE,87.
    
    df2<-cbind(df2, Letnik=c(80, 88, 75))
    df2<-rbind(df2, data.frame(ime="Ademir", Priimrk="Hujdurovic", spol=TRUE, Letnik="89"))
    df2#tukaj nekaj fali
    
 #B   
    
    # 1. Uporabi vgrajen vektor LETTERS ali letters in naredi vektor
    # v1 z vrednostmi 1, 2, 3, ..., 26 katerih imena so ??crke v angle??ski
    # abecedi. Katere po vrstnem redu so v angle??ski abecedi
    # samoglasniki: "a","e","i","o","u"?
   
    library("stringr")
     v1<-1:26
    v1
    
    names(v1)=letters
    v1[c("a", "e", "i", "o", "u")]
   
    
     #   2. Naredi seznam l1 z vrednostmi m1,df1,v1,5 in imeni
    # "matrika","dataframe","vektor","stevilka".
    l1<-list(matrika=m1, dataframe=df2, vektor=v1, stevilka=5)
    
    l1
    
    
    
    # 3. V seznamu l1, spremeni element vrednosti "stevilka" z
    # vrednostjo 6.
    l1["stevilka"]<-6
    l1
    
    
    
    
     # 4. Preobrni vrstni red elementov v seznamu l1, nato preveri kateri
    # element je na prvem mestu.
    l1[4:1]
    l1<-l1[length(l1):1]
    l1[[1]]
    
    
    
    # 5. V seznamu l1, spremeni element "vektor" tako da na dvajseto
    # mesto vrinemo "??s" z vrednostjo 19.5
   
    v1[1:19]
    v1[20:26]
    c(v1[1:19], s=19.5,v1[20:26] )
    l1[["vektor"]]<-c(l1[["vektor"]][1:19], s=19.5,l1[["vektor"]][20:26])
    l1[["vektor"]]
     # 6. Prika??zi prve dve vrstice dataframea "dataframe" znotraj
    # seznama l1.
    l1[["dataframe"]][1:2,]
    head(l1[["dataframe"]], 2)
    
    
    
   # C.
    # 1. Iz vektorja z vrednostmi 1,2,3,1,2,3,2,0,3,4 naredi factor f1.
   v<-c(1,2,3,1,2,3,2,0,3,4)
   f1<-factor(v)
    f1
    
    # 2. Katere vrednosti se pojavijo v f1 in kolikokrat se ponovi 3?
    levels(f1)
    summary(f1)["3"]
    #   3. Zamenjaj vse 2 z 6.
    levels(f1)["3"]<-"6"
    f1
    
    # 4. V katerih mesecih so bili nabrani podatki iz dataframea
    # airquality? Uporabi vgrajen vektor month.name in tudi vrni
    # imena teh mesecev.
    
    levels(factor(airquality$Month))
    month.name[as.numeric(levels(factor(airquality$Month)))]
    
    # 5. Koliko razli??cnih ??stevil cilindrov imajo avti iz dataframea
    # mtcars?
   length(levels(factor(mtcars$cyl)))
    
    
#D  
    
    #  1. V laboratoriju so preverjali pH 100 razli??cnih snovi in so dobili
    # te podatke vpH < ???runif (100, 0, 14). Razporedi pH snovi v
    # faktorje glede na opis iz tabele:
    #   pH <3 3-6 6-8 8-11 >11
    # Opis s. acid w. acid neutral w. base s. base
    # Koliko je mo??cnih kislin (s. acid)?
    
   vpH<-runif(100,0,14) 
   #ta ukaz naredi random vektor dolzine 100 z vrednostimi od 0-14
   
   vpH
   f2<-cut(vpH,breaks=c(0,3,6,8,11,14), labels = c("s. acid", "w. acid", "neutral", "w. base", "s. base"))
   summary(f2)["s. acid"]
   
   
   
   #   2. V anketi smo vpra??sali 65 naklju??cnih pe??scev koliko otrok imajo
    # in odgovori so bili zabele??zeni v
    # cimri < ???sample(0 : 6, 65,replace = T). Razpodredi
    # anktirane v 3 kategorije : 0, 1, ??? 2. Dodaj vrstni red
    # "1" < "2" < "???2".
   cimri<-sample(0:6, 65, replace=T)
   cimri
   f3<-cut(cimri, breaks = c(-1,0,1,6), labels = c("0", "1", ">=2"))
   factor(f3, order=T, lables=c("0", "1", ">=2"))
   f3
   
   
   
   
    # 3. Naredi faktor z 30 elementi enakimi "Kava",30 elementi
    # enakimi "Caj",30 elementi enakimi "Pivo" in 30 elementi
    # enakimi "Sok". Potem jih preme??saj v naklju??cni vrstni red in
    # nato razvrsti nazaj po abecednem redu.
    # 
   
   
   f4<-gl(4,30,labels = c("Kava", "Caj", "Pivo", "Sok"))
   f4
   f4[sample(1:length(f4), length(f4), replace=F)]
   sample(f4)
   f4<-f4[order(f4)]
   f4
   f4<-factor(f4, ordered = T, labels = c("Caj", "Kava", "Pivo", "Sok")
   f4
   
   
#E
   # 1. Sestavi vektor z 50 naklju??cnimi imeni vsako sestavljeno iz petih
   # ??crk, pri ??cemer je samo prva ??crka z veliko za??cetnico. Prva, tretja
   # in peta ??crka so soglasniki in druga in ??cetrta so samoglasniki.
  letters
  samoglasniki<-v1[c("a", "e", "i", "o", "u")]
  LETTERS
  sample(letters[c(1,5,9,15,21)], 1, replace = T)
  sample(letters[-c(1,5,9,15,21)], 1, replace = T))
  paste(sample(LETTERS[-c(1,5,9,15,21)], 1, replace = T),sample(letters[c(1,5,9,15,21)], 1,replace = T),sample(letters[-c(1,5,9,15,21)], 1,replace = T) , sample(letters[c(1,5,9,15,21)], 1, replace = T) , sep = "")
   
  
  
    # 2. V dafaframeu iris vrni samo vrstice vrste "satosa", ki imajo
   # cvete dol??zine manj kot 1.5cm.
      iris[iris$Species=="setosa",]
   
   
   # 3. V dataframeu airquality vrni vrstice z temperaturo med 50 in
   # 60.
      airquality[airquality$Temp>=50&airquality$Temp<=60, ]
      
      
      
   # 4. V dataframeu airquality vrni stolpce "Wind","Day","Month"
   # ampak samo za tiste ki, imajo hitrost vetra ve??c kot 15kmh.
   # 
   airquality[airquality$Wind>15/1.6,c("Temp", "Month", "Day")]
   
   
     