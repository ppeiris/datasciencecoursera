library(dplyr)
library(ggplot2)
# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
# Select only data from boltmore fips == "24510"
boltmoreNEI = NEI[NEI$fips == "24510", ]

boltmorePOINT <- boltmoreNEI[boltmoreNEI$type == "POINT", ]
boltmoreNONPOINT <- boltmoreNEI[boltmoreNEI$type == "NONPOINT", ]
boltmoreONROAD <- boltmoreNEI[boltmoreNEI$type == "ON-ROAD", ]
boltmoreNONROAD <- boltmoreNEI[boltmoreNEI$type == "NON-ROAD", ]

boltmorePOINT_byYear <- group_by(boltmorePOINT, year)
boltmorePOINT_byYear_mean <- summarize(boltmorePOINT_byYear, mean = mean(Emissions))
boltmorePOINT_byYear_mean$type = "POINT"

boltmoreNONPOINT_byYear <- group_by(boltmoreNONPOINT, year)
boltmoreNONPOINT_byYear_mean <- summarize(boltmoreNONPOINT_byYear, mean = mean(Emissions))
boltmoreNONPOINT_byYear_mean$type = "NONPOINT"

boltmoreONROAD_byYear <- group_by(boltmoreONROAD, year)
boltmoreONROAD_byYear_mean <- summarize(boltmoreONROAD_byYear, mean = mean(Emissions))
boltmoreONROAD_byYear_mean$type = "ON-ROAD"

boltmoreNONROAD_byYear <- group_by(boltmoreNONROAD, year)
boltmoreNONROAD_byYear_mean <- summarize(boltmoreNONROAD_byYear, mean = mean(Emissions))
boltmoreNONROAD_byYear_mean$type = "NON-ROAD"

data <- rbind(boltmorePOINT_byYear_mean,
              boltmoreNONPOINT_byYear_mean,
              boltmoreONROAD_byYear_mean,
              boltmoreNONROAD_byYear_mean)




plt <- qplot(year, mean, data = data, color = type)
plt <- plt + geom_line()
plt <- plt + ggtitle("Boltmore city PM2.5 variation")
plt <- plt + labs(x = "Year")
plt <- plt + labs(y = "Mean PM2.5")

ggsave(file = "plot3.png")
