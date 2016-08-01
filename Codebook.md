# Codebook

Elaborates on the variables created in run_analysis.R

### Downloading Data

* url: url of the site where the data is stored
* zipFile: location of zip file when data is downloaded
* path: where unzipped data is stored

### Reading Data

* testActivityData: reads y_test.txt
* trainActivityData: reads y_train.txt
* testSubjectData: reads subject_test.txt
* trainSubjectData: reads subject_train.txt
* testFeaturesData: reads X_test.txt
* trainFeaturesData: reads X_train.txt

### Merging Data

* activityData: binded testActivityData and trainActivityData
* subjectData: binded testSubjectData and trainSubjectData
* featuresData: binded testFeaturesData and trainFeaturesData
* featureNames: contains names for featuresData
* data: binded activityData, subjectData and featuresData

### Extracting Data and Changing Labels

* selectedNames: information on which labels will be extracted
* activityLabels: list of labels for detailed activities. Used to modify activities column

### Tidying Data

* tidiedData: contains tidied data, written to tidiedData.txt

#### Note: No helper functions were used in this script