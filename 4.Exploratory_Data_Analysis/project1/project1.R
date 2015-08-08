readData <- function() {
	fileName = "household_power_consumption.txt"
	if (!file.exists(fileName)) {
		stop("Data file does not exists")
	}

	rowData <- read.table(fileName,
	                      header = TRUE,
	                      sep=';',
	                      nrow =2)

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

project1 <- function(){

	data <- readData()
	#print(head(data))
	#print(tail(data))

	# Making the plot 1
	# plot.new()
	# hist(data[, 3],
	#      main = "Global Active Power",
	#      col = "red",
	#      xlab = "Global Active Power (kilowatts)",
	#      ylab = "Frequency")

	# dev.copy(png, "plot1.png")
	# dev.off()


	# Making the plot 2

	# print(data[, 2])

	#plot(data[, 3][seq(1, length(data[,3]), 10)],
	#     type="l")


	xlab_ = c("Thu", "Fri", "Sat")
	plot(data[, 3], type="l", xlab =xlab_)
	axis(2, at=1:3, labels=xlab_)


}


