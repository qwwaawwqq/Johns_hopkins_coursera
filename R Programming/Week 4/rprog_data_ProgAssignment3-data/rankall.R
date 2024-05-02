rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that outcome is valid
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
  
  ## For each state, find the hospital of the given rank
  state_list <- unique(outcomes$State)
  
  hospital_ranks <- data.frame(hospital = character(length(state_list)),
                               state = character(length(state_list)),
                               stringsAsFactors = FALSE)
  
  for (i in seq_along(state_list)) {
    state_data <- outcomes[outcomes$State == state_list[i], ]
    state_data[, index] <- as.numeric(state_data[, index])
    
    state_data <- state_data[order(state_data[, index], state_data[, 2]), ]
    
    if (num == "best") {
      hospital_ranks$hospital[i] <- state_data$Hospital.Name[1]
    } else if (num == "worst") {
      hospital_ranks$hospital[i] <- state_data$Hospital.Name[nrow(state_data)]
    } else {
      hospital_ranks$hospital[i] <- state_data$Hospital.Name[num]
    }
    
    hospital_ranks$state[i] <- state_list[i]
  }
  
  ## Return a data frame with the hospital names and the state name
  hospital_ranks
}