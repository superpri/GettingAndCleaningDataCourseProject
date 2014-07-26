# Final Project - Getting And Cleaning Data

This is the final project for Getting And Cleaning Data class of the Signature Track for Data Specialist online program given by John Hopkins University on Coursera. The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set.

## Dataset

The dataset used here is from the Smartlab - Non Linear Complex Systems Laboratory by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto: Human Activity Recognition Using Smartphones Dataset.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the group captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

## Problem

The goal is to prepare tidy data that can be used for later analysis. Each student should create one R script called run_analysis.R that does the following: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Script

The script run_analysis.R contains all code to build my solution to the problem given. All one needs to do is run it:
```R
    source('./run_analysis.R')
    analyze()
```

You don't need to download the dataset. The script has its means:
```R
    download.file("https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip", destfile="dataset.zip", method="wget")
    unzip("dataset.zip")
    setwd("UCI HAR Dataset")
```

The script changes the directory to the *UCI HAR Dataset* extracted from the download.zip and executes all functions there. The final tidy data is written on *final.txt*.

*Note*: In all the examples above, it is assumed that the script file is physically in the current working directory. If it does not, you should provide the correct path to the file to source it.