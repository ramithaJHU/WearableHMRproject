### WearableHMRproject: Getting and Cleaning Data 
####  JHU Data Science Specialization Course Project

_____
This repository contains the files for Getting and Cleaning Data course of Coursera, JHU Data Science Specialization Course Project.

A full description of the project, where the data used in this project were collected and the original data set is available at the site where the data was obtained: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

___
#### Content of the Repository
- **README.md** : Contains an introduction and Instruction List:
- **code_book.md**  : Contains description of all the Variables and Summary Choices:
- **run_analysis.R** : Contains R script for converting row data into tidy data and then summarizing the data
- **Tidy_Data.txt** : Contains the tidy data obtained from above R script 
- **Tidy_Data_Summary.txt** : Contains the summary of tidy data obtained from above R script 

___
#### R script file, `run_analysis.R`, Contains R script for converting row data into tidy data and them summarizing the data.
Main steps followed in the process are as followed and has been further described in Code Book

This R script created under following environment
-Microsoft Windows 10 Pro
-OS Version: 10.0.16299 build 16299


1. Download and unzip the data set, if it has not being downloaded
2. Read Feature descriptions and Activity labels
3. Check for duplicated features and check weather the duplicated items contains measurements on the mean and standard deviation
   Note: Even there are duplicated features with the same name, those items does not contain measurements on the mean and standard deviation. So, they were left as it is without combining.
4. Remove "()" , replace "(" with "_", replace ")" with "", replace "," with "_" and replace "-" with "_" in feature names to make it meaningful as DF column names can not contain (), - and ,
5. Read the Test and Training data into variables 
6. Merge Train and Test data into single data frames of each type
7. Remove original data frames from memory to save memory
8. Replace activity numbers in Y_merge data frame with activity names
9. Find the column indexes, where word mean or std appear in any letter combination 
10. Create a new DF that contains data measurements on the mean and standard deviation
11. Create a single DF with measurements on the mean and standard deviation, subject and activity
12. Create a DF that contains summary of values, which are first grouped by subject and then grouped by activity
13. Change Variable names to represent these are Summarized by adding "AVG" prefix
14. Write tidy and Summarized data to a file

Tidy data and Summarized tidy data were saved two files named "Tidy_Data.txt" and "Tidy_Data_Summary.txt" respectively and uploaded for reference.
