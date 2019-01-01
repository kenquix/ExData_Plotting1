#read data from working directory
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert the Date and Time variables to Date/Time classes
power$Date <- strptime(power$Date, "%d/%m/%Y")
power$DateTime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#subset data
powSub <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

#specify number of plots per row, column (plots are filled row-wise)
par(mfrow = c(2,2))

#create plot on screen device
#plot 1
plot(powSub$DateTime, powSub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#plot 2
plot(powSub$DateTime, powSub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot 3
plot(powSub$DateTime, powSub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(powSub$DateTime, powSub$Sub_metering_2, col = "red")
lines(powSub$DateTime, powSub$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

#plot 4
plot(powSub$DateTime, powSub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#copy plot to a PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)

#close the PNG device
dev.off()
