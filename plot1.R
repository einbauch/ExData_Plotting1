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

# Plot1
hist(dataset$Global_active_power, xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red')
dev.copy(png, filename = 'plot1.png', width = 480, height = 480)
dev.off()