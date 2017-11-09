
# Data from: http://estadisticasviolenciagenero.msssi.gob.es/
# Taken at https://twitter.com/RasgoLatente/status/662970639028875264
# Used in https://twitter.com/RasgoLatente/status/663484970888003584
año <- 2004:2014
muertes <-  c(  72 ,  57 ,  69 ,  71,  76 ,   56,  73,   61,  52,  54,   54) 

par(mar=c(8,4,4,2)+0.1)
barplot(muertes, ylim= c(0, 80), ylab = "Número de muertes", col = "#944084",
     pch=17,names.arg = año,
     xlab = "Año", main = "Víctimas mortales por violencia de género")

mtext("Fuente: Portal Estadístico Delegación del Gobierno para la Violencia de Género",
      side=1,line=4)
mtext("@RasgoLatente",side=1,line=5, col = "#DD8787")

#  added some more info and a mean bar in the code below

año <- 2004:2017
muertes <-  c(  72 ,  57 ,  69 ,  71,  76 ,   56,  73,   61,  52,  54,   55,
                60, 44, 43) 
muertes.media <- c()
for (element in muertes){
  muertes.media[mean()]
}
mean(muertes)
par(mar=c(8,4,4,2)+0.1)
barplot(muertes, ylim= c(0, 80), ylab = "Número de muertes", col = "#944084",
        pch=17,names.arg = año,
        xlab = "Año", main = "Víctimas mortales por violencia de género")

mtext("Fuente: Portal Estadístico Delegación del Gobierno para la Violencia de Género",
      side=1,line=4)
mtext("@RasgoLatente",side=1,line=5, col = "#DD8787")
abline(mean(muertes), b = 0)
text("Media", x = 17, y = 65)
