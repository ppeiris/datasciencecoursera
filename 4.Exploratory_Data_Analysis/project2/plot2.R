library(dplyr)
# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
# Select only data from boltmore fips == "24510"
boltmoreNEI = NEI[NEI$fips == "24510", ]
# Group the data set by year
byYear <- group_by(boltmoreNEI, year)
# Summarize the data
aveNEI <- summarize(byYear, mean = mean(Emissions))
# Make a plot
plot(aveNEI$year,
     aveNEI$mean,
     main = "PM2.5 Variation in Baltimore City",
     type="l",
     xlab = "Year",
     ylab = "Average Emission (PM2.5)")

# Save to the disk
dev.copy(png, "plot2.png",  width = 480, height = 480)
dev.off()
