library(stringr)

# PARAMS
l1 <- c('0_Correos',
        '1_Doc_base',
        '2_Carto',
        '3_Doc',
        '4_Campo',
        '5_GIS',
        '6_Entregas')
l2 <- list(c(),
           c(),
           c(),
           c('1_Portada', '2_Tablas', '3_Figuras', '4_Anexos', '5_Planos'),
           c(),
           c('1_raster', '2_vectorial'),
           c())
proxectopath <- "C:/Users/cac/Desktop/Z/Proxectos/"
proxecto <- "644_EsIA_PE_Branas"

#-------------------------------------------------------------------------------
# FolderPillar
# Function to create a folder structure based on the lists above
FolderPillars <- function (l1, l2, proxecpath, proxec){
    
    dir <- paste0(proxectopath, proxecto,"/")
    
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

FolderPillars(l1, l2, proxectopath, proxecto)