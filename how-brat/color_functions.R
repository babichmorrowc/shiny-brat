# Function to return coordinates in a cylinder given HSV
hsv2cyl_xyz <- function(hsv_vec) {
  # Given a 3x1 matrix, e.g. one returned by rgb2hsv
  # Assuming the 1st value is hue, 2nd saturation, 3rd value
  xyz_coord <- c(hsv_vec[2] * cos(hsv_vec[1] * 2 * pi),
                 hsv_vec[2] * sin(hsv_vec[1] * 2 * pi),
                 hsv_vec[3])
  return(xyz_coord)
}

# Function to compute the distance from a reference color to an input color
color_distance <- function(ref_color = "#9ACC3F",
                           new_color,
                           color_space = "rgb") {
  
  # Convert hex to rgb
  # Dividing by 255 to get a unit cube
  ref_rgb <- col2rgb(ref_color) / 255
  new_rgb <- col2rgb(new_color) / 255
  
  if(color_space == "rgb") {
    # Calculate euclidean distance between colors
    dist <- as.numeric(dist(rbind(t(new_rgb), t(ref_rgb))))
    
    # Calculate percent of sqrt 3
    perc_dist <- 1 - dist / sqrt(3)
  } else if(color_space == "hsv") {
    # Convert hex to hsv
    ref_hsv <- rgb2hsv(ref_rgb, maxColorValue = 1)
    new_hsv <- rgb2hsv(new_rgb, maxColorValue = 1)
    
    # Convert HSV to xyz coordinates in the cylinder
    ref_xyz <- hsv2cyl_xyz(ref_hsv)
    new_xyz <- hsv2cyl_xyz(new_hsv)
    
    # Calculate euclidean distance between colors
    dist <- as.numeric(dist(rbind(ref_xyz, new_xyz)))
    
    # Calculate percent of sqrt 5
    perc_dist <- 1 - dist / sqrt(5)
  }
  
  return(perc_dist)
}