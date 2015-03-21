# Load the Gross Domestic Product data for the 190 ranked countries in this data
# set:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
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

FGDP <- read.csv("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv")
EDSTATS_Country <- read.csv("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")

