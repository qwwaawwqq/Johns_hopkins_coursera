# Code Book

This code book describes the variables, data, and transformations performed to clean up the data.

## Data Source

- Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Variables

- `Subject`: The ID of the test subject, ranging from 1 to 30.
- `Activity`: The type of activity performed when the corresponding measurements were taken. It can be one of the following: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
- Measurement variables: The dataset contains variables with the mean and standard deviation of various measurements from the accelerometer and gyroscope. These variables are named using the following convention:
  - `t` or `f` prefix: Time domain or frequency domain signals.
  - `BodyAcc`, `GravityAcc`: Acceleration signals separated into body and gravity acceleration signals.
  - `BodyGyro`: Gyroscope signals.
  - `Jerk`: Jerk signals obtained from body linear acceleration and angular velocity.
  - `Mag`: Magnitude of signals calculated using the Euclidean norm.
  - `X`, `Y`, `Z`: Axis of the signals.
  - `mean()`: Mean value.
  - `std()`: Standard deviation.

## Transformations

1. Merged the training and test datasets to create one dataset.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the dataset.
4. Appropriately labeled the dataset with descriptive variable names.
5. Created a second, independent tidy dataset with the average of each variable for each activity and each subject.
