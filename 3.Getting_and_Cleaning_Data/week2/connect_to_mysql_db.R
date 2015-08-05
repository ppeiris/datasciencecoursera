
library("RMySQL") # load the library

#Connect to the mysql server and select the database
con_nhg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")

# show database command
showDb <- dbGetQuery(con_nhg19, "show databases;")

# list all the tables in the given database
allTables <- dbListTables(con_nhg19)

# get all the fields of the table
listFields <- dbListFields(con_nhg19, "affyU133Plus2")

describeTable <- dbGetQuery(con_nhg19, "describe affyU133Plus2;")


selectData <- dbGetQuery(con_nhg19, "select count(*) from affyU133Plus2")

affDat <- dbReadTable(con_nhg19, "affyU133Plus2")

query <- dbSendQuery(con_nhg19, "select * from affyU133Plus2 where misMatches between 1 and 3")

affyMis <- fetch(query, n = 10) # only first 10 rows
print(str(affyMis))
dbClearResult(query)


# ***** disconnect
dbDisconnect(con_nhg19)


# print(allTables[1:5])


# print(listFields)

# print(describeTable)

# print(selectData)


# print(class(affDat))
