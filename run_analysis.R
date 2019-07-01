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
library(dplyr)

## Download and unzip the dataset:
fileName <- "UCI HAR Dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "

if (!file.exists(fileName)){
    download.file(fileURL, fileName)
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip(fileName) 
}

# Read Feature descriptions and Activity lables
features<-read.table("./UCI HAR Dataset/features.txt", col.names = c("num:", "feature"))
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("num:", "activity_label"))

# Check for duplicated features 
duplicated_features <- features[duplicated(features$feature), "feature"]
# Check if there are any measurements with  word mean or sd among duplicated items
grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", duplicated_features, value = TRUE) # There are none 
#  So even though there are duplicate columns, as we will not be using them, 
#  we do not need to combine/filter them out
#  Remove "()" , replace "(" with "_", replace ")" with "", replace "," with "_"
#  in feature names to make it meaningfull as DF column names can not contain () and ,
features$feature <- gsub("[(][)]", "", features$feature)
features$feature <- gsub("[)]", "", features$feature)
features$feature <- gsub("[(]", "_", features$feature)
features$feature <- gsub(",", "_", features$feature)
features$feature <- gsub("-", "_", features$feature)
# Read the Test and Training data into variables with the same file names 
# from the subfolders within project folder 
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = c("activity"))

subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = c("activity"))

# Merge Train and Test data into single data frames of each type
X_merged <- rbind(X_test, X_train)
Y_merged <- rbind(Y_test, Y_train)
subject_merged <- rbind(subject_test, subject_train)


# Remove original data frames from memory to save memory
rm("subject_test", "X_test", "Y_test", "subject_train", "X_train", "Y_train" )

## Replace activity numbers in Y_merge with activity names
Y_merged$activity <- factor(Y_merged$activity, labels = activity_labels$activity_label)

#names(X_merged) <- grep(".", "_", names(X_merged))
# Find the column indexes, where word mean or std appear in any letter combination 
features_meanStd_index <- grep("[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd]", features$feature)

X_Mean_Std <- X_merged[ , features_meanStd_index]

# Create a single DF with measurements on the mean and standard deviation, subject and activity
tidyData <- cbind(X_Mean_Std, Y_merged, subject_merged)

# Create a DF that contains summary of values, which are first grouped by subject and then grouped by activity
tidyData_summarized <- tidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean))

# Change Variable names to represent these are Summarized by adding "AVG" prefix
colnames(tidyData_summarized) <- c("subject", "activity", paste("AVG", 
                                colnames(tidyData_summarized[3:ncol(tidyData_summarized)]), sep = "_"))
# Write tidy and Summarized data to a file

write.csv(tidyData, "Tidy_Data.csv")
write.csv(tidyData_summarized, "Tidy_Data_Summary.csv")

