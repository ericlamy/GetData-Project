##########################################################################################
##                                                                                      ##
## The 'run_analysis' script:                                                           ##
##   1. Merges the 'training' and the 'test' sets and creates a new data sets           ##
##      'workingset'.                                                                   ##
##   2. Extracts only the measurements on the mean and standard deviation               ##
##      for each measurement.                                                           ##
##   3. Uses descriptive activity names to name the activities in the data set.         ##
##   4. Appropriately labels the data set with descriptive variable names.              ##
##   5. From the data set in step 4, creates a second, independent tidy data set with   ##
##      the average of each variable for each activity and each subject.                ##
##                                                                                      ##
## Input: None.                                                                         ##
##                                                                                      ##
## Input files:                                                                         ##
##   - The 'training' set is composed of the 'subject_train.txt', 'y_train.txt' and     ##
##     the 'X_train.txt' files.                                                         ##
##   - The 'test' set is composed of the 'subject_test.tx', 'y_test.txt' and the        ##
##     'X_test.txt' files.                                                              ##
##   - The 'features.txt' file contains names of each variable (column) for both set.   ##
##   - The 'activity_labels.txt' file contains the names for the different activity     ##
##     codes.                                                                           ##
##   All the files are located under the 'UCI HAR Dataset' folder or subfolders.        ##
##                                                                                      ##
## Output: The tidy data set in the 'tidy-data-set.txt' file in the format              ##
##         write.table(..., row.name=FALSE, ...)                                        ##
##                                                                                      ##
## Version:                                                                             ##
##      1.0 150122 Inital version (Eric)                                                ##
##                                                                                      ##
## Todo: NA                                                                             ##
##########################################################################################

## Load plyr library that will be used to calculate the average of each variable.
library(plyr)

##########################################################################################
## Step 1. Merges the 'training' and the 'test' sets to create one data set.            ## 
########################################################################################## 

## Load TRAIN data and merge them in one dataset 'training'.
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt") 
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt") 
train_data <- read.table("UCI HAR Dataset/train/X_train.txt") 
training <- cbind(cbind(train_subject, train_activity), train_data) 

## Load TEST data and merge them in one dataset 'test'. 
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt") 
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt") 
test_data <- read.table("UCI HAR Dataset/test/X_test.txt") 
test <- cbind(cbind(test_subject, test_activity), test_data) 

## Merge training dataset and test dataset in a data frame with 563 variables.(1+1+561) 
data <- rbind(training, test)

## Load labels (from 'features.txt' file) and name the 'data' dataset columns.  
labels <- read.table("UCI HAR Dataset/features.txt") 
names(data) <- c("Subject", "Activity", as.character(labels$V2)) 

##########################################################################################
## Step 2. Extracts all the measurements on the mean and the standard deviation         ## 
##         for each measurement.                                                        ## 
##########################################################################################

## Extract the Subject, Activity and all columns that includes the word mean() and std().
workingset <- data[, grep("Subject|Activity|mean\\(\\)|std\\(\\)", names(data), value=TRUE)]

##########################################################################################
## Step 3. Uses descriptive activity names to name the activities in the data set.      ##
##########################################################################################

## Read the activity names from the 'activity_labels.txt' file
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

## In the working set, replace the activity id with their corresponding activity name
workingset$Activity <- activities[workingset$Activity, 2] 

##########################################################################################
## Step 4. Appropriately labels the data set with descriptive variable names.           ##
##########################################################################################

## Set all letters in lower case in the variables (column) of the working set.
names(workingset) <- tolower(names(workingset))

## In the variables (columns) of the working set, remove all parentheses and dashes.
names(workingset) <- gsub('\\(|\\)|-', "", names(workingset))

## Replace begining 't' with timedomainsignal.
names(workingset) <- gsub('^t', "timedomainsignal", names(workingset))

## Replace begining 'f' with frequencydomainsignal.
names(workingset) <- gsub('^f', "frequencydomainsignal", names(workingset))

## Replace abreviated names with their corresponding full names.
names(workingset) <- gsub('acc', "acceleration", names(workingset))
names(workingset) <- gsub('gyrojerk', "angularacceleration", names(workingset))
names(workingset) <- gsub('gyro', "angularspeed", names(workingset))
names(workingset) <- gsub('mag', "magnitude", names(workingset))

## Remove repetition (bodybody)
names(workingset) <- gsub("bodybody", "body", names(workingset))

##########################################################################################
## Step 5. From the data set in step 4, creates a second, independent tidy data set     ##
##         with the average of each variable for each activity and each subject.        ##
##########################################################################################

## Calculate the average of each variable for each subject and activity
## in the new data set 'workingset2'.
##
workingset2 <- ddply(workingset, c("subject", "activity"), numcolwise(mean))

##########################################################################################
## Step 6. Write the final tidy data set in a txt file.                                 ##  
##########################################################################################

write.table(workingset2, row.name=FALSE, file="tidy-data-set.txt")

## Script end.