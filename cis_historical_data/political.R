setwd("~/R"); library(XML)
###
### Script to make graphs of perceived problems of spanish population with historical data
### this script was used to ilustrate Rasgo Latente post: http://rasgolatente.es/politica-error-fundamental-atribucion/
### 

# You can read the archive from web or download and open from local file

# html<-readHTMLTable("Three principal problems.html", head= T)
html <- readHTMLTable("http://www.cis.es/opencms/-Archivos/Indicadores/documentos_html/TresProblemas.html")

# read data
datos <- as.data.frame(html[2])
head(datos)
# when we substract the data the column names aren't correct. example: NULL.abr99 
# we substract the name 
nombres <- colnames(datos)
nombres[2:length(nombres)] <- substr(nombres[2:length(nombres)], 6,10)
colnames(datos) <- nombres
str(datos)
# converting the data to numbers
for (a in 2:ncol(datos)){
   datos[[a]] <- as.numeric(as.character(datos[[a]]))
}

head(datos)
datos.rev <- datos
new_order <- c(1, ncol(datos):2)

# data came un reverse chronological order, we must reverse column
datos.rev <- datos[,new_order] 
datos <- datos.rev

# helper function that creates an object for the plot function
plot_object <- function(object, size=24){ return(list(nombre=toString(object[[1]]) , 
                          plot=as.numeric(object[(length(object)-size):length(object)]))) }


# size is the numbers of months you want to plot 
size = 50
# question number is the number of the question yo want to plot
# watch the question looking at datos[[1]]
datos[[1]]
question_number = 2
# graphic parameters
par(mar=c(10,4,4,2)+0.1)

serie<-plot(plot_object(datos[question_number,], size=size)$plot, type="o", 
            main = "Tres problemas principales que existen \n actualmente en España (multirespuesta)", col.main="#DD8787",
            ylim=c(0,90), col="#B16C6C" ,pch=15, xaxt="n", 
            ylab="Porcentaje de personas que eligieron como opción", xlab=" ")
# create the bottom labels with the months
axis(1,at=1:length(plot_object(datos[question_number,], size = size)$plot ),
	labels=colnames(datos[(length(datos)-size):length(datos)]) )
# bottom texts
mtext("Fuente: CIS",side=1,line=6)
mtext("@RasgoLatente",side=1,line=4, col = "#DD8787")

# create the legend. Make sure that col has the proper number of colours 
legend("topright", text_legend, lty=c(1,1), col=c("#B16C6C","#6666ff") ,  lwd=c(2.5,2.5))

# function to plot ohter line plot other line 

lines(plot_object(datos[17,], size=size)$plot, type="o", col = "#6666ff", pch=16)
lines(plot_object(datos[18,], size=size)$plot, type="o", col = "#6666ff", pch=16)
lines(plot_object(datos[19,], size=size)$plot, type="o", col = "#6666ff", pch=16)


text_legend <- c(plot_object(datos[question_number,], size=size)$nombre, plot_object(datos[19,], size=size)$nombre )

