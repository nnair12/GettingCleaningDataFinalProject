# GettingCleaningDataFinalProject

Final project for the course Getting and Cleaning Data.
The script run_analysis.R will download the UCI HAR Dataset folder from an external site provided by the instuctor. It then does the following:

1. Merges the training and the test sets to create one data set.
  - Six separate data files are read and then binded together
2. Extracts only the measurements on the mean and standard deviation for each measurement.
  - Certain columns from the combined data are extracted. Other columns are discarded
3. Uses descriptive activity names to name the activities in the data set
  - Uses one of the provided files, activity_labels.txt, to obtain the names for the activities column
4. Appropriately labels the data set with descriptive variable names.
  - Changes the names of several labels to make the data easier to understand
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script ends with writing the data set created in step 5 to a file called tidiedData.text. It does not require the original data to have been downloaded beforehand.
