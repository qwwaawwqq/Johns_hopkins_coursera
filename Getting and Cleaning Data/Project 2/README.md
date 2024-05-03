# Getting and Cleaning Data Course Project

This repository contains the files for the Getting and Cleaning Data Course Project.

## Project Overview

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Files

- `run_analysis.R`: The R script that performs the data cleaning and transformation.
- `CodeBook.md`: The code book describing the variables, data, and transformations.
- `tidy_data.txt`: The resulting tidy data set.

## Instructions

1. Download and unzip the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Place the unzipped `UCI HAR Dataset` folder in the same directory as the `run_analysis.R` script.
3. Run the `run_analysis.R` script. It will generate the `tidy_data.txt` file in the same directory.

## Script Functionality

The `run_analysis.R` script performs the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
