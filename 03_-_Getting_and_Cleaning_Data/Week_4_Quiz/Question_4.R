# Load the Gross Domestic Product data for the 190 ranked countries in this data
# set:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
#
# Load the educational data from this data set:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv
#
# Match the data based on the country shortcode. Of the countries for which the
# end of the fiscal year is available, how many end in June?
#
# Original data sources:
# http://data.worldbank.org/data-catalog/GDP-ranking-table
# http://data.worldbank.org/data-catalog/ed-stats

# Download data and load it
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
file.dest <- 'GDP4.csv'
download.file(file.url, file.dest, method='wget')
GDP <- read.csv(file.dest, skip=4, nrows=190)
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
file.dest <- 'edu.csv'
download.file(file.url, file.dest, method='wget')
edu <- read.csv(file.dest)

# Merge the datasets
merged <- merge(GDP, edu, by.x = 'X', by.y = 'CountryCode')

# Extract the information
fy.june <- grep('Fiscal year end: June', merged$Special.Notes)
length(fy.june)
