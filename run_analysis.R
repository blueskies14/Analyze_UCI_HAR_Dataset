# Read in X_train, y_train and subject_train files
X_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')

# Read in X_test, y_test and subject_test files
X_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')

# Merge the X, y and subject dataframes
X = rbind(X_train, X_test)
y = rbind(y_train, y_test)
subject = rbind(subject_train, subject_test)

# Extract the mean and std data 
X_reduced = X[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 
                  227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 
                  503:504, 516:517, 529:530, 542:543)]

# Label the y activities and merge with X_reduced
activity = as.factor(y[, 1])
levels(activity) = c('walking', 'walking_upstairs', 'walking_downstairs', 
                       'sitting', 'standing', 'laying')
X_reduced$activity = activity

# Merge the subject with X_reduced
X_reduced$subject = subject[, 1]

# Rename the columns with the appropriate labels
colnames(X_reduced)[1:66] = c('tBodyAccX.mean', 'tBodyAccY.mean', 'tBodyAccZ.mean', 
                              'tBodyAccX.std', 'tBodyAccY.std', 'tBodyAccZ.std',
                              'tGravityAccX.mean', 'tGravityAccY.mean', 'tGravityAccZ.mean', 
                              'tGravityAccX.std', 'tGravityAccY.std', 'tGravityAccZ.std',
                              'tBodyAccJerkX.mean', 'tBodyAccJerkY.mean', 'tBodyAccJerkZ.mean', 
                              'tBodyAccJerkX.std', 'tBodyAccJerkY.std', 'tBodyAccJerkZ.std',
                              'tBodyGyroX.mean', 'tBodyGyroY.mean', 'tBodyGyroZ.mean', 
                              'tBodyGyroX.std', 'tBodyGyroY.std', 'tBodyGyroZ.std',
                              'tBodyGyroJerkX.mean', 'tBodyGyroJerkY.mean', 'tBodyGyroJerkZ.mean', 
                              'tBodyGyroJerkX.std', 'tBodyGyroJerkY.std', 'tBodyGyroJerkZ.std',
                              'tBodyAccMag.mean', 'tBodyAccMag.std', 
                              'tGravityAccMag.mean', 'tGravityAccMag.std',
                              'tBodyAccJerkMag.mean', 'tBodyAccJerkMag.std', 
                              'tBodyGyroMag.mean', 'tBodyGyroMag.std',
                              'tBodyGyroJerkMag.mean', 'tBodyGyroJerkMag.std', 
                              'fBodyAccX.mean', 'fBodyAccY.mean', 'fBodyAccZ.mean', 
                              'fBodyAccX.std', 'fBodyAccY.std', 'fBodyAccZ.std', 
                              'fBodyAccJerkX.mean', 'fBodyAccJerkY.mean', 'fBodyAccJerkZ.mean', 
                              'fBodyAccJerkX.std', 'fBodyAccJerkY.std', 'fBodyAccJerkZ.std',
                              'fBodyGyroX.mean', 'fBodyGyroY.mean', 'fBodyGyroZ.mean', 
                              'fBodyGyroX.std', 'fBodyGyroY.std', 'fBodyGyroZ.std',
                              'fBodyAccMag.mean', 'fBodyAccMag.std',
                              'fBodyAccJerkMag.mean', 'fBodyAccJerkMag.std',
                              'fBodyGyroMag.mean', 'fBodyGyroMag.std',
                              'fBodyGyroJerkMag.mean', 'fBodyGyroJerkMag.std')

# Create a data set with the mean of each variable for each activity and subject
library(reshape2)
mX = melt(X_reduced, id = c('subject', 'activity'))
newX = dcast(mX, subject + activity ~ variable, mean)
write.table(newX, file = 'mean_subject_activity.txt', sep = ',', col.names = colnames(newX))
