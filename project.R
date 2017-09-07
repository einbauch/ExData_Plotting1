# Reading the dataset
dataset <- read.csv('./../data/household_power_consumption.txt', sep = ';')

# Subsetting to include only 2 dates that are requered
dataset <- subset(dataset, dataset$Date == '1/2/2007' | dataset$Date == '2/2/2007')

# Setting locale for date and time display to English (since my system locale is not English)
Sys.setlocale("LC_TIME", "English")

# Converting columns to a proper class
library(lubridate)
dataset$datetime <- parse_date_time(paste(dataset$Date, dataset$Time), orders = 'dmy_HMS')
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
dataset$Global_reactive_power <- as.numeric(as.character(dataset$Global_reactive_power))
dataset$Voltage <- as.numeric(as.character(dataset$Voltage))
dataset$Global_intensity <- as.numeric(as.character(dataset$Global_intensity))
dataset$Sub_metering_1 <- as.numeric(as.character(dataset$Sub_metering_1))
dataset$Sub_metering_2 <- as.numeric(as.character(dataset$Sub_metering_2))
dataset$Sub_metering_3 <- as.numeric(as.character(dataset$Sub_metering_3))

# Plot1
hist(dataset$Global_active_power, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red')
dev.copy(png, filename = 'plot1.png', width = 480, height = 480)
dev.off()

# Plot2
plot(dataset$datetime, dataset$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.copy(png, filename = 'plot2.png', width = 480, height = 480)
dev.off()

# Plot3
plot(dataset$datetime, dataset$Sub_metering_1, type = 'l', xlab = '', ylab = 'energy sub metering')
points(dataset$datetime, dataset$Sub_metering_2, type = 'l', col = 'red')
points(dataset$datetime, dataset$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', lwd = 1, col = c('black', 'red', 'blue'), legend = names(dataset[7:9]))
dev.copy(png, filename = 'plot3.png', width = 480, height = 480)
dev.off()

# Plot4
par(mfrow = c(2,2))
plot(dataset$datetime, dataset$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')
plot(dataset$datetime, dataset$Voltage, type = 'l', xlab = names(dataset[10]), ylab = names(dataset[5]))
plot(dataset$datetime, dataset$Sub_metering_1, type = 'l', xlab = '', ylab = 'energy sub metering')
points(dataset$datetime, dataset$Sub_metering_2, type = 'l', col = 'red')
points(dataset$datetime, dataset$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', lwd = 1, col = c('black', 'red', 'blue'), 
       legend = names(dataset[7:9]), bty = 'n', seg.len = 3, pt.cex = 1, cex = 0.6, inset = 0.1)
plot(dataset$datetime, dataset$Global_reactive_power, type = 'l', xlab = names(dataset[10]), ylab = names(dataset[4]))
dev.copy(png, filename = 'plot4.png', width = 480, height = 480)
dev.off()