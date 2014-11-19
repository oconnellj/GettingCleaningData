# Structure of average_measurement_values file

The run_analysis script produces an output file called average_measurement_values.txt, which contains the mean value of 66 measurements values, by student id and by activity type. 

The original measurement values were collected from the accelerometers of Samsung Galaxy 5 smartphones in trials that involved 30 students performing 6 different activities (walking, sitting, standing, laying down, walking upstairs and walking downstairs). From the 561 measurements that were generated from each activity period, the script extracts both the mean and standard deviation values for 33 different variables, and then calculates the mean value of those 66 measurements for each student and each activity type. 

The 33 different measurement variables that were collected are:

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

where each -XYZ variable contains 3 distinct measurements, corresponding to 3 different axes. More information on the original measurements can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

Each row in the average_measurement_values.txt file contains the mean values, for a given student and a given activity, of the mean and standard deviation data that was collected for each of the 33 measurements. Since all of the original measurement values were normalised and bound in [-1,1] range, the mean and standard deviation values are also in the [-1,1] range.

Each row in the file contains the following 68 data items:

* Subject: the identifier of the student. Each student identifier is a number in the range 1 to 30.

* Activity: one of the 6 activities. The 6 activities are walking, laying, sitting, standing, walking upstairs and walking downstairs.

* timeBodyAccXaxisMean: the mean of the tBodyAcc-mean()-X measurements

* timeBodyAccYaxisMean: the mean of the tBodyAcc-mean()-Y measurements

* timeBodyAccZaxisMean: the mean of the tBodyAcc-mean()-Z measurements

* timeBodyAccXaxisStd: the mean of the tBodyAcc-std()-X measurements

* timeBodyAccYaxisStd: the mean of the tBodyAcc-std()-Y measurements

* timeBodyAccZaxisStd: the mean of the tBodyAcc-std()-Z measurements

* timeGravityAccXaxisMean: the mean of the tGravityAcc-mean()-X measureme
nts

* timeGravityAccYaxisMean: the mean of the tGravityAcc-mean()-Y measurements

* timeGravityAccZaxisMean: the mean of the tGravityAcc-mean()-Z measurements

* timeGravityAccXaxisStd: the mean of the tGravityAcc-std()-X measurements

* timeGravityAccYaxisStd: the mean of the tGravityAcc-std()-Y measurements

* timeGravityAccZaxisStd: the mean of the tGravityAcc-std()-Z measurements

* timeBodyAccJerkXaxisMean: the mean of the tBodyAccJerk-mean()-X measurements

* timeBodyAccJerkYaxisMean: the mean of the tBodyAccJerk-mean()-Y measurements

* timeBodyAccJerkZaxisMean: the mean of the tBodyAccJerk-mean()-Z measurements

* timeBodyAccJerkXaxisStd: the mean of the tBodyAccJerk-std()-X measurements

* timeBodyAccJerkYaxisStd: the mean of the tBodyAccJerk-std()-Y measurements

* timeBodyAccJerkZaxisStd: the mean of the tBodyAccJerk-std()-Z measurements

* timeBodyGyroXaxisMean: the mean of the tBodyGyro-mean()-X measurements

* timeBodyGyroYaxisMean: the mean of the tBodyGyro-mean()-Y measurements

* timeBodyGyroZaxisMean: the mean of the tBodyGyro-mean()-Z measurements

* timeBodyGyroXaxisStd: the mean of the tBodyGyro-std()-X measurements

* timeBodyGyroYaxisStd: the mean of the tBodyGyro-std()-Y measurements

* timeBodyGyroZaxisStd: the mean of the tBodyGyro-std()-Z measurements

* timeBodyGyroJerkXaxisMean: the mean of the tBodyGyroJerk-mean()-X measurements

* timeBodyGyroJerkYaxisMean: the mean of the tBodyGyroJerk-mean()-Y measurements

