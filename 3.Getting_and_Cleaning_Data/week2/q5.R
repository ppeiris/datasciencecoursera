x <- read.fwf(#
  "getdata-wksst8110.for",#
  skip=4,#
  widths=c(12, 7,4, 9,4, 9,4, 9,4))

print(x)
