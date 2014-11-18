# Introduction

The run_analysis script produces an output file called average_measurement_values.txt, which contains the mean value of 66 measurements values, by student id and by activity type. 

The original measurement values were collected from the accelerometers of Samsung Galaxy 5 smartphones in trials that involved 30 students performing 6 different activities (walking, sitting, standing, laying down, walking upstairs and walking downstairs). From the 561 measurements that were generated from each activiy period, the script extracts both the mean and standard deviation values for 33 different variables, and then calculates the mean value of those 66 measurements for each student and each activity type. 

The 33 different variables are:
* tBodyAcc-XYZ
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
(where each -XYZ variable contains 3 distinct measurements, corresponding to 3 different axes)

Each row in the output file contains the mean values, for a given student and a given activty, of the mean and standard deviation data that was collected for each of the 33 measurements. The first and second column identifies the student and the activity. The subsequent 66 columns contain the mean values for the different mean and standard deviation measurements:
* Mean of tBodyAcc-mean()-X (3rd column)
* Mean of tBodyAcc-mean()-Y (4th column)
* Mean of tBodyACc-mean()-Z (5th column)
* Mean of tBodyACc-std()-X (6th column)
* Mean of tBodyAcc-std()-Y (7th column)
* Mean of tBodyAcc-std()-Z (8th column)
* Mean of tGravityAcc-mean()-X (9th column)
* Mean of tGravityAcc-mean()-Y (10th column)
* Etc.