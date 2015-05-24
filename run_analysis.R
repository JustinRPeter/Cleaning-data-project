#This script is for the Cleaning Data Course Project.
#It does the following:
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set
#   with the average of each variable for each activity and each subject.
#   Justin Peter, 24 May 2015


#Clean workspace
    rm(list=ls())


#-----1. Merge the training and the test sets to create one data set.

#Set the path to the data file directory
    data_dir <- "./data/UCI_HAR_Dataset/"
#Set the working directory to be where the data is located.
    setwd(data_dir)


#1.1 Read in the training data sets separately and combine
    subjectTrain <- read.table("./train/subject_train.txt",header=FALSE)

    XTrain <- read.table("./train/X_train.txt",header=FALSE)

    YTrain <- read.table("./train/y_train.txt",header=FALSE)

#1.2 Read in the test data sets
    subjectTest <- read.table("./test/subject_test.txt",header=FALSE)

    XTest <- read.table("./test/X_test.txt",header=FALSE)

    YTest <- read.table("./test/y_test.txt",header=FALSE)


#1.3 Read in the descriptive files
    features <- read.table("features.txt",header=FALSE)

    activityLabs <- read.table("activity_labels.txt",header=FALSE)

#1.4 Assign the descriptive names to the merged data set
    #First clean up the names in features data frame
    #Get rid of "-","(",")" characters.
    features[,2] <- gsub('[-()]', '', features[,2])

    colnames(subjectTest) <- "subjectID"
    colnames(subjectTrain) <- "subjectID"

    colnames(XTest)  <- features$V2
    colnames(XTrain) <- features$V2

    colnames(YTest)  <- "activityID"
    colnames(YTrain) <- "activityID"

    colnames(activityLabs) <- c('activityID','activityType')

#1.5 Merge the training and test data sets separately and then combine

    trainData <- cbind(XTrain,YTrain,subjectTrain)
    testData  <- cbind(XTest,YTest,subjectTest)

    mergeData <- rbind(trainData,testData)
    

#-----2.Now get only the columns containing information on the mean and
#       standard deviation

    #Extract the column indices from the features data frame
    extractColInds <- grep(".*mean.*|.*std.*|activityID|subjectID",
                           names(mergeData))

    extractData <- mergeData[,extractColInds]

#-----3. and 4.Uses descriptive activity names to name the activities in the data set

    cleanData <- merge(extractData,activityLabs,by.x="activityID",by.y="activityID")
    cleanData <- merge(extractData,activityLabs,by="activityID")

#------5. Create a second, independent tidy data set with the average of
#         each variable for each activity and each subject. 

     #Drop the unnecessary column names when calculating the mean.     
     tidyData <- aggregate(cleanData[,!names(cleanData) %in% 
                                      c('activityID','subjectID','activityType')],
                           list(activityID=cleanData$activityID,
                                subjectID=cleanData$subjectID),
                                mean)

     #Write the tidy data set
     write.table(tidyData, "Samsung_tidy_data_set.txt", 
                 row.name=FALSE,sep="\t")

