install.packages("tidyverse")
library(ggplot2)

# Gráficas Avanzadas

iris # Obtenemos el dataframe.

irisFilter <- subset(iris, Sepal.Length > 4.9) # Filtramos por Sepal.Length

irisFilter # Dataframe filtrado.

# Ploteamos.

ggplot(data=irisFilter, aes(x=Sepal.Length, y=Sepal.Width, color=Species, shape=Species, size=2)) + geom_point() + facet_grid(Species ~ .)

levels(iris$Species) # Para saber los diferentes valores en "Species".
