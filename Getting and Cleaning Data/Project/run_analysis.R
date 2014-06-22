# Course project, Getting and Cleaning Data
# Creates a tidy dataset from smartphone acceleration sensor data
# Data can be acquired from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# Citation:
# Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra 
# and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a 
# Multiclass Hardware-Friendly Support Vector Machine. International Workshop 
# of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

library(reshape2)
        
# Read feature names from file "features.txt"
names <- read.table(file = "./features.txt")
names <- names[,2] # Remove line numbers
        
# Read testing data into data frames, add col. names & combine
# Data
testData <- read.table(file = "./test/X_test.txt", colClasses = "numeric") 
names(testData) <- names
# Subjects
testSubj <- read.table(file = "./test/subject_test.txt")
names(testSubj) <- c("Subject")
# Activities
testActy <- read.table(file = "./test/y_test.txt") 
names(testActy) <- c("Activity")
# Combined
test <- cbind(testSubj, testActy, testData) 

# Read training data into data frames, add col. names & combine
# Data
trainData <- read.table(file = "./train/X_train.txt", colClasses = "numeric") 
names(trainData) <- names
# Subjects
trainSubj <- read.table(file = "./train/subject_train.txt") 
names(trainSubj) <- c("Subject")
# Activities
trainActy <- read.table(file = "./train/y_train.txt") 
names(trainActy) <- c("Activity")
# Combined
train <- cbind(trainSubj, trainActy, trainData) 

# Combine both sets to one dataset
data <- rbind(test, train)

# Extract the measurements on the mean and st.dev. for each measurement
# 1) Find indices of variables with "mean()" in their name
means <- grep(pattern="mean()", x=names(data), fixed=TRUE)
# 2) Find indices of variables with "std()" in their name
stdevs <- grep(pattern="std()", x=names(data), fixed=TRUE)
extr <- c(1,2,means,stdevs)     # extr = Columns to leave in the data
extr <- sort(x = extr)          # Sort to have columns in right order
data <- data[ , extr]           # Remove other columns from data

# Order data
data <- data[order(data$Subject,data$Activity),]

# Substitute activity codes with textual descriptions
# 1) Read activity names
acts <- read.table("./activity_labels.txt"); acts <- acts[,2]
# 2) Replace codes with text using for loop
for (i in 1:nrow(data)) {
        data$Activity[i] <- as.character(acts[as.numeric(data$Activity[i])])
}

# Create a dataset with measurements averaged for each user and activity
dataMelt <- melt(data, id.vars = c("Subject", "Activity"), variable.name = "Feature",
                 value.name = "Value")
dataMelt <- dcast(dataMelt, Subject + Activity ~ Feature, value.var = "Value", mean)

# Add prefix "avg_" to col. names for clarity
for (i in 3:length(names(dataMelt))) {
        names(dataMelt)[i] <- paste("avg_", names(dataMelt)[i], sep = "")
}

# Create csv file of data
write.csv(x = dataMelt, file = "./measureMeansBySubjAct.txt")