colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

data  <- read.table("household_power_consumption.txt", header = TRUE, colClasses = colClasses, sep=";", na.strings = c("?"))
data <- subset(data, Date == "2/2/2007" | Date == "1/2/2007")

data[,"Date"] <- as.Date(data[,"Date"], format = "%d/%m/%Y")
dates <- data$Date
times<- data$Time
x<- paste(dates, times)
datetime<- strptime(x, format = "%Y-%m-%d %H:%M:%S")
data <- cbind(datetime, data)

#Plot 1
png("plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()