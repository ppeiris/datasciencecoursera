library(dplyr)
library(ggplot2)
library(sqldf)
# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

colnames(SCC) <- tolower(names(SCC))
colnames(SCC) <- gsub("\\.", "", names(SCC))
colnames(NEI) <- tolower(names(NEI))

# Boltmore City
boltmoreNEI = NEI[NEI$fips == "24510", ]
laNEI = NEI[NEI$fips == "06037", ]

mvList <- sqldf("SELECT scc FROM SCC WHERE SCC.eisector LIKE '%Vehicle%'")
mvDataFromBM <- merge(boltmoreNEI, mvList, by.x = "scc", by.y = "scc")
mvDataFromLA <- merge(laNEI, mvList, by.x = "scc", by.y = "scc")


groupDataBM <- group_by(mvDataFromBM, year)
groupDataLA <- group_by(mvDataFromLA, year)

summaryDataBM <- summarize(groupDataBM, mean = mean(emissions))
summaryDataBM$city <- "Boltmore"
summaryDataLA <- summarize(groupDataLA, mean = mean(emissions))
summaryDataLA$city <- "Los Angeles County"


data <- rbind(summaryDataBM, summaryDataLA)

plt <- qplot(year, mean, data = data, color = city)
plt <- plt + geom_line()
plt <- plt + ggtitle("Emissions From Motor Vehicle Sources ")
plt <- plt + labs(x = "Year")
plt <- plt + labs(y = "Mean PM2.5")


ggsave(file = "plot6.png")
