Codebook
========
The zipped data used for the assignment is provided by Coursera's link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data is originally from: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws www.smartlab.ws

After unzipping the directory ./UCI HAR Dataset is created, with 2 sub- directories "train" and "test", along with 4 descriptive files: 1) feature_labels 2) features 3) features_info and 4) Readme. These files contain descriptions of the actual data, labeling, units and data files in the sub-directories "train" and "test". The sub-directories "train" and "test" each contain one sub-directory with the original signals, "Inertial Signals", and 3 files:

1) the "X_*" (with * either "train" or "test") file containing the combined, lightly pre-processed data of measurements and gravity accelerations

2) the subject_* file describing the number of the person on whom the measurement was taken

3) the y_* file describing the Activity during the measurement

In the assignment the X, y and subject file will be combined and used, the inertial signals are not needed as all required info is in the X-file.

The column names of the X_train.txt and X_test.txt data has been set to the values in the 'features.txt' file.
