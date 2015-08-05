if (!file.exists("Fss06hid.csv")) {
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile = "Fss06hid.csv", method="curl")
}

data <- read.csv("Fss06hid.csv")



logicalVec <- data$

