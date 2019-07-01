# This file contains the R-code for generating tidy data out of row data collected from 
# Samsung Galaxy S smartphone and the script for performing the analysis
# A group of 30 volunteers within an age bracket of 19-48 years were asked to 
# perform six different activities. Their activities were recorded using smartphome's 
# embedded accelerometer and gyroscope. Data set and a complete descriptopn of experiment 
# is available at:  
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#OS: Microsoft Windows 10 Pro
#OS Version: 10.0.16299 build 16299

#R version 3.5.2 (2018-12-20)
#RStudio Version: 1.1.456
library(utils)
library(dplyr)
setwd("D:/jhu/wk12-3.4 Assignment/WearableHARproject")

## Download and unzip the dataset:
fileName <- "UCI HAR Dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "

if (!file.exists(fileName)){
    download.file(fileURL, fileName)
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip(fileName) 
}

# Read the features descriptions and Activity Lables
features<-read.table("./UCI HAR Dataset/features.txt", col.names = c("num:", "feature"))
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("num:", "activity_label"))

# Read the Test and Training data into variables with the same file names 
# from the subfolders within project folder 
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject_no"))
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = c("activity"))

subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject_no"))
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = c("activity"))

# Merge Train and Test data into single data frames of each type
X_merged <- rbind(X_test, X_train)
Y_merged <- rbind(Y_test, Y_train)
subject_merged <- rbind(subject_test, subject_train)


# Remove original data frames from memory to save memory
rm("subject_test", "X_test", "Y_test", "subject_train", "X_train", "Y_train" )

# assign activity labels to activity numbers in Y-merger
Y_merged$activity <- factor(Y_merged$activity, labels = activity_labels$activity_label)
# Convert Subjects into factors and assign column name to subject


tbl_Subject_Record_Nos <- table(subject_merged)
#records_on_subjects <- as.vector(table(subject_merged))
record_split_by_subject <-split(X_merged, subject_merged$V1)

features_meanStd_loc <- grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", features$V2)
features_meanStd_val <- grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", features$V2, value = TRUE)
features_meanStd_names <- sub("[()](.*)", "", features_meanStd_val)

X_dfMeanStd <- X_merged[ , features_meanStd_loc]

colnames(X_dfMeanStd) <- features_meanStd_names
