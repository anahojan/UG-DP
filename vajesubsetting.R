#Exercise 1 _
#Subset the vector, "mtcars[,1]", for values greater than "15.0". _
subset(mtcars[,1],mtcars[,1]>"15,0", , drop=FALSE )

#Exercise 2 _
#Subset the dataframe, "mtcars" for rows with "mpg" greater than , or equal to, 21 miles per gallon. _
subset(mtcars, mtcars$mpg>= 21, )


#Exercise 3 _
#?Subset "mtcars" for rows wih "cyl" less than "6", and "gear" exactly equal to "4". _
subset(mtcars,mtcars$cly<6 & mtcars$gear==4, )


#Exercise 4 _
#Subset "mtcars" for rows greater than, or equal to, 21 miles per gallon. Also, select only the columns, "mpg" through "hp". _
a<-subset(mtcars,mtcars$mpg>=21 )
a[c("mpg", "hp")]




#Exercise 5 _
#Subset "airquality" for "Ozone" greater than "28", or "Temp" greater than "70". Return the first five rows. _
b<-subset(airquality, airquality$Ozone>"28" | airquality$Temp>70)
b[1:5,]




#Exercise 6 _
#Subset "airquality" for "Ozone" greater than "28", and "Temp" greater than "70". Select the columns, "Ozone" and "Temp". _ Return the first five rows. _
c<-subset(airquality, airquality$Ozone>28 & airquality$Temp>70, c("Ozone", "Temp"))
c[1:5,]


#Exercise 7 _
#Subset the "CO2" dataframe for "Treatment" values of "chilled",
#and "uptake" values greater that "15". Remove the category, "conc". Return the first 10 rows.
CO2
df<-subset(CO2, CO2$Treatment=="chilled" & CO2$uptake>15)
df[1:10,c(1:3, 5)]




#Exercise 8 _
#Subset "airquality" for "Ozone" greater than "100". Select the columns "Ozone", "Temp", "Month" and "Day" only.
d<-subset(airquality, airquality$Ozone>100)
d[,c(1,4:6)]



#Exercise 9 _
#From mtcars dataset show only columns with the letter p in their names, where number of cyl=6!
mtcars[grepl("p", colnames(mtcars))]


#Exercise 10 _
#From mtcars dataset show only every other column and every 7th row. Generate sequences for rows and columns!

  Exercise 11 _

Create a list of the following dataframes: iris, cars, mtcars. Subset the list and calculate the mean for the last 6 rows of the mtcars' wt column.