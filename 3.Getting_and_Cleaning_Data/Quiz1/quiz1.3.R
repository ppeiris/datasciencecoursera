quiz1.3 <- function() {

    library(xlsx)
    setwd("/Users/prabath/Dropbox/RIT_Academics_Prabath/NoiseAndRandomProcesses_Spring2011/Note/datasciencecoursera/Getting_and_Cleaning_Data/Quiz1")
    fileName <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

    if (!file.exists("data")) {
        dir.create("data")
    }

    if (!file.exists("data/ng.xlsx")) {
        download.file(fileName, destfile = "./data/ng.xlsx", method = "curl")
    }
    list.files("./data")

    rowIndex <- 18:23
    colIndex <- 7:15
    dat <- read.xlsx("data/ng.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)

    sum(dat$Zip*dat$Ext,na.rm=T)

}
