# Load the Gross Domestic Product data for the 190 ranked countries in this data
# set:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2dtGDP.csv
#
# Load the educational data from this data set:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
#
# Match the data based on the country shortcode. How many of the IDs match? Sort
# the data frame in descending order by GDP rank (so United States is last).
# What is the 13th country in the resulting data frame?
#
# Original data sources:
# http://data.worldbank.org/data-catalog/GDP-ranking-table
# http://data.worldbank.org/data-catalog/ed-stats

library(data.table)
dtGDP <- data.table(read.csv("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2dtGDP.csv", skip=4, nrows=215))
dtEd <- data.table(read.csv("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"))

# Remove observations with empty Country Codes in dtGDP
dtGDP <- dtGDP[X != ""]
# Select and rename columns of interest in dtGDP
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP,
         c("X", "X.1", "X.3", "X.4"),
         c("CountryCode", "rankingGDP", "Long.Name", "gdp"))

# Merge data from both tables
dt <- merge(dtGDP, dtEd, all=TRUE, by=c("CountryCode"))

sum(!is.na(unique(dt$rankingGDP)))

dt[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y,
                                              rankingGDP, gdp)][13]
