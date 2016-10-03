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

png(filename = "plot2.png")

plot(DateTime, dat_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()