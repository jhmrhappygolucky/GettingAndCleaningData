#Getting and Cleaning Data Course Project
##by Jeff Hughes

### Training tables
1. x_train = read in the x_train.txt file from the UCI Data Set
+ The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
+ Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
+ Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
+ The experiments have been video-recorded to label the data manually. 
+ The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
	
2. y_train = read in the y_train.txt file from the UCI Data Set. This is a simple 1-column data frame with activity id's only.
+ These activity id's correspond to walking, walking_upstairs, sitting, laying, etc.

3. subject_train = read in the subject_train.txt file from the UCI Data Set
	+ This is a simple 1-column data frame with subject id's only.
	+ Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Testing tables
4. x_test = read in the x_test.txt file from the UCI Data Set.
+ The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
+ Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
+ Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
+ The experiments have been video-recorded to label the data manually. 
+ The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

5. y_test = read in the y_test.txt file from the UCI Data Set. This is a simple 1-column data frame with activity id's only.
+ These activity id's correspond to walking, walking_upstairs, sitting, laying, etc.

6. subject_test = read in the subject_train.txt file from the UCI Data Set
	+ This is a simple 1-column data frame with subject id's only.
	+ Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Column headers
7. features = read in features.txt, which is a List of all features. 
+ Use the 2nd column of this data frame as a character vector, which is used to assign column names to the x_train and y_train data sets

### Activity Labels
8. activityLabels = read in activity_labels.txt, which contains a unique id for each walking activity 
(i.e. walking, walking_upstairs, walking_downstairs, sitting, standing, laying)

### Transformations
9. mergedTrain = perform a column-bind on 3 data frames, adding data columns for activity id's and subject id's to the y_train data frame.

10. mergedTest = perform a column-bind on 3 data frames, adding data columns for activity id's and subject id's to the y_test data frame.

11. mergedTrainAndTest = perform a row bind on the mergedTrain and mergedTest data sets, so just stacking these 2 data sets on top of each other, similar to a SQL UNION query

12. meanAndStandardDeviation
+ Extracts only the measurements on the mean and standard deviation for each measurement.
+ Generate boolean TRUE or FALSE for each element in the colNames "character" vector, will be used as a filter.

13. finalTidySet = use the 'mean' function on all columns in data set that are numeric and can be averaged, output this file as .txt to the working directory

 




