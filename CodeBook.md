
1) The run_analysis.R script first reads the data files from the web and assign the content to the following variables

-temp: the data file downloaded from the internet
-X_train: training set (X_train.txt)
-y_train: training labels (y_train.txt)
-subject_train: subject trained (subject_train.txt)
-X_test: test set (X_test.txt)
-y_test: test labels (y_test.txt)
-subject_test: subject test (subject_test.txt)
-features: features (features.txt)
-activity: activity (actvity.txt)

2) Train and test variables are merged and assigned to the following variables. 

-X_merge: sets merged 
-y_merge: labels merged
-subject_merge: subjects merged

3) Only the measurements on the mean and standard deviation for each measurement is extracted. 

-mean_std: mean and standard deviation extracted data

4) Activity names are replaces in y_merge using the activity data set

5) Feature names are assigned to X_merge data set  


6) Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

tidy_data_set: created a tidy data set binding subject_merge,y_merge,X_merge 
mean_data: average of each variable for each activity and each subject

7) The resulting data file is written to the working directory 