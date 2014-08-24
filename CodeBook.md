# CodeBook file for a tidy data set that can be created by run_analysis.R #
* * *
This file describes a tidy data set that can be created by run_analysis.R

The task is to analyse initial data files which have been collected in accordance with
the project that focused on daily activities by a group of persons (subjects) and it is described here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

During each activity measurements were taken for each subject by an accelerometer that was built in a Samsung phone. The phone was positioned on the waist. Only measurements of mean and standard deviations for different accelerometer measurements (which are all described in features_info.txt file in the archive ) were selected for analysis by this code.
The analysis is to find means of all selected measures for each activity and each subject and to produce a tidy data set called "tidy.txt".

More details are provided in the Readme.md file that can be found in the same GitHub repository.

## What does run_analysis.R do? ##

The code does the following tasks as required by the project assignment:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set (tidy.txt) with the average of each variable 
   for each activity and each subject.

## How to produce a tidy data set? ##

To produce a tidy data set you need:

1.  Unzip the archive data file that can be found here:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	
	If successful, your unzip program will create a new directory 'UCI HAR Dataset' under your current path.

2.	Copy run_analysis.R code file into 'UCI HAR Dataset' folder.

3.	Set the working directory for R or RStudio to be the one that points to 'UCI HAR Dataset', so the files 	in that directory can be accessed by R directly by name.

4.	Run the code in 'run_analysis.R'.

If you have run run_analysis.R correctly, the script shall produce one TXT file called 'tidy.txt' in the local folder. The file is created by write.table call with one space separator with row names removed.

## How is data organized in tidy.txt file? ##

The file contains means of measurements of data (which in turn were means and standard deviations of some body movements measurements) for 30 subjects (participants) identified by numbers 1 through 30 that performed 6 types of the following activities:
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

The columns order is as folows:
    - subject code
    - activity label (one of the ones right above)
    - followed by 79 columns of measurements (of means of both means and standard deviations as described before).
    
Each measurements column has a name in the following format: "mean_of_<description_of_a_measure>", for example:
mean_of_tBodyAcc-std()-X, which means it's a mean of the body accelerometer standard deviation along axis X for a particular subject (their subject ID can be found in the first column) while he/she was doing an activity outlined in "activity" column averaged over all available measures. 
There are in total of 79 measurements columns besides the first column "subject" and the second column "activity"

Columns contain the data with the following data domains:

* The first column is "subject" that contains SubjectID (numeric, numbers from 1 to 30 inclusive) 
  for each participant  

* The second column is activity; a character string, one of the following: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* The next 79 columns contain means of means or means of standard deviations of the parameters 
  described in features.txt file. The values are float numbers (both positive and negative). They represent mean values for every feature measurementss for each participant and each activity.
  For example, for participant 2, that was doing activity WALKING_DOWNSTAIRS measurement "mean_of_tBodyAcc-std()-X" means it's a mean of participant 2 body accelerometer standard deviation along axis X while he/she was walking downstairs.
  
The subject and activity columns are ordered by subject and then by activity.

The order of the means of measures columns (starting from column 3) is the same as in features.txt

There will be 6 rows with the same subject ID, for each of 6 activities, 180 rows in total.
There will be 81 columns in total (subjectID, activity, followed by 79 columns of means of measurements)

