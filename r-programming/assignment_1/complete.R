complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases

    #cat('   id nobs\n')
    dat <- data.frame() #creates an empty data frame
    for (i in id) {
        nrows <- sum(complete.cases(read.csv(sprintf("%s/%03d.csv", directory, i))))
        #cat(sprintf(' %d %3d %4d\n', i, id[i], nrows))
        #corvec <- c()
        dat <- rbind(dat, cbind(id = i, nobs = nrows))
    }
    dat
}
