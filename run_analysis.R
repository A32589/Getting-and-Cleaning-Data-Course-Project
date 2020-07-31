library(tidyverse)

###Merges the training and the test sets to create one data set.

#reading the test and train data 
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


#merging the data 
x_total <- rbind(x_train,x_test)
y_total <- rbind(y_train,y_test)
subject_total <- rbind(subject_test,subject_train)

#removing the test train data 
rm(x_train,x_test,y_test,y_train,subject_train,subject_test)


# read data description
variable_names <- read.table("./UCI HAR Dataset/features.txt")

# read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")


###Extracts only the measurements on the mean and standard deviation for each measurement.
selected_variable <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
x_total <- x_total[,selected_variable[,1]]



###Uses descriptive activity names to name the activities in the data set
colnames(y_total) <- "activity"
y_total$activitylabel <- factor(y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- y_total[,-1]




###Appropriately labels the data set with descriptive variable names.
colnames(x_total) <- variable_names[selected_variable[,1],2]


###From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
colnames(subject_total) <- "subject"
total <- cbind(x_total, activitylabel, subject_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)