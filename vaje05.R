#vaje 5. 23.4.2020
# A. 

#1. Napi??si funkcijo, ki ima za vhodni podatek naravno ??stevilo n in
# vrne njegov faktorial n! = n · (n ??? 1) · . . . · 2 · 1 (ne uporabiti
# vgrajeno funkcijo factorial)

factorial(5)
faktorial<-function(n){
  prod(n:1)
}
faktorial(5)

# 2. Poskusi tudi narediti isto funckijo ampak z rekurzijo:
#   f (n) = (
#     1 if n = 1
#     n ??? f (n ??? 1) otherwise
    

faktorial2<-function(n){
  if (n<=1){
    return(1)
  }else{
    return(n*faktorial2(n-1))
  }
}
faktorial2(5)



#3. Napi??si funkcijo, ki za vhodni parameter x vrne TRUE, ??ce je x
#     naravno ??stevilo, in vrne FALSE druga??ce (TRUE: 4, 1.0 FALSE:
#                                                 0. -2. 3.4).

naravna<-function(n){
  if(n>0 && round(n)==n){
    return(TRUE)
  }else{
    return(FALSE)
  }
}
naravna(1.0)

jenaravna<-function(n){
  return(n>0 && round(n)==n)
}
jenaravna(1.7)

#4. Uporabi(apply) zgornje funkcije na vektorjih.
# 2 / 6
sapply(1:5, faktorial) #vrne vektor
lapply(1:5, faktorial2)#vrne list


#B. 

#1. Napi??si funkcijo incircle, ki za vhodni parametre x in y vrne
#     Boolovo spremenljivko, ki je TRUE ??ce to??cka (x,y) le??zi znotraj
#     kroga (ali na robu) z polmerom 1 in sredi??s??cem v (0,0), in vrne
#     FALSE druga??ce.

incircle<-function(x,y){
  sqrt(x^2+y^2)<=1
}
incircle(1,1)
x<-seq(0,1, 0.1)
x
y<-x
incircle(x,y)

#2. Uporabi(apply) zgornjo funkcijo za vektorja
#     x < ???seq(0, 1, 0.1), y < ???x
#    
mapply(incircle, x,y)

#3. Napi??si funkcijo logbase z parametri x in base, ki izra??cuna in
#     vrne logbase (x), ??ce je base podan in vrne log2(x) ??ce ni. Lahko
#     si pomaga??s z formulo logbase (x) = ln(x)
#     ln(base)
#     .
#     3 / 6
#     
logbase<-function(x,base=2){
  return(log(x)/log(base))
}
logbase(100,10)
logbase(1024)



#C. 
#1. Napi??si funkcijo, ki ima za vhodni podatek numeri??cno matriko
#     in vrne vektor z minimumi iz vsakega stolpca.
#     
colmnames<-function(input_matrix){
  result<-numeric(ncol(input_matrix))
  for(i in 1:ncol(input_matrix)){
    result[i]<-min(input_matrix[,i])
  }
  return(result)

}

numeric(4)#naredi prazen vektor z st mest

m1<-matrix(1:9, nrow = 3)
columnmin(m1)
apply(m1, 2,min)

#2. Napi??si funkcijo, ki ima za vhodne podatke naravna ??stevila
#     nrow,ncol in nmines in vrne nrow × ncol matriko, ki ima
#     nmines elementov enakih TRUE in ostalimi FALSE, nalju??cno
#     razporejenih. 
minolovec<-function(nrow,ncol,nmines){
  vektorTF<-c(rep(TRUE, nmines), rep(FALSE, nrow*ncol-nmines))
  matrix(sample(vektorTF), nrow = ncol)
 
}

logical(4)#naredi vektor z 4 falsez
minolovec(3,4,5)


#Dodaj preverbo, ki preveri ??ce je nmines prevelik
#     (ali druge probleme) in vrne ERROR in vrednost NaN.
#     4 / 6
#     

minolovec1<-function(nrow,ncol,nmines){
  if(nrow*ncol-nmines<0){
    message("error prevec nmines")
    return(NaN)
  }else{
  vektorTF<-c(rep(TRUE, nmines), rep(FALSE, nrow*ncol-nmines))
  matrix(sample(vektorTF), nrow = ncol)
  } 
}

minolovec3<-function(nrow,ncol,nmines){
  tryCatch(minolovec(nrow,ncol,nmines), error=function(e){
    message("error prevec nmines")
    return(NaN)
  })
}
minolovec3(3,4,22)
minolovec1(2,4,10)




#D. 
#1. Napi??si funkcijo, ki ima za vhodne podatke seznam s
#     poimenovanimi atomi??cnimi vrednosti (primer
#     list(a = 1, b = 2, c = 3), in sprinta
#     v konzolo vrednosti: "vrednost
#      spremenljivke a je 1" "vrednost
#     spremenljivke b je 2" ... 


printlist<-function(input_list){
  for(i in 1:length(input_list))
  print(paste("Vrednost spremenljivke " ,names(input_list[i]), "je ",input_list[i]))
  }
}
printlist(list(a = 1, b = 2, c = 3))

#2. Napi??si
#       funkcijo, ki ima za vhodne podatke
     # string in dataframe, ki vsebuje 2
     # stolpca stringov, in vrne spremenjen
     # vhodni string tako, da spremeni vse
     # besede iz stolpca 1 na besede v
     # stolpcu 2. input: inputdf<
     # ???data.frame("From"=c("colour","lift","centre"),
     # "To"=c("color","elevator","center"),stringsAsFactors=F)
     # inputstring< ???"In the centre of the
     # lift there was a banana" , output:
     # "In the center of the elevator there
     # was a banana"
inputdf<-data.frame("From"=c("colour","lift","centre"),"To"=c("color","elevator","center"),stringsAsFactors=F), 
inputstring< ???"In the centre of the lift there was a banana" , output: "In the center of the elevator there was a banana"


prevedi<-function(input_string,input_dataframe){
  library(stringr)
  for(j in 1:nrow(input_dataframe)){
  input_string<-str_replace_all(string = input_string, pattern = input_dataframe[j,1], replacement = input_dataframe[j,2])
  }
  return(input_string)
}

inputdf<-data.frame("From"=c("colour", "lift", "centre"), "To"=c("color", "elevator", "center"), stringsAsFactors = F)
inputstring<-"In the centre of the lift there was a banana" , output: "In the center of the elevator there was a banana"

prevedi(inputstring, inputdf)
