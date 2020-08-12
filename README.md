# gettingandcleaningdata

==================================================================
Submission for Getting and Cleaning Data course submission
==================================================================

A independent tidy data set with the average of each variable for each activity and each subject, based upon data provided by the "Human Activity Recognition Using Smartphones Dataset"[1].

The data is based upon the experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- A 561-feature vector with averaged time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'code_book.txt': Shows information about the variables and calculations

- 'data': folder containing the "Human Activity Recognition Using Smartphones Dataset"[1]

- 'importData.R': R script to import the data sets from the 'data' folder and create train and test data tables

- 'run_analysis.R': R script to merge train and test data tables, run analyses, and create a tidy data set

- 'tidy data/tidyData.txt': independent tidy data set with the average of each variable for each activity and each subject

- 'variables.txt': List of all variables


Analysis performed in 'run_analysis.R'
======================================
- Train and test data tables created using 'importData.r' were merged using rbind()

- Extracted only those columns that included mean and standard deviation for each measurement using grep()

- Updated the activity column to include descriptive values using factor(), where values were given by the 'activities' data table created in 'importData.R'

- Updated variable names to be more descriptive using gsub()

- Created a new data table containing independent tidy data:
      - Calculated the average values of all variables by subject and activity
      - Calculated the average values of all variables by subject only
      - Merged these tables together by creating an additional factor level for activity; "ALL"
      - Arranged the table first by subject and then by activity
      - Updated variable names to account for these new values

- Wrote tidy data set to 'tidyData.txt' using write.table(..., row.names = FALSE)

Notes: 
======
- Features were normalized and bounded within [-1,1] prior to averaging.

Reference:
==========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.