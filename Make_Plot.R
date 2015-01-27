make_plot <- function(Gully_DEM, Gully_field) {
  # This function will extract the columns of interest from the data frames and will draw the 
  # cross section of the same gully (field measurements and DEM from UAV data) in the same plot.
  Depth_Field <- Gully_field$Depth.until.soil.surface
  Distance_Field <- Gully_field$Length
  Depth_DEM <- Gully_DEM$Depth
  Distance_DEM <- Gully_DEM$DISTANCE
  plot(Distance_Field, Depth_Field, type="b", main="Gully Cross Section", xlab="Distance (m)", 
     ylab="Depth (m)", ylim=c(max(Depth_Field), min(Depth_DEM)), lwd=3, col="Blue")
  
  lines(Distance_DEM, Depth_DEM, lwd=3, col="Red", ylim=rev(range(Depth_DEM)))
  points(Distance_DEM, Depth_DEM, lwd=3, col="Red", ylim=rev(range(Depth_DEM)))
  legend("bottomright", c("Field","DEM"), lty=c(1,1), lwd=c(3, 3),col=c("blue","red")) 
  }