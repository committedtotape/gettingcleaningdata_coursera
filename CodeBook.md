# Code Book

This document is a modified version of the orginal `features_info.txt` file, and it provides information of the variables in the final dataset (`get_clean_data_tidy.txt`), along with any summaries and transformations performed.

The relevant data as described in `features_info.txt` is as follows:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' for time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The final dataset only has the mean and std estimated from the above signals as requested.

This results in 66 measurements recorded in the final dataset. The measurements measured in the X, Y and Z directions appear 3 times (1 for each direction), resulting in 24 Mean measurements and 24 Standard deviation measurements (i.e. the 8 'XYZ' variables above multipled by 3). The other 9 measurements appear for both mean and standard deviation measurements (24 + 24 + 9 + 9 = 66).

The final dataset summarises these 66 measurements further by taking the average (mean) for each subject and activity. The measurements listed above have been renamed to be more descriptive.
The variables in the final dataset are as follows:

1.  "subject" - integer - ID of the subject (human particpant) ranging from 1 - 30
2.  "activity" - factor - Activity label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
3.  "AvgTimeBodyAccelerometerMeanX" - Average of mean Time domain body acceleration signal - X direction
4.  "AvgTimeBodyAccelerometerMeanY" - Average of mean Time domain body acceleration signal - Y direction
5.  "AvgTimeBodyAccelerometerMeanZ" - Average of mean Time domain body acceleration signal - Z direction
6.  "AvgTimeGravityAccelerometerMeanX" - Average of mean Time domain gravity acceleration signal - X direction
7.  "AvgTimeGravityAccelerometerMeanY" - Average of mean Time domain gravity acceleration signal - Y direction
8.  "AvgTimeGravityAccelerometerMeanZ" - Average of mean Time domain gravity acceleration signal - Z direction
9.  "AvgTimeBodyAccelerometerJerkMeanX" - Average of mean Time domain jerk body acceleration signal - X direction
10.  "AvgTimeBodyAccelerometerJerkMeanY" - Average of mean Time domain jerk body acceleration signal - Y direction
11.  "AvgTimeBodyAccelerometerJerkMeanZ" - Average of mean Time domain jerk body acceleration signal - Z direction
12.  "AvgTimeBodyGyroscopeMeanX" - Average of mean Time domain body gyroscope signal - X direction
13.  "AvgTimeBodyGyroscopeMeanY" - Average of mean Time domain body gyroscope signal - Y direction
14.  "AvgTimeBodyGyroscopeMeanZ" - Average of mean Time domain body gyroscope signal - Z direction
15.  "AvgTimeBodyGyroscopeJerkMeanX" - Average of mean Time domain jerk body gyroscope signal - X direction
16.  "AvgTimeBodyGyroscopeJerkMeanY" - Average of mean Time domain jerk body gyroscope signal - Y direction
17.  "AvgTimeBodyGyroscopeJerkMeanZ" - Average of mean Time domain jerk body gyroscope signal - Z direction
18.  "AvgTimeBodyAccelerometerMagnitudeMean" - Average of mean Time domain body acceleration magnitude
19.  "AvgTimeGravityAccelerometerMagnitudeMean" - Average of mean Time domain gravity acceleration magnitude
20.  "AvgTimeBodyAccelerometerJerkMagnitudeMean" - Average of mean Time domain jerk body acceleration magnitude
21.  "AvgTimeBodyGyroscopeMagnitudeMean" - Average of mean Time domain body gyroscope magnitude
22.  "AvgTimeBodyGyroscopeJerkMagnitudeMean" - Average of mean Time domain jerk body gyroscope magnitude
23.  "AvgFrequencyBodyAccelerometerMeanX" - Average of mean frequency domain body acceleration signal - X direction
24.  "AvgFrequencyBodyAccelerometerMeanY" - Average of mean frequency domain body acceleration signal - Y direction
25.  "AvgFrequencyBodyAccelerometerMeanZ" - Average of mean frequency domain body acceleration signal - Z direction
26.  "AvgFrequencyBodyAccelerometerJerkMeanX" - Average of mean frequency domain jerk body acceleration signal - X direction
27.  "AvgFrequencyBodyAccelerometerJerkMeanY" - Average of mean frequency domain jerk body acceleration signal - Y direction
28.  "AvgFrequencyBodyAccelerometerJerkMeanZ" - Average of mean frequency domain jerk body acceleration signal - Z direction
29.  "AvgFrequencyBodyGyroscopeMeanX" - Average of mean frequency domain body gyroscope signal - X direction
30.  "AvgFrequencyBodyGyroscopeMeanY" - Average of mean frequency domain body gyroscope signal - Y direction
31.  "AvgFrequencyBodyGyroscopeMeanZ" - Average of mean frequency domain body gyroscope signal - Z direction
32.  "AvgFrequencyBodyAccelerometerMagnitudeMean" - Average of mean frequency domain body acceleration magnitude
33.  "AvgFrequencyBodyAccelerometerJerkMagnitudeMean" - Average of mean frequency domain jerk body acceleration magnitude
34.  "AvgFrequencyBodyGyroscopeMagnitudeMean" - Average of mean frequency domain body gyroscope magnitude
35.  "AvgFrequencyBodyGyroscopeJerkMagnitudeMean" - Average of mean frequency domain jerk body gyroscope magnitude


36 - 68.  The variables 3-35 are repeated but for the average of the standard deviation instead of average of the mean.

All features (3-68) are numeric and normalized and bounded within [-1,1].

The complete list of variables names can be found in `variable_names.txt`.


