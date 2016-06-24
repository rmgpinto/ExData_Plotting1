## Coursera Exploratory Data Analysis Course Project 1
## Ricardo Pinto
## 2016-06-24
# plot1.R

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
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()