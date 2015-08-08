if (!file.exists("Fss06hid.csv")) {
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile = "Fss06hid.csv", method="curl")
}

agricultureLogical <- read.csv("Fss06hid.csv")

print(which(agricultureLogical$ACR == 3 & agricultureLogical$AGS == 6))
