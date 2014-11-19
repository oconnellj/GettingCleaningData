
## Unzip the input data which should be in the local directory
zname <- "getdata_projectfiles_UCI HAR Dataset.zip"
if (!file.exists(zname))
	print("Zip file with dataset does not exist")
else
	unzip(zname)

## Read in the test data, starting with the student ids
y <- file("UCI HAR Dataset/test/subject_test.txt", "r")
if (!isOpen(y))
	print("Could not open the subject_test.txt file")
subjects <- readLines(y)
close(y)

## Read the test labels
y <- file("UCI HAR Dataset/test/y_test.txt", "r")
if (!isOpen(y))
	print("Could not open the y_test.txt file")
tlabels <- readLines(y)
close(y)

## Read the test set
y <- file("UCI HAR Dataset/test/X_test.txt", "r")
if (!isOpen(y))
	print("Could not open the X_test.txt file")
tset <- read.table(y)
close(y)

## Merge all of the test data into one data frame
testdata <- cbind(subjects, tlabels, tset)

## We now do the same for the training data

y <- file("UCI HAR Dataset/train/subject_train.txt", "r")
if (!isOpen(y))
	print("Could not open subject_train.txt file")
subjects <- readLines(y)
close(y)

## Read the training labels
y <- file("UCI HAR Dataset/train/y_train.txt", "r")
if (!isOpen(y))
	print("Could not open the y_train.txt file")
tlabels <- readLines(y)
close(y)

## Read the training set
y <- file("UCI HAR Dataset/train/X_train.txt", "r")
if (!isOpen(y))
	print("Could not open the X_train.txt file")
tset <- read.table(y)
close(y)

## Merge all of the training data into another data frame
traindata <- cbind(subjects, tlabels, tset)

## Check that the column names of the two data frames
## are the same, before merging them

if (!identical(names(testdata), names(traindata)))
	print("Different column names in test set and training set")

## Now merge those two datasets using rbind
## alldata contains the merge of the test data set and training data set
alldata <- rbind(testdata, traindata)

## Part 2 - extract only those measurements that contain mean or std values

## We start by getting all of the variable names ... 
y <- file("UCI HAR Dataset/features.txt", "r")
if (!isOpen(y))
	print("Could not open the file containing the variable names")
varNames <- read.table(y)
close(y)

## We now need to extract only those measurements that contain the mean and std dev of each measurement.
## Search for all variable names that contain "-mean()" or "-std()"
## The resulting vector contains the column numbers in its first column

toExtract <- varNames[which(grepl(as.character("-mean()"),as.character(varNames$V2),fixed=TRUE) | grepl(as.character("-std()"),as.character(varNames$V2),fixed=TRUE)),]

## The number of rows in toExtract is equal to the number of columns that we will be be extracting

nExtract <- nrow(toExtract)

## The columns to be extracted are the first two columns (subjects 
## and labels), and all of the columns identified in toExtract
## dataset contains the set of extracted columns

extract <- c(1,2,toExtract[,1]+2)
dataset <- alldata[,extract]

## Part 3 - set the activity labels, using the names in the activity_labels.txt file
## This is done by setting the 2nd column to character type and replacing the previous 
## numeric value by the corresponding activity label

y <- file("UCI HAR Dataset/activity_labels.txt", "r")
if (!isOpen(y))
	print("Could not open the file containing the activity names")
activityLabels <- read.table(y)
close(y)

## Need to set the 2nd column of dataset to be of type string and then
## change the value from a number to the corresponding activity name

dataset[,2] <- as.character(dataset[,2])
for (i in 1:nrow(dataset)) {
	j <- as.numeric(dataset[i,2])
	dataset[i,2] <- as.character(activityLabels[j,"V2"])
	}

## Part 4 - Set the names of the column variables to descriptive names.
## Descriptive names are derived from the names that were read from 
## features.txt file, by removing non-alphabetic characters, by replacing
## X/Y/Z by Xaxis/Yaxis/Zaxis, by moving "Mean" or "Std" to the end
## of the name, by replacing tBody by triBody, by replacing fBody by 
## freqBody and by replacing BodyBody by Body.

cnames <- c("Subject", "Activity", as.character(toExtract[,2]))
for (i in 1:length(cnames)) {
	s <- as.character(cnames[i])
	s <- sub("-mean\\(\\)-X","XaxisMean",s)
	s <- sub("-mean\\(\\)-Y","YaxisMean",s)
	s <- sub("-mean\\(\\)-Z","ZaxisMean",s)
	s <- sub("-std\\(\\)-X","XaxisStd",s)
	s <- sub("-std\\(\\)-Y","YaxisStd",s)
	s <- sub("-std\\(\\)-Z","ZaxisStd",s)
	s <- sub("-mean\\(\\)","Mean",s)
	s <- sub("-std\\(\\)","Std",s)
	s <- sub("tBody","timeBody",s)
	s <- sub("tGravity","timeGravity",s)
	s <- sub("fBody","freqBody",s)
	s <- sub("BodyBody","Body",s)
	cnames[i] <- s
	}
names(dataset) <- cnames

## Part 5 - Create a new tidy data set that gives the average
## value for each measurement, by student and by activity
## This will be a wide table, where each row contains the 
## average values for all measurements for a given student and given activity

## Calculate how many unique students and activities are present
## From this we can calculate the toal number of rows in the output data frame

d1 <- unique(dataset[,1])
d2 <- unique(dataset[,2])

## Output matrix will hold the average values
## Keys will hold the student id and activity
## We will bind those two data frames together
## to produce the tidy data set

output <- matrix(nrow = length(d1) * length(d2), ncol = nExtract)
keys <- data.frame()
k <- 0
for (i in 1:length(d1)) {
	for (j in 1:length(d2)) {
		k <- k + 1
		keys[k,1] <- d1[i]
		keys[k,2] <- d2[j]
		output[k,] <- colMeans(dataset[which(dataset$Subject == d1[i] & dataset$Activity == d2[j]),3:(nExtract+2)])
		}
	}

## Merge keys and output to create the tidy data set,
## and order it by student id and activity name
dt <- cbind(keys, output)
dt <- dt[order(as.numeric(as.character(dt$V1)), dt$V2),]

## Set the names of the columns to the same names as the
## original column names
names(dt) <- cnames

## Write the output to file, as a txt file. The output file is called average_measurement_values.txt

write.table(dt,"average_measurement_values.txt", row.names = FALSE)



