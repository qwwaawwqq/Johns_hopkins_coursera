corr <- function(directory, threshold = 0) {
  # List all CSV files in the directory
  files <- list.files(directory, pattern = "\\.csv$", full.names = TRUE)
  
  # Initialize a vector to store the correlations
  correlations <- numeric(0)
  
  # Iterate over each file
  for (file in files) {
    # Read the CSV file
    data <- read.csv(file)
    
    # Check if the file has enough complete cases
    if (sum(complete.cases(data)) > threshold) {
      # Compute the correlation between sulfate and nitrate
      # Ensure that both columns exist in the data
      if ("sulfate" %in% names(data) && "nitrate" %in% names(data)) {
        current_cor <- cor(data$sulfate, data$nitrate, use = "complete.obs")
        # Append the result to the correlations vector if it's not NA
        if (!is.na(current_cor)) {
          correlations <- c(correlations, current_cor)
        }
      }
    }
  }
  
  # Return the vector of correlations
  return(correlations)
}