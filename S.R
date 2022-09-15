#skripta



#UVOZ IZVOZ
      #read.csv()
      #csv-comma seperated value je v Zahodni evropi podpi훾je
      #Prvi CSV prevzema da so podatki lo훾eni z vejico in decimalna je pika.
      #CSV2 je vejica je podpi훾je in decimalka vejica.
      #Write.csv
      #Write.csv2
      write.table(airquality, file = "./Data/airquality.Rds")
      
      data <- read.table(file = "./Data/airquality.rds")
      
      write.csv(airquality, file = "./Data/airquality.csv")
      
      write.csv2(airquality, file = "./Data/airquality1.csv")
      
      write.csv(mtcars, file = gzfile("./Data/mtcars.csv.gz"))
      
      
      #Uvoz excela
      #openxlsx-je izredno po훾asen
      #readxl-branja excela
      #writexl-pisanje excwela
      
      library("writexl")
      library("openxlsx")
      library("tibble")
      library("rio")
      library("readxl")
      write_xlsx(
        airquality,
        path = "./Data/airquality.xlsx"
        df <- read_xlsx(path = "./Data/airquality.xlsx")
        as_tibble(df)
        
        dfcsv <- import(file = "./Data/airquality.csv")
        
        import(file = "./Data/mtcars.csv.gz")
        
        dfxlsx <- import(file = "./Data/airqality.xlsx")
        
  ##################################
#OBJEKTI
  
      x <- c(2.1, 4.2, 3.3, 5.4)
      x[x > 3]
      y <- x[-c(1, 3)]
      y
      
      
      mylist <- list(
        x = c(1, 5, 7),
        y = c(4, 2, 6),
        y = c(0, 3, 4)
      )
      
      mylist[[2]][[3]]
      mylist$y[[3]]
      
      imeelementa <- "y"
      names(mylist) == imeelementa
      
      
  #matrike
      a <- matrix(1:9, nrow = 3)
      colnames(a) <- c("A", "B", "C")
      a[1:2,]
      #prvo mesto so vrstice in drugo mesto so stolpci
      a[1, ]
      a[, ]
      a[1, , drop = FALSE]
      a[1, 1, drop = FALSE]
      
      #dataframe.R jih ima kar precej vgrajenih dataframi
      cars
      library(tibble)
      as_tibble(cars[, 1])
      
      cars[, c(1, 2), drop = FALSE]
      
      View(airquality)
      View(cars)
      
      cars[cars$speed == 4,]
      cars[cars$speed > 10,]
      cars[cars$speed > 10 & cars$dist <= 20,]
      # & and
      # | or
      
      View(airquality)
      airquality[airquality$Temp > 75 &
                   airquality$Wind > 12, c("Temp", "Wind")]
  
  #GREPL-funkcija grepl je case sensetive
  
      imenastolpcev <- colnames(airquality)
      imenastolpcev <- grepl("n",colnames((airquality))
     grepl("t", colnames((airquality)))
     airquality[, grepl("t", colnames(airquality), ignore.case = TRUE), drop =
                  FALSE]
     
     airquality[, seq(1, ncol(airquality), by = 2)]
    
  #SUBSET-funkcija subset
    #subset(x-dataframe, subset, select)
     subset(airquality, airqality$Temp > 75 & airquality$Wind > 12, c("Temp", "Month"))
     subset(airquality, airquality$Temp > 75 & airquality$Wind > 12, c("Temp", "Month"))
     
     x <- c("1", 34, TRUE)
     1 <- list(x, cars)
     1
    
    df1 <- airquality
    df2 <- mtcars
    l <- list(df1, df2)
    names(l) <- c("airquality", "mtcars")
    l
    l[[2]]$hp
    
    str(l)
    l$airquality$Month
    
    l$airquality$Ozone[1:6]
    mean(airquality$Ozone[1:6])
    
    mean(airquality$Ozone[1:6], na.rm = TRUE)
    #na.rm bo na vrednosti sle ven in bomo dobili nazaj rezultat 27
    
    
    ##############################################################
    #Prve vaje
    # A. Izra??cunaj z R-jem:
    #   1. a = 3 + 5 ??? 10
    a<=3+5-10
    a
    
    #   2. 
    a<=4^5
    a
    #   3. ln(3 � 4)
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
    
    
    
    
    
    
    
    
    
    
    
    
    ################################################################
    #VAJE
    
    #Exercise 1 _
    #Subset the vector, "mtcars[,1]", for values greater than "15.0". _
    subset(mtcars[, 1], mtcars[, 1] > "15,0", , drop = FALSE)
    
    #Exercise 2 _
    #Subset the dataframe, "mtcars" for rows with "mpg" greater than , or equal to, 21 miles per gallon. _
    subset(mtcars, mtcars$mpg >= 21, )
    
    
    #Exercise 3 _
    #?Subset "mtcars" for rows wih "cyl" less than "6", and "gear" exactly equal to "4". _
    subset(mtcars, mtcars$cly < 6 & mtcars$gear == 4, )
    
    
    #Exercise 4 _
    #Subset "mtcars" for rows greater than, or equal to, 21 miles per gallon. Also, select only the columns, "mpg" through "hp". _
    a <- subset(mtcars, mtcars$mpg >= 21)
    a[c("mpg", "hp")]
    
    
    
    
    #Exercise 5 _
    #Subset "airquality" for "Ozone" greater than "28", or "Temp" greater than "70". Return the first five rows. _
    b <-
      subset(airquality, airquality$Ozone > "28" |
               airquality$Temp > 70)
    b[1:5,]
    
    
    
    
    #Exercise 6 _
    #Subset "airquality" for "Ozone" greater than "28", and "Temp" greater than "70". Select the columns, "Ozone" and "Temp". _ Return the first five rows. _
    c <-
      subset(
        airquality,
        airquality$Ozone > 28 & airquality$Temp > 70,
        c("Ozone", "Temp")
      )
    c[1:5,]
    
    
    #Exercise 7 _
    #Subset the "CO2" dataframe for "Treatment" values of "chilled",
    #and "uptake" values greater that "15". Remove the category, "conc". Return the first 10 rows.
    CO2
    df <- subset(CO2, CO2$Treatment == "chilled" & CO2$uptake > 15)
    df[1:10, c(1:3, 5)]
    
    #Exercise 8 _
    #Subset "airquality" for "Ozone" greater than "100". Select the columns "Ozone", "Temp", "Month" and "Day" only.
    d <- subset(airquality, airquality$Ozone > 100)
    d[, c(1, 4:6)]
    
    #Exercise 9 _
    #From mtcars dataset show only columns with the letter p in their names, where number of cyl=6!
    mtcars[grepl("p", colnames(mtcars))]

    #Exercise 10 _
    #From mtcars dataset show only every other column and every 7th row. Generate sequences for rows and columns!
    
    # Exercise 11 _
    #
    # Create a list of the following dataframes: iris, cars, mtcars. Subset the list and calculate the mean for the last 6 rows of the mtcars' wt column.
    
    #########################################
 #HEADTAIL   
    
    library(tibble)
    as_tibble(airquality)
    
        head(airquality, 10)
        tail(airquality, 3)
        
        age <- rnorm(100, mean = 60, sd = 20)
        age
        #creating factors <50; 50-70; >70
        
        ageF <- factor(cut(age, breaks = c(
          min(age) - 1, 50, 70, max(age)
        )),
        labels = c("<50", "50-70", ">70"))
        ageF
        levels(ageF)
        
    ###########################################
  #STRINGI
    #predavanje 26.3.2020
    
    library("stringr")
    #zacne se s konkatinacijo -zdruzevanje stringov
    
    string1 <- "Danes"
    string2 <- "je lep dan"
    paste(string1, string2) #po defoltu je whitespace
    
    string3 <- NA
    paste(string1, string3)
    
    #v r ju imamo posebno funkcijo za concatinate
    str_c(string1, string2) # nima po defaultu whitespace
    
    str_c(string1, string2, sep = " ")
    
    
    str_c(string1, string3, sep = " ")
    # uporabljaj str_c ker je bolj pravilen
    
    #dolzina stringa v r
    nchar(string1)
    
    #ta pogleda koliko je elementov noter
    length(string1)
    length(string2)
    length((c("Bruce", "wayne")))
    
    str_length(string1)
    #paziti moramo pri velikih paketih saj se imena funkcij podvajajo,
    #zato damo ime knjiznice dvojno dvopicje in funkcijo
    
    stringr::str_length(string1)
    
    stringr::str_length(c("Bruce", "wayne"))
    
    
    f <- factor(c("good", "moderate", "bad"))
    nchar(f)
    stringr::str_length(f)
    #od stringerja se ne ozira ali je vektor ali je faktor
    
    #ekstrakcija stringov-substring
    # str_sub()
    # extracts parts of strings based on their location
    # first argument, string, is a vector of strings
    # the arguments start and end specify the boundaries of the piece to extract in characters
    # both start and end can be negative integers, in which case, they count from the end of the string
    #poveste kje zacnete in kje koncate
    
    str_sub(c("Bruce", "wayne"), 1, 4)
    
    str_sub(c("Bruce", "wayne"), -4, -1)
    #z minusi pomeni da greste od vzadaj
    
    
    #detektiranje
    # str_detect(): answers the question: Does the string contain the pattern?
    #   str_subset(): subsetting strings based on match
    # str_count(); counting matches
    
    pizzas <- c("cheese", "pepperoni", "sauce", "green peppers")
    str_detect(pizzas, pattern = "pepper")
    str_detect(pizzas, pattern = "auc")
    #po defoltu je partial matching
    str_detect(pizzas, pattern = "auc")
    
    str_subset(pizzas, pattern = fixed("pepper"))
    str_subset(pizzas, pattern = fixed("."))
    
    
    # str_split(): pull apart raw string data into more useful variables
    
    date_ranges <-
      c("23.01.2017 - 29.01.2017", "30.01.2017 - 06.02.2017")
    split_dates <- str_split(date_ranges, pattern = fixed(" - "))
    split_dates
    class(str_split(date_ranges, pattern = fixed(" - ")))
    #dobimo list
    unlist(str_split(date_ranges, pattern = fixed(" - ")))
    #dobimo vektor
    
    
    #replacement
    ids <- c("ID#: 192", "ID#: 118", "ID#: 001")
    
    # Replace "ID#: " with ""
    id_nums <- str_replace(ids, "ID#: ", "")
    
    id_nums
    ## [1] "192" "118" "001"
    phone_numbers <- c("510-555-0123", "541-555-0167")
    #zamenja samo ta prvega po defoltu
    
    str_replace_all(phone_numbers, "-", ".")
    ## [1] "510.555.0123" "541.555.0167"
    
    str_sub(ids, 6, 8)
    
    # open names.txt and copy the content
    # you'll turn a vector of full names, like "Bruce Wayne", into abbreviated names like "B. Wayne". This requires combining str_split(), str_sub() and str_c().
    # do task using str_split with simplify=TRUE
    # calculate how many names end with a, h, s and e.
    
    names <-
      c(
        "Sophia Abbe",
        "Olivia Abbett",
        "Emma Abbey",
        "Ava Abbitt",
        "Isabella Abbot",
        "Mia Abbott",
        "Aria Abbs",
        "Riley Abby",
        "Zoe Abdon",
        "Amelia Able",
        "Layla Abner",
        "Charlotte Abney",
        "Aubrey Aborn",
        "Lily Abrahams",
        "Chloe Abram",
        "Harper Abram",
        "Evelyn Ace",
        "Adalyn Acey",
        "Emily Acker",
        "Abigail Ackerley",
        "Madison Ackerly",
        "Aaliyah Ackerman",
        "Avery Ackers",
        "Ella Ackert",
        "Scarlett Ackland",
        "Maya Ackland",
        "Mila Ackley",
        "Nora Acklin",
        "Camilla Ackroyd",
        "Arianna Acock",
        "Eliana Acomb",
        "Hannah Acomb",
        "Leah Acors",
        "Ellie Acre",
        "Kaylee Acreman",
        "Kinsley Acres",
        "Hailey Acton",
        "Madelyn Acuff",
        "Paisley Acy",
        "Elizabeth Adams",
        "Addison Adcock",
        "Isabelle Adcox",
        "Anna Addams",
        "Sarah Adderley",
        "Brooklyn Adderly",
        "Mackenzie Addicott",
        "Victoria Addington",
        "Luna Addy",
        "Penelope Ade",
        "Grace Ades"
      )
    
    (str_split(names, " ", simplify = TRUE))
    #dobimo matriko
    ime <- (str_split(names, " ", simplify = TRUE))[, 1]
    priimek <- (str_split(names, " ", simplify = TRUE))[, 2]
    str_sub(ime[1], 1, 1)
    str_c(str_c(str_sub(ime, 1, 1), ".", sep = ""), priimek, sep = " ")
    
    ime
    zadnjacrkaimena <- str_sub(ime, -1,-1)
    zadnjacrkaimena
    class(zadnjacrkaimena)
    str_count(zadnjacrkaimena, pattern = "a")
    str_count(zadnjacrkaimena, pattern = "h")
    str_count(zadnjacrkaimena, pattern = "s")
    str_count(zadnjacrkaimena, pattern = "e")
    
    #if-statements
    x <- 5
    if (x > 0) {
      print("Nenegativno stevilo")
    } else{
      print("Stevilo je negativno")
    }
    
    if (test_expression1) {
      statement1
    } else if (test_expression2) {
      statement2
    } else if (test_expression3) {
      statement3
    } else {
      statement4
    }
    
    a = c(5, 7, 2, 9)
    ifelse(a %% 2 == 0, "even", "odd")
    
    a <- 1:10
    b <- 1:10
    res <- numeric(length = length(a))
    for (i in seq_along(a)) {
      res[i] <- a[i] + b[i]
    }
    res
    
    
    x <- c(2, 5, 30, 9, 8, 11, 6)
    count <- 0
    for (val in x) {
      if (val %% 2 == 0)
        count = count + 1
    }
    print(count)
    
    #random vrednost
    sample(1:30, 5, replace = TRUE)
    #replace=true pomeni da se stevila lahko ponavljajo
    
    #
    set.seed(1234)#strevilka znotraj oklepaja nima nobene veze
    sample(1:10, 5)
    #random lahko shramimo zacasno v casu seanse
    
    
    
    while (test_expression) {
      statement
      #se izvaja dokler je true
    }
    
    i <- 1
    while (i <= 6) {
      print(i)
      i = i + 1
    }
    
    
    if (test_expression) {
      break
    }
    ####################
    #a break statement is used inside a loop (repeat, for, while) to stop the iterations and flow the control outside of the loop
    x <- 1:5
    for (val in x) {
      if (val == 3) {
        break
      }
      print(val)
    }
    
    #a next statement is useful when we want to skip the current iteration of a loop without terminating it
    #next je v drugih jezikih continue
    if (test_condition) {
      next
    }
    ######################
    x <- 1:5
    for (val in x) {
      if (val == 3) {
        next
      }
      print(val)
    }
    #repeat se izvaja neskoncnokrat dokler vi ne date breAK
    
    repeat {
      statement
    }
    ##############
    
    x <- 1
    repeat {
      print(x)
      x = x + 1
      if (x == 6) {
        break
      }
    }
    
    #################################
    #VAJE LOOPS#
    
    #Exercise 1
    #For the first exercise, write a repeat{} loop that prints all the even numbers from 2 - 10, via incrementing the variable, "i <- 0".
    # x<-1
    # repeat {
    #   print(x)
    #   val=x+1
    #   val
    # if(val %% 2 = 0 ){
    #   val
    # }
    # elseif(val>10){
    #   break
    #   }
    #
    # }
    
    
    # Exercise 2
    # Using the following variables:
    
    # msg <- c("Hello")
    # i <- 1
    
    # Write a repeat{} loop that breaks off the incrementation of, "i", after 5 loops, and prints "msg" at every increment.
    
    # Exercise 3
    #With, i <- 1, write a while() loop that prints the odd numbers from 1 through 7.
    
    # Exercise 4
    # Using the following variables:
    #
    #   msg <- c("Hello")
    # i <- 1
    #
    # Write a while() loop that increments the variable, "i", 6 times, and prints "msg" at every iteration.
    #
    # Exercise 5
    # For this exercise, write a for() loop that prints the first four numbers of this sequence: x <- c(7, 4, 3, 8, 9, 25).
    #
    # Exercise 6
    # For the next exercise, write a for() loop that prints all the letters in y <- c("q", "w", "e", "r", "z", "c").
    #
    # Exercise 7
    # Write a nested loop, where the outer for() loop increments "a" 3 times, and the inner for() loop increments "b" 3 times. The break statement exits the inner for() loop after 2 incrementations. The nested loop prints the values of variables, "a" and "b".
    #
    # Exercise 8
    # Finally, write a for() loop that uses next to print all values except "3" in the following variable: i <- 1:5
    #
    
    ##################################################
    #vaje 2. 26.03.2020
    
    #1. Zapi??si matriko m1 in dataframe df1
    
    # ??? df1 =   "Peter" "Mursic" TRUE "Klavdija" "Kutnar" FALSE "Uros" "Godnov" TRUE
    
    m1 <- matrix(c(1:9), ncol = 3, byrow = TRUE)
    m1
    df1 <-
      data.frame(
        A = c("Peter", "Mursic", TRUE),
        B = c("Klavdija", "Kutnar", FALSE),
        C = c("Uros", "Godnov", TRUE)
      )
    df2 <- t(df1)
    df2
    
    #2. Matriki m1 poimenuj stolpce z
    colnames(m1) <- c("stolpec1", "stolpec2", "stolpec3")
    rownames(m1) <- c("vrstica1", "vrstica2", "vrstica3")
    m1
    
    
    
    #3. Preimenuj "vrstico2" z "mi??ska"
    rownames(m1)[2] <- "miska"
    m1
    
    
    #4. Katera vrednost je v stoplcu "stopec3" in vrstici "mi??ska"?
    # Zamenjaj ga z 100.
    
    m1["miska", "stolpec3"]
    m1["miska", "stolpec3"] <- 100
    m1
    
    
    #5. Zamenjaj vrednosti v stolpcu "stolpec2" z 10,11,12.
    m1["stolpec2" <- 10:12]
    
    
    
    #6. Dataframeu df1 poimenuj stolpce z "Ime","Priimek","Spol"
    colnames(df2) <- c("ime", "Priimek", "spol")
    df2
    
    
    #7. Dataframeu df1 dodaj stolpec "Letnik" z vrednostmi 88,80,75,
    nato dodaj ??se vrstico "Ademir",
    "Hujdurovic",
    TRUE,
    87.
    
    df2 <- cbind(df2, Letnik = c(80, 88, 75))
    df2 <-
      rbind(
        df2,
        data.frame(
          ime = "Ademir",
          Priimrk = "Hujdurovic",
          spol = TRUE,
          Letnik = "89"
        )
      )
    df2#tukaj nekaj fali
    
    #B
    
    # 1. Uporabi vgrajen vektor LETTERS ali letters in naredi vektor
    # v1 z vrednostmi 1, 2, 3, ..., 26 katerih imena so ??crke v angle??ski
    # abecedi. Katere po vrstnem redu so v angle??ski abecedi
    # samoglasniki: "a","e","i","o","u"?
    
    library("stringr")
    v1 <- 1:26
    v1
    
    names(v1) = letters
    v1[c("a", "e", "i", "o", "u")]
    
    
    #   2. Naredi seznam l1 z vrednostmi m1,df1,v1,5 in imeni
    # "matrika","dataframe","vektor","stevilka".
    l1 <- list(
      matrika = m1,
      dataframe = df2,
      vektor = v1,
      stevilka = 5
    )
    
    l1
    
    
    
    # 3. V seznamu l1, spremeni element vrednosti "stevilka" z
    # vrednostjo 6.
    l1["stevilka"] <- 6
    l1
    
    
    
    
    # 4. Preobrni vrstni red elementov v seznamu l1, nato preveri kateri
    # element je na prvem mestu.
    l1[4:1]
    l1 <- l1[length(l1):1]
    l1[[1]]
    
    
    
    # 5. V seznamu l1, spremeni element "vektor" tako da na dvajseto
    # mesto vrinemo "??s" z vrednostjo 19.5
    
    v1[1:19]
    v1[20:26]
    c(v1[1:19],   s  = 19.5, v1[20:26])
    l1[["vektor"]] <-
      c(l1[["vektor"]][1:19],   s  = 19.5, l1[["vektor"]][20:26])
    l1[["vektor"]]
    # 6. Prika??zi prve dve vrstice dataframea "dataframe" znotraj
    # seznama l1.
    l1[["dataframe"]][1:2,]
    head(l1[["dataframe"]], 2)
    
    
    
    # C.
    # 1. Iz vektorja z vrednostmi 1,2,3,1,2,3,2,0,3,4 naredi factor f1.
    v <- c(1, 2, 3, 1, 2, 3, 2, 0, 3, 4)
    f1 <- factor(v)
    f1
    
    # 2. Katere vrednosti se pojavijo v f1 in kolikokrat se ponovi 3?
    levels(f1)
    summary(f1)["3"]
    #   3. Zamenjaj vse 2 z 6.
    levels(f1)["3"] <- "6"
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
    
    vpH <- runif(100, 0, 14)
    #ta ukaz naredi random vektor dolzine 100 z vrednostimi od 0-14
    
    vpH
    f2 <-
      cut(
        vpH,
        breaks = c(0, 3, 6, 8, 11, 14),
        labels = c("s. acid", "w. acid", "neutral", "w. base", "s. base")
      )
    summary(f2)["s. acid"]
    
    
    
    #   2. V anketi smo vpra??sali 65 naklju??cnih pe??scev koliko otrok imajo
    # in odgovori so bili zabele??zeni v
    # cimri < ???sample(0 : 6, 65,replace = T). Razpodredi
    # anktirane v 3 kategorije : 0, 1, ??? 2. Dodaj vrstni red
    # "1" < "2" < "???2".
    cimri <- sample(0:6, 65, replace = T)
    cimri
    f3 <-
      cut(
        cimri,
        breaks = c(-1, 0, 1, 6),
        labels = c("0", "1", ">=2")
      )
    factor(f3, order = T, lables = c("0", "1", ">=2"))
    f3
    
    
    
    
    # 3. Naredi faktor z 30 elementi enakimi "Kava",30 elementi
    # enakimi "Caj",30 elementi enakimi "Pivo" in 30 elementi
    # enakimi "Sok". Potem jih preme??saj v naklju??cni vrstni red in
    # nato razvrsti nazaj po abecednem redu.
    #
    
    
    f4 <- gl(4, 30, labels = c("Kava", "Caj", "Pivo", "Sok"))
    f4
    f4[sample(1:length(f4), length(f4), replace = F)]
    sample(f4)
    f4 <- f4[order(f4)]
    f4
    f4 <-
      factor(
        f4,
        ordered = T,
        labels = c("Caj", "Kava", "Pivo", "Sok")
        f4
        
        
        #E
        # 1. Sestavi vektor z 50 naklju??cnimi imeni vsako sestavljeno iz petih
        # ??crk, pri ??cemer je samo prva ??crka z veliko za??cetnico. Prva, tretja
        # in peta ??crka so soglasniki in druga in ??cetrta so samoglasniki.
        #letters
        samoglasniki <- v1[c("a", "e", "i", "o", "u")]
        LETTERS
        sample(letters[c(1, 5, 9, 15, 21)], 1, replace = T)
        sample(letters[-c(1, 5, 9, 15, 21)], 1, replace = T)
      )
    paste(
      sample(LETTERS[-c(1, 5, 9, 15, 21)], 1, replace = T),
      sample(letters[c(1, 5, 9, 15, 21)], 1, replace = T),
      sample(letters[-c(1, 5, 9, 15, 21)], 1, replace = T) ,
      sample(letters[c(1, 5, 9, 15, 21)], 1, replace = T) ,
      sep = ""
    )
    
    
    
    # 2. V dafaframeu iris vrni samo vrstice vrste "satosa", ki imajo
    # cvete dol??zine manj kot 1.5cm.
    iris[iris$Species == "setosa",]
    
    
    # 3. V dataframeu airquality vrni vrstice z temperaturo med 50 in
    # 60.
    airquality[airquality$Temp >= 50 & airquality$Temp <= 60, ]
    
    
    
    # 4. V dataframeu airquality vrni stolpce "Wind","Day","Month"
    # ampak samo za tiste ki, imajo hitrost vetra ve??c kot 15kmh.
    #
    airquality[airquality$Wind > 15 / 1.6, c("Temp", "Month", "Day")]
    
    
    ####################################################
    #VAJE IMPORT EXPORT
    library("readxl")
    library("writexl")
    dfA <-
      read_xls(path = "../DataVaje/file_example_XLS_50.xls", skip = 2)
    #skipamo prvi dve vrstici
    dfA2 <- read.csv(file = "data_csv.txt")
    write_xlsx(dfA2, path = "data_cvs.xlsx")
    
    getwd()
    list.files(path = ".")
    
    #BBBBBBBBBBBBBBBBBBBBBB
    dfB1 <-
      read.csv(file = "time_series_covid19_confirmed_global.csv")
    dfB2 <-
      dfB1[dfB1$Country.Region == "Slovenia", (ncol(dfB1) - 6):ncol(dfB1)]
    dfB2
    #3
    sum(dfB1[, ncol(dfB1)])
    
    dfB3 <- dfB1[, c(2, ncol(dfB1))]
    dfB3
    write.csv(dfB3, file = gzfile("dfB3.csv.gz"))
    
    #CCCCCCCCCCCCCCCCCCCC
    dfC1 <- read.table(file = "SI.txt", sep = "\t")
    dfC2 <- dfC1[, -(4:9)]
    
    #2 grepl
    dfC2[grepl("z", dfC2$V3), 3, drop = F]
    dfC2[grepl("h" , dfC2$V3, ignore.case = T), 3]
    
    
    dfC2[grepl("r$", dfC2$V3), 3]
    
    dfC3 <- dfC2[dfC2$V2 >= 6000 & dfC2$V2 < 7000, 2:3]
    
    write.table(dfC3, file = "dfC3.txt", sep = "\t")
    
    #DDDDDDDDDDDDDDDDDDDDDD
    
    library("readxl")
    dfD1 <- read_xls(path = "../DataVaje/Sample.xls")
    
    stoti <- seq(100, nrow(dfD1), 100)
    
    dfD1[stoti, 1:7]
    
    #2
    dfD2 <- levels(factor(dfD1$`Customer Name`))
    write_xlsx(dfD2, path = "dfD2.xlsx")
    
    #3
    imena <- levels(factor(dfD1$`Customer Name`))
    grepl(".* .* .*", imena)
    
    #pika pomeni enkrat karkoli
    
    ################################################
    #predavanje 18.3.2020
    
    library(rowr)
    DF1 <-
      data.frame(A = c(1, 2, 3), B = c("apple", "banana", "lemon"))
    df2 <- data.frame(C = c("car", "truck"))
    cbind.fill(DF1, df2, fill = NA)
    
    library(plyr)
    DF1 <-
      data.frame(A = c(1, 2, 3), B = c("apple", "banana", "lemon"))
    B = c("apple", "banana", "lemon")
  )
  df2 <- data.frame(C = c(4, 5, 6), D = c("bike", "plane", "train"))
  rbind.fill(DF1, df2)
  
  files <-
    list.files(
      pattern = "*.csv",
      path = "./Mcars/",
      full.names = TRUE
    )
  
  files
  list_of_frames <- ()
  for (i in 1:length(files)) {
    list_of_frames[[i]] <- read.csv2(files[i])
  }
  
  dfAll <- do.call("rbind", list_of_frames)
  
  #export airquality dataset as csv, rds, xlsx, gz
  data("airquality")
  
  write.csv(airquality, file = "airquality.csv")
  saveRDS(airquality, "airqulity.rds")
  
  #datumi
  library("lubridate")
  date <- "2019-05-05"
  time <- "28:25:31"
  
  datetime <- paste(date, time)
  datetime
  class(datetime)
  
  date1 <- as.POSIXct(datetime) #vektor
  date2 <- as.POSIXlt(datetime) #list
  
  class(date1)
  class(date2)
  
  unclass(date1)
  unclass(date2)
  
  today()
  now()
  
  Sys.Date()
  Sys.time()
  
  #pretvarjanje stringov v datum
  ymd("2017-01-31")
  
  mdy("January 31, 2017") #pazi na jezik
  
  dmy("31-Jan-2017")
  
  dmy("17/10/2018")
  
  ymd_hms("2017-01-31 20:11:59")
  
  mdy_hm("01/31/2017 08:01")
  
  
  year <- 2007
  month <- 11
  day <- 5
  hour <- 15
  minutes <- 7
  make_date(year, month, day)
  make_datetime(year, month, day, hour, minutes)
  
  library("lubridate")
  as_datetime()
  as_date()
  as.Date()
  as_datetime(
    now()
    ## [1] "2020-03-15 UTC"
    as_date(now())
    ## [1] "2020-03-15"
    
    #Use the appropriate lubridate function to parse each of the following dates:
    d1 <- "January 1, 2010"
    d2 <- "2015-Mar-07"
    d3 <- "06-Jun-2017"
    d4 <- c("August 19 (2015)", "July 1 (2015)")
    d5 <- "12/30/14" # Dec 30, 2014
    
    mdy(d1)
    ymd(d2)
    dmy(d3)
    mdy(d4)
    mdy(d5)
    
    
    x <- ymd_hms("2019-05-05 19:23:13")
    year(x)
    ## [1] 2019
    month(x)
    ## [1] 5
    mday(x)
    ## [1] 5
    yday(x)
    ## [1] 125
    wday(x)
    ## [1] 1
    hour(x)
    ## [1] 19
    minute(x)
    ## [1] 23
    second(x)
    ## [1] 13
    
    #for month() and wday() you can set label = TRUE
    #abbr = FALSE to return the full name
    month(datetime, label = TRUE)
    ## [1] maj
    ## 12 Levels: jan\\. < feb\\. < mar\\. < apr\\. < maj < jun\\. < ... < dec\\.
    wday(datetime, label = TRUE, abbr = FALSE)
    ## [1] nedelja
    ## 7 Levels: nedelja < ponedeljek < torek < sreda < ?etrtek < ... < sobota
    
    
    #On which day of the week were you born?
    d1 <- "November 12, 2000"
    w_day <- wday(mdy(d1))
    w_day
    #On which day of the week will you celebrate 40th birthday?
    d2 <- "November 12, 2040"
    w_day <- wday(mdy(d2))
    w_day
    
    #trajanje se vedno vrne v sekundah
    when you subtract two dates,
    you get a difftime object
    a difftime class object records a time span of seconds,
    minutes,
    hours,
    days,
    or weeks
    lubridate provides an alternative which always uses seconds:the duration
    my_age <- today() - ymd("1975-09-11")
    my_age
    ## Time difference of 16257 days
    as.duration(my_age)
    ## [1] "1404604800s (~44.51 years)"
    
    dseconds(15)
    ## [1] "15s"
    dminutes(10)
    ## [1] "600s (~10 minutes)"
    dhours(c(12, 24))
    ## [1] "43200s (~12 hours)" "86400s (~1 days)"
    
    ddays(0:5)
    ## [1] "0s"                "86400s (~1 days)"  "172800s (~2 days)"
    ## [4] "259200s (~3 days)" "345600s (~4 days)" "432000s (~5 days)"
    dweeks(3)
    ## [1] "1814400s (~3 weeks)"
    dyears(1)
    ## [1] "31536000s (~52.14 weeks)"
    
    #periods are time spans but don't have a fixed length in seconds, instead they work with "human" times, like days and months
    seconds(15)
    ## [1] "15S"
    minutes(10)
    ## [1] "10M 0S"
    hours(c(12, 24))
    ## [1] "12H 0M 0S" "24H 0M 0S"
    days(7)
    
    months(1:6)
    ## [1] "1m 0d 0H 0M 0S" "2m 0d 0H 0M 0S" "3m 0d 0H 0M 0S" "4m 0d 0H 0M 0S"
    ## [5] "5m 0d 0H 0M 0S" "6m 0d 0H 0M 0S"
    weeks(3)
    ## [1] "21d 0H 0M 0S"
    years(1)
    ## [1] "1y 0m 0d 0H 0M 0S"
    
    ymd("2018-10-19") + dyears(1)
    ## [1] "2019-10-19"
    
    # %Y: 4-digit year (1982)
    # %y: 2-digit year (82)
    # %m: 2-digit month (01)
    # %d: 2-digit day of the month (13)
    # %A: weekday (Wednesday)
    # %a: abbreviated weekday (Wed)
    # %B: month (January)
    # %b: abbreviated month (Jan)
    
    d <- as.Date("09/08/2000", format = "%m-%d-%Y")
    d
    
    Sys.setlocale(local = "German")
    change locale
    currentL <- Sys.getlocale()
    Sys.setlocale("LC_ALL", "German")
    ## [1] "LC_COLLATE=German_Germany.1252;LC_CTYPE=German_Germany.1252;LC_MONETARY=German_Germany.1252;LC_NUMERIC=C;LC_TIME=German_Germany.1252"
    date <- ymd("20180301")
    format(date, "%d-%m-%y")
    ## [1] "01-03-18"
    format(date, "%d-%b-%Y")
    ## [1] "01-Mrz-2018"
    format(date, "%d-%B-%y")
    
    format(date, "%b %d, %Y")
    ## [1] "Mrz 01, 2018"
    format(date, "%B %d, %Y")
    ## [1] "M?rz 01, 2018"
    wday(date, label = TRUE, abbr = FALSE)
    ## [1] Donnerstag
    ## 7 Levels: Sonntag < Montag < Dienstag < Mittwoch < ... < Samstag
    Sys.setlocale("LC_ALL", currentL)
    ## Warning in Sys.setlocale("LC_ALL", currentL): OS reports
    ## request to set locale to "LC_COLLATE=Slovenian_Slovenia.
    
    Use sys.getlocale and sys.set.locate to:#display today's month in Checz
      
      Sys.setlocale(locale = "Chez")
    x <- month(today(), label = TRUE, abbr = FALSE)
    x
    #display today's day in Russian
    Sys.setlocale(locale = "Russian")
    x <- wday(today(), label = TRUE, abbr = FALSE)
    x
    
    Sys.setlocale(locale = "English")
    
    #In this exercise you will work with the date, "1930-08-30", Warren Buffett's birth date! Mind the locale language!
    
    # Use as.Date() and an appropriate format to convert "08,30,1930" to a date (it is in the form of "month,day,year")
    # Use as.Date() and an appropriate format to convert "Aug 30,1930" to a date
    # Use as.Date() and an appropriate format to convert "30aug1930" to a date
    # also solve previous tasks with lubridate functions
    Sys.setlocale(locale = "English_UK")
    d <- mdy("08,30,1930")
    d
    format(d, "%m %d %Y")
    
    #########################################################################
    #predavanje 2.4.2020
    
    data(beavers)
    apply(t(beaver1),1,max)
    
    apply(mtcars, 2, mean)
    #sigurno se zna zgodi da 
    #se bodo uvazali in 
    #izvazali podatki v r
    
    r<- apply(mtcars, 2, mean)
    r[1:3]
    
    head(apply(mtcars,2,function(x) x%%10), 4)
    
    l<-list(a=1:10, b=11:20)
    lapply(l,mean)
    #ce ima l dva elementa ima tudi lapply dva elementa
    
    sapply(l,mean)
    #poizkusa poenostaviti rezultat
    #vrne vektor
    
    #lahko osnoven list razdelimo na grupe in potem applzamo 
    #ns podsmezne grupe
    unique(mtcars$cyl)
    tapply(mtcars$mpg, mtcars$cyl, mean)
    
    
    ##############################
    #apply.txt#
    
    # Excercise 1
    #a. Get the following matrix of 5 rows and call it 'mymatrix':
    mymatrix = matrix(data = c(6,34,923,5,0, 112:116, 5,9,34,76,2, 545:549), nrow = 5)
    mymatrix
    
    
    #b. Get the mean of each row
    apply(mymatrix, 1, mean)
    
    
    #c. Get the mean of each column
    apply(mymatrix,2,mean)
    
    # Excercise 2
    # Use 'lapply' on a data.frame 'mtcars'
    # a. Use three 'apply' family functions to get the minimum values of each column of the 'mtcars' dataset. Store each output in a separate object ('l', 's', 'm') and get the outputs.
    
    l<-lapply(mtcars,min)
    s<-sapply(mtcars, min)
    m<-apply(mtcars,2, min)
    
    listodobjects<-list(l,s,m)
    
    
    ########################################
    
    pow <- function(x, y) {
      # function to print x raised to the power y
      result <- x^y
      print(paste(x,"raised to the power", y, "is", result))
      #tukaj se nic ne vrne in se samo sprinta
    }
    
    pow(2,300)
    #ce eksplicitno povemo lahko zamenjamo vrstni red argumentov
    
    check <- function(x) {
      if (x > 0) {
        result <- "Positive"
      }
      else if (x < 0) {
        result <- "Negative"
      }
      else {
        result <- "Zero"
      }
      return(result)
    }
    
    r<-check(1)
    r
    
    
    ####################################
    #scope
    outer_func <- function() {
      a <- 20
      inner_func <- function() {
        a <- 30 # ta je samo inner funkciaj
        print(a)
      }
      inner_func()
      print(a)
    }
    
    a <- 10
    outer_func()
    
    #################
    outer_func <- function(){
      inner_func <- function(){
        a <<- 30
        print(a)
      }
      inner_func()
      print(a)
    }
    
    outer_func()
    
    ######################
    lapply(list(1,2,3), function(x) { 3 * x })
    sapply(list(1,2,3), function(x,y) { 3 * x*y }, y=2)
    mapply(function(x,y,z) { 3 * x*y*z},list(1,2,3),MoreArgs=list(y=2,z=3))
    
    #########################
    
    # Exercise 1
    # 
    # Create a function to print square of number
    square<-function(x){
      result<-x^2
      print(result)
    }
    
    square(6)
    
    
    # Exercise 2
    # Create a function to print a number raise to another with the one argument a default argument
    
    square2<-function(x, y=2){
      result<-x^y
      print(result)
    }
    
    square2(8)
    
    
    
    # Exercise 3
    # Create a function to print class of an argument
    a<-c(1,2,3)
    
    classf<-function(x){
      
      print(class(x))
    }
    
    classf(a)
    
    
    
    # Exercise 4
    # Create a function that given a vector and an integer will return how many times the integer appears inside the vector.
    integvector<-function(a,b){
      print
    }
    
    
    
    
    
    # Exercise 5
    # Create a function that given an integer will calculate how many divisors it has (other than 1 and itself). Make the divisors appear on screen.
    #  
    
    ###################################
    #Trycatch
    tryCatch(
      expr = {
        # Your code...
        # goes here...
        # ...
      },
      error = function(e){ 
        # (Optional)
        # Do this if an error is caught...
      },
      warning = function(w){
        # (Optional)
        # Do this if an warning is caught...
      },
      finally = {
        # (Optional)
        # Do this at the end before quitting the tryCatch structure...
      }
    )
    
    sqrt("a")
    ## Error in sqrt("a"): non-numeric argument to mathematical function
    tryCatch(
      sqrt("a"), 
      error=function(e) 
        print("You can't take the square root of a character!"))
    ## [1] "You can't take the square root of a character!"
    sqrt(c(4, 9, "Covid19"))
    ## Error in sqrt(c(4, 9, "Covid19")): non-numeric argument to mathematical function
    tryCatch(sqrt(c(4, 9, "Covid19")), error=function(e) NA)
    ## [1] NA
    
    sapply(c(4, 9, "Covid19"), function(x) tryCatch(sqrt(x), error=function(e) NA))
    ##       4       9 Covid19 
    ##      NA      NA      NA
    now this should work
    sapply(c(4, 9, "Covid19"), function(x) tryCatch(sqrt(as.numeric(x)), error=function(e) NA))
    ##       4       9 Covid19 
    ##       2       3      NA
    
    divide<-function(x,y) {
      if (y!=0){
        print(x/y)
      } else {print("Cannot divide by zero!")}
    }
    
    divide(4,"2")
    divide(4,0)
    
 ##################################
    # 1. Doma??ca Naloga, do 1.4.2020 23:59.
    # Oddaj .r datoteko z R kodo preko e-u??cilnice.
    
    
    
    # 1. Pri predmetu Podatkovno Programiranje je 213 ??studentov
    # prejelo na kon??cem izpitu od 0 do 100 to??ck. Zgneneriraj vektor
    # dol??zine 213 z naklju??cnimi celo??stevilskimi vrednosti od 0 do 100.
    studentje<-floor(runif(213, min=0, max=101))
    studentje
    
    # Profesor potem mora spremeniti te to??cke v ocene od 10 do 1
    # glede na intervale 100-90,89-80,79-70,....,9-0. Koliko
    # ??studentov je pisalo 10?
    f1<-cut(studentje,breaks=c(-1,9,19,29,39,49,59,69,79,89, 101), labels=c("1","2","3","4","5","6","7","8","9","10"))
    f1
    summary(f1)["10"]
    summary(f1)["6"]
    
    
    # 2. Naredi dataframe, kjer je prvi stolpec "Imena" sestavljena iz
    # 213 naklju??cnih imen sestavljenih iz ??crk ki predstavljajo
    # za??cetnice imena ??studenta (primer "D.G.","H.E.,"X.Q.",
    # uporabi angle??sko abecedo) drugi stoplec so "Tocke" iz prejsnje naloge, in tretji stopec so "Ocene" oz. faktorji iz
    # prej??snje naloge. Dodaj ??se ??cetrti stolpec, ki pove ??ce je ??student
    # opravil izpit (10-6 je opravil, 5-1 ni opravil).
    library("stringr")
    imena<-1:213
    priimki<-1:213
    imena<-sample(LETTERS,213, replace = T)
    imena
    priimki<-sample(LETTERS,213, replace = T)
    priimki
    imepriimrk<-str_c(imena,priimki, sep=".")
    pike<-1:213
    pike[1:213]<-"."
    imenainpriimki<-str_c(imepriimrk,pike)
    
    df<-data.frame(imena=imenainpriimki,tocke=studentje, ocene=f1)
    df
    
    o[1:213]<-" "
    o[df$tocke>49]<-"opravil"
    o[df$tocke<49 | df$tocke==49]<-"ni opravil"
    o
    
    # prejsnje naloge, in tretji stopec so "Ocene" oz. faktorji iz
    # prej??snje naloge. Dodaj ??se ??cetrti stolpec, ki pove ??ce je ??student
    # opravil izpit (10-6 je opravil, 5-1 ni opravil).
    
    koncneocene<- data.frame(cbind(df,"opravil"=o))
    koncneocene
    # 3. Vrni imena in zaklju??cno oceno vseh ??studentov, ki so opravili
    # predmet.
    subset(koncneocene,koncneocene$tocke>49, c("imena", "ocene"))
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    