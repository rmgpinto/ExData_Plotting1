## Coursera Exploratory Data Analysis Course Project 1
## Ricardo Pinto
## 2016-06-24
# plot3.R

# Data set URL
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile = "exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Downloads the Household Power Consumption Dataset to the working directory
download.file(dataUrl, destfile = zipFile, method = "curl")
# Unzips the Household Power Consumption Dataset
unzip(zipFile)

# Load only data from the dates 2007-02-01 and 2007-02-02
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date and Time variables to Date/Time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot and save png file
png(filename = "plot3.png", width = 480, height = 480)
with(data, {
  plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(Time, Sub_metering_1, type = "l", col = "black")
  points(Time, Sub_metering_2, type = "l", col = "red")
  points(Time, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()