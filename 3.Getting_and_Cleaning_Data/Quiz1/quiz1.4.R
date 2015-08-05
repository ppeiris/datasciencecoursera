quiz1.4 <- function() {

    library("XML")
    setwd("/Users/prabath/Dropbox/RIT_Academics_Prabath/NoiseAndRandomProcesses_Spring2011/Note/datasciencecoursera/Getting_and_Cleaning_Data/Quiz1")
    fileName <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

    if (!file.exists("data")) {
        dir.create("data")
    }

    if (!file.exists("data/restaurants.XML")) {
        download.file(fileName, destfile = "./data/restaurants.XML", method = "curl")
    }
    # list.files("./data")


    doc <- xmlTreeParse("data/restaurants.xml", useInternal = TRUE)

    rootNode <- xmlRoot(doc)

    # xmlSApply(rootNode, xmlValue)

    zip <- xpathSApply(rootNode, "//zipcode", xmlValue)

    zip <- data.frame(zip)

    select <- zip[zip[, 1] == 21231, ]

    length(select)

}
