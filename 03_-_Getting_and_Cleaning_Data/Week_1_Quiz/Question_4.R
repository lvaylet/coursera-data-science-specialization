# Read the XML data on Baltimore restaurants
library(XML)
restaurants <- xmlParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")

# How many restaurants have zipcode 21231?
zipcode <- xpathSApply(restaurants, "//zipcode", xmlValue)
length(which(zipcode == 21231))
