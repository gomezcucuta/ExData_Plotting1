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

# Making the plot

png(filename = "plot1.png")

hist(dat_subset$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()