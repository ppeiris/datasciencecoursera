library(dplyr)
# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
# Group the data set by year
byYear <- group_by(NEI, year)
# Summarize the data
aveNEI <- summarize(byYear, mean = mean(Emissions))
# Make a plot
plot(aveNEI$year,
     aveNEI$mean,
     main="Total Emissions From PM2.5",
     type="l",
     xlab = "Year",
     ylab = "Average Emission (PM2.5)")

# Save to the disk
dev.copy(png, "plot1.png",  width = 480, height = 480)
dev.off()
