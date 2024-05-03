# Load required packages
library(dplyr)

# Download and unzip the data (if not already downloaded)
if (!file.exists("UCI HAR Dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip")
  unzip("UCI HAR Dataset.zip")
}

# Read in the training data
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read in the test data
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge the training and test data
x_data <- rbind(train_x, test_x)
y_data <- rbind(train_y, test_y)
subject_data <- rbind(train_subject, test_subject)
merged_data <- cbind(subject_data, y_data, x_data)

# Read the feature names
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

# Extract measurements on the mean and standard deviation
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$V2)
selected_data <- merged_data[, c(1, 2, mean_std_features + 2)]

# Use descriptive activity names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
selected_data$V1.1 <- activity_labels$V2[selected_data$V1.1]

# Label the data set with descriptive variable names
names(selected_data)[1:2] <- c("Subject", "Activity")
names(selected_data)[3:ncol(selected_data)] <- features$V2[mean_std_features]

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- selected_data %>%
  group_by(Subject, Activity) %>%
  summarize_all(mean)

# Write the tidy data set to a text file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)