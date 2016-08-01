
## Creates data folder if there isn't one already

if (!file.exists("./data")) dir.create("./data")

## Downloading data for project

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "./data/Dataset.zip"
download.file(url, destfile = zipFile) 
unzip(zipFile, exdir = "./data")

path <- file.path("./data", "UCI HAR Dataset")

#// uncomment below lines at end
testActivityData <- read.table(file.path(path, "test", "y_test.txt"), header = FALSE)
trainActivityData <- read.table(file.path(path, "train", "y_train.txt"), header = FALSE)
testSubjectData <- read.table(file.path(path, "test", "subject_test.txt"), header = FALSE)
trainSubjectData <- read.table(file.path(path, "train", "subject_train.txt"), header = FALSE)
testFeaturesData <- read.table(file.path(path, "test", "X_test.txt"), header = FALSE)
trainFeaturesData <- read.table(file.path(path, "train", "X_train.txt"), header = FALSE)

## 1. Merges the training and the test sets to create one data set.

activityData <- rbind(trainActivityData, testActivityData)
subjectData <- rbind(trainSubjectData, testSubjectData)
featuresData <- rbind(trainFeaturesData, testFeaturesData)

## Naming the variables

names(activityData) <- c("Activity")
names(subjectData) <- c("Subject")
featureNames <- read.table(file.path(path, "features.txt"), header = FALSE)
names(featuresData) <- featureNames$V2

## Merging data

data <- cbind(subjectData, activityData)
data <- cbind(data, featuresData)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

selectedNames <- grepl("mean\\(\\)|std\\(\\)", names(data))
selectedNames[1:2] <- TRUE # so that Activity and Subject fields will remain
data <- data[, selectedNames]

## 3. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path(path, "activity_labels.txt"), header = FALSE)
data$Activity <- factor(data$Activity, labels = activityLabels$V2)

## 4. Appropriately labels the data set with descriptive variable names.
# Makes the variable names more clear

names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("^f", "frequency", names(data))
names(data) <- gsub("Acc", "Acceleration", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))

## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.

library(plyr)
tidiedData <- aggregate(. ~Subject + Activity, data, mean)
tidiedData <- tidiedData[order(data$Subject,data$Activity),]
write.table(tidiedData, file = "tidiedData.txt", row.names = FALSE)