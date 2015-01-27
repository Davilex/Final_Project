# Title: Accuracy of gully cross sections in a high resolution DEM.
# Team: Gully Bully (David Scholte-Albers)
# Date: 29-01-2015 

############### Initialization #################

#Check Working Directory
setwd("D:/GS_Final")
getwd()

# import libraries

# import functions
source("Final_Project/R/FinalProjectDavid/Make_Plot.R")

################ Data processing #################
# 
# Load Gully Data, the numbers in the names refer to points taken with GPS
Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_01_03.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_1_3_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_13_16.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_13_16_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_26_28.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_26_28_field_meas.csv")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_39_41.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_39_41_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_48_50.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_48_50_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_60_62.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_60_62_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_73_75.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_73_75_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_73_75.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_73_75_field_meas.csv")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_76_77.csv") # Ietwat dubieus dat DEM kortere geul heeft
Gully_field <- read.csv("DEMs/Results.gdb/Tej_76_77_through_field_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_78_79.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_78_79_lots_of_vegetation_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_112_114.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_112_114_waste_field_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_115_117.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_115_117_wasteland_field_meas.csv")

######Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_117_119.csv") 117???? kan bestandje niet vinden.
#####Gully_field <- read.csv("DEMs/Results.gdb/Tej_117_119_lots_of_vegetation_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_146_147.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_146_147_triple_field_meas.csv")

#Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_148_149.csv")
#Gully_field <- read.csv("DEMs/Results.gdb/Tej_148_149_small_double_field_meas.csv")

Gully_DEM <- read.csv("DEMs/Results.gdb/Tej_150_151.csv")
Gully_field <- read.csv("DEMs/Results.gdb/Tej_150_151_small_single_field_meas.csv")

#Gully_field2 <- na.omit(Gully_field)
#gf <- df(Gully_field, na.omit=T)



# Add Depth Field to Gully_DEM
Gully_DEM$Depth <- Gully_DEM$RASTERVALU[1] - Gully_DEM$RASTERVALU

############### Plot Results #####################
make_plot(Gully_DEM, Gully_field)

############### Determine Difference ####################
difference_per_5_cm <- Gully_field$Depth.until.soil.surface..m. - Gully_DEM$Depth

############### Statistics ##########################


mean(difference_per_5_cm)
sd(difference_per_5_cm)
lines(Gully_field$Length_m, difference_per_5_cm, lwd=3, col="Green")

###### End of Script #####