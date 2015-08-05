########################################################################
#
# Programming Assignment 1 Part 2
# https://class.coursera.org/rprog-014/assignment/view?assignment_id=3
#
########################################################################
complete <- function(dir, id = 1:332) {

    # Read the data from the file
    values <- vector(mode="numeric")
    ids <- vector(mode="numeric")
    for(i in 1:length(id)) {
        filename <- getFileName(id[i]) # Build the file name
        filedata <- read.csv(paste(dir, filename, sep="/")) # Retreave data from the file
        cc <- complete.cases(filedata)
        values <- c(values, sum(cc))
        ids <- c(ids,id[i])
    }
    dataframe <- data.frame(id = ids, nobs = values)
    print(dataframe)
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
