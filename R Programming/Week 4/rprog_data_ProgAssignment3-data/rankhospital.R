rankhospital <- function(state, outcome, num = "best") {
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
  
  ## Rank hospitals in that state by 30-day death rate
  state_data <- state_data[order(state_data[, index], state_data[, 2]), ]
  
  ## Return hospital name in that state with the given rank
  if (num == "best") {
    return(state_data$Hospital.Name[1])
  } else if (num == "worst") {
    return(state_data$Hospital.Name[nrow(state_data)])
  } else {
    return(state_data$Hospital.Name[num])
  }
}