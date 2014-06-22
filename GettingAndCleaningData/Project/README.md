This is the submission for Coursera course "Getting and cleaning data", a part of the Data Science specialization. This folder contains the following files:

* README.md: This file, with base information on the script and the dataset it produces
* run_analysis.R: The script for creating a tidy dataset
* CodeBook.md: Information on the variables in the dataset produced

The dataset used in this project is courtesy of the following study:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

How to use the script:

* Download the data from this address: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Extract the zip file obtained from the above address
* Copy file "run_analysis.R" to the folder "UCI HAR Dataset" contained in the zip file
* Run the script, the end result will be a csv file named "measureMeansBySubjAct.txt"

The script works as follows:

* Read data from test set (folder "test") for measurements ("X_test.txt"), subject numbers ("subject_test.txt") and activities ("Y_test.txt"); add column names; combine columns
* Repeat above step for training data
* Combine training and test data to one dataset
* Extract only data on the means and standard deviations of measurements
* Substitute activity codes with names from file "activity_labels.txt"
* Based on this data, create a set with values averaged by subject and activity
* Create csv file

For more details refer to the script file