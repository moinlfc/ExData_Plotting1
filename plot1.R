## read household_power_consumption.txt file
File <- "household_power_consumption.txt"
data <- read.table(File, sep=";",header = TRUE,stringsAsFactors = FALSE)

## subset database
datarange <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

##plot graph 1
class("datarange$Global_active_power")
plot1data <- as.numeric(datarange$Global_active_power)
hist(plot1data, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##saving file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()