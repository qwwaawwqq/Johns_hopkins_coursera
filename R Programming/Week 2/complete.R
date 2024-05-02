complete <- function(directory, id = 1:332) {
  # Create an empty data frame to store the results
  results <- data.frame(id = integer(), nobs = integer(), stringsAsFactors = FALSE)
  
  # Loop through each ID
  for (monitor_id in id) {
    # Construct file name based on current monitor ID
    file_path <- sprintf("%s/%03d.csv", directory, monitor_id)
    
    # Check if file exists
    if (file.exists(file_path)) {
      # Read the CSV file
      data <- read.csv(file_path)
      
      # Count complete cases
      complete_cases_count <- sum(complete.cases(data))
      
      # Append the result to the data frame
      results <- rbind(results, data.frame(id = monitor_id, nobs = complete_cases_count))
    }
  }
  
  # Return the results data frame
  return(results)
}
