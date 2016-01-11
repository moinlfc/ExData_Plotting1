## read household_power_consumption.txt file
File <- "household_power_consumption.txt"
data <- read.table(File, sep=";",header = TRUE,stringsAsFactors = FALSE)

## subset database
datarange <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Converting Class
plot4DateTime <- strptime(paste(datarange$Date, datarange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

class("datarange$Global_active_power")
plot4Global <- as.numeric(datarange$Global_active_power)
class(plot2Global)

class("datarange$Sub_metering_1")
plot4Sub1 <- as.numeric(datarange$Sub_metering_1)
class(plot4Sub1)

class("datarange$Sub_metering_2")
plot4Sub2 <- as.numeric(datarange$Sub_metering_2)
class(plot4Sub2)

class("datarange$Sub_metering_3")
plot4Sub3 <- as.numeric(datarange$Sub_metering_3)
class(plot4Sub3)

class("datarange$Voltage")
plot4Voltage <- as.numeric(datarange$Voltage)
class(plot4Voltage)

class("datarange$Global_reactive_power")
plot4GlobalR <- as.numeric(datarange$Global_reactive_power)
class(plot4GlobalR)


##plot graph 4
par(mfrow=c(2,2))

plot(plot4DateTime, plot4Global, type="l", ylab="Global Active Power", xlab="")

plot(plot4DateTime, plot4Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(plot4DateTime, plot4Sub1, type="l", ylab="Energy sub metering", xlab="")
lines(plot4DateTime, plot4Sub2, type = "l", col = "red")
lines(plot4DateTime, plot4Sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1, lwd=3)

plot(plot4DateTime, plot4GlobalR, type="l", ylab="Golbal_reactive_power", xlab="datetime")


##saving file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()