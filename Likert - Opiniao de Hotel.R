# Data: 25/11/2020
# User: Samuel Duarte
#

# Biblioteca
library(readxl) # carregar o banco
library(likert) # Usar os graficos Likert
library(ggplot2) # Grafico
library(xtable)  # Palheta
library(plyr)    

banco <- read_excel("Opinioes_hotel.xlsx")
View(banco)

banco[ ,2:8]<-lapply(banco[ ,2:8], function(x){factor(x,
  levels = c("1","2","3","4","5"),
  labels = c("Ruim","Regular","Bom","Muito Bom","Excelente"))})

lik<-likert(as.data.frame(banco[ ,2:8]))

lik

summary(lik)

plot(lik, plot.percents=T,low.color="orangered2",high.color="seagreen3")

plot(lik, type="heat")

plot(lik, type="density")
