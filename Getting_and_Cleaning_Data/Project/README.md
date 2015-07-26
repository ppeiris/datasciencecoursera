# How run_analysis.R script works


run_analysis.R script generate following files in the current dir

allSubjects.txt - contain all the training and test subjects
allActivities.txt - contain all training and testing activities
allData.txt - contain concatenate data from traning and testing
finalDataSet.txt - contain the final data set with only relevent columns
tidyDataSetForStep5.txt - contain the final tidy data set

When you run the this script, it will generate all the data files and save them
in the current directory. When you run the script for the second time, if alove files
already exists, it will load data from those files instead of loading and run the concatonating
from row data files. If you want to re run the script to regenerate the data sets, you have to
remove above data file(s) before run the script.

