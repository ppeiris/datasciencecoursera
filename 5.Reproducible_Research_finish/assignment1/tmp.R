library(knitr)
library(ggplot2)
library(dplyr)
library(scales)

dataset <- read.csv('activity.csv', header=TRUE, sep=",", na.strings = "NA", blank.lines.skip = TRUE)
head(dataset)

dataset <- dataset[!is.na(dataset$steps), ]
dataset <- dataset[!is.na(dataset$date), ]
head(dataset)

gdata <- group_by(dataset, date)
head(gdata)

