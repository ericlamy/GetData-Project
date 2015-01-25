# Getting and Cleaning Data: CODE BOOK for course project

## The raw data
The data are collected from the accelerometers from the Samsung Galaxy S smart-phone.
They are the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smart-phone with embedded inertial sensors.

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw data in this repo have been downloaded from [this archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

In the 'UCI HAR Dataset' folder, the raw data are organised as follows:

   * Training data (in the 'train' subfolder)
     * The subjects ID (in the 'subject_train.txt' file)
     * The activity ID (in the 'y_train.txt file)
     * The measurements (in the X_train.txt)
   * Test data (in the 'test' subfolder)
     * The subjects ID (in the 'subject_test.txt' file)
     * The activity ID (in the 'y_test.txt file)
     * The measurements (in the X_test.txt)
   * The names of the measurements are listed in the 'features.txt file and the 'features_info.txt' file contains their description.

All measurements are normalised.
   
## The 'training' and 'test' data sets
The 'training' and 'test' data sets have been re-composed from the above raw files.

## The transformation

The raw data have been processed as follows:

   1. To build the 'training' data set, the script combines the subjects IDs with the activity IDs and the measurements for the train data (see above).
   2. The 'test' data set is created by combining in the same way the subjects IDs with the activity IDs and the measurements for the test data.
   3. The 'training' and 'test' data set are merged in one data frame of 563 variables with 10299 observations.
   4. The columns of this data frame is named (labelled) with 'subject', 'activity' and the labels contained in the 'features.txt' file.
   5. From this data frame, the script creates a new data frame 'workingset' by extracting the columns : Subject, Activity and anything including mean() and std(). 
   6. In the 'workingset', the script replaces the activity ID with their corresponding activity names read form the 'activity_labels.txt' file.
   7. The variables names of the 'workingset' are further cleaned by:
       * setting all letters in lower case,
	   * removing all parentheses and dashes,
	   * replacing beginning 't' with 'timedomainsignal',
	   * replacing beginning 'f' with 'frequencydomainsignal',
	   * replacing abreviated names with their corresponding full names:
	     * 'acc' with 'acceleration
		 * 'gyrojerk' with 'angularacceleration'
		 * 'gyro' with 'angularspeed'
		 * 'mag' with 'magnitude'
	   * removing the 'bodybody' repetition with 'body'

From this tidy data set, the script creates a second independent tidy data set ('workingset2') with the average of each variable for each activity and each subject (using ddply).	   

This final tidy data set is written in a table format in  the 'tidy-data-set.txt' file with no column names.
 
## The result

### The first tidy data set ('workingset')
This data set contains 68 variables and 10299 observations.

All observations are normalised (i.e. in the range [-1,1]).

### The second tidy data set ('tidy-data-set.txt' file)
This data set contains 68 variables and 180 observations that corresponds to the averages on the measurements of the 30 subjects for the 6 activities performed.
(Each subject performs 6 activities).

The final 'tidy-data-set.txt' is located in the working directory and can be viewed.

All results are normalised (i.e. in the range [-1,1]).

----------
## Variables names conversion table:

|    Initial names	|	Result names	|
|	---------------------------	|	---------------------------------------------------------------	|
|	Subject	|	subject	|
|	Activity	|	activity	|
|	tBodyAcc-mean()-X	|	timedomainsignalbodyaccelerationmeanx	|
|	tBodyAcc-mean()-Y	|	timedomainsignalbodyaccelerationmeany	|
|	tBodyAcc-mean()-Z	|	timedomainsignalbodyaccelerationmeanz	|
|	tBodyAcc-std()-X	|	timedomainsignalbodyaccelerationstdx	|
|	tBodyAcc-std()-Y	|	timedomainsignalbodyaccelerationstdy	|
|	tBodyAcc-std()-Z	|	timedomainsignalbodyaccelerationstdz	|
|	tGravityAcc-mean()-X	|	timedomainsignalgravityaccelerationmeanx	|
|	tGravityAcc-mean()-Y	|	timedomainsignalgravityaccelerationmeany	|
|	tGravityAcc-mean()-Z	|	timedomainsignalgravityaccelerationmeanz	|
|	tGravityAcc-std()-X	|	timedomainsignalgravityaccelerationstdx	|
|	tGravityAcc-std()-Y	|	timedomainsignalgravityaccelerationstdy	|
|	tGravityAcc-std()-Z	|	timedomainsignalgravityaccelerationstdz	|
|	tBodyAccJerk-mean()-X	|	timedomainsignalbodyaccelerationjerkmeanx	|
|	tBodyAccJerk-mean()-Y	|	timedomainsignalbodyaccelerationjerkmeany	|
|	tBodyAccJerk-mean()-Z	|	timedomainsignalbodyaccelerationjerkmeanz	|
|	tBodyAccJerk-std()-X	|	timedomainsignalbodyaccelerationjerkstdx	|
|	tBodyAccJerk-std()-Y	|	timedomainsignalbodyaccelerationjerkstdy	|
|	tBodyAccJerk-std()-Z	|	timedomainsignalbodyaccelerationjerkstdz	|
|	tBodyGyro-mean()-X	|	timedomainsignalbodyangularspeedmeanx	|
|	tBodyGyro-mean()-Y	|	timedomainsignalbodyangularspeedmeany	|
|	tBodyGyro-mean()-Z	|	timedomainsignalbodyangularspeedmeanz	|
|	tBodyGyro-std()-X	|	timedomainsignalbodyangularspeedstdx	|
|	tBodyGyro-std()-Y	|	timedomainsignalbodyangularspeedstdy	|
|	tBodyGyro-std()-Z	|	timedomainsignalbodyangularspeedstdz	|
|	tBodyGyroJerk-mean()-X	|	timedomainsignalbodyangularaccelerationmeanx	|
|	tBodyGyroJerk-mean()-Y	|	timedomainsignalbodyangularaccelerationmeany	|
|	tBodyGyroJerk-mean()-Z	|	timedomainsignalbodyangularaccelerationmeanz	|
|	tBodyGyroJerk-std()-X	|	timedomainsignalbodyangularaccelerationstdx	|
|	tBodyGyroJerk-std()-Y	|	timedomainsignalbodyangularaccelerationstdy	|
|	tBodyGyroJerk-std()-Z	|	timedomainsignalbodyangularaccelerationstdz	|
|	tBodyAccMag-mean()	|	timedomainsignalbodyaccelerationmagnitudemean	|
|	tBodyAccMag-std()	|	timedomainsignalbodyaccelerationmagnitudestd	|
|	tGravityAccMag-mean()	|	timedomainsignalgravityaccelerationmagnitudemean	|
|	tGravityAccMag-std()	|	timedomainsignalgravityaccelerationmagnitudestd	|
|	tBodyAccJerkMag-mean()	|	timedomainsignalbodyaccelerationjerkmagnitudemean	|
|	tBodyAccJerkMag-std()	|	timedomainsignalbodyaccelerationjerkmagnitudestd	|
|	tBodyGyroMag-mean()	|	timedomainsignalbodyangularspeedmagnitudemean	|
|	tBodyGyroMag-std()	|	timedomainsignalbodyangularspeedmagnitudestd	|
|	tBodyGyroJerkMag-mean()	|	timedomainsignalbodyangularaccelerationmagnitudemean	|
|	tBodyGyroJerkMag-std()	|	timedomainsignalbodyangularaccelerationmagnitudestd	|
|	fBodyAcc-mean()-X	|	frequencydomainsignalbodyaccelerationmeanx	|
|	fBodyAcc-mean()-Y	|	frequencydomainsignalbodyaccelerationmeany	|
|	fBodyAcc-mean()-Z	|	frequencydomainsignalbodyaccelerationmeanz	|
|	fBodyAcc-std()-X	|	frequencydomainsignalbodyaccelerationstdx	|
|	fBodyAcc-std()-Y	|	frequencydomainsignalbodyaccelerationstdy	|
|	fBodyAcc-std()-Z	|	frequencydomainsignalbodyaccelerationstdz	|
|	fBodyAccJerk-mean()-X	|	frequencydomainsignalbodyaccelerationjerkmeanx	|
|	fBodyAccJerk-mean()-Y	|	frequencydomainsignalbodyaccelerationjerkmeany	|
|	fBodyAccJerk-mean()-Z	|	frequencydomainsignalbodyaccelerationjerkmeanz	|
|	fBodyAccJerk-std()-X	|	frequencydomainsignalbodyaccelerationjerkstdx	|
|	fBodyAccJerk-std()-Y	|	frequencydomainsignalbodyaccelerationjerkstdy	|
|	fBodyAccJerk-std()-Z	|	frequencydomainsignalbodyaccelerationjerkstdz	|
|	fBodyGyro-mean()-X	|	frequencydomainsignalbodyangularspeedmeanx	|
|	fBodyGyro-mean()-Y	|	frequencydomainsignalbodyangularspeedmeany	|
|	fBodyGyro-mean()-Z	|	frequencydomainsignalbodyangularspeedmeanz	|
|	fBodyGyro-std()-X	|	frequencydomainsignalbodyangularspeedstdx	|
|	fBodyGyro-std()-Y	|	frequencydomainsignalbodyangularspeedstdy	|
|	fBodyGyro-std()-Z	|	frequencydomainsignalbodyangularspeedstdz	|
|	fBodyAccMag-mean()	|	frequencydomainsignalbodyaccelerationmagnitudemean	|
|	fBodyAccMag-std()	|	frequencydomainsignalbodyaccelerationmagnitudestd	|
|	fBodyBodyAccJerkMag-mean()	|	frequencydomainsignalbodyaccelerationjerkmagnitudemean	|
|	fBodyBodyAccJerkMag-std()	|	frequencydomainsignalbodyaccelerationjerkmagnitudestd	|
|	fBodyBodyGyroMag-mean()	|	frequencydomainsignalbodyangularspeedmagnitudemean	|
|	fBodyBodyGyroMag-std()	|	frequencydomainsignalbodyangularspeedmagnitudestd	|
|	fBodyBodyGyroJerkMag-mean()	|	frequencydomainsignalbodyangularaccelerationmagnitudemean	|
|	fBodyBodyGyroJerkMag-std()	|	frequencydomainsignalbodyangularaccelerationmagnitudestd	|
