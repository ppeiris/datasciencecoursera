
# Data file name
fileName = "household_power_consumption.txt"

#chek for existing file
if (!file.exists(fileName)) {
    # Download the data set
    zipFileName = 'household_power_consumption.zip'
    dataLink = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(dataLink, destfile = zipFileName, method = "curl")
    unzip(zipFileName)
    unlink(zipFileName)
}

# check for the file one more time
if (!file.exists(fileName)) {
    NULL
} else {


    rowData <- read.table(fileName, header = TRUE, sep=';', nrow =2)

    # figure out the data formats for each col
    classes <- sapply(rowData, class)

    # Get the correct row number to read the data
    dataStartDate <- as.Date(rowData[1,1], "%d/%m/%Y")
    requiredStartDate <- as.Date("2007-02-01")
    requiredEndDate <- as.Date("2007-02-02")

    # Ignore this number of mins from the first day
    firstDayStart <- strptime("00:00:00", "%H:%M:%S")
    firstDayEnd <- strptime(rowData[1,2], "%H:%M:%S")
    firstDayMin <- abs(as.numeric(as.difftime(firstDayStart - firstDayEnd))) * 60
    skipRows = (as.numeric(requiredStartDate - dataStartDate) * 60 * 24) - firstDayMin + 1

    # Figure out the rows that starts from 2007-02-01 to 2007-02-02
    rowCount <- ((as.numeric(requiredEndDate - requiredStartDate) + 1) * 60 * 24) + 1


    data <- read.table(fileName,
                        header = FALSE,
                        sep=";",
                        na.strings = "?",
                        colClasses = classes,
                        skip = skipRows,
                        nrow = rowCount)
    data[, 1] <- as.Date(data[, 1], "%d/%m/%Y")
    #data[, 2] <- strptime(data[, 2], "%H:%M:%S")
    data
}
