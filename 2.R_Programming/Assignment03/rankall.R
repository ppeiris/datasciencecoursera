
rankall <- function(outcome, num = "best") {
    # read the data file
    outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    # match the column name to col number
    columns = data.frame(name = c("heart attack", "heart failure", "pneumonia"), value = c(11, 17, 23))
    # Convert all the number to numeric
    outcomeData[, 11] <- as.numeric(outcomeData[, 11])
    outcomeData[, 17] <- as.numeric(outcomeData[, 17])
    outcomeData[, 23] <- as.numeric(outcomeData[, 23])
    colnum <- columns[columns$name == outcome, 2] # filter by the column

    if (length(colnum) == 0) {
        stop("invalid outcome")
    }

    splitData <- split(outcomeData, outcomeData$State) # Split the data by state

    hos <- character()
    sta <- character()
    i <- 1
    for(data in splitData) {
        nnum <- num
        stateData <- data.frame(hospital = data$Hospital.Name, state = data$State, rank = data[, colnum])
        stateData <- stateData[complete.cases(stateData),] # remove the NA data rows
        stateData <- stateData[order(stateData[, 1]), ] # Sort by the name
        stateData <- stateData[order(stateData[, 3]), ] # Sort by the rank
        if (typeof(nnum) == "character" && nnum == 'best') {
            nnum <- 1
        }
        if (typeof(nnum) == "character" && nnum == 'worst') {
            nnum <- nrow(stateData)
        }
        if (is.na(stateData[nnum:nnum, ][, 1]) | nrow(stateData) < nnum) { # handle for the NA
            finalData <- data.frame(hospital = NA, state = unique(stateData$state))
        } else {
            finalData <- data.frame(hospital = stateData[nnum:nnum, ]$hospital , state = stateData[nnum:nnum, ]$state)
        }
        hos[i] <- as.character(finalData$hospital)
        sta[i] <- as.character(finalData$state)
        i <- i + 1
    }

    df <- data.frame(hospital = hos, state = sta)

    df
}
