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
## Libraries
#install.packages("dplyr")
library(dplyr)
#install.packages("tidyr")
library(tidyr)

## Merge train and test data frames
df <- rbind(train,test)

## Extract only mean and standard deviation measurements for each measurement
df_colnames <- colnames(df)
data <- df[,c(1,2,grep(".*(mean|std)[(][)].*", df_colnames))]
feats <- tibble::as_tibble(colnames(data))

## Add descriptive activity names
data$activityLabel <- factor(data$activityLabel, levels = c(1:6), 
                             labels = activities[[1]])
data <- rename(data, activity = activityLabel)

## Change variables names to reflect more descriptive variable names
colnames(data) <- gsub("^t", "time-", colnames(data)) # prefix t -> time
colnames(data) <- gsub("^f", "frequency-", colnames(data)) # prefix f -> frequency

colnames(data) <- gsub("Acc", "Acceleration-", colnames(data)) # Acc -> Acceleration
colnames(data) <- gsub("Gyro", "AngularVelocity-", colnames(data)) # Gyro -> AngularVelocity
colnames(data) <- gsub("Mag", "Magnitude", colnames(data)) # Mag -> Magnitude
colnames(data) <- gsub("Jerk", "Jerk-", colnames(data)) # add hyphen at the end of Jerk

colnames(data) <- gsub("[(][)]", "", colnames(data)) # remove '()'
colnames(data) <- gsub("std", "standardDeviation", colnames(data)) # std -> standardDeviation

colnames(data) <- gsub("--","-", colnames(data)) # remove duplicate '-'
colnames(data) <- gsub("BodyBody", "Body", colnames(data)) #remove duplicate 'Body'

colnames(data) <- gsub("X$", "Xaxis", colnames(data)) # X -> Xaxis
colnames(data) <- gsub("Y$", "Yaxis", colnames(data)) # Y -> Yaxis
colnames(data) <- gsub("Z$", "Zaxis", colnames(data)) # Z -> Zaxis

## Create data set with the average of each variable for each activity and each 
## subject





