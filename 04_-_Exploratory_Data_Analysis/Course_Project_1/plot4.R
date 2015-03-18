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

# plot4.png
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))

# Top left
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Top right
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom left
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, lty = 1, bty = "n",
       col = c("black", "red" , "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
)

# Bottom right
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
