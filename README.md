# WearableHMRproject: Getting and Cleaning Data 
### JHU Data Science Specialization Course Project

This repo contains the files for Getting and Cleaning Data course of Coursera, JHU Data Science Specialization Course Project.

### Content of the Repository
>- **README.md**
>- **CodeBook.md** 
>- **run_analysis.R**

### File `README.md` , Contains an introduction and Instruction List:

### File `CodeBook.md` , Contains description of all the Variables and Summary Choices:

### File R script, `run_analysis.R`, Contains R script for converting row data into tidy data:

>1. Download the dataset  to the working directory and unzip
>2. Retrieve the test and training data (Data from smartphone, Subjects and Activity correspnd to each data from smartphone) into RStudio 
>3. Retrieve activity and feature data into RStudio, 

>4. Loads the activity and subject data for each dataset, and merges those
   columns with the dataset
>5. Merges the two datasets
>6. Converts the `activity` and `subject` columns into factors
>7. Creates a tidy dataset that consists of the average (mean) value of each
   variable for each subject and activity pair.

The end result is shown in the file `WearableHMRtidy.txt`.
