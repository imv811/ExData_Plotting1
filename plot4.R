colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

data  <- read.table("household_power_consumption.txt", header = TRUE, colClasses = colClasses, sep=";", na.strings = c("?"))
data <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

data[,"Date"] <- as.Date(data[,"Date"], format = "%d/%m/%Y")
dates <- data$Date
times<- data$Time
x<- paste(dates, times)
datetime<- strptime(x, format = "%Y-%m-%d %H:%M:%S")
data <- cbind(datetime, data)

#Plot 4
png("plot4.png", width=480, height=480, units="px")
par(mfcol = c(2,2))
with(data, {
  plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  
  plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  
  plot(datetime, Voltage, type = "l")
  plot(datetime, Global_reactive_power, type = "l")
})
dev.off()