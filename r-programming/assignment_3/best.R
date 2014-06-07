best <- function(state, outcome) {
    ## Read outcome data
    csvFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    if (missing(state)) {
        stop("Missing [state]")
    }
    if (missing(outcome)) {
        stop("missing [outcome]")
    }
    if (!any(csvFile$State == state)) {
        stop("invalid state")
    }
    outcomes = c('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    if (!any(names(outcomes) == outcome)) {
        stop("invalid outcome")
    }
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    #state_data = subset(outcome, outcome$State == state, select = c(2, 7, 11, 17, 23))
    stateData = csvFile[csvFile$State == state,]
    # TODO fix warning "In which.min(stateData[, 11]) : NAs introduced by coercion"
    stateData$Hospital.Name[which.min(stateData[,outcomes[outcome]])]
    #stateData$Hospital.Name[which.min(as.numeric(stateData[,outcomes[outcome]]) == min(as.numeric(stateData[,outcomes[outcome]]),na.rm = TRUE))]
    
    # TODO doesn't fix the order for ties
}