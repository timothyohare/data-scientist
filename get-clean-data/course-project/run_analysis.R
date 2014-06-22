# Course project for "Getting and Cleaning Data" class
# Data was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# H.A.R.U.S. => Human Activity Recognition Using Smartphones

harus <- function() {
    if (!file.exists("./data")) {dir.create("./data")}
    zipDataUrl <-   "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipDataFile <- "./data/HARUSzipData.zip"
    if (!file.exists(zipDataFile)) {
        download.file(zipDataUrl, destfile=zipDataFile)
    }
    
    # file names
    zipDir <- "./data/UCI HAR Dataset"
    
    featuresFile <- paste(zipDir, "/features.txt", sep="")
    features <- read.table(featuresFile, col.names = c('feature_idx', 'feature'))
    
    activityLabelsFile <- paste(zipDir, "/activity_labels.txt", sep="")
    activities <- read.table(activityLabelsFile, col.names = c('activity_idx', 'activity'))
    
    # read in the test data
    testDir <- paste(zipDir, "/test", sep="")
    
    subjectTestFile <- paste(testDir, "./subject_test.txt", sep="")
    testSubjects <- read.table(subjectTestFile, col.names = c('subject_id'))
    
    XtestFile <- paste(testDir, "./X_test.txt", sep="")
    Xtest <- read.table(XtestFile)
    colnames(Xtest) <- features$feature
    
    ytestFile <- paste(testDir, "./y_test.txt", sep="")
    ytest <- read.table(ytestFile, col.names = "activities")
    
    # read in the training data
    trainDir <- paste(zipDir, "/train", sep="")
    
    subjectTrainFile <- paste(trainDir, "./subject_train.txt", sep="")
    trainSubjects <- read.table(subjectTrainFile, col.names = c('subject_id'))
    
    XtrainFile <- paste(trainDir, "./X_train.txt", sep="")
    Xtrain <- read.table(XtrainFile)
    colnames(Xtrain) <- features$feature
    
    ytrainFile <- paste(trainDir, "./y_train.txt", sep="")
    ytrain <- read.table(ytrainFile, col.names = "activities")
    
    if (!file.exists(featuresFile)) {
        #unzip(zipDataFile, exdir="./data" )
        print (sprintf("Features file named %s doesn't exist", featuresFile))
    }
    
    # (ff <- factor(substring("statistics", 1:10, 1:10), levels = letters)
    # combo <- data.frame(schtyp, schtyp.f, ses, ses.f, read)
    # act <- c("WALKING" = 1, "WALKING_UPSTAIRS" = 2, "WALKING_DOWNSTAIRS" = 3, "SITTING" = 4, "STANDING" = 5, "LAYING" = 6)
    # act <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
    # http://www.ats.ucla.edu/stat/r/modules/factor_variables.htm
    # ses.order <- ordered(ses, levels = c("low", "middle", "high"))
    # ses.order <- ordered(ytest, levels = act)
    
    f <- factor(activities$activity, levels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
    # tells how many are there for each activity
    #table(ytrain, dnn=f)
    combo <- data.frame(ytrain, trainSubjects, Xtrain)
    write.csv(combo, "./data/combined_tidy_dataset.csv")
}