## Coursera Getting and Cleaning Data Project

Justin Peter

The Coursera Getting and Cleaning data project repository


### Summary
This project is an exercise to obtain and clean data sets and output a summary
data set coforming to the "tidy data" principles.

The raw data sets can be obtained at [Raw data
sets](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


A description of the data sets can be found at [The UCI Machine Learning
Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Running the script run_analysis.R
First you will need to download and unzip the data sets above.

Then you will need to set the working directory in line 21 of the
run_analysis.R script to the UCI_HAR_Dataset subdirectory of the directory
which you downloaded the data sets to.

### Summary of the R script
The script executes the followwing steps, as per the project instructions

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each
variable for each activity and each subject. 

### Additional Information

The variables and data sets are described in more detail in the CodeBook.md
file in this repository.
