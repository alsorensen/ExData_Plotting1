## Download and unzip data
rm(list=ls())
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileDownloadDest <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, fileDownloadDest, method = "curl")
unzip(fileDownloadDest)


## Init
par(mfrow = c(1,1))
library("lubridate") # Introduced in "Getting and Cleaning Data"

## Read household power consumption data (called power)
##
power <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

## Convert the column Date to a powerDate of class "Date" and add it to the original data
##
power$powerDate <- dmy(power$Date)

## Subset the data using the right range of valid dates (called power2):
##
power2 <- subset(power, powerDate >= "2007-02-01" & powerDate <= "2007-02-02")

## Plot number 1
##
hist(power2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")

## Export to png number 1 (using png and not dev.copy to avoid problems with the layout when converting)
##
png("plot1.png", width=504, height=504)
hist(power2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")
dev.off()
