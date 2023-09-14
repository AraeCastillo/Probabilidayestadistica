

#_____________________ MEDIDAS ___________________

# Se trabajará con la matriz de datos "penguins.xlsx"
# Obtenida de https://allisonhorst.github.io/palmerpenguins/

#----------------------------------------------
# Descargar la matriz y 
# subirla a la nube de trabajo
#----------------------------------------------

# 1.- Descargar la matriz desde classroom o github 
# Nota: El archivo se encontrará en la carpeta de descargas

# 2.- En la ventana de visualizacion (ventana 4) seleccionar:
# Upload / Seleccionar archivo / abrir la carpeta en donde se encuentra
# descargado el archivo (carpeta de descargas)/ aceptar.


#----------------------------------------
# Exportacion de la matriz
#----------------------------------------

# Environment /Import dataset/from excel/ Browser/ seleccionar el 
# archivo/ aceptar/ (visualizar)/ import

#----------------------------------------
#  Exploracion de la matriz
#----------------------------------------

dim(penguins)
str(penguins)
colnames(penguins)
anyNA(penguins)


#-----------------------------------------------
#      Tendencia central
#-----------------------------------------------

# 1.- Media y mediana
summary(penguins)


# 2.- Moda

# 2.1.- Se descarga el paquete "modeest"
install.packages("modeest")

# 2.2.- Se abre la librería
library(modeest)

# 2.3.- Cálculo de la moda para la variable isla y largo del pico
mfv(penguins$isla) # categorica
mfv(penguins$masa_corporal_g) # numerica


#-----------------------------------------------
#    Medidas de posición
#------------------------------------------------

# 1.- Cuartiles (cuantiles)
summary(penguins)

# Selección de una variable de la matriz de datos
masa_corporal_g<-penguins$masa_corporal_g

table(masa_corporal_g)

# 2.- Quintil
quintil<-quantile(penguins[["masa_corporal_g"]], 
                  p=c(.20, .40, .60, .80))

#2.1.- Visualizacion de la variable
quintil

# 3.- Decil
decil<-quantile(penguins[["masa_corporal_g"]], 
                p=c(.10, .20, .30, .40, .50, .60,
                    .70, .80, .90))

#3.1.- Visualizacion de la variable
decil


# 4.- Percentil
percentil<-quantile(penguins[["masa_corporal_g"]], 
                    p=c(.33, .66))
percentil

# Interpretacion:
# <192 = Bajo
# 192-209 = Intermedio
# > 209 = Alto

table(masa_corporal_g)

#-----------------------------------------------
#      Medidas de dispersión
#-----------------------------------------------

# 1.- Cálculo de la varianza (sólo para variables cuantitativas)
var(penguins$masa_corporal_g)

# 2.- Cálculo de la desviación estándar
sd(penguins$masa_corporal_g)

# 3.- Error
media_masa_corporal_g<-mean(penguins$masa_corporal_g)
error<-(penguins$masa_corporal_g-(media_masa_corporal_g))
error


#4.- Coeficiente de variacion
CV<-sd(penguins$masa_corporal_g)/mean(penguins$masa_corporal_g)*100
CV

# 5.- Rango intercuartilico (IQR)
IQR(penguins$masa_corporal_g)

# 6.- Rango
masa_corporal_g<-penguins$masa_corporal_g
rango<-max(masa_corporal_g)-min(masa_corporal_g)
rango
