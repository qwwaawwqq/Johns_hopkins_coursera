pollutantmean <- function(directory, pollutant, id = 1:332) {
  # Create an empty vector to store pollutant values
  pollutant_values <- numeric()
  
  # Loop through each monitor ID
  for (i in id) {
    # Generate file path for each monitor's data file
    file_path <- paste0(directory, "/", formatC(i, width = 3, flag = "0"), ".csv")
    
    # Read data from the file
    data <- read.csv(file_path)
    
    # Extract pollutant values for the specified pollutant
    pollutant_values <- c(pollutant_values, data[[pollutant]])
  }
  
  # Calculate mean of the pollutant values, ignoring NA values
  mean_pollutant <- mean(pollutant_values, na.rm = TRUE)
  
  # Return the mean
  return(mean_pollutant)
}
