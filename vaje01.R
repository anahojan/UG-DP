#Prve vaje
# A. Izra??cunaj z R-jem:
#   1. a = 3 + 5 ??? 10
    a<=3+5-10
    a

#   2. 
    a<=4^5
    a
#   3. ln(3 · 4)
    b<-log(3* 4)
    b
#   4. sin(??), kaj pomeni dobljena vrednost?
    c<-sin(pi)
    c
    #rezultat je 0

#   5.
    sqrt(4)/log10(100)
#  
#   6. | ??? 10| + b4.6c + d3.2e
      abs(-10)+floor(4.6)+ceiling(3.5)
    
      #   B Vektorji:
      #   1. Zapi??si vektor v0 z vrednostmi "miza", "stol", "omara",
      # "okno".
      a<-c("miza", "stol", "omara", "okno")
      a
      # 2. V vektorju v0 zamenjaj ??cetrti element z "polica"
      a[4]<-"polica"
      a
      # 3. Zapi??si vektor v1 z vrednostmi 1, 4, 3, 15, 75
      v1<-c( 1, 4, 3, 15, 75)
      v1
      # 4. Zapi??si vektor v2 z vrednostmi 5, 6, 0,
      # ???
      v2<-c(5, 6, 0, sqrt(2), -4)
      v2
      # 5. Pove??caj vse vrednosti v1 za 3.
      v1+3
      # 6. Podvoji vse vrednosti v v2.
      v2*2
      # 7. Se??stej vektorja v1 in v2.
      v1+v2
      # 8. Poi??s??ci skalarni produkt(excel: sumproduct) vektorjev v1 in v2.
      
      sum(v1*v2)
      # 9. Zdru??zi vektorja v1 in v2 v skupen dalj??si vektor, v tem vrstemredu.
        append(v1, v2)
        
    # C Vektorji:
    #   1. Zapi??si vektor z vrednostmi 1, "a",TRUE. Kaj se je zgodilo?
        v<-c(1,"a", TRUE)
        class(v)
        v
        class(v)
        #zgodil se je coarsion-> vektor je sestavljen iz razlicnih tipov zato je ta vektor pol string
    #   2. Zapi??si vektor v z vrednostmi 1, 2, 3, . . . , 99, 100
        v1<-seq(1:100)
        v1
        
    # 3. Se??stej vse vrednosti v v.
        sum(v1)
    # 4. Izra??cunaj vrednost 1 + 4 + 16 + 25 + 36 + . . . + 10000.
        vsota<-sum(v1^2)
        vsota
    # 5. Poi??s??ci aritmeti??cno sredino vrednosti v v.
        mean(v1)
    # 6. Poi??s??ci minimum in maximum vrednosti iz v.
        min(v1)
        max(v1)
    # 7. Vektorju v zamenjaj vse razen prvih sedemdeset vrednosti na 0.
        v1[71:100]<-0
        v1
        
    # 8. Vektorju v zamenjaj vse razen vsakega pete vrednosti na -1.
        v1[c(-5,-10,-15)]<--1
        v1[seq(-1,-10,-5)]<--1
        v1
  # D Vektorji:
    #   1. Zapi??si vektor z vrednostmi 100, 99, 98, . . . , 2, 1
    v<-c(100:1)
    v<-seq(100,1)
    v
    # 2. Zapi??si vektor z vrednostmi ???100, ???99, ???98, . . . , ???2, ???1
    v<-c(-100:-1)
    v<-seq(-100,-1)
    v
    # 3. Zapi??si vektor z vrednostmi ???1, ???2, ???3, . . . , ???99, ???100
    v<-c(-1:-100)
    v<-seq(-1,-100)
    v
    # 4. Zapi??si vektor z vrednostmi ???50, ???40, ???30, ???20, . . . , 1000
    d<-c(seq(-50, 1000, by=10))
    d<-10*(-5:100)
    d
    # 5. Zapi??si vektor z vrednostmi 1, 4, 7, 10, . . . , 106
    v1<-seq(1, 106, by=3)
    3*(0:35)+1
    v1
     # 6. Poskusi ??se vse zgornje z uporabo : namesto seq.
    # 
# E Seznam(list):
    #   1. Zapi??si seznam l1 z vrednostmi 1, "a",TRUE.
    l1<-list(1, "a", TRUE)
    l1
    
    # 2. Zapi??si seznam l2 z vrednostmi 2, 3, 2, "banana", 1 : 10.
    l2<-list(2, 3, 2, "banana", 1 : 10)
    l2
    # 3. Zamenjaj drugi element seznama l1 z "A".
   l1[2]<-"A"
    l1
    
   # 4. Zapi??si seznam l3, ki je enak seznamu l2 kateremu smo nakonec dodali ??se seznam l1
    l3<-list(l2,l1)
    l3
    # 5. Poi??s??ci ??cetrto vrednost vektorja, ki je na petem mestu seznama l2.
    l2[5]
    
    
    
    # 6. Zapi??si seznam l4 z vrednostmi "pivo", 4.3, l1,"KOPER", l2.
   l4<-list("pivo", 4.3, l1,"KOPER", l2)
    l4
    
     # 7. Zamenjaj tretjo vrednost seznama, ki je na tretjem mestu seznama l4 z vrednostjo -2.
    l4[3]<--2
    l4
    
    # 8. Poi??s??ci vsoto vseh vrednosti seznamu l5 z elementi 4, 5.3, 1.4, 0, ???3, 3, 3.
    l5<-list(4, 5.3, 1.4, 0, ???3, 3, 3)
    do.call(sum, l5)
    sum(unlist(l5))
    
    # F Matrike:
    #   1. Zapi??si matrike
    m1<-t(matrix(1:9, nrow=3))
    m1
    
    m2<-matrix(9:1, ncol=3)
    m2
   
    m3<-matrix(1:4, nrow=2, ncol=6, byrow=TRUE)
    m3
    # 2. Poi??s??ci vsoto matrik m1 in m2.
    m1+m2
    
    # 3. Zmanj??saj vse vrednosti v m3 za 10.
    m3-10
    # 4. Potroji vse vrednosti v m1.
    m1*3
    # 5. Zdru??zi m1 in m2 horizontalno in rezultat zdru??zi vertikalno z
    # m3. rbind in cbind
    mh<-cbind(m1,m2)
    mr<-rbind(mh,m3)
    mr
    # 6. kvadriraj vrednosti v m1
    m1^2
    
 # G Matrike:
    #   1. Poi??s??ci dimenzije matrike m3
   nrow(m3)
   ncol(m3)
    
   # 2. Zamenjaj vrednost v drugi vrstici prvem stoplcu matrike m1 na
    # -1.
    m1[2,1]<--1
    m1
    # 3. Poi??s??ci drugi stolpec matrike m2
    m2[,2]
    
    # 4. Poi??s??ci katerkoli podmatriko v matriki m2 velikosti 2x2 in jo
    # zamenjaj z ni??clami.
    m2[1:2,1:2]<-0
    m2
    
    # 5. Zamenjaj vse razen prvo vrstico v matriki m1 z 5
    m1[-1,]<-5
    m1
    
    # 6. Zapi??si matriko
    a<-c("a","b", "c", "d")
    a
    m4<-matrix(a, nrow = 2, byrow=TRUE )
    m4
    cbind(m4,m3)
    
    # in jo horizontalno zdru??zi z m3. Kaj se je zgodilo?  