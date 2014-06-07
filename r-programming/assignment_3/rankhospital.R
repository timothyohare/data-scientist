rankhospital <- function(state, outcome, num = "best") {
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
    
    # Are these all of the outcomes?
    outcomes = c('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    if (!any(names(outcomes) == outcome)) {
        stop("invalid outcome")
    }
    
    if (num == "best") {
        num = 1
    } 
    
    
    # Hospitals that do not have data on a particular outcome should
    # be excluded from the set of hospitals when deciding the rankings.
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    stateData = csvFile[csvFile$State == state,]
    #stateData$Hospital.Name[which.min(stateData[,outcomes[outcome]])]
    orderedData = order(as.numeric(stateData[,outcomes[outcome]]), stateData[,2], na.last = NA )
    # TODO If the number given by num is larger than the number of hospitals in that
    # state, then the function should return NA.
    if (num == "worst") {
      num = length(orderedData) 
    }
    stateData[orderedData[num],2]
}