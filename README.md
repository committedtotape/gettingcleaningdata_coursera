# Getting and Cleaning Data Assignment

Repository for Coursera Getting and Cleaning Data Assignment which is based on a [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

This repository comprises of 3 files:

*  `run_analysis.R` - The R code to extract, manipulate and output a tidy dataset as requested. See below for details.
*  `get_clean_data_tidy.txt` - The final tidy dataset created by R code.
*  `CodeBook.md` - A document to indicate all the variables and summaries calculated, along with units, and any other relevant information.

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

This dataset is output as a text file (`get_clean_data_tidy.txt`) for submission.

