# Análisis de Expresión Diferencial en el Área Distal del Capullo de la Flor

## Cargamos librarias
library(limma)

library(edgeR)

library(grid)

library(VennDiagram)

library(ggplot2)

library(RColorBrewer)

## Leemos archivos
tabPrincipal = read.csv("C:/Users/rafae/OneDrive/Documents/Carrera/ProgramaciónR/KallistoQuant2/Metadata(TPM).csv", header = TRUE, row.names = 1)

head(tabPrincipal) # Primeras 6 filas

dim(tabPrincipal) # Dimensiones de la tabla: # de genes, # de lecturas

## Procesamos los datos
lecturas = tabPrincipal[rowSums(cpm(tabPrincipal) >= 1) >= 10,] # Filtramos los genes con menos de 2 reads y 10 lecturas en total

head(lecturas) # Visualizamos

dim(lecturas) # Vemos las dimensiones: # de genes, # de lecturas

## Expresión diferencial, comparación de lecturas en distal flower bud
plot(log2(lecturas[,c("ERR_DT_FB_0_R1", "ERR_DT_FB_2_R1", "ERR_DT_FB_4_R1", "ERR_DT_FB_6_R1")]), col="red")

## Agrupación de datos
corridas = sub("..$", "", colnames(lecturas)) # Declaramos grupos para DGEList

corridas # Visualizamos

dge = DGEList(counts = lecturas, group = corridas) # Objeto DGEList

head(dge) # Visualizamos

plotMDS(dge) # Ploteamos los grupos

## Normalizamos los datos
dgeNormalizado = calcNormFactors(dge)

dgeNormalizado

head(dgeNormalizado$samples)

## Estimación de la dispersión
dgeNormalizado = estimateCommonDisp(dgeNormalizado)

print(paste("Dispersion: ", round(dgeNormalizado$common.dispersion, 3)))

## Comparación de dos experimentos
expDif = exactTest(dgeNormalizado, dispersion = dgeNormalizado$common.dispersion, pair = c("ERR_DT_FB_0_", "ERR_DT_FB_2_"))

dim(expDif) # Dimensionamos

topTags(expDif) # Genes con mayor cambio

dim(topTags(expDif)) # Número de genes arrojados por topTags

## Comparación de otros dos experimentos
expDif_UP = exactTest(dgeNormalizado, dispersion = dgeNormalizado$common.dispersion, pair = c("ERR_DT_FB_4_", "ERR_DT_FB_6_"))

dim(expDif_UP) # Dimensionamos

topTags(expDif_UP) # Genes con mayor cambio

dim(topTags(expDif_UP)) # Número de genes arrojados por topTags

## Graficamos un gen, NODE_1_length_14006_cov_24.853613_g0_i0
grafExperimental = lecturas["NODE_1_length_14006_cov_24.853613_g0_i0", c("ERR_DT_FB_0_R1", "ERR_DT_FB_2_R1", "ERR_DT_FB_4_R1", "ERR_DT_FB_6_R1")] # Visualizando un gen es específico.

grafExperimental_UP = as.numeric(grafExperimental) # Se convierte a un vector

names(grafExperimental_UP) = colnames(grafExperimental) # Asignamos el axis title

barplot(grafExperimental_UP) # Graficamos

## Graficamos un gen, NODE_1_length_14006_cov_24.853613_g0_i0
grafExperimental = lecturas["NODE_1_length_14006_cov_24.853613_g0_i0", c("ERR_DT_FB_0_R1", "ERR_DT_FB_2_R1", "ERR_DT_FB_4_R1", "ERR_DT_FB_6_R1")] # Visualizando un gen es específico.

grafExperimental_UP = as.numeric(grafExperimental) # Se convierte a un vector

names(grafExperimental_UP) = colnames(grafExperimental) # Asignamos el axis title

barplot(grafExperimental_UP) # Graficamos

## Graficamos un gen, NODE_62786_length_247_cov_1.534314_g47576_i0
grafExperimental2 = lecturas["NODE_62786_length_247_cov_1.534314_g47576_i0", c("ERR_DT_FB_0_R1", "ERR_DT_FB_2_R1", "ERR_DT_FB_4_R1", "ERR_DT_FB_6_R1")] # Visualizando un gen es específico.

grafExperimental2_UP = as.numeric(grafExperimental2) # Se convierte a un vector

names(grafExperimental2_UP) = colnames(grafExperimental2) # Asignamos el axis title

barplot(grafExperimental2_UP) # Graficamos

## FDR de los dos genes
deTab = topTags(expDif_UP, n=Inf)$table # False discovery range

print(deTab)

deTab[c("NODE_1_length_14006_cov_24.853613_g0_i0", "NODE_62786_length_247_cov_1.534314_g47576_i0"),] # Visualizamos 2 genes

## Comparación de ED

dfGenes = row.names(deTab)[deTab$FDR < 0.5 & abs(deTab$logFC) > 1]

print(paste("Genes diferenciales: ", length(dfGenes)))

dwnGenes = row.names(deTab)[deTab$logFC < -1]

print(paste("Genes reprimidos: ", length(dwnGenes)))

ovrGenes = row.names(deTab)[deTab$logFC > 1]

print(paste("Genes inducidos: ", length(ovrGenes)))

venn.plot <- venn.diagram(
  x = list(
    Set1 = dfGenes,
    Set2 = dwnGenes,
    Set3 = ovrGenes
  ),
  category.names = c("Differentialy Expressed", "Inhibited", "Group 3"),
  filename = NULL,
  output = TRUE
)

grid.draw(venn.plot)



