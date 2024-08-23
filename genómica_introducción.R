## Genómica Clases de R

# Datos Tipo Lógicos

# Matrices

matriz <- matrix(1:9, nrow = 3, ncol = 3)
print(matriz)

# Listas

vector_num <- c(1,2,3,4,5)
lista <- list(nombre = "Juan", edad = 30, vector = vector_num)
print(lista)

# Dataframe

df <- data.frame(nombre="Juan","Luisa", edad=c(23,24))
df[1,2]

head(iris)
iris$Sepal.Length
iris[1:10,3]

df_filtrado <- subset(iris, Sepal.Width > 4)
colnames(iris)
df_filtrado

sepalLength <- iris[,"Sepal.Width"]
max(sepalLength)
length(sepalLength)
mean(sepalLength)

# Creando un Dataframe

x <- c(10,9,5)
nombres <- c("Rafael", "Aldo", "Ana")

class(x)
class(nombres)

names(x) <- nombres
x

# Estructuras de Control de Flujo

x <- c(2,6,2,1,2,1,4,5,3,2,67,67,34,6,2,4)

if(x>5){
  print('x es mayor q 5')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 )
} else{
  print('x es menor q 5')
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         