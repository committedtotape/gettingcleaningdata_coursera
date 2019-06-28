# Getting and Cleaning Data Assignment

Repository for Coursera Getting and Cleaning Data Assignment which is based on a [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

## Purpose of assignment (from course project)

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

>Here are the data for the project:

>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

>You should create one R script called run_analysis.R that does the following.

>Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This repository comprises of 5 files:

*  `README.md` - This document detailing the assignment and files contained in project.
*  `run_analysis.R` - The R code to extract, manipulate and output a tidy dataset as requested. See below for details.
*  `CodeBook.md` - A document to indicate all the variables and summaries calculated, along with units, and any other relevant information.
*  `variable_names.txt` - The full list of variable names present in the final dataset `get_clean_data_tidy.txt`.
*  `get_clean_data_tidy.txt` - The final tidy dataset as requested.

## run_analysis.R

The R code is split into 6 main sections, a preliminary section to import data plus 5 further sections related to the 5 steps laid out in assignment instructions:

### Section 0

Downloads data from [this location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Unzips the data for use in analysis.

Reads in the required text files from location of unzipped files.
8 files are used:

*  'features.txt': List of all features.
*  'activity_labels.txt': Links the class labels with their activity name.
*  'train/X_train.txt': Training set.
*  'train/y_train.txt': Training labels.
*  'test/X_test.txt': Test set.
*  'test/y_test.txt': Test labels.
*  'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.  Ranges from 1 to 30. 
*  'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample.  Ranges from 1 to 30. 

### Section 1

Combines the test and training datasets to create a dataset each for test and train data.
`test` dataset created from `subject_test`, `X_test` and `y_test`. 
`train` dataset created from `subject_train`, `X_train` and `y_train`.

### Section 2

Appends the `test` and `train` datasets created and selects only the required variables:

*  subject
*  activity_class
*  All variables relating to the mean or standard deviation of the measurements (66 measurements in total)

### Section 3

Activites are named using the `activity_labels.txt` file. This is joined using the `activity_class` variable (values 1-6) so the description of activity can be taken (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

### Section 4

Descriptive variable names are provided by ammending the existing variable names as given by the `features.txt` file. Various replacements are made using the `str_replacement` function from the `stringr` package to make the names more descriptive by expanding on abbreviations.

### Section 5

The dataset created in Section 4 is grouped by `subject` and `activity` to create a tidy dataset with each subject-activity combination having 1 row of data. Each of the 180 rows (6 activities x 30 subjects) has 68 columns including the subject, activity and 66 average measurements calculated (using `group_by` and `summarise_all` from `dplyr` package).

The column names are further ammended to indicate that average measurements are now being displayed.

This dataset is output as a text file (`get_clean_data_tidy.txt`) for submission.

