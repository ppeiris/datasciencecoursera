quiz1.5 <- function() {

    library(data.table)
    setwd("/Users/prabath/Dropbox/RIT_Academics_Prabath/NoiseAndRandomProcesses_Spring2011/Note/datasciencecoursera/Getting_and_Cleaning_Data/Quiz1")
    fileName <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

    if (!file.exists("data")) {
        dir.create("data")
    }

    if (!file.exists("data/acs.csv")) {
        download.file(fileName, destfile = "./data/acs.csv", method = "curl")
    }
    # list.files("./data")

    DT <- fread("./data/acs.csv")

    # data$pwgtp15



    # DT? <- data.frame(data)

    # DT[,mean(pwgtp15),by=SEX]

    # mean(DT$pwgtp15,by=DT$SEX)

    # tapply(DT$pwgtp15,DT$SEX,mean)

    # mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)


    # sapply(split(DT$pwgtp15,DT$SEX),mean)

    DT[,mean(pwgtp15),by=SEX]



}
