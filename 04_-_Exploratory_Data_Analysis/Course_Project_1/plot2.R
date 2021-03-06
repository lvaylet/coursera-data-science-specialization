# Download data file (if not already done)
if (!file.exists("household_power_consumption.zip")) {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
}

# Unzip data file (if not already done)
if (!file.exists("household_power_consumption.txt")) {
  unzip("household_power_consumption.zip")
}

# Read data file (if not already done)
library(data.table)
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = c("?"))

# Extract relevant data
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

# Consolidate dates and times
data$DateTime <- strptime(paste(data$Date, data$Time, sep = " "),
                          format= "%d/%m/%Y %H:%M:%S")

# plot2.png
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
