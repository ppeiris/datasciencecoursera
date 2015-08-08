

gdp = read.csv("getdata-data-GDP.csv", skip = 4)
gdp = gdp[1:190, ] # load the 190 cuntries
gdp_code = data.frame("CountryCode" = as.character(gdp[, 1]), "gdp" = ((gdp[, 5])))
# print(gdp_code)
# # gdp_code = order(gdp_code, na.last = TRUE, decreasing = FALSE)

# # print(head(gdp_code))



ed = read.csv("getdata-data-EDSTATS_Country.csv")


ed_code = data.frame("X" = ed$CountryCode)



mdata = merge(gdp_code, ed_code, by.x = "CountryCode", by.y = "X")


print(mdata)


# mdata = order(mdata, decreasing = TRUE)

# print(mdata)

# print(mdata[order(mdata[,"gdp"]), ])













# print(str(mdata))

# print(head(values))

# print(head(mdata$gdp))

# print(unique(mdata))





