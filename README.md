# Getting-and-Cleaning-Data-Course-Project

This repository was created for week 4 Assignment of getting and cleaning data at coursera.

The code was written based on instructions given in the R assignment. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

Code: the code reads the train and test data sets and then merges them into a total data set for x, y and subject.

Tidytext
The new generated dataset contained variables calculated based on the mean and standard deviation.
Each row of the dataset is an average of each activity type for all subjects.
