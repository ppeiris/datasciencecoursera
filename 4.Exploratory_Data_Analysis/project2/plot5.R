library(dplyr)
library(ggplot2)
library(sqldf)
# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


boltmoreNEI = NEI[NEI$fips == "24510", ]


colnames(SCC) <- tolower(names(SCC))
colnames(SCC) <- gsub("\\.", "", names(SCC))
colnames(boltmoreNEI) <- tolower(names(boltmoreNEI))

coalList <- sqldf("SELECT scc FROM SCC WHERE SCC.eisector LIKE '%Vehicle%'")
coalData <- merge(boltmoreNEI, coalList, by.x = "scc", by.y = "scc")

groupData <- group_by(coalData, year)
summaryData <- summarize(groupData, mean = mean(emissions))

plot(summaryData$year,
     summaryData$mean,
     main = "Emissions From Vehicle",
     type="l",
     xlab = "Year",
     ylab = "Average Emission (PM2.5)")

# Save to the disk
dev.copy(png, "plot5.png",  width = 480, height = 480)
dev.off()


