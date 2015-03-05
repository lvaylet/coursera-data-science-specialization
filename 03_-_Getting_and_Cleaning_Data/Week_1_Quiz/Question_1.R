# The American Community Survey distributes downloadable data about United States communities

# Download the 2006 microdata survey about housing for the state of Idaho
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "ss06hid.csv", method = "curl")
# Download the code book, describing the variable names
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf", "PUMSDataDict06.pdf", method = "curl")

# Load the data into R
DF <- read.csv("ss06hid.csv")
names(DF)
head(DF)
summary(DF)

# Query the VAL variable to determine how many properties are worth $1,000,000 or more (VAL == 24 according to the code book)
length(which(DF$VAL == 24))
