## Getting and Cleaning Data Project Code Book

Justin Peter

### Description
This document contains additional information about the data sets and the
variables used in the Samsung data set.


### Source Data
A full description of the data used in this project can be found at [The UCI
Machine Learning
Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found
here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information
The data set comes with a README.txt file. Most of this section is taken from
there.

The experiments have been carried out with a group of 30 volunteers within an
age bracket of 19-48 years. Each person performed six activities (WALKING,
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a
smartphone (Samsung Galaxy S II) on the waist. Using its embedded
accelerometer and gyroscope, we captured 3-axial linear acceleration and
3-axial angular velocity at a constant rate of 50Hz. The experiments have been
video-recorded to label the data manually. The obtained dataset has been
randomly partitioned into two sets, where 70% of the volunteers was selected
for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows of 2.56
sec and 50% overlap (128 readings/window). The sensor acceleration signal,
which has gravitational and body motion components, was separated using a
Butterworth low-pass filter into body acceleration and gravity. The
gravitational force is assumed to have only low frequency components,
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a
vector of features was obtained by calculating variables from the time and
frequency domain.

### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the
  estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###A note on data units
- 'train/subject_train.txt': Each row identifies the subject who performed the
  activity for each window sample. Its range is from 1 to 30.

- Features are normalized and bounded within [-1,1].

### Section 1. Merge the training and the test sets to create one data set.

First set the working directory, This will be the UCI_HAR_Dataset subdirectory
of the directory to which you downloaded the data.

The following files are read:

- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

The data sets are assigned column names. Then the training and test data sets
are merged to create trainData and testData. These two data sets are combined
to create a data frame named mergeData

## Section 2. Extract only the measurements on the mean and standard deviation
for each measurement. 

A grep is used to find those columns with 'mean' and 'std' in their names.

Those columns are extracted from mergeData and the resultant data set is named
extractData.

## Section 3. Use descriptive activity names to name the activities in the
data set

The activity_labels.txt provides descriptive names. It is merged with the
extractData data frame to create cleanData data frame.

## Section 4. Appropriately label the data set with descriptive activity
names.

The gsub command is used to get rid of superfluous characters. The data names
are self explanatory.

## Section 5. Create a second, independent tidy data set with the average of
each variable for each activity and each subject. 

Finally we use the aggregate function to produce a data set with the mean of
each variable and subject. Unnecessary columns are dropped. The final data set
tidyData is then written out.
