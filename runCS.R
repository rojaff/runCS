## To run this function you need to install the circuitscape python library:
## https://pypi.python.org/pypi/Circuitscape/

## Define runCS function
runCS <- function(coordinates, raster){
  name <- as.character(strsplit(raster, ".asc"))
  out <- paste0(name, ".out")
  ini <- paste0(name, ".ini")
  CS_ini <- c("[circuitscape options]",            
              "data_type = raster",
              "scenario = pairwise",
              paste(c("point_file =",
                      "habitat_file =",
                      "output_file ="),
                    paste(getwd(),c(coordinates, raster, out), sep="/")))
  writeLines(CS_ini, ini)
  CS_run <- paste("csrun.py", paste(getwd(), ini, sep="/"))
  system(CS_run)
}

### Example use:
## > source("runCS.R")
## > runCS(coordinates="coordinates.txt", raster="GD.asc")

