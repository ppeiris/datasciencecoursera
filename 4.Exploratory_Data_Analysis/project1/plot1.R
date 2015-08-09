data <- source("readdata.R")
data <- data$value

#Making the plot 1
plot.new()
hist(data[, 3],
     main = "Global Active Power",
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
