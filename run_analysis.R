################################################################################
##                           run_analysis.R                                   ##
################################################################################
## This scripts performs the following operations:                            ##
##                                                                            ##
## 1. Merges the training and the test sets to create one data set.           ##
## 2. Extracts only the measurements on the mean and standard deviation for   ##
##    each measurement.                                                       ##
## 3. Uses descriptive activity names to name the activities in the data set. ##
## 4. Appropriately labels the data set with descriptive variable names.      ##
## 5. From the data set in step 4, creates a second, independent tidy data    ##
##    set with the average of each variable for each activity and each        ## 
##    subject.                                                                ##
################################################################################

## Merge train and test data frames
df <- rbind(train,test)

## Extract only mean and standard deviation measurements for each measurement
df_colnames <- colnames(df)
df <- df[,c(1,2,grep(".*(mean|std).*", df_colnames))]

