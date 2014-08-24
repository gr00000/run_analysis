library(plyr)

# read data files 

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)

X_train<-read.table(unzip(temp,"UCI HAR Dataset/train/X_train.txt"),header=FALSE)
y_train<-read.table(unzip(temp,"UCI HAR Dataset/train/y_train.txt"),header=FALSE)
subject_train<-read.table(unzip(temp,"UCI HAR Dataset/train/subject_train.txt"),header=FALSE)

X_test<-read.table(unzip(temp,"UCI HAR Dataset/test/X_test.txt"),header=FALSE)
y_test<-read.table(unzip(temp,"UCI HAR Dataset/test/y_test.txt"),header=FALSE)
subject_test<-read.table(unzip(temp,"UCI HAR Dataset/test/subject_test.txt"),header=FALSE)

features<-read.table(unzip(temp,"UCI HAR Dataset/features.txt"),header=FALSE)

activity<-read.table(unzip(temp,"UCI HAR Dataset/activity_labels.txt"),header=FALSE)


# merge the data files

X_merge<-rbind(X_train,X_test)

y_merge<-rbind(y_train,y_test)

subject_merge<-rbind(subject_train,subject_test)

# arrange the column titles

names(features)<-c("id","feature")

names(X_merge)<-features$feature
names(y_merge)<-"activity"
names(subject_merge)<-"subject"

names(activity)<-c("id","activity")

# Extracts only the measurements on the mean and standard deviation for each measurement. 

mean_std<-grep('mean|std', features$feature)

X_merge<-X_merge[, mean_std]
names(X_merge)<-features$feature[mean_std]

# Use descriptive activity names to name the activities in the data set

y_merge$activity<-activity[y_merge$activity,]$activity

y_merge <- data.frame(lapply(y_merge, as.character), stringsAsFactors=FALSE)

# bind the datasets

tidy_data_set <- cbind(subject_merge, y_merge, X_merge)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

mean_data<-aggregate(tidy_data_set[, 3:dim(tidy_data_set)[2]],list(tidy_data_set$subject,
                                                                   tidy_data_set$activity), mean)

names(mean_data)[1:2] <- c('subject', 'activity')

# write the data

write.table(mean_data, "meandata.txt", row.names=FALSE, sep="\t")

# close the link 

unlink(temp)

