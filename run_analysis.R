#The data linked  are data collected from the accelerometers from the Samsung Galaxy S smartphone. 
#A full description is available at the site where the data was obtained: 
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#The following R script does the following. 
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)

"Merge training and test datasets"
# Read data
message("reading X_train.txt")
training.x <- read.table("data/UCI HAR Dataset/train/X_train.txt")
message("reading y_train.txt")
training.y <- read.table("data/UCI HAR Dataset/train/y_train.txt")
message("reading subject_train.txt")
training.subject <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
message("reading X_test.txt")
test.x <- read.table("data/UCI HAR Dataset/test/X_test.txt")
message("reading y_test.txt")
test.y <- read.table("data/UCI HAR Dataset/test/y_test.txt")
message("reading subject_test.txt")
test.subject <- read.table("data/UCI HAR Dataset/test/subject_test.txt")

# Merge x, y, subject data sets
merged.x <- rbind(training.x, test.x)
merged.y <- rbind(training.y, test.y)
merged.subject <- rbind(training.subject, test.subject)

# Read features 
features = read.table("data/UCI HAR Dataset/features.txt")
# Index only the data on mean and std. dev.
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
# Make the feature names better suited for R with some substitutions
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Add the column names (features) to data
colnames(merged.subject) = "subject";
colnames(merged.x)       = features[,2]; 
colnames(merged.y)       = "activity";

# First reduce the merged.x table to what we want
merged.x <- merged.x[,mean_and_std_features]
#marge the three data sets
df <- cbind(merged.x, merged.y, merged.subject)

# Use descriptive activity names to name the activities in the dataset
activityLabels = read.table("data/UCI HAR Dataset/activity_labels.txt")
df$activity[df$activity == 1] = "WALKING"
df$activity[df$activity == 2] = "WALKING_UPSTAIRS"
df$activity[df$activity == 3] = "WALKING_DOWNSTAIRS"
df$activity[df$activity == 4] = "SITTING"
df$activity[df$activity == 5] = "STANDING"
df$activity[df$activity == 6] = "LAYING"

#Appropriately labels the data set with descriptive variable names. 
names(df)<-gsub("^t", "time", names(df))
names(df)<-gsub("^f", "frequency", names(df))
names(df)<-gsub("Acc", "Accelerometer", names(df))
names(df)<-gsub("Gyro", "Gyroscope", names(df))
names(df)<-gsub("Mag", "Magnitude", names(df))
names(df)<-gsub("BodyBody", "Body", names(df))
df$activity <- as.factor(df$activity)
df$subject <- as.factor(df$subject)

tidy <-aggregate(. ~subject + activity, df, mean)
tidy <-tidy[order(tidy$subject,tidy$activity),]
write.table(tidy, file = "tidydata.txt",row.name=FALSE)

