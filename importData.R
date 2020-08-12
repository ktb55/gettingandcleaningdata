################################################################################
##                            importData.R                                    ##
################################################################################
## This file reads in the following tables:                                   ##
## - feature labels,                                                          ##
## - test and training data:                                                  ##
##              --  data set (X_test and X_train),                            ##
##              --  activity labels for data set (Y_test and Y_train),        ##
##              --  subject identifier for data set (subject_test and         ##
##                  subject_train).                                           ##
##                                                                            ##
## These tables are then merged appropriately to create test and training     ##
## data sets.                                                                 ##
################################################################################
## Libraries
# install.packages("dplyr")
library(dplyr)
# install.packages("tibble")
library(tibble)

## Read in feature labels
features <- tibble::as_tibble(read.table("./data/features.txt")[,2])

## Read in test data
X_test <- tibble::as_tibble(read.table("./data/test/X_test.txt")) # data set
Y_test <- tibble::as_tibble(read.table("./data/test/Y_test.txt")) # activity labels
subject_test <- tibble::as_tibble(read.table("./data/test/subject_test.txt")) # subject identifier

## Read in training data
X_train <- tibble::as_tibble(tbl_df(read.table("./data/train/X_train.txt"))) # data set
Y_train <- tibble::as_tibble(tbl_df(read.table("./data/train/Y_train.txt"))) # activity labels
subject_train <- tibble::as_tibble(tbl_df(read.table("./data/train/subject_train.txt"))) # subject identifier

## Add column names
colnames(X_test) <- features[[1]]
colnames(X_train) <- features[[1]]
colnames(Y_test) <- c("activityLabel")
colnames(Y_train) <- c("activityLabel")
colnames(subject_test) <- c("subjectIndentifier")
colnames(subject_train) <- c("subjectIdentifier")

## Create test and train data frames
test <- cbind(subject_test, Y_test, X_test)
train <- cbind(subject_train, Y_train, X_train)