data <- source("readdata.R")
data <- data$value

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

dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()
