

fileName <- "gdp.csv"

if (!file.exists(fileName)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = fileName, method = "curl")
}

data <- read.csv(fileName, skip = 4)
data <- data[1:190, ]
gdp_code = data.frame("CountryCode" = as.character(data[, 1]), "countryNames" = data[, 4], "gdp" = ((data[, 5])))
nums <- as.numeric(gsub(",", "", gdp_code$gdp))

print("Quiz4 Question 2 : ")
print(mean(nums))
print("-------------------------------")


print("Quiz4 Question 3")
countryNamesModify <- sub("S\xe3o", "___", gdp_code$countryNames)
countryNamesModify <- sub("C\xf4te", "___", countryNamesModify)
names <- grep("^United", countryNamesModify)
print(length(names))
print("-------------------------------")


fileName2 <- "educational.csv"

if (!file.exists(fileName2)) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = fileName2, method = "curl")
}

edudata <- read.csv(fileName2)

mdata = merge(gdp_code, edudata, by.x = "CountryCode", by.y = "CountryCode")










