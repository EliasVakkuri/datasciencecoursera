# Code book
## Project work, Coursera course "Getting and cleaning data"

The script "run_analysis.R" is intended to produce a tidy dataset based on smartphone sensor data from [1]. The script will produce a csv file with means and standard deviations averaged by subject and activity performed. The resulting file "measureMeansBySubjAct.txt" will contain the following fields.

* Subject
The number of the subject from the original study.

* Activity
The activity performed when the measurement was obtained. One of the following values: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

* Averages of means and standard deviations for the following measurements
tBodyAcc-XYZ
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

For more detailed information on these, check the explanations in the source data (can be obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Sources:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
