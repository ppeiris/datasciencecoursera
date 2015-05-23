########################################################################
#
# Programming Assignment 1
# https://class.coursera.org/rprog-014/assignment/view?assignment_id=3
#
########################################################################
pollutantmean <- function(dir, pollutant, id = 1:332) {

    # Read the data from the file
    values <- vector(mode="numeric")
    for(i in 1:length(id)) {
        filename <- getFileName(id[i]) # Build the file name
        filedata <- read.csv(paste(dir, filename, sep="/")) # Retreave data from the file
        values <- c(values, cleanData(filedata[pollutant]))
    }
    print(mean(values))
}

# Calculate the mean value
cleanData <- function(data) {
    bad <- is.na(data)
    cleanData <- data[!bad]
    cleanData
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
