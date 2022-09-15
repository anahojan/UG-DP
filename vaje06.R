#Grafi

# #vaje05-30.4.2020
library(lattice)
library(ggplot2)
library(gganimate)
# A.
    #1. Nari??si y???x z raztresenim grafikonom z uporabo plot, lattice in
    # ggplot2.
    n<-1000
    x<-(0:n-1)^((sqrt(5)-1)/2)*cos((0:n-1)*2*pi*(sqrt(5)-1)/2)
    y<-(0:n-1)^((sqrt(5)-1)/2)*sin((0:n-1)*2*pi*(sqrt(5)-1)/2)
    plot(x,y)
    dotplot(y~x)
    dfA<-data.frame(xcoord=x, ycoord=y)
    ggplot(dfA, aes(x=xcoord, y=ycoord))+geom_point()

    # 2. Nari??si funkcijo sinus na intervalu [?????, ??].
   plot(sin,-pi,pi)
   


     # 3. Nari??si kro??znico s polmerom 1 okoli izhodi??s??ca. Dodaj naslov in
    # pre/poimenuj x os in y os. Nari??si ??se kvadrat na isto sliko.
    # 2 / 5
    x<--100:100/100*pi
    plot(cos(x),sin(x), type = "l", col="blue", main = "Naslov", xlab = "x os", ylab = "y os")
    points(c(1,1,-1,-1,1),c(1,-1,-1,1,1),type="l",col="green")
   

# B. 
    #1. Napi??si funkcijo, ki ima za vhodni parameter naravno ??stevilo n
    # in zgenerira n to??ck po naklju??cju znotraj kvadrata
    # [???1, 1] × [???1, 1], in nato pre??steje koliko od teh to??ck le??zi
    # znotraj ali na kro??znici. Funkcija naj vrne kot rezultat
    # 4*pre??steto/n. Poleg tega naj tudi izri??se s funkcijo plot vse
    # to??cke, kro??znico in kvadrat. Pobarvaj to??cke znotraj kro??znice z
    # drugo barvo. Lahko si pomagate s funkcijo iz prej??snji vaj:
    #   incircle<-(function(x,y) sqrt(x^2+y^2)<=1)
   
    krogkvadrat<-function(n){
      x<-runif(n,-1,1)
      y<-runif(n,-1,1)
      
      incircle<-(function(x,y) sqrt(x^2+y^2)<=1)
      count<-sum(incircle(x,y))
     
      x2<--100:100/100*pi
      plot(cos(x2),sin(x2), type = "l", col="blue", main = "Naslov", xlab = "x os", ylab = "y os")
      points(c(1,1,-1,-1,1),c(1,-1,-1,1,1),type="l",col="green")
      points(x,y,col=ifelse(incircle(x,y), 'red','purple'))
      points(x,y,col=c("red", "purple"))
      return(4*count/n)
    }
    krogkvadrat(1000)
    
    
    
    
    
    
    
     # 2. GGplotu iz A1 dodajte ??se barve, na podlagi razdalj od
    # izhodi??s??ca in tudi na podlagi istih razdalj ??se pove??cajte oziroma
    # zmaj??sajte to??cke, kot pri son??cnici.
    # 3 / 5
    n<-1000
    x<-(0:n-1)^((sqrt(5)-1)/2)*cos((0:n-1)*2*pi*(sqrt(5)-1)/2)
    y<-(0:n-1)^((sqrt(5)-1)/2)*sin((0:n-1)*2*pi*(sqrt(5)-1)/2)
    dfB<-data.frame(xcoord=x,ycoord=y)
    
    ggplot(dfB,aes(x=xcoord,y=ycoord,color=sqrt(xcoord^2+ycoord^2), size=sqrt(xcoord^2+ycoord^2)))+
      geom_point()+scale_size_continuous(range = c(0.5,2))+scale_color_continuous(low="brown",high="yellow")
    
    
    
 # C.
    #1. Nari??si spodnji tortni grafikon v Rju z ggplot:
    
    dfB1<-data.frame(labels=c("no","no, but in yellow"),"values"=c(7,1))
    ggplot(dfB1, aes(x="", y=values,fill=labels))+
      geom_bar(width = 1, stat = "identity")+coord_polar("y", start=0.2)+
      scale_fill_manual(values=c("cyan", "yellow"))+
     
      labs(title="Is this meme funny?",x="",y="")+
      theme(plot.title = element_text(size=30),
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            panel.grid  = element_blank(),
            legend.title=element_blank(),
            legend.text = element_text(size = 16, face = "bold"))
    
    # 2. Nari??si velikost cvetov (Petal.Length) v dataframeu iris s
    # histogramom. Pobarvaj razli??cne vrste z druga??cnimi barvami.
    # Kako bi narisali samo 1 vrsto namesto vseh 3?
    #   4 / 5
  ggplot(iris, aes(x=Petal.Length,fill=Species))+geom_bar()
  ggplot(iris[iris$Species=="setosa",], aes(x=Petal.Length, color=Species))+geom_bar()
    
    
    
    
 # D. 
    #1. Nari??si razpr??seni grafikon z velikostjo cvetov proti njenim
    # ??sirinam. Dodaj premico, ki najbolj??se predstavlja te to??cke (po
    # metodi najmanj??sih kvadratov, funkcija ls(y ??? x)). Nato
    # pobarvaj to??cke nad in pod premico z razli??cnimi barvami.
   
    premica<-lm(iris$Petal.Width~iris$Petal.Length)
   premica[[1]][1]
    
     ggplot(iris, aes(x=Petal.Length,y=Petal.Width,color=(Petal.Width>premica[[1]][2]*Petal.Length+premica[[1]][1])))+geom_point()+ geom_abline(slope=premica[[1]][2],intercept=premica[[1]][1])+theme(legend.title = element_blank())
    
  
  
  
  
    
     # 2. Nari??si z ggplotom slednji dataframe
    # z uporabo geom segment(), ki nari??se daljico med (x1,y1) in
    # (x2,y2). Ce ponovno za??zene??s kodo za druga??cno vrednost ??
    # time ??? [1, 200] dobi??s malo dru??cano sliko, ki je tudi zvezna
    # (time = 1 je zelo podobna time = 1.1). GGanimirajte to v
    # odvisnosti od ??casa, naprimer za time = (1 : 100/10).

    library(gganimate)
    time=6; 
    points<-0:200*pi/100
    cardioid<-data.frame(x1=sin(points),y1=cos(points),x2=sin(time*points),y2= cos(time*points))
    ggplot(cardioid)+geom_segment(aes(x=x1,y=y1,xend=x2,yend=y2))
    bigdf<-function(input_vector){
      animatedf<-NULL
      points<-0:200*pi/100
      for (i in input_vector){
        animatedf<-rbind(animatedf,data.frame(x1=sin(points),y1=cos(points),x2=sin(i*points),y2=cos(i*points),times=rep(i,201)))
      }
      return(animatedf)
    }
    bigger<-bigdf(1:200/10)
    ggplot(bigger)+geom_segment(aes(x=x1,y=y1,xend=x2,yend=y2))+transition_states(times,transition_length=0,state_length = 0.1)
    
    
    
    
    
    
    