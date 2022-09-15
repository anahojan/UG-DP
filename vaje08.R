#pipe
#vaje-08 14-05-2020

library(tidyverse)
#A
    # V dataframu airquality neodvisno od ostalih tock
    #   Prikazi vrstice brez NA in zadnje 4 stolpce

airquality%>%drop_na()
airquality%>%na.omit()%>%select(3:6)
airquality%>%na.omit()%>%select(Wind:Day)
airquality%>%na.omit()%>%select((ncol(.)-3):ncol)
    # Prikazi samo eno petnajstino vrstic in stolpce, ki vsebujejo crko "o".
airquality%>%sample_frac(1/15)%>%select(contains("o")) 
airquality%>%slice_sample(prop=1/15) #ni te funkcije
# Dodaj nov stolpec, ki prikazuje temperaturo v Celzijih. Nato prikazi najmanjso, najvecjo in povprecno temperaturo v celzijih.
airquality%>%mutate(Celyij=(Temp-32)*5/9)


airquality%>%mutate(Celyij=(Temp-32)*5/9)%>%summarise(Najvroce=max(Celyij),Najmrzlo=min(Celyij),povp=mean(Celyij))
# Najdi najbolj varen in najbolj nevaren dan za soncenje.

airquality%>%na.omit()%>%filter(Solar.R==max(Solar.R)|Solar.R==min(Solar.R))
airquality%>%na.omit()%>%top_n(1,-Solar.R) #ce nas zanimajo najvecji oy najmanjsi

#B
    # v dataframu mtcars:
    #   
    # Z uporabo rownames_to_column() dodaj imena avtomobilov v nov stolpec z 
    # imenom "Tip", ga shrani in od tukaj dalje delaj na tem dataframu
   
mtcars2<-mtcars%>%rownames_to_column("Tip")



    # Koliko konjske moci imajo v povprecju avtomobili znamke Mercedes?
mtcars2%>%filter(grepl(pattern = "Merc", x=Tip))%>%summarise(mean(hp))
    #   Prestej koliko avtov ima 4,6, in 8 cilindrov.

mtcars2%>%group_by(cyl)%>%summarise(n())
    # Vrni maximalno in minimalno vrednost za vsak numericni stolpec.
    # 
mtcars2%>%summarise_if(is.numeric,.funs = list(min=min,max=max))
mtcars2%>%summarise(across(.col=is.numeric,.funs=list(min,max))) #te funk ni-across

#C
# Koliko zveznih drzav ima ZDA?
USArrests%>%nrow()

#   Katere tri zvezne drzave so najbolj nevarne v vsakem izmed treh katogorij kriminala?
USArrests%>%top_n(3,Murder)
USArrests%>%top_n(3,Assault)
USArrests%>%top_n(3,Rape)

#   Razvsrti zvezne drzave glede na skupno vrednost aretacij vseh treh kriminalnih dejavnosti.
USA2<-USArrests%>%mutate(Skupno=Murder+Assault+Rape)%>%arrange(desc(Skupno))
# A obstaja korelacija med skupnimi aretacijami in procentom mestnega prebivalstva?
#Narisi regresijsko premico med temi dvemi spremenljivkami in previdi vrednost na obeh ekstremih (100% in 0%).

premica<-lm(Skupno~UrbanPop,data=USA2)
presecisce<-premica[[1]][1]
koeficient<-premica[[1]][2]
USA2%>%ggplot()+geom_point(aes(x=UrbanPop,y=Skupno))+geom_abline(slope = koeficient,intercept = presecisce)  

# Razmislite, kaj bi vas se lahko zanimalo o tej podatovni mnozici.




