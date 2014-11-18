
# Introduction

The run_analysis.R file contains a script that merges a set of training data and test data, extracts certain measurement values from the merged data, and produces a tidy data set that contains the mean of those measurement values by type of activity.

There are 5 distinct parts of the script.

## Part 1 - Reading and merging the test data and training data

The script starts by unzipping the "getdata_projectfiles_UCI HAR Dataset.zip" file in the local directory. Once the file has been unzipped, it then retrieves both the test data and the training data from the subdirectories. 

The test data is read from 3 files in the "test" subdirectory, subject_test.txt, y_test.txt and X_test.txt files. The content of these 3 files is read and merged into the testdata data frame.


In the same way, the training data is read from 3 files in the "train" subdirectory. That data is read and merged into the traindata data frame.

Those two data frames, testdata and traindata, are then merged using cbind(), to created a merge of all data.

## Part 2 - Extracting only the mean and std measurements
There are 561 measurement variables in the input data, of which only 66 are either mean values or standard variation values. To find which columns correspond to mean or standard variation values, the variable names are read from the features.txt file, and a search is performed, using grepl() to find those variable names that contain either "-mean()" or "-std()". The result of the search returns a structure that contains the column number and column name, for all matching columns.

Using the column numbers, the script copies those columns, as well as the frist two columns (which contain the subject identifier and activity label) into a new data frame, called dataset. This data frame contains only the mean and standard deviation measurements from the original data.

## Part 3 - Setting descriptive activity names
To change the values in the activity column from numeric values to descriptive names, the script reads the set of activity names from the activity_labels.txt file. The input is read in the form of a table, where each row contains a numeric value and the corresponding activity name. The script them replaces each numeric value in the 2nd column of the dataset data frame by the corresponding activity name that was read from the file. This is achieved by using a for loop.

## Part 4 - Labelling the data set with descriptive variable names
To change the column names from generic values to descriptive variable nemes, the script uses the set of feature variable names that had already been read in part 2. The name of the first column in the data set is set of "Subject", the name of the second column is set of "Activity", while the names of the other columns are set to the names that were read earlier from features.txt

## Part 5 - Creating a new tidy data set with mean values only
The final part of the script createas a new tidy data set that just contains the mean of each measurement in dataset, by student and by activity type. The output is in the form of a data frame where each row provides the list of mean measurement values for a given student and given activity. 

Since there are 66 measurements, each row contains 68 values: student id, activity name, and the mean value of all 66 measurement values for that student and that activity. The mean values are calculated by using the colMeans() function on the matching rows of the dataset.

The output is ordered by student id and actiivty name, before being written to the average_measurement_values.txt file.

