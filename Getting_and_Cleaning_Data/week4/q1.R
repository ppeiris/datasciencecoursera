

fileName <- "communities.cvs"

if (!file.exists(fileName)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "communities.cvs", method = "curl")
}

data <- read.csv(fileName)


splits <- strsplit(names(data), "wgtp")


print(splits[123])


