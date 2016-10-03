remove(list = ls())

# Reading the file

library(data.table)

dat <- fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

str(dat)

head(dat)

# Subsetting the dataset

dat_subset <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

str(dat_subset)

head(dat_subset); tail(dat_subset)

# Converting character strings to dates and times

library(lubridate)

dat_subset$Date <- dmy(dat_subset$Date)

DateTime <- paste(dat_subset$Date, dat_subset$Time)

DateTime <- ymd_hms(DateTime)

str(DateTime)

# Making the plot

png(filename = "plot4.png")

par(mfcol = c(2, 2))

plot(DateTime, dat_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(DateTime, dat_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(DateTime, dat_subset$Sub_metering_2, type = "l", col = "red")

lines(DateTime, dat_subset$Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n")

plot(DateTime, dat_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(DateTime, dat_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()