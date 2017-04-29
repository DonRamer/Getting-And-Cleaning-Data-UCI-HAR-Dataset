# Getting-And-Cleaning-Data-UCI-HAR-Dataset

Getting-And-Cleaning-Data-Johns-Hopkins-Bloomberg-School-of-Public-Health-Coursera / UCI HAR Dataset 
This is a repository for all code written for the Getting and Cleaning Data Coursera course through Johns Hopkins University.Course Project(UCI HAR Dataset directory)

Unzip the source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a folder on your local drive, say C:\Users\yourname\Documents\R\Put run_analysis.You must to change all the path directory of run_analysis.R to use the code.  Use data <- read.table("data_set_with_the_averages.txt") to read the data. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 * 6 = 180 rows. Note that the provided R script has no assumptions on numbers of records, only on locations of files. Don´t forget open library(dplyr) to run the code.
