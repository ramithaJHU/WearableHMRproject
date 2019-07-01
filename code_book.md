### Code Book for WearableHMRproject: Getting and Cleaning Data 
####  JHU Data Science Specialization Course Project
***
Author: Ramitha P. Rathnayake

___
This Code book describes the Variable names in file "Tidy_Data.txt" and summaries calculated based on those variables contained in file "Tidy_Data_Summary.txt" of this repository.

- **"README.md"** file describes the steps followed in creating the above files
- **"run_analysis.R"** : Contains R script for converting row data into tidy data and then summarizing the data

A full description of the project, where the data used in this project were collected and the original data set is available at the site where the data was obtained: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

___
#### Steps associated in generating the data in "Tidy_Data.txt" and "Tidy_Data_Summary.txt" are:
    1. Downloaded and extracted the file in above link
    2. Training and the test sets were merged to create one data set. This data set was then merged with features and subject data
    3. Measurements on the mean and standard deviation for each measurement were extracted to create a separate data set.
    4. Descriptive activity names were used to replace activity numbers in the data set
    5. Data set was named with descriptive variable names
    6. A second data set was created from the data set in step 5
    7. Data set in step 6 was first grouped by subject and then grouped by activity. then, the average of each variable for each activity and each subject was calculated.
    8. Both tidy data set in step 6 and summarized data set in step 7 were saved to files.

___
#### Variables in "Tidy_Data.txt"

- subject : Represents 30 volunteers within an age bracket of 19-48 years

- activity : Represents 06 different activities performed by 30 volunteers while wearing a Smartphone.

    Namely:
    - `WALKING`: Data Collected while Subject was walking
    - `WALKING_UPSTAIRS`: Data Collected while Subject was walking upstairs
    - `WALKING_DOWNSTAIRS`: Data Collected while Subject was walking downstairs
    - `SITTING`: Data Collected while Subject was sitting
    - `STANDING`: Data Collected while Subject was standing
    - `LAYING`: Data Collected while Subject was laying


- "X", "Y", "Z" suffixes in variable names used to denote 3-axial signals in the X, Y and Z directions.

- "Acc" in variable names used to denote measurements taken with accelerometer
    - `tAcc-XYZ` 

- "Gyro" in variable names used to denote measurements taken with gyroscope
    - `tGyro-XYZ` 
    
- Prefix 't'  in variable names used to denote time domain signals

- "Body" and "Gravity" in variable names used to denote acceleration signal  separated into body and gravity acceleration signals 
    - `tBodyAcc-XYZ` : Body acceleration
    - `tGravityAcc-XYZ`: Gravitational acceleration

- "JerK" in variable names used to denote the body linear acceleration and angular velocity derived in time to obtain Jerk 
    - `tBodyAccJerk-XYZ`
    - `tBodyGyroJerk-XYZ`

- "JerlMag" in variable names used to denote the magnitude of these three-dimensional signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ) calculated using the Euclidean norm.
    - `tBodyAccMag`
    - `tGravityAccMag`
    - `tBodyAccJerkMag`
    - `tBodyGyroMag`
    - `tBodyGyroJerkMag`

- Prefix 'f'  in variable names used to denote signals converted to frequency domain with Fast Fourier Transform (FFT)
    - `fBodyAcc-XYZ`
    - `fBodyAccJerk-XYZ`
    - `fBodyGyro-XYZ`
    - `fBodyAccMag`
    - `fBodyAccJerkMag`
    - `fBodyGyroMag`
    - `fBodyGyroJerkMag`

___
#### Variables in "Tidy_Data_Summary.txt"

- "mean" in variable names used to denote Mean value estimated from original signals

- "std" in variable names used to denote Standard deviation estimated from original signals

- "angle" in variable names used to denote Angle between to vectors

- Additional vectors obtained averaging the signals in a signal window sample. These are used on the angle variable:

    - `gravityMean`
    - `tBodyAccMean`
    - `tBodyAccJerkMean`
    - `tBodyGyroMean`
    - `tBodyGyroJerkMean`

- Variable which were in original data set, which are not in tidy data set include variable names containing words:
    - `mad`: Median absolute deviation 
    - `max`: Largest value in array
    - `min`: Smallest value in array
    - `sma`: Signal magnitude area
    - `energy`: Energy measure. Sum of the squares divided by the number of values. 
    - `iqr`: Interquartile range 
    - `entropy`: Signal entropy
    - `arCoeff`: Autorregresion coefficients with Burg order equal to 4
    - `correlation`: correlation coefficient between two signals
    - `maxInds`: index of the frequency component with largest magnitude
    - `meanFreq`: Weighted average of the frequency components to obtain a mean frequency
    - `skewness`: skewness of the frequency domain signal 
    - `kurtosis`: kurtosis of the frequency domain signal 
    - `bandsEnergy`: Energy of a frequency interval within the 64 bins of the FFT of each window.

___
#### Variables in "Tidy_Data_Summary.txt"

- Variables in file "Tidy_Data_Summary.txt" were obtained by:
    - All the variables in data set in "Tidy_Data.txt" were first grouped by subject and then grouped by activity. then, the average of each variable for each activity and each subject was calculated.
    - Prefix "AVG" was added to each variable name (except subject and activity) to denote the values are Averaged values

___    
