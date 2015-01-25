# getdata-010
Project Assignment of getdata-010 Getting and Cleaning Data

Task:
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data Source:
Training data set: ./UCI HAR Dataset/train/X_train.txt
Testing data set: ./UCI HAR Dataset/test/X_test.txt
List of all features: ./UCI HAR Dataset/features.txt

Process Steps:
1. Read in the features list into the "labels" variable which is a character vector.
2. Read in the training data set into a data frame, "allData".
3. Read in the testing data set and bind to "allData".
4. Select the required columns by the feature names.
5. Rename the column names
6. Calculate the average of each column, and store the result in "finalTidyData"
7. Output "finalTidyData" to a file.

