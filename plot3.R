#read data from working directory
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert the Date and Time variables to Date/Time classes
power$Date <- strptime(power$Date, "%d/%m/%Y")
power$DateTime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#subset data
powSub <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

#create plot on screen device
plot(powSub$DateTime, powSub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(powSub$DateTime, powSub$Sub_metering_2, col = "red")
lines(powSub$DateTime, powSub$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

#copy plot to a PNG file
dev.copy(png, file = "plot3.png", height = 480, width = 480)

#close the PNG device
dev.off()
