#

#Clean workspace
    rm(list=ls())


#-----1. Merge the training and the test sets to create one data set.

#Set the path to the data file directory
    data_dir <- "./data/UCI_HAR_Dataset/"
#Set the working directory to be where the data is located.
    setwd(data_dir)


#1.1 Read in the training data sets separately and combine
    #subjectTrain <- read.table(paste(data_dir,"train/","subject_train.txt",sep=""),
    #                               header=FALSE)
    subjectTrain <- read.table("./train/subject_train.txt",header=FALSE)

    XTrain <- read.table(paste(data_dir,"train/","X_train.txt",sep=""),
                         header=FALSE)

    YTrain <- read.table(paste(data_dir,"train/","y_train.txt",sep=""),
                         header=FALSE)


    #Merge the training data sets
    #trainData <- cbind(XTrain,YTrain,subjectTrain)

#1.2 Read in the test data sets
    subjectTest <- read.table(paste(data_dir,"test/","subject_test.txt",sep=""),
                              header=FALSE)

    XTest <- read.table(paste(data_dir,"test/","X_test.txt",sep=""),
                        header=FALSE)

    YTest <- read.table(paste(data_dir,"test/","y_test.txt",sep=""),
                        header=FALSE)

    #Merge the test data sets
    #testData <- cbind(XTest,YTest,subjectTest)

#1.3 Read in the descriptive files
    features <- read.table(paste(data_dir,"features.txt",sep=""),header=FALSE)

    activityLabs <- read.table(paste(data_dir,"activity_labels.txt",sep=""),
                               header=FALSE)

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
     write.table(tidyData, "./data/Samsung_tidy_data_set.txt", 
                 row.name=FALSE,sep="\t")


    #Need to add the 
    
#Now search for only those strings which contain "mean" and "std"
#The indices in features will give us the appropriate columns to extract
#from the merged data sets

#We will achieve this by conducting a search on the appropriate variables.
# Read features and make the feature names better suited for R with some
# substitutions
#features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] <- gsub('-mean', 'Mean', features[,2])
features[,2] <- gsub('-std', 'Stddev', features[,2])

