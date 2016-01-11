## read household_power_consumption.txt file
File <- "household_power_consumption.txt"
data <- read.table(File, sep=";",header = TRUE,stringsAsFactors = FALSE)

## subset database
datarange <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## Converting Class
plot2DateTime <- strptime(paste(datarange$Date, datarange$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


class("datarange$Global_active_power")
plot2Global <- as.numeric(datarange$Global_active_power)
class(plot2Global)

##plot graph 2
plot(plot2DateTime, plot2Global, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##saving file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()