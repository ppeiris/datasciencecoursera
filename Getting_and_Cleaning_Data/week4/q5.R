library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)



# data <- data.frame("dates" = sampleTimes)



countYears <- 0
countDays <- 0
for (d in sampleTimes) {

    tmpd <- as.Date(d)


    if (format(tmpd, "%Y") == "2012") {
        countYears <- countYears + 1

        if (weekdays(tmpd) == "Monday") {
            countDays <- countDays + 1
        }
    }


}


print(countYears)
print(countDays)

# print(data)



# print(d)


# print(class(data[1, ]))


# print(weekdays(data[1, ]))
