#Load the gully data that is stored in a .csv file. The file is described by 2 GPS points between which a cross
#section profile has been measured.

load_dem_data <- function (GPSpoint1, GPSpoint2) {
  file_loc <- paste("DEMs/Results.gdb/Tej_", GPSpoint1, "_", GPSpoint2, ".csv", sep="")
  Gully_DEM<- read.csv(file_loc)
}


load_field_data <- function (GPSpoint1, GPSpoint2) {
  file_loc <- paste("DEMs/Results.gdb/Tej_", GPSpoint1, "_", GPSpoint2, "_field_meas.csv", sep="") 
  Gully_DEM<- read.csv(file_loc, sep=";")
}