Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zipOriginal description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+SmartphonesThe attached R script (run_analysis.R) performs the following to clean up the data:Merges the training and test sets to create one data set, namely train/X_train.txt with test/X_test.txt, the result of which is a 10299x561 data frame, as in the original description ("Number of Instances: 10299" and "Number of Attributes: 561"), train/subject_train.txt with test/subject_test.txt, the result of which is a 10299x1 data frame with subject IDs, and train/y_train.txt with test/y_test.txt, the result of which is also a 10299x1 data frame with activity IDs.Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. The result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set: 

  Walking  
  
  Walking upstairs  
  
  Walking downstairs  
  
  Sitting  
  
  Standing  
  
  Laying  

Variables contain X, Y or X to denote 3-axial signals in the X, Y and Z directions.

Variables contain Gyro or ACC to denote two sensor signals for recording the results of activities, accelerometer or gyroscope.

Variables contain Time_Acc_XYZ and Time_Gyro_XYZ to denote time domain signals were captured at a constant rate of 50 Hz.

Variables contain Time_BodyAcc_XYZ and Time_GravityAcc_XYZ to denote acceleration signal separate by body and gravity acceleration.

Variables contain std: Standard deviation.

The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names. Then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs. The result is saved as tidy_data.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. The names of the attributes are similar to the following: 
 
  Time_BodyAcc_mean_X
 
  Time_BodyAcc_mean_Y
 
  Time_BodyAcc_mean_Z
 
  Time_BodyAcc_std_X
 
  Time_BodyAcc_std_Y
 
  Time_BodyAcc_std_Z
 
  Time_GravityAcc_mean_X
 
  Time_GravityAcc_mean_Y
 
  Time_GravityAcc_mean_Z
 
  Time_GravityAcc_std_X
 
  Time_GravityAcc_std_Y
  
 .
 .
 .
 
 The result is saved as "tidy_data.txt", a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains activity names, and then the averages for each of the 66 attributes.
