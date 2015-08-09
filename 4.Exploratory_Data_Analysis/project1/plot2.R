data <- source("readdata.R")
data <- data$value

# Making plot2
plot(data[, 3],
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     xaxt = 'n')

axis(side=1, at=c(0, 1500, 2900), labels=c('Thu', 'Fri', 'Sat'))
dev.copy(png, "plot2.png",  width = 480, height = 480)
dev.off()
