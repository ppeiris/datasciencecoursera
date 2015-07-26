
run_analysis <- function() {
  
  # [ ] load the Activity Lables 
  # Activity lables are in the activity_labels.txt, Column 1 : Activity ID, Column 2 : Activity Name
  
  activityLabels <- read.table("activity_labels.txt", col.names = c("activityId", "activityName"))
  
  print(activityLabels)
  
  # Load the subject_train and test
  
  subjectsTrain <- read.table("train/subject_train.txt", col.names = c("subject"))
  subjectsTest <- read.table("test/subject_test.txt", col.names = c("subject"))
  
  
  print(head(subjectsTrain))
  
  # load the features 
  
  features <- read.table("features.txt", col.names = c("featureId", "featureName"))

  print(head(features))
  
  # load the activities from y_train.txt
  
  activitiesTrain <- read.table("train/y_train.txt", col.names = c("activityId"))
  activitiesTest <- read.table("test/y_test.txt", col.names = c("activityId"))
  
  
  # load the data for both training and test 
  
  trainingData <- read.table("train/X_train.txt")
  
  testingData <- read.table("test/X_test.txt")
  
  l = list(trainingData, testingData)
  
  rbindlist(l)
  
  
  
  # print(head(trainingData))
  
  # concatenate the data sets
  
  
  

}

run_analysis()
