# Getting and Cleaning Data: README for course project

## Introduction:
This project is an assignment of the Data Science specialisation offered by the Johns Hopkins University.
This is my personnel contribution.

## Purpose:
The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.

## The repo structure and contents:

In the main folder:

   1. README.md (this file)
   2. codebook.md contains the detailed description of the variables of the tidy data set ('tidy-data-set.txt' file).
   3. run_analysis.R - A R script to run to create the 'tidy-data-set.txt' file.
   4. The 'UCI HAR Dataset' folder contains the data to be cleaned.
   
In the 'UCI HAR Dataset' folder:

   1. README.txt explains the datasets structure.
   2. 'features_info.txt' shows information about the variables used on the feature vector.
   3. 'features.txt': List of all features.
   4. 'activity_labels.txt': Links the class labels with their activity name.
   5. 'train/X_train.txt': Training set.
   6. 'train/y_train.txt': Training labels.
   7. 'test/X_test.txt': Test set.
   8. 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.

(Remark: the files under the './Inertial Signals' subfolders are not use here.)

## The (raw) data:
The data are collected from the accelerometers from the Samsung Galaxy S smart-phone.
They are the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smart-phone with embedded inertial sensors.
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
For your convenience, they are located in the 'UCI HAR Dataset' folder and subfolders of this repo.

## The data sets

The 'training' and 'test' data sets are re-composed from the following (raw) files:

- The files prefixed by 'subject_' contains the subjects IDs.
- The files prefixed by 'y_' contains the activity IDs.
- The files prefixed by 'X_' contains the measurements.
- 'features.txt' contains the name of the variables in the measurements files (X_train.txt and X_test.txt).
- 'activity_labels.txt' contains the labels for each activity code.

## The 'run_analysis' script:
This script:

   1. Merges the 'training' and the 'test' sets and creates a new data set 'workingset'.
   2. Extracts only the measurements on the mean and standard deviation for each measurement.
   3. Uses descriptive activity names to name the activities in the data set.
   4. Appropriately labels the data set with descriptive variable names.
   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   
## Script output:
The script creates the 'tidy-data-set.txt' file in the format ""write.table(..., row.name=FALSE, ...)".
This is the tidy data to produce. You can find a detailed description of these in the associated 'codebook.md' file in this repo.

## How to run the script:

   1. Open a R console and set the working directory to the locaction where you have downloaded this repo.
   
      setwd("your_location_here")
   2. Run the script:
   
      source("run_analysis.R")
   3. You can view the tidy data set from the 'tidy-data-set.txt' file.	  
   

   
