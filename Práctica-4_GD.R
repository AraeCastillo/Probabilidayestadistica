# ______________Gráficos____________
#  Se va a trabajar con la matriz penguins

#--------------------------------------------
# Importación de matriz 
#-------------------------------------------

# Import data / from excel /browse / seleccionar archivo / aceptar

#--------------------------------------
#    Exploracion
#-----------------------------------
#Dimensiones
dim(penguins)

colnames(penguins)
#Tipo de variable
str(penguins)
#Datos faltantes
anyNA(penguins)

# Estadistica descriptiva: Da el mínimo y máximo de datos
summary(penguins)

#-----------------------------------------
# Configuración de la matriz
#------------------------------------------

penguins$especie
#1.- Convertir las variables categóticas a factores
penguins$especie<-factor(penguins$especie, 
                         levels=c("Adelie", "Gentoo", "Chinstrap"))


penguins$isla
penguins$isla<-factor(penguins$isla, 
                      levels=c("Torgersen", "Biscoe", "Dream"))


penguins$genero
penguins$genero<-factor(penguins$genero, 
                        levels=c("male", "female"))

penguins$año
penguins$año<-factor(penguins$año, 
                     levels=c("2007", "2008", "2009"))

str(penguins)

summary(penguins)

View(penguins)

# ---Este paso no es opcional.---
# 2.- Creamos una nueva matriz de datos donde se seleccionan
# las columnas de la 2 a la 9.
#Base de Datos 1 [numero de observaciones,]
BD1<-penguins[,2:9]
colnames(BD1)

#---------------------------------
#   Librerías
#----------------------------------
install.packages("ggplot2")

library(ggplot2)


# ------------------------------------------------
#         Boxplot GRAFICO DE EXPLORACION DE DATOS
#--------------------------------------------------

# 1.- Creación de un vector de color
color=c("chocolate1","cyan3")

# 2.- Creacion del grafico
#boxplot (matriz de datos)(x y variables) 
ggtitle:título del grafico 
xlab y ylab: etiquetas con buena ortografia
BX<-ggplot(penguins, aes(x=genero, y=largo_pico_mm))+
  geom_boxplot(fill=color)+
  ggtitle("Boxplot")+
  xlab("Género")+
  ylab("largo del pico (mm)")+
  theme_bw()

# 3.- Visualización del boxplot
BX

#--------------------------------------------------
#            Gráfico de barras: para variables cualitativas
#--------------------------------------------------

# 1.- Creación de un vector de color
color=c("darkolivegreen1", "darkorchid1", "gold")

# 2.- Creación del gráfico
GB1<-ggplot(penguins, aes(x=año))+
  geom_bar(colour= "gray0", fill=color)+
  ggtitle("Gráfico de Barras")+
  xlab("Año")+
  ylab("Frecuencias")+
  theme_minimal()

# 3.- Visualizacion del grafico
GB1

# 4.- Barras verticales

GB2<-ggplot(penguins, aes(x=año))+
  geom_bar(colour= "gray7", fill=color)+
  ggtitle("Gráfico de Barras")+
  xlab("Año")+
  ylab("Frecuencias")+
  coord_flip()+
  theme_minimal()

# 5. Visualizacion del objeto
GB2

#--------------------------------------------------
#           Histograma: Para variables cuantitativas
#---------------------------------------------------

# 1.- Construccion del grafico

HG<-ggplot(penguins, aes(x=largo_aleta_mm))+
  geom_histogram(col="gray55", fill="lightgoldenrod1")+
  ggtitle("Histograma")+
  xlab("Largo de la aleta (mm)")+
  ylab("Frecuencias")+
  theme_classic()

# 2.- Visualizacion del grafico
HG

#----------------------------------
#   Grafico de dispersion: Se visualizan hasta tres variables, 
#Dos cuantitativas y la tercera cualitativa que permite diferenciar por grupos
#-----------------------------------

color=c("darkolivegreen1", "darkorchid1", "gold")

# 1.- Construccion del grafico
#Coincidir la x con su etiqueta y Y con la misma etqiueta
GD<-ggplot(penguins, aes(x=largo_pico_mm, y=grosor_pico_mm))+
  geom_point(aes(color=especie))+
  scale_color_manual(values=c("coral1","aquamarine3","blueviolet"))+
  ggtitle("Gráfico de dispersión")+
  xlab("largo del pico (mm)")+
  ylab("grosor del pico (mm)")+
  theme_light()

GD

# 2.- Visualizacion del objeto
GD

#-------------------------------
#  Organizacion de graficos
#-------------------------------

# 1.- Descargar el paquete gridExtra

install.packages("gridExtra")

# 2.- Abrir la libreria
library(gridExtra)

# 3.- Organizacion 2 graficos en una fila y dos columnas 
grid.arrange(BX,GB1, nrow=1, ncol=2)

# 4.- Organizacion 3 graficos en dos filas y dos columnas 
grid.arrange(BX,GB1,HG, nrow=2, ncol=2)

# 5.- Organizacion 4 graficos en dos filas y dos columnas 
grid.arrange(BX,GB1,HG,GD, nrow=2, ncol=2)
