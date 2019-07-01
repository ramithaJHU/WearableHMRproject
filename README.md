# WearableHMRproject: Getting and Cleaning Data 
###  JHU Data Science Specialization Course Project

This repo contains the files for Getting and Cleaning Data course of Coursera, JHU Data Science Specialization Course Project.

### Content of the Repository
>- **README.md** : Contains an introduction and Instruction List:
>- **code_book.md**  : Contains description of all the Variables and Summary Choices:
>- **run_analysis.R** : Contains R script for converting row data into tidy data and then summarizing the data
>- **Tidy_Data.csv** : Contains the tidy data obtained fron above R script 
>- **Tidy_Data_Summary.csv** : Contains the summary of tidy data obtained from above R script 


### R script file, `run_analysis.R`, Contains R script for converting row data into tidy data and them summmarizing the data.
Main steps followed in the process are as followed and has been firther described in Code Book

This R sctipt created under following environment
>-Microsoft Windows 10 Pro
>-OS Version: 10.0.16299 build 16299


>1. Download and unzip the dataset, if it has not being downloaded
>2. Read Feature descriptions and Activity lables
>3. Check for duplicated features and check weather the duplicated items contains measurements on the mean and standard deviation
   Note: Even there are duplicated features with the same name, those items does not contain measurements on the mean and standard deviation. So, they were left as it is without combining.
>4. Remove "()" , replace "(" with "", replace ")" with "", replace "," with "" in feature names to make it meaningfull as DF column names can not contain () and ,
>5. Read the Test and Training data into variables 
>6. Merge Train and Test data into single data frames of each type
>7. Remove original data frames from memory to save memory
>8. Replace activity numbers in Y_merge data drame with activity names
>9. Find the column indexes, where word mean or std appear in any letter combination 
>10. Create a new DF that contains data measurements on the mean and standard deviation
>11. Create a single DF with measurements on the mean and standard deviation, subject and activity
>12. Create a DF that contains summary of values, which are first grouped by subject and then grouped by activity
>13. Write tidy and Summarized data to a file

Tidy data and Summarized tidy data were saved two files named "Tidy_Data.csv" and "Tidy_Data_Summary.csv" respectively and uploaded for reference.
