best <- function(state, outcome) {
  ## Read outcome data
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if (!state %in% unique(outcomes[, 7])) {
    stop("invalid state")
  }
  
  if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop("invalid outcome")
  }
  
  ## Get column indices for the given outcome
  if (outcome == "heart attack") {
    index <- 11
  } else if (outcome == "heart failure") {
    index <- 17
  } else {
    index <- 23
  }
  
  ## Filter data by state and outcome
  state_data <- outcomes[outcomes$State == state, ]
  state_data[, index] <- as.numeric(state_data[, index])
  
  ## Return hospital name in that state with lowest 30-day death rate
  best_hospital <- state_data$Hospital.Name[which.min(state_data[, index])]
  
  best_hospital
}