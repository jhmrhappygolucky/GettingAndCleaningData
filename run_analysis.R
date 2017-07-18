######################################################################
# Downloaded Files Locally and Reading in all Data Sets into R

setwd("D:/Coursera - JHU/03 - Tidy and Clean Data/Project/UCI/UCI HAR Dataset")

# Reading trainings tables:
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

# Reading feature vector:
features <- read.table('./features.txt')

# Reading activity labels:
activityLabels = read.table('./activity_labels.txt')

######################################################################
# Assign column names to data sets read in previously

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

##################################################################
# Merges the training and the test sets to create one data set.

mergedTrain <- cbind(y_train, subject_train, x_train)
mergedTest <- cbind(y_test, subject_test, x_test)
mergedTrainAndTest <- rbind(mergedTrain, mergedTest)
                     
##################################################################  
# Assign column names from merged data set into a character vector
colNames <- colnames(mergedTrainAndTest)

################################################################## 
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Generate boolean TRUE or FALSE for each element in the colNames "character" vector, will be used as a filter
meanAndStandardDeviation <- (
                   grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

################################################################## 
# Filters data set to 10,299 rows, uses step above as a filter

setForMeanAndStd <- mergedTrainAndTest[ , meanAndStandardDeviation == TRUE]

################################################################## 
# Merge data sets together to pull in the "activityLabel" field (i.e. Walking, etc)

setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

################################################################## 
# creates a second, independent tidy data set with the average of each variable for each activity and each subject

finalTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
finalTidySet <- finalTidySet[order(finalTidySet$subjectId, finalTidySet$activityId),]

################################################################## 
# Output second, independent tidy set to working directory

write.table(finalTidySet, "finalTidySet.txt", row.name=FALSE)



