## read household_power_consumption.txt file
File <- "household_power_consumption.txt"
data <- read.table(File, sep=";",header = TRUE,stringsAsFactors = FALSE)

## subset database
datarange <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Converting Class
plot3DateTime <- strptime(paste(datarange$Date, datarange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

class("datarange$Sub_metering_1")
plot3Sub1 <- as.numeric(datarange$Sub_metering_1)
class(plot3Sub1)

class("datarange$Sub_metering_2")
plot3Sub2 <- as.numeric(datarange$Sub_metering_2)
class(plot3Sub2)

class("datarange$Sub_metering_3")
plot3Sub3 <- as.numeric(datarange$Sub_metering_3)
class(plot3Sub3)

##plot graph 3
par(mfrow=c(1,1))

plot(plot3DateTime, plot3Sub1, type="l", ylab="Energy sub metering", xlab="")
lines(plot3DateTime, plot3Sub2, type = "l", col = "red")
lines(plot3DateTime, plot3Sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty=1, lwd=3)

##saving file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()