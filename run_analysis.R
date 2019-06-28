# Getting and cleaning data course assignment
# run_analysis.R

# load tidyverse for dplyr and stringr
library(tidyverse)

# 0.1 DOWNLOAD DATA ---------------------------

# download file if not already done
if (!file.exists("data.zip")) {
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "data.zip", method = "curl")
}

# unzip file if not already done
if (!file.exists("UCI HAR Dataset")) { 
  unzip("data.zip") 
}

# 0.2 READ-IN DATA ------------------------

# - 'features.txt': List of all features.
feature_list <- read.table("UCI HAR Dataset/features.txt", 
                           col.names = c("ob","feature"))

# - 'activity_labels.txt': Links the class labels with their activity name.
activity_list <- read.table("UCI HAR Dataset/activity_labels.txt", 
                            col.names = c("activity_class","activity"))

# - 'train/X_train.txt': Training set.
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",
                      col.names = feature_list$feature)

# - 'train/y_train.txt': Training labels.
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",
                      col.names = c("activity_class"))

# - 'test/X_test.txt': Test set.
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",
                     col.names = feature_list$feature)

# - 'test/y_test.txt': Test labels.
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",
                     col.names = c("activity_class"))


# - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
# Its range is from 1 to 30. 

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",
                            col.names = "subject")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",
                           col.names = "subject")

# 1 MERGE DATA ----------------------------------------

# combine the test data to get measurements, activity and subject in one dataset

test <- bind_cols(subject_test, y_test, x_test)

# combine the train data to get measurements, activity and subject in one dataset

train <- bind_cols(subject_train, y_train, x_train)

# 2 EXTRACT MEAN AND STD ------------------------------

# combine test and train data - only keep mean and sd measurements
# in the feature list datasets, mean and std measurements are denoted with 'mean()' and 'std()' in variable names
# in being converted to column names, these are denoted as 'mean..' and 'std..'

test_and_train <- bind_rows(test, train) %>% 
  select(subject, activity_class, contains("mean..", ignore.case = FALSE), contains("std..", ignore.case = FALSE))

# 3 DESRCRIPTIVE ACTIVITY NAMES ----------------------

# join to activity labels dataset on the class (i.e. 1-6) to get description (laying, sitting etc)
test_and_train <- test_and_train %>% 
  inner_join(activity_list, by = "activity_class") %>% 
  select(subject, activity, everything(), -activity_class)

# 4 DESRCRIPTIVE VARIABLE NAMES ---------------------

# get vector or current dataset names
dataset_names <- names(test_and_train)

# create a new vector of dataset names that have the following replacements
new_dataset_names <- dataset_names %>% 
  # change t to Time  
  str_replace("^t", "Time") %>% 
  # change f to Frequency  
  str_replace("^f", "Frequency") %>% 
  # change Acc to Accelerometer  
  str_replace("Acc", "Accelerometer") %>% 
  # change Gyro to Gyroscope 
  str_replace("Gyro", "Gyroscope") %>% 
  # Body duplicated for some variables so reduce
  str_replace("BodyBody", "Body") %>% 
  # change Mag to Magnitude
  str_replace("Mag", "Magnitude") %>% 
  # change the mean references (e.g. .mean..) to Mean
  str_replace(".mean[.]+", "Mean") %>% 
  # change the std references (e.g. .std..) to Std
  str_replace(".std[.]+", "Std")

# assign these new dataset names to the names of dataset
names(test_and_train) <- new_dataset_names

# 5 AVERAGE MEASUREMENTS PER ACTIVITY AND SUBJECT ----------------------

# group by subject and activity
# summarise_all will take the mean of all non-grouped-by variables
test_and_train_avg <- test_and_train %>% 
  group_by(subject, activity) %>% 
  summarise_all(mean) %>% 
  ungroup()

# adjust variable names one more time to new pre-fix measurements with Avg to indicate
# these are now average measurements (subject and activity remain unchanged)

final_names <- c(names(test_and_train_avg[1:2]), paste0("Avg", names(test_and_train_avg[3:68])))

names(test_and_train_avg) <- final_names

# write out text file for submission
write.table(test_and_train_avg, "get_clean_data_tidy.txt", row.name = FALSE)
