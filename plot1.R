#read data from working directory
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert the Date and Time variables to Date/Time classes
power$Date <- strptime(power$Date, "%d/%m/%Y")
power$DateTime <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")

#subset data
powSub <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")

#create plot on screen device
hist(powSub$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

#copy plot to a PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)

#close the PNG device
dev.off()
