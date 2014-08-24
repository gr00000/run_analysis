

The run_analysis.R reads the data for the following experiments and creates a tidy data set.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

The objective:
==============

The objective of the script is 

1- Merge the training and the test sets to create one data set.
2- Extracts only the measurements on the mean and standard deviation for each measurement. 
3- Use descriptive activity names to name the activities in the data set
4- Appropriately label the data set with descriptive variable names. 
5- Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

How the script works and the variables:
=======================================

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
                                                                   




