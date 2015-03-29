# You can use the quantmod (http://www.quantmod.com/) package to get historical
# stock prices for publicly traded companies on the NASDAQ and NYSE. Use the
# following code to download data on Amazon's stock price and get the times the
# data was sampled.
# library(quantmod)
# amzn = getSymbols("AMZN",auto.assign=FALSE)
# sampleTimes = index(amzn)
# How many values were collected in 2012?
# How many values were collected on Mondays in 2012?

# Install the quantmod package
install.packages('quantmod')
library(quantmod)

# Load Amazon stock data
amzn = getSymbols("AMZN", auto.assign=FALSE)

# Extract the index
sampleTimes = index(amzn)

# Create logical for year 2012
year2012 <- grepl('2012-*', sampleTimes)

# Count 2012 observations (i.e. true)
table(year2012)

# Subset based on 2012
sampleTimes2012 <- subset(sampleTimes, year2012)

# Convert to day of week
day <- format(sampleTimes2012, '%A')

# Count each day
table(day)
