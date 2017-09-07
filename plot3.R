# Reading the dataset
path_to_data <- '' # please set path to the dataset before running the script
dataset <- read.csv(path_to_data, sep = ';')

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

# Plot3
plot(dataset$datetime, dataset$Sub_metering_1, type = 'l', xlab = '', ylab = 'energy sub metering')
points(dataset$datetime, dataset$Sub_metering_2, type = 'l', col = 'red')
points(dataset$datetime, dataset$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', lwd = 1, col = c('black', 'red', 'blue'), legend = names(dataset[7:9]))
dev.copy(png, filename = 'plot3.png', width = 480, height = 480)
dev.off()