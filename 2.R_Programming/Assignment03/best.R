


best <- function(state, outcome) {
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

    states <- data.frame((unique(outcomeData$State)))

    if (length(states[states[, 1] == state,]) == 0) {
        stop("invalid state")
    }

    data <- data.frame(outcomeData$State, outcomeData[, colnum], outcomeData$Hospital.Name)
    data <- data[complete.cases(data),] # remove the NA values from the frame
    data <- data[data[, 1] == state, ] # filter by the state
    final <- data[data[ , 2] == min(data[, 2]), ] # find the min value
    as.character(final[, 3])

}
