rankall <- function(outcome, num = "best") {
    ## Read outcome data
    csvFile <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

    ## Check that state and outcome are valid
    if (missing(outcome)) {
        stop("missing [outcome]")
    }
    # Are these all of the outcomes?
    outcomes = c('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    if (!any(names(outcomes) == outcome)) {
        stop("invalid outcome")
    }
    
    if (num == "best") {
        num = 1
    } 
    
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    orderedData = order(csvFile$State, as.numeric(csvFile[,outcomes[outcome]]), na.last = NA )
    data.frame('hospital' = csvFile[orderedData, 2],
               'state' = csvFile[orderedData, 7])
    # tapply ?
    t = tapply(as.numeric(csvFile[,outcomes[outcome]]), csvFile$State, order, simplify = FALSE)
    s = split(csvFile, csvFile$State)
    u = split(csvFile, csvFile$State)
    t$CO == 4
    u$AK$Hospital.Name[t$AK == 4]
    d = data.frame(csvFile$State, csvFile[,11], csvFile[,2])
    
    
    #1) create a set of row indices that exclude NAs: u<-which(!is.na(data[,<name of outcome>])
    #2) subset the data using these indices This will return all data rows except any that have NA in the outcome column you're interested in.
    
    #In the set of hospitals for a given state I do the following:
    #first remove all the NAs using complete.cases() {this actually from the dataframe I create from reading selected column of the file)
    #order by outcome
    #count the rows for that hospital
    #use that count as index for worst when subsetting the record for that state I need to return
}