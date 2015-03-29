# Load the Gross Domestic Product data for the 190 ranked countries in this data
# set:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
#
# Remove the commas from the GDP numbers in millions of dollars and average
# them. What is the average?
#
# Original data sources:
# http://data.worldbank.org/data-catalog/GDP-ranking-table

# Download data
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
file.dest <- 'GDP4.csv'
download.file(file.url, file.dest, method='wget')

# Load data
GDP <- read.csv(file.dest, skip=4, nrows=190)

# Substitute comma's out
GDPdol <- gsub(",", "", GDP$X.4)

# Convert to integer and calculate mean
GDPdol <- as.integer(GDPdol)
mean(GDPdol, na.rm=TRUE)