* timeBodyGyroJerkZaxisMean: the mean of the tBodyGyroJerk-mean()-Z measurements

* timeBodyGyroJerkXaxisStd: the mean of the tBodyGyroJerk-std()-X measurements

* timeBodyGyroJerkYaxisStd: the mean of the tBodyGyroJerk-std()-Y measurements

* timeBodyGyroJerkZaxisStd: the mean of the tBodyGyroJerk-std()-Z measurements

* timeBodyAccMagMean: the mean of the tBodyAccMag-mean() measurements

* timeBodyAccMagStd: the mean of the tBodyAccMag-std() measurements

* timeGravityAccMagMean: the mean of the tGravityAccMag-mean() measurements

* timeGravityAccMagStd: the mean of the tGravityAccMag-std() measurements

* timeBodyAccJerkMagMean: the mean of the tBodyAccJerkMag-mean() measurements

* timeBodyAccJerkMagStd: the mean of the tBodyAccJerkMag-std() measurements

* timeBodyGyroMagMean: the mean of the tBodyGyroMag-mean() measurements

* timeBodyGyroMagStd: the mean of the tBodyGyroMag-std() measurements

* timeBodyGyroJerkMagMean: the mean of the tBodyGyroJerkMag-mean() measurements

* timeBodyGyroJerkMagStd: the mean of the tBodyGyroJerkMag-std() measurements

* freqBodyAccXaxisMean: the mean of the fBodyAcc-mean()-X measurements

* freqBodyAccYaxisMean: the mean of the fBodyAcc-mean()-Y measurements

* freqBodyAccZaxisMean: the mean of the fBodyAcc-mean()-Z measurements

* freqBodyAccXaxisStd: the mean of the fBodyAcc-std()-X measurements

* freqBodyAccYaxisStd: the mean of the fBodyAcc-std()-Y measurements

* freqBodyAccZaxisStd: the mean of the fBodyAcc-std()-Z measurements

* freqBodyAccJerkXaxisMean: the mean of the fBodyAccJerk-mean()-X measurements

* freqBodyAccJerkYaxisMean: the mean of the fBodyAccJerk-mean()-Y measurements

* freqBodyAccJerkZaxisMean: the mean of the fBodyAccJerk-mean()-Z measurements

* freqBodyAccJerkXaxisStd: the mean of the fBodyAccJerk-std()-X measurements

* freqBodyAccJerkYaxisStd: the mean of the fBodyAccJerk-std()-Y measurements

* freqBodyAccJerkZaxisStd: the mean of the fBodyAccJerk-std()-Z measurements

* freqBodyGyroXaxisMean: the mean of the fBodyGyro-mean()-X measurements

* freqBodyGyroYaxisMean: the mean of the fBodyGyro-mean()-Y measurements

* freqBodyGyroZaxisMean: the mean of the fBodyGyro-mean()-Z measurements

* freqBodyGyroXaxisStd: the mean of the fBodyGyro-std()-X measurements

* freqBodyGyroYaxisStd: the mean of the fBodyGyro-std()-Y measurements

* freqBodyGyroZaxisStd: the mean of the fBodyGyro-std()-Z measurements

* freqBodyAccMagMean: the mean of the fBodyAccMag-mean() measurements

* freqBodyAccMagStd: the mean of the fBodyAccMag-std() measurements

* freqBodyAccJerkMagMean: the mean of the fBodyAccJerkMag-mean() measurements

* freqBodyAccJerkMagStd: the mean of the fBodyAccJerkMag-std() measurements

* freqBodyGyroMagMean: the mean of the fBodyGyroMag-mean() measurements

* freqBodyGyroMagStd: the mean of the fBodyGyroMag-std() measurements

* freqBodyGyroJerkMagMean: the mean of the fBodyGyroJerkMag-mean() measurements

* freqBodyGyroJerkMagStd: the mean of the fBodyGyroJerkMag-std() measurements
