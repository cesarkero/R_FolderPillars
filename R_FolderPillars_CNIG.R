library(stringr)

list <- c(1,2,3,6,7,8,9,10,20,21,22,23,24,25,43,44,45,46,47,48,49,50,67,68,69,70,
          71,72,73,74,75,92,93,94,95,96,97,98,99,100,119,120,121,122,123,124,125,
          126,151,152,153,154,155,156,157,184,185,186,187,188,189,190,191,222,223,
          224,225,226,227,228,229,260,261,262,263,264,265,266,298,299,300,301,302,
          303,304,298,299,300,301,302,303,304,336,'302B','303B')

path <- "D:/_10_LIDAR_CNIG/2015/"

FolderPillars <- function (l, p, mainfoldername, padnum = 4, padchar = "0",
                           subfolders = c("CNIG_descarga"), subsubfolders = c("a","b")){
    for (i in l){
        #create folder name
        name <- paste0(p, mainfoldername, str_pad(i, padnum, "left", pad = padchar), "/")
        #if doesn't exist create and add a new folder structure inside
        if (!dir.exists(name)){
            dir.create(name)
            for (sf in subfolders){
                dir.create(paste0(name,sf,"/"))
                for (ssf in subsubfolders){
                    dir.create(paste0(name,sf,"/"),ssf,"/")
                }
            }
        } else {
            print("Dir already exists!")
        }
    }   
}

FolderPillars(list, path, "MTN")