# run_analysis.R
-----------------
This R script takes the data collected from the accelerometers from the Samsung Galaxy S smartphone. The full description of the data is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data is downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script assumes that the dataset has been downloaded and unzipped in the current folder. The dataset is contained in a folder named 'UCI HAR Dataset', which also contains the descriptions of the files and variables of the dataset.

The script merges the training dataset train/X_train.txt and the testing set test/X_test.txt into one dataset X. 

From the 561 variables originally included in the features (or columns of X), 66 variables that measure the mean and standard deviation of the primary variables are extracted into a new dataset X_reduced. The extracted variables and their column names are:

feature | column name
:------:|:-----------:
tBodyAcc-mean()-X | tBodyAccX.mean 
tBodyAcc-mean()-Y | tBodyAccY.mean 
tBodyAcc-mean()-Z | tBodyAccZ.mean
tBodyAcc-std()-X | tBodyAccX.std
tBodyAcc-std()-Y | tBodyAccY.std
tBodyAcc-std()-Z | tBodyAccZ.std
tGravityAcc-mean()-X | tGravityAccX.mean
tGravityAcc-mean()-Y | tGravityAccY.mean
tGravityAcc-mean()-Z | tGravityAccZ.mean
tGravityAcc-std()-X | tGravityAccX.std
tGravityAcc-std()-Y | tGravityAccY.std
tGravityAcc-std()-Z | tGravityAccZ.std
tBodyAccJerk-mean()-X | tBodyAccJerkX.mean
tBodyAccJerk-mean()-Y | tBodyAccJerkY.mean
tBodyAccJerk-mean()-Z | tBodyAccJerkZ.mean
tBodyAccJerk-std()-X | tBodyAccJerkX.std
tBodyAccJerk-std()-Y | tBodyAccJerkY.std
tBodyAccJerk-std()-Z | tBodyAccJerkZ.std
tBodyGyro-mean()-X | tBodyGyroX.mean
tBodyGyro-mean()-Y | tBodyGyroY.mean
tBodyGyro-mean()-Z | tBodyGyroZ.mean 
tBodyGyro-std()-X | tBodyGyroX.std
tBodyGyro-std()-Y | tBodyGyroY.std
tBodyGyro-std()-Z | tBodyGyroZ.std
tBodyGyroJerk-mean()-X | tBodyGyroJerkX.mean
tBodyGyroJerk-mean()-Y | tBodyGyroJerkY.mean
tBodyGyroJerk-mean()-Z | tBodyGyroJerkZ.mean
tBodyGyroJerk-std()-X | tBodyGyroJerkX.std
tBodyGyroJerk-std()-Y | tBodyGyroJerkY.std
tBodyGyroJerk-std()-Z |  tBodyGyroJerkZ.std
tBodyAccMag-mean() | tBodyAccMag.mean
tBodyAccMag-std() |  tBodyAccMag.std
tGravityAccMag-mean() | tGravityAccMag.mean
tGravityAccMag-std() | tGravityAccMag.std
tBodyAccJerkMag-mean() | tBodyAccJerkMag.mean
tBodyAccJerkMag-std() | tBodyAccJerkMag.std
tBodyGyroMag-mean() | tBodyGyroMag.mean
tBodyGyroMag-std() | tBodyGyroMag.std
tBodyGyroJerkMag-mean() | tBodyGyroJerkMag.mean
tBodyGyroJerkMag-std() | tBodyGyroJerkMag.std 
fBodyAcc-mean()-X | fBodyAccX.mean
fBodyAcc-mean()-Y | fBodyAccY.mean
fBodyAcc-mean()-Z | fBodyAccZ.mean
fBodyAcc-std()-X | fBodyAccX.std
fBodyAcc-std()-Y | fBodyAccY.std
fBodyAcc-std()-Z | fBodyAccZ.std
fBodyAccJerk-mean()-X | fBodyAccJerkX.mean
fBodyAccJerk-mean()-Y | fBodyAccJerkY.mean
fBodyAccJerk-mean()-Z | fBodyAccJerkZ.mean
fBodyAccJerk-std()-X | fBodyAccJerkX.std
fBodyAccJerk-std()-Y | fBodyAccJerkY.std
fBodyAccJerk-std()-Z | fBodyAccJerkZ.std
fBodyGyro-mean()-X | fBodyGyroX.mean
fBodyGyro-mean()-Y | fBodyGyroY.mean
fBodyGyro-mean()-Z | fBodyGyroZ.mean
fBodyGyro-std()-X | fBodyGyroX.std
fBodyGyro-std()-Y | fBodyGyroY.std
fBodyGyro-std()-Z | fBodyGyroZ.std	
fBodyAccMag-mean() | fBodyAccMag.mean
fBodyAccMag-std() | fBodyAccMag.std
fBodyAccJerkMag-mean() | fBodyAccJerkMag.mean
fBodyAccJerkMag-std() | fBodyAccJerkMag.std
fBodyGyroMag-mean() | fBodyGyroMag.mean
fBodyGyroMag-std() | fBodyGyroMag.std
fBodyGyroJerkMag-mean() | fBodyGyroJerkMag.mean
fBodyGyroJerkMag-std() | fBodyGyroJerkMag.std

The activity labels train/y_train.txt and test/y_test.txt are merged as well and added to X_reduced as a new column 'activity'; similarly, the subject id's train/subject_train.txt and test/subject_test.txt are merged and added to X_reduced as a new column 'subject'. The dataset X_reduced contains 68 columns and 10299 rows.

The activity labels are originally in a numeric format, ranging from 1 for walking to 6 for laying. This is changed to a factor with 6 levels describing the activities directly: 'walking', 'walking_upstairs', 'walking_downstairs', 'sitting', 'standing', and 'laying'.  

The script creates a new dataset, newX, which contains the mean of each variable (column) of X_reduced for each activity and subject; this dataset contains 68 columns and 180 rows, each row corresponds to a particular subject and activity. The dataset newX is written out to the file 'mean_subject_activity.txt'


