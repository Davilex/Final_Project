# Title: Accuracy of gully cross sections in a high resolution DEM.
# Team: Gully Bully (David Scholte-Albers)
# Date: 29-01-2015 

############### Initialization #################

rm(list = ls())
ls()
#options(digits = 3)
# Check Working Directory
setwd("D:/GS_Final")
getwd()

# Set username
username = "Guest013"

# import libraries
library(ggplot2)

# import functions
source("Final_Project/R/FinalProjectDavid/Make_Plot.R")
source("Final_Project/R/FinalProjectDavid/Load_Field_and_DEM_Data.R")

################ Data processing #################

# Load Gully Data, change GPS_points for different data
# Valid combinations are: (1, 3); (13, 16); (26, 28); (39, 41); (48, 50); 
# (73, 75); (78, 79); (115, 117); (146, 147); (148, 149)
GPS_points <- c(1,3)
DEM_values <- load_dem_data(GPS_points[1], GPS_points[2])
Field_values <- load_field_data(GPS_points[1], GPS_points[2])

########## MOOIER!!!!!!!!!!!!!!
DEM_values <- load_dem_data("01", "03_2")

# Add Depth Field to Gully_DEM
DEM_values$Depth <- DEM_values$RASTERVALU[1] - DEM_values$RASTERVALU

############### Plot Results #####################
make_plot(DEM_values, Field_values)

############### Determine Difference ####################
difference_per_5_cm <- abs(Field_values$Depth.until.soil.surface - DEM_values$Depth)

############## Plot difference in same plot #################
if (length(Field_values$Length) >= length(DEM_values$DISTANCE)) {
  lines(Field_values$Length, difference_per_5_cm, lwd=3, col="Black")
  } else {
    lines(lines(DEM_values$DISTANCE, difference_per_5_cm, lwd=3, col="Black"))
  }
############### Statistics ##########################
mean_difference <- round(mean(difference_per_5_cm), digits=3)
max_difference <- round(max(difference_per_5_cm), digits=3)
sd_difference <- round(sd(difference_per_5_cm), digits=3)

############# Conclusion ######################
print(paste("Welcome ", username, "! Thank you for using this lovely tool to determine the difference in depth",
            " between a real gully and the same gully in a DEM. The GPS points you chose are ", GPS_points[1], " and ",
            GPS_points[2], ". The accuracy of the DEM is a bit disappointing, because there is a mean difference of ", 
            mean_difference, "m and a standard deviation of ", sd_difference, "m. The largest difference between DEM ", 
            "and measurement is " , max_difference, "m. Thank you for using this tool, we hope to see you again.", sep=""))

###### End of Script #####