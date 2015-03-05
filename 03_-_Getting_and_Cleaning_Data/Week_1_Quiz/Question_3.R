# Download the Excel spreadsheet on Natural Gas Aquisition Program
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", "DATA.gov_NGAP.xlsx", method = "curl")

# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called dat
library(xlsx)
dat <- read.xlsx("DATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, endRow = 7:15)

# What is the value of:?
sum(dat$Zip*dat$Ext, na.rm = T)
