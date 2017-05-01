# Getting-And-Cleaning-Data-UCI-HAR-Dataset

Getting-And-Cleaning-Data-Johns-Hopkins-Bloomberg-School-of-Public-Health-Coursera / UCI HAR Dataset 
This is a repository for all code written for the Getting and Cleaning Data Coursera course through Johns Hopkins University.Course Project(UCI HAR Dataset directory)

Unzip the source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a folder on your local drive, say C:\Users\yourname\Documents\R\Put run_analysis.You must to change all the path directory of run_analysis.R to use the code. Don´t forget open library(dplyr) to run the code.

The R code for cleaning raw data is shown in "run_analysis.R" script.The steps for processing data are following : 1.Load relevant data mentioned above into R. 2.Merge train data and test data to individual dataset. 3.Subset variables only containing mean and std(standard deviation). 4.Use descriptive activity names to name six activities in activity table. 5.Combind subject table, activity table and mean_std table into one dataset. 6.Create a second, independent tidy dataset with the average of each variable for each activity and each subject.

Code book records corresponding meanings of each variable for the tidy data.
