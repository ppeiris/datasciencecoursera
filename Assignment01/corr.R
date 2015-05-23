################################################################################
#
# Programming Assignment 1 Part 3
# https://class.coursera.org/rprog-014/assignment/view?assignment_id=3
#
# Write a function that takes a directory of data files and a threshold
# for complete cases and calculates the correlation between sulfate and
# nitrate for monitor locations where the number of completely observed
# cases (on all variables) is greater than the threshold. The function
# should return a vector of correlations for the monitors that meet the
# threshold requirement. If no monitors meet the threshold requirement,
# then the function should return a numeric vector of length 0.
#
################################################################################
corr <- function(dir, threshold = 0) {

    # Read the data from the file
    values <- vector(mode="numeric")
    ids <- vector(mode="numeric")
    id <- 1:332
    corVector <- vector(mode="numeric")
    for(i in 1:length(id)) {
        filename <- getFileName(id[i]) # Build the file name
        filedata <- read.csv(paste(dir, filename, sep="/")) # Retreave data from the file
        completeData <- filedata[complete.cases(filedata), ]
        if (nrow(completeData) > threshold) {
            corVector <- c(corVector, cor(completeData$nitrate, completeData$sulfate))
        }
    }

    print(corVector)
}

# Generate the file name using the fileId
getFileName <- function(fileId) {
        fid <- floor(log10(fileId) + 1)
        fname <- ""
        if (fid < 3) {

            for(j in 1:abs(fid - 3)) {
                fname <- paste("0", fname, sep = "")
            }
        }
        fname <- paste(fname, toString(fileId), sep = "")
        fname <- paste(fname, "csv", sep=".")
}
