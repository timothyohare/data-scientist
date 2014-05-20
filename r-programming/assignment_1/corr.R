corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    files_list <- dir(directory, full.names = TRUE)
    #creates a list of files
    #dat <- data.frame() #creates an empty data frame
    corvec <- numeric()
    #corvec2 <- numeric()
    for (file_name in files_list) {
        csv_file <- read.csv(file_name)
        cc <- sum(complete.cases(csv_file))
        #cat(sprintf("%s: %d\n", file_name, cc))
        if (cc > threshold) {
            # loops through the files, rbinding them together
            
            #dat <- rbind(dat, csv_file)
            #tempc = cor(dat$sulfate, dat$nitrate, use="complete.obs")
            tempc = cor(csv_file$sulfate, csv_file$nitrate, use="complete.obs")
            #tempc2 = cor(csv_file$sulfate, csv_file$nitrate, use="pairwise.complete.obs")
            #cat(sprintf("added %s, curr cor %f\n", file_name, tempc))
            corvec <- c(corvec, tempc)
            #corvec2 <- c(corvec2, tempc2)
        }
        
    }
    #dat_subset <- subset(dat, dat$Day == day) #subsets the rows matching the 'day' argument
    #median(dat_subset$Weight, na.rm = TRUE) #identifies the median of the subset
    # while stripping out the NAs
    #lastcorvec <- cor(dat$sulfate, dat$nitrate, use="complete.obs")
    corvec
    #cat(head(corvec2))
}
