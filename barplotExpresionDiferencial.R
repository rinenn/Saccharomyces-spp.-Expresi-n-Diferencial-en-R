# Shiny de Expresión Diferencial

## Descargas
#install.packages("shiny")
#install.packages("dplyr")

## Establecemos librerias
library(shiny)
library(ggplot2)
library(tidyr)
library(dplyr)

# Directorio de trabajo
setwd("/Users/rafae/OneDrive/Documents/Carrera/ProgramaciónR/Saccharomyces/")

# Aquí llamaremos a nuestra tabla de datos y la guardaremos en una variable dentro de R
counts = read.table("Saccharomyces.txt", header=TRUE,  sep="\t", comment.char="")

head(counts)

# Interfaz de usuario
ui <- fluidPage(
  titlePanel("Visualización Interactiva de Genes con Gráficos de Barras"),
  sidebarLayout(
    sidebarPanel(
      selectInput("genes", "Seleccione los genes a visualizar:", 
                  choices = counts$target_id, 
                  selected = counts$target_id[1],
                  multiple = TRUE),
      
      checkboxGroupInput("columns", "Seleccione las columnas para graficar:", 
                         choices = names(counts)[2:5], 
                         selected = names(counts)[2:3])
    ),
    
    mainPanel(
      plotOutput("barPlot")
    )
  )
)

# Lógica del servidor
server <- function(input, output) {
  
  output$barPlot <- renderPlot({
    # Filtrar los genes seleccionados
    selected_data <- counts %>% filter(target_id %in% input$genes)
    
    # Filtrar las columnas seleccionadas
    selected_data <- selected_data %>% select(target_id, all_of(input$columns))
    
    # Transformar los datos para ggplot2 usando pivot_longer
    melted_data <- selected_data %>% pivot_longer(cols = -target_id, names_to = "Column", values_to = "Value")
    
    # Graficar
    ggplot(melted_data, aes(x = target_id, y = Value, fill = Column)) +
      geom_bar(stat = "identity", position = "dodge") +
      theme_minimal() +
      labs(x = "Gene", y = "Valor", fill = "Columna") +
      scale_fill_brewer(palette = "Set1")
  })
}

# Ejecutar la aplicación Shiny
shinyApp(ui = ui, server = server)
