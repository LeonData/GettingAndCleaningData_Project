# This code perfoms the tasks outlined in the Project requirements
#
# The code reads data files from the Human Activity Recognition database
# and produces a tidy data set which contains means of all measurements
# of means and standard deviations of body movements as recorded by an accelerometer
# built into a Samsung phone. For more details - please read README.md or codeBook.md files
#
# To run the code: 
#         1) Unzip the archive with data files that can be found here
#           http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#           into some directory with your favourite UNZIP program.
#           When unzipped, a new folder shall be created - "UCI HAR Dataset",
#           which contains data files needed by this code to create an output
#        2) Copy this code file into "UCI HAR Dataset" folder
#        3) In R or RStudio set working directory to point to .../"UCI HAR Dataset" 
#           so file "activity_labels.txt" can be read using only its name
#        4) Run the code in R (by using command source("run_analysis.R") or in RStidio
#
# Tasks perfomed:
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names.
# 5. Create a second, independent tidy data set with the average of each variable 
#    for each activity and each subject. It's written into 'tidy.txt' file locally.
#

######################  Task 1: read and merge data files ######################

# Read training set files and merge 3 components: measures, subject, and activity data
trainSet                     = read.csv("train/X_train.txt", sep="", header=FALSE)
trainSet[, ncol(trainSet)+1] = read.csv("train/subject_train.txt", sep="", header=FALSE)
trainSet[, ncol(trainSet)+1] = read.csv("train/y_train.txt", sep="", header=FALSE)

# Read test set files and merge 3 components: measures, subject, and activity data
testSet                      = read.csv("test/X_test.txt", sep="", header=FALSE)
testSet[, ncol(testSet) +1]  = read.csv("test/subject_test.txt", sep="", header=FALSE)
testSet[, ncol(testSet) +1]  = read.csv("test/y_test.txt", sep="", header=FALSE)

# Get the total number of columns for train and test sets and check if they are equal
colNumTest = ncol(testSet)

if( colNumTest != ncol(trainSet) )
{
  stop("Train and Test sets have different number of columns! Please check data!") 
}

# Bind rows from test and train data sets
fullSet = rbind(testSet, trainSet)

##############  Task 2: reduce data to columns containing mean , std ##############

# Read all features names
features = read.table("features.txt", header=FALSE)[,2]

# Get indexes of the columns with mean and std data
colsIndexes <- grep("mean|std", features)

# Add last two columns indexes for activity and subject
colsIndexes <- c(colsIndexes, colNumTest-1, colNumTest)

# Reduce full set to only columns needed
fullSet <- fullSet[,colsIndexes]

# Get total number of columns
colsFullSet = ncol(fullSet)

##############  Task 4: Modify column names by adding mean_of_ to features columns ##############

# Read initial columns names
colsNames   <- grep("mean|std", features, value=TRUE)

for( i in 1:length(colsNames) )
{
  # Add "mean_of_" to every name containing mean or std
  colsNames[i] <- paste("mean_of_", colsNames[i], sep="")
}

# Add subject and activity
colsNames   <- c(colsNames, "subject", "activity")

# Set column names in fullSet
colnames(fullSet) <- colsNames

##############  Task 3: Substitute activity id with activity name ##############

# Read activity labels
activityLabels = read.table("activity_labels.txt", header=FALSE)

for( i in 1:nrow(fullSet) )
{
  a <- fullSet$activity[i]
  fullSet[i,colsFullSet] <- as.character(activityLabels[a, 2])
}

##############  Task 5: Generating a tidy data ##############

# Set activity and subject as factors
fullSet$activity <- as.factor(fullSet$activity)
fullSet$subject  <- as.factor(fullSet$subject)

# Get tidy data of means (supressing warnings as last 2 columns, like activities (which are strings), 
# produces warnings when means are calculated, but those columns are discarded after anyway as unneeded)
suppressWarnings(
  tidy <- aggregate(fullSet, by=list(subject=fullSet$subject, activity = fullSet$activity), 
                    FUN=mean, na.rm=TRUE)[,c(1:(colsFullSet-2))]
)

##############  Writing a tidy data into local file "tidy.txt" ##############

write.table(tidy, "tidy.txt", sep=" ", row.names=FALSE)

################################ End of file ################################
