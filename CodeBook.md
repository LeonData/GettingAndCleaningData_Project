# CodeBook file for a tidy data set created by run_analysis.R #
* * *
This file describes a tidy data set that is created by run_analysis.R

The task is to analyse initial data files which have been collected in accordance with
the project that is described here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Short descriptoon of the data collection project

	There have been several data files collected by recording of accelerometer information 
	by a sensor built into a smart phone while 30 persons (subjects) performed activities of 
	daily living (ADL).
	Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
	SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

	As a result - a Human Activity Recognition database was built which was split into 
	a training set and a test set of files (they are located in /test and /train subfolders).

Files description is as follows:

Folder 'UCI HAR Dataset'

 * activity_labels.txt - contains 2 columns with 6 rows that describe activities as
  	- WALKING
	- WALKING_UPSTAIRS
	- WALKING_DOWNSTAIRS
	- SITTING
	- STANDING
	- LAYING

 * features.txt - contains 561 rows with names of measurements
 
 * features_info.txt - contains descriptions of the measurements

Folder 'UCI HAR Dataset/train'

 * subject_train.txt - contains subject ID (one per row, values from 1 to 30 inclusive)
                       of subjects that were included in the train set
 
 * X_train.txt       - contains rows of measurements       

 * y_train.txt       - contains activity codes (one per row, values from 1 to 6 inclusive)
 
Folder 'UCI HAR Dataset/test'

 * subject_test.txt  - contains subject ID (one per row, values from 1 to 30 inclusive)
                       of subjects that were included in the test set
 
 * X_test.txt       - contains rows of measurements       

 * y_test.txt       - contains activity codes (one per row, values from 1 to 6 inclusive)

## What does run_analysis.R do? ##

The code file does the following tasks as required by the project
assignment:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set (tidy.txt) with the average of each variable 
   for each activity and each subject.
 
## How to produce a tidy data set? ##

To produce a tidy data set you need:
     *	Unzip the archive data file that can be found here:
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	If successful, your unzip program will create a new directory
	'UCI HAR Dataset' under your current path,
     *	Copy run_analysis.R code file into 'UCI HAR Dataset' folder
     *	Set the working directory for R or RStudio to be 
	the one that points to 'UCI HAR Dataset', so the files
	in that directory can be accessed by R directly by name.
     *	If you don't have read.table package installed, please
	install it by calling 'install.packages("read.table")
     *	Run the code in 'run_analysis.R'

## How is data organized in tidy.txt file? ##

If you have run run_analysis.R correctly, the script shall produce
one TXT file 'tidy.txt' in the local folder which will contain
a tidy data set in the following format:

* Subject ID (numeric, values from 1 to 30 inclusive)
* Activity label (character string, see above explanations for activity_labels.txt)
* The next columns will contain means and standard deviations of the parameters 
  described above in its original form ( like tBodyAcc-mean()-X ). 
  See full list of activities in features.txt file.
  The order of the columns starting from column 3 is the same as in features.txt

There will be 6 rows with the same subject ID, for each activity, 180 rows in total.
