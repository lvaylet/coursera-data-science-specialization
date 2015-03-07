# The sqldf package allows for execution of SQL commands on R data frames. We
# will use the sqldf package to practice the queries we might send with the
# dbSendQuery command in RMySQL. Download the American Community Survey data and
# load it into an R object called acs
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv

if (!file.exists("ss06pid.csv")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "ss06pid.csv", method = "curl")
}

acs <- read.csv("ss06pid.csv")

library(sqldf)
sqldf("select pwgtp1 from acs where AGEP < 50")
