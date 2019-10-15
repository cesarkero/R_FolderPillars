library(stringr)
library(shiny)
options(shiny.port = 8888)

# PARAMS
# Level 1 folders
l1 <- c('0_Correos',
        '1_Doc_base',
        '2_Carto',
        '3_Doc',
        '4_Campo',
        '5_GIS',
        '6_Entregas')
#level 2 folders
l2 <- list(c(),
           c(),
           c(),
           c('1_Portada', '2_Tablas', '3_Figuras', '4_Anexos', '5_Planos'),
           c(),
           c('1_raster', '2_vectorial'),
           c())
proxectopath <- "Z:/Proxectos/"
proxectodir <- "999_PROYECTO_SHINY"

#-------------------------------------------------------------------------------
# FolderPillar
# Function to create a folder structure based on the lists above
FolderPillars <- function (l1, l2, proxecpath, proxec){
    # set dirname
    dir <- paste0(proxectopath, proxectodir,"/")
    # if dir don't exist --> create
    if (!dir.exists(dir)){ dir.create(dir) }
    
    for (i in 1:length(l1)){
        newdir <- paste0(dir,l1[i],"/")
        dir.create(newdir)
        for (i2 in l2[[i]]){
            if (!is.null(l2[[i]])){dir.create(paste0(newdir,i2,"/"))}
        }
    }
}

#-------------------------------------------------------------------------------
# SHINY
ui <- fluidPage(
    
    # App title ----
    headerPanel("Tool to create a new proyect with empty folder structure"),
    
    # Select folder of projects
    textInput(inputId = "proxectopath", 
              label = "Select folder of projects (use rightslash at the end):",
              value = proxectopath),
    
    # Name of the project
    textInput(inputId = "proxectodir", 
              label = "Code and name of the project:",
              value = proxectodir),
    
    checkboxGroupInput("level1", "Level 1 folders:",c(l1)),
    
    tableOutput("data1"),
    
    # Create
    actionButton(inputId = "action",
                 label = "Create folders")
)

# Crear estructura de carpetas
server <- function(input, output) {
    observeEvent(input$action, {
        FolderPillars(l1, l2, input$proxectopath, input$proxectodir)
    })
    output$data1 <- renderTable({level1})
}

shinyApp(ui, server)