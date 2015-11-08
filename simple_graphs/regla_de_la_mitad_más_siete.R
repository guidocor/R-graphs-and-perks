# Graph of the "la mitad más siete" formula. A joke that states
# that you can sleep with a person who has the half of your age 
# plus seven years


(a = 15:80)
(edad = (a/2) + 7)

# basic plot
plot(a,edad, type="l", ylim=c(0,max(edad)+15), 
     xlim=c(0,max(a)+20), col = "red", lwd = 5,
     main = "Regla de la mitad + 7",
     xlab = "Tu edad",
     ylab = "Edad mínima de quien te quieres..."
     )



(seq_line = seq(20, 80, 10))
(edad_plot <- seq_line/2 + 7)

for(i in 1:length(seq_line)){
  # x0, y0, x1, y1
  # creating the bars betwen x-axis and the line
  segments(seq_line[i],0, seq_line[i], edad_plot[i], lty = 3)
  # putting the y values on the line
  text(seq_line[i] , edad_plot[i] +3, paste0(edad_plot[i]) ) 
  
  
  }


