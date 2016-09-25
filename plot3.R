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

## Plot number 3
##
with(power2, {
    plot(Sub_metering_1~powerDT,type="n", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_1~powerDT,col='black')
    lines(Sub_metering_2~powerDT,col='red')
    lines(Sub_metering_3~powerDT,col='blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



## Export to png number 3 (using png and not dev.copy to avoid problems with the layout when converting)
##

png("plot3.png", width=504, height=504)
with(power2, {
    plot(Sub_metering_1~powerDT,type="n", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_1~powerDT,col='black')
    lines(Sub_metering_2~powerDT,col='red')
    lines(Sub_metering_3~powerDT,col='blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
