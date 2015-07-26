
loadActivityLables <- function() {
    fileName <- "activity_labels.txt"
    # Activity lables are in the activity_labels.txt, Column 1 : Activity ID, Column 2 : Activity Name
    # activityLabels <- read.table("activity_labels.txt", col.names = c("activityId", "activityName"))
    activityLabels <- read.table(fileName, col.names = c("activityId", "activityName"))
    activityLabels
}

loadSubjectData <- function() {

    fileName <- "allSubjects.txt"
    if (file.exists(fileName)) {
        print(paste(fileName , " file exists !"))
        allSubjects <- read.table(fileName)
    } else {
        print("loading and merging subject data from training and testing...")
        # Load and merge the traning and subject data sets
        subjectsTrain <- read.table("train/subject_train.txt", col.names = c("subject"))
        subjectsTest <- read.table("test/subject_test.txt", col.names = c("subject"))
        allSubjects <- rbind(subjectsTrain, subjectsTest)
        print(paste("saving merged data set as ", fileName))
        write.table(allSubjects, file = fileName, col.names = FALSE, row.names = FALSE)
    }
    allSubjects
}

loadActivityData <- function() {

    fileName <- "allActivities.txt"
    if (file.exists(fileName)) {
        print(paste(fileName , " file exists !"))
        allActivities <- read.table(fileName)
    } else {
        # Load the activitie Ids
        print("loading and merging activity data sets from training and testing...")
        activitiesTrain <- read.table("train/y_train.txt", col.names = c("activityId"))
        activitiesTest <- read.table("test/y_test.txt", col.names = c("activityId"))
        allActivities <- rbind(activitiesTrain, activitiesTest)
        print(paste("saving merged data set as ", fileName))
        write.table(allActivities, file = fileName, col.names = FALSE, row.names = FALSE)
    }
    allActivities
}

getColumnNamesForMeanAndStd <- function() {

    # Extracts column names of the measurements on the mean and standard deviation
    features <- read.table("features.txt", col.names = c("featureId", "featureName"))
    colIdsForMeanAndStd <- features[features[, 2] == 'tBodyAcc-mean()-X' |
                                    features[, 2] == 'tBodyAcc-mean()-Y' |
                                    features[, 2] == 'tBodyAcc-mean()-Z' |
                                    features[, 2] == 'tBodyAcc-std()-X'  |
                                    features[, 2] == 'tBodyAcc-std()-Y'  |
                                    features[, 2] == 'tBodyAcc-std()-Z', ]
    colIdsForMeanAndStd
}

loadMeasuredData <- function() {
    fileName <- "allData.txt"
    if (file.exists(fileName)) {
        print(paste(fileName , " file exists !, wait..."))
        allData <- read.table(fileName)
    } else {
        # load the data for both training and test
        print("loading and merging traning and testing data sets...")
        trainingData <- read.table("train/X_train.txt")
        testingData <- read.table("test/X_test.txt")
        allData = rbind(trainingData, testingData)
        print(paste("saving merged data set as ", fileName))
        write.table(allData, file = fileName, col.names = FALSE, row.names = FALSE)
    }
    colData <- getColumnNamesForMeanAndStd() # Load only the relevent col Ids

    allData[, c(colData$featureId)]
    # write.table(allData, file = "allData.txt")
}

run_analysis <- function() {

    fileName <- "finalDataSet.txt"
    fileNameAverage <- "tidyDataSetForStep5.txt"
    if (file.exists(fileName)) {
        print(paste(fileName , " file exists !. Remove this file to regenrate"))
        finalDataSet <- read.table(fileName, header = TRUE)
    } else {
      ############################ Create the data.frame for the final data set ##################################################
      totalRowCount <- 10299 # Total number of rows in the final data set rowCount(training data set) + rowCount(testing data set)
      finalDataSet <- data.frame(
                                 'SubjectId'          = integer(totalRowCount),
                                 'ActivityId'         = integer(totalRowCount),
                                 'ActivityName'       = character(totalRowCount)
                                )

      ########################### Load the subject_train and test ################################################################
      finalDataSet[, "SubjectId"] <- loadSubjectData()[ , 1] # Load the Subject ID in to final data set
      finalDataSet[, "ActivityId"] <- loadActivityData()[, 1] # Load all the activitie IDs for each subject
      msData <- loadMeasuredData() # load all the mesured data
      finalDataSet[, "tBodyAcc-mean-X"] <- msData[, 1]
      finalDataSet[, "tBodyAcc-mean-Y"] <- msData[, 2]
      finalDataSet[, "tBodyAcc-mean-Z"] <- msData[, 3]
      finalDataSet[, "tBodyAcc-std-X"] <- msData[, 4]
      finalDataSet[, "tBodyAcc-std-Y"] <- msData[, 5]
      finalDataSet[, "tBodyAcc-std-Z"] <- msData[, 6]
      finalDataSet$ActivityName <- NA
      activityLabels <- loadActivityLables() # Load all the activity labels

      # Fill the activity name column
      i <- 1
      for(actId in finalDataSet[, 2]) {
        finalDataSet[i, 'ActivityName'] <- as.character(activityLabels[activityLabels$activityId == actId, ]$activityName)
        i <- i + 1
      }
      # finalDataSet[,2] <- NULL # drop the activtyId Column
      print(paste("Saving final data set as ", fileName))
      write.table(finalDataSet, file = fileName, row.names = FALSE)
  }

  print(head(finalDataSet))


  if (file.exists(fileNameAverage)) {
        print(paste(fileNameAverage , " file exists !. Remove this file to regenrate"))
        aveData <- read.table(fileNameAverage, header = TRUE)
    } else {

      aveData <- data.frame("SubjectId" = integer(0),
                            "ActivityName" = integer(0),
                            "tBodyAcc-ave-X" = double(0),
                            "tBodyAcc-ave-Y" = double(0),
                            "tBodyAcc-ave-Z" = double(0),
                            "tBodyAcc-std-ave-X" = double(0),
                            "tBodyAcc-std-ave-Y" = double(0),
                            "tBodyAcc-std-ave-Z" = double(0)
                            )

      for(personId in 1:30) { # Subject Ids 1..30
        for(actName in activityLabels[, 2]) { # iterate activity names
            # filter data using subject Id and Activity Name
            tmpData <- finalDataSet[finalDataSet$SubjectId == personId & finalDataSet$ActivityName == actName, ]
            tmpAveData <- data.frame("SubjectId" = personId,
                                     "ActivityName" = as.character(actName),
                                     "tBodyAcc-ave-X" = mean(tmpData[, 4]),
                                     "tBodyAcc-ave-Y" = mean(tmpData[, 5]),
                                     "tBodyAcc-ave-Z" = mean(tmpData[, 6]),
                                     "tBodyAcc-std-ave-X" = mean(tmpData[, 7]),
                                     "tBodyAcc-std-ave-Y" = mean(tmpData[, 8]),
                                     "tBodyAcc-std-ave-Z" = mean(tmpData[, 9])
                                     )

            aveData <- rbind(aveData, tmpAveData)

        }
      }
      write.table(aveData, file = fileNameAverage, row.names = FALSE)
    }

    print(head(aveData))
}
