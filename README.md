GettingAndCleaningData Project
==============================

* * *
This file describes the scope of work for the project

The main task is to analyse files which have been collected in accordance with
the data collection project that is described here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Short descriptoon of the data collection project

There have been several data files collected by recording of accelerometer information 
by a sensor built into a smart phone while 30 persons (subjects) performed activities of 
daily living (ADL).
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist.

As a result - a Human Activity Recognition database was built which was split into 
a training set and a test set of files. All files have been zipped together into an archive
that can be found using the link above. When the archive in unzipped, a new folder
'UCI HAR Dataset' gets created that also contains two subfolders /test and /train among
others. Files that are used for this project are located in 'UCI HAR Dataset' folder and
its /test and /train subfolders.

Files description is as follows:

Folder 'UCI HAR Dataset' contains the following relevant files:

 * activity_labels.txt - contains 2 columns with 6 rows that describe activities as
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

 * features.txt - contains 561 rows with names of measurements; each measure is a float number
 
 * features_info.txt - contains descriptions of the measurements taken by the phone's accelerometer

Folder 'UCI HAR Dataset/train' contains the following relevant files:

 * subject_train.txt - contains subject ID (one per row, values from 1 to 30 inclusive)
                       of subjects that were included in the train set
 
 * X_train.txt       - contains rows of measurements       

 * y_train.txt       - contains activity codes (one per row, values from 1 to 6 inclusive)
 
Folder 'UCI HAR Dataset/test' contains the following relevant files:

 * subject_test.txt  - contains subject ID (one per row, values from 1 to 30 inclusive)
                       of subjects that were included in the test set
 
 * X_test.txt        - contains rows of measurements       

 * y_test.txt        - contains activity codes (one per row, values from 1 to 6 inclusive)

## What is the scope of the project? ##

The scope of the project is to perform the following tasks:
 1. Merge the training and the test sets to create one data set.
 2. Extract only the measurements on the mean and standard deviation for each measurement.
 3. Use descriptive activity names to name the activities in the data set
 4. Appropriately label the data set with descriptive activity names.
 5. Create a second, independent tidy data set with the average of each variable 
    for each activity and each subject. It's written into 'tidy.txt' file locally.

## How does the code work? ##

The code first reads X_, y_, and subject_ files from both /test and /train folders and combines them all (bu both columns and rows) in one big data set that contains columns in the following order: <measuremenst>, subjectID, activityID and all rows presented in either /test ot /train files. 

Then the code selects only those measurements columns that describe mean or std of some body movements by selecting only those column names that contain either "mean" or "std" in their names.
It then adds "subject" and "activity" columns at the end, producing a new data set which is used from now on.

Then the code substitutes activity IDs with activity names and adds "mean_of_" prefix to names of the remaining measurements columns which all contain at this poin either means or std of some body movements.

Then the code finds means of those measurements for each subject and each activity; thus producing a tidy data set.

Finally, the code writes that tidy data set into "tidy.txt" file into a local folder.

## How to reproduce a tidy data set? ##

To produce a tidy data set you need to:

1. 	Unzip the archive data file that can be found here:

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	
    If successful, your unzip program will create a new directory 'UCI HAR Dataset' under your current path.

2.	Copy run_analysis.R code file into 'UCI HAR Dataset' folder.

3.	Set the working directory for R or RStudio to be the one that points to 'UCI HAR Dataset', so the files in that directory can be accessed by R or RStudio directly by name.

4.	Run the code in 'run_analysis.R'.
5.  Check if file "tidy.txt" appears in the local folder (where you copied "run_analysis.R"
