data <- source("readdata.R")
data <- data$value


par(mfrow = c(2, 2))


# Making plot 1
plot(data[, 3],
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     xaxt = 'n')

axis(side=1, at=c(0, 1500, 2900), labels=c('Thu', 'Fri', 'Sat'))

# Making plot 2
plot(data[, 5],
     type="l",
     xlab = "datetime",
     ylab = "Voltage",
     xaxt = 'n')

axis(side=1, at=c(0, 1500, 2900), labels=c('Thu', 'Fri', 'Sat'))



#Making the plot 3
plot(data[, 7],
     type="l",
     xlab = "",
     ylab = "Energy sub metering",
     xaxt = 'n')

lines(data[, 8], col = "red")
lines(data[, 9], col = "blue")

legend('topright',
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       col = c('black', 'red', 'blue'))

axis(side=1, at=c(0, 1500, 2900), labels=c('Thu', 'Fri', 'Sat'))

# Making plot 4
plot(data[, 4],
     type="l",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     xaxt = 'n')

axis(side=1, at=c(0, 1500, 2900), labels=c('Thu', 'Fri', 'Sat'))


dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()
