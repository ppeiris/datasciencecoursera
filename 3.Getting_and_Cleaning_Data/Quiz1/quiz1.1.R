quiz1.1 <- function() {

    setwd("/Users/prabath/Dropbox/RIT_Academics_Prabath/NoiseAndRandomProcesses_Spring2011/Note/datasciencecoursera/Getting_and_Cleaning_Data/Quiz1")
    fileName <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

    if (!file.exists("data")) {
        dir.create("data")
    }

    if (!file.exists("data/cameras.csv")) {
        download.file(fileName, destfile = "./data/cameras.csv", method = "curl")
    }
    # list.files("./data")

    data <- read.csv("./data/cameras.csv")
    val <- data.frame(data$VAL)
    val <- data.frame(val[complete.cases(val), ])
    val <- val[val[, 1] >= 24, ]

    length(val)

}
