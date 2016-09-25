## Init
rm(list=ls())
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

## Create DateTime column (powerDT):
##
power2$powerDT = ymd_hms(paste(power2$powerDate, power2$Time))

## Plot number 2
##
with(power2, plot(Global_active_power ~ powerDT , type="l", ylab="Global Active Power (kilowatts)", xlab = ""))


## Export to png number 2 (using png and not dev.copy to avoid problems with the layout when converting)
##
png("plot2.png", width=504, height=504)
with(power2, plot(Global_active_power ~ powerDT , type="l", ylab="Global Active Power (kilowatts)", xlab = ""))
dev.off()
