Getting-and-Cleaning-Data-Project
=================================

##Data source:

The data are obtained from The UCI Machine Learning Repository. (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)


##Raw Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

##Tidy data created by this project
### Section 1. Merge the following training and the test sets to create one data set.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Assign column names to dataframe merged.x, merged.y and merged.subject.

## Section 2. Extract only the measurements on the mean and standard deviation for each measurement.
Read features.txt and create a logcal vector (mean_and_std_features) that contains TRUE values for the ID, mean and stdev columns and FALSE values for the others.
Subset the dataframe, merged.x, to keep only the necessary columns.
Merge x, y and subject dataframe to the complete dataframe that is named df.

## Section 3. Use descriptive activity names to name the activities in the data set
Use the correspondence in activity_labels.txt to label the variable activity.
  1 = "WALKING"
  2 = "WALKING_UPSTAIRS"
  3 = "WALKING_DOWNSTAIRS"
  4 = "SITTING"
  5 = "STANDING"
  6 = "LAYING"

## Section 4. Appropriately label the data set with descriptive activity names.
Use gsub function for pattern replacement to clean up the data labels.

## Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 


##Reference:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
