# Read the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Subset the data for the dates 2007-02-01 and 2007-02-02
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert Date and Time variables to Date/Time classes
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
subset_data$Time <- strptime(subset_data$Time, format = "%H:%M:%S")

# Create the plot
png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

# Read the data and subset for the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert Date and Time variables to Date/Time classes
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
subset_data$Time <- strptime(paste(subset_data$Date, subset_data$Time), format = "%Y-%m-%d %H:%M:%S")

# Create the plot
png("plot2.png", width = 480, height = 480)
plot(subset_data$Time, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

# Read the data and subset for the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert Date and Time variables to Date/Time classes
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
subset_data$Time <- strptime(paste(subset_data$Date, subset_data$Time), format = "%Y-%m-%d %H:%M:%S")

# Create the plot
png("plot3.png", width = 480, height = 480)
plot(subset_data$Time, subset_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset_data$Time, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Time, subset_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()

# Read the data and subset for the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert Date and Time variables to Date/Time classes
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
subset_data$Time <- strptime(paste(subset_data$Date, subset_data$Time), format = "%Y-%m-%d %H:%M:%S")

# Create the plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 1
plot(subset_data$Time, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2
plot(subset_data$Time, subset_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(subset_data$Time, subset_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset_data$Time, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Time, subset_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

# Plot 4
plot(subset_data$Time, subset_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()