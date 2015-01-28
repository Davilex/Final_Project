# The load_data function loads the data for 2 given GPS_points. Both DEM data as well as field measurements
# are loaded into the Gully_DEM and the Gully_field parameter.

load_data <- function (GPSpoint1, GPSpoint2) {
  DEM <- paste("DEMs/Results.gdb/Tej_", GPSpoint1, "_", GPSpoint2, ".csv", sep="")
  Gully_DEM<- read.csv(DEM, sep=";")
  Field <- paste("DEMs/Results.gdb/Tej_", GPSpoint1, "_", GPSpoint2, "_field_meas.csv", sep="")
  Gully_Field <- read.csv(Field, sep=";")
  Gullies <- c(Gully_DEM, Gully_Field)
  return(Gullies)
}

load_data(13,16)[1]
Gully_Field <- load_data(13,16)[2]
class(Gully_DEM)
Gully_Field

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_01_03.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_1_3_field_meas.csv", sep=";") ####### comma seperated

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_13_16.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_13_16_field_meas.csv", sep=";")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_26_28.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_26_28_field_meas.csv", sep=";")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_39_41.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_39_41_field_meas.csv", sep=";")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_48_50.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_48_50_field_meas.csv", sep=";")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_73_75.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_73_75_field_meas.csv", sep=";")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_78_79.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_78_79_field_meas.csv", sep=";")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_115_117.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_115_117_field_meas.csv", sep=";")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_146_147.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_146_147_field_meas.csv", sep=";")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_148_149.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_148_149_field_meas.csv", sep=";")


#####Gully_field2 <- na.omit(Gully_field) Mochten er nog NAs inzitten...
#gf <- df(Gully_field, na.omit=T)