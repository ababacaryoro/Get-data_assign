Code Book
========================================================

This is an assignment from the Getting and cleaning data course (week 3) given by the Johns Hopkins University. In the following sections, a description of the variables, data and transformations made to clean data is given.

## Description of variables and Data

In the database, there are 68 variables that can be describe as following : 

 The original variables come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Original variables can be summarized has : 
* tBodyAcc-XYZ (read tBodyAcc-x, tBodyAcc-y and tBodyAcc-z)
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

  After manipulating, the variables retained in the final database are means and standard deviations of the preceding one. Ex :fBodyGyroJerkMag.mean..., fBodyGyroJerkMag.std...,  ...

## Transformations performed to clean up the data

The original data base were on separate text files. The first operation made was to merge all the datasets to one dataset. After that, only the measurements on the mean and standard deviation for each measurement have been extracted. In a final step, tidy data set with the average of each variable for each activity and each subject have been created.



