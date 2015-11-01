library(dplyr)
library(ggplot2)
library(sqldf)
# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

colnames(SCC) <- tolower(names(SCC))
colnames(SCC) <- gsub("\\.", "", names(SCC))
colnames(NEI) <- tolower(names(NEI))

coalList <- sqldf("SELECT scc FROM SCC WHERE SCC.eisector LIKE '%Coal%'")
coalData <- merge(NEI, coalList, by.x = "scc", by.y = "scc")

groupData <- group_by(coalData, year)
summaryData <- summarize(groupData, mean = mean(emissions))

plot(summaryData$year,
     summaryData$mean,
     main = "Emissions From Coal Combustion-Related Sources",
     type="l",
     xlab = "Year",
     ylab = "Average Emission (PM2.5)")

# Save to the disk
dev.copy(png, "plot4.png",  width = 480, height = 480)
dev.off()


