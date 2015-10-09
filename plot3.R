# Read data from household_power_consumption.txt file
# Extract rows that has the dates from 2007-02-01 to 2007-02-02
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
sdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# plot3 to save the Global Active Power by day and time in plot3.png file
subMetering1 <- as.numeric(sdata$Sub_metering_1)
subMetering2 <- as.numeric(sdata$Sub_metering_2)
subMetering3 <- as.numeric(sdata$Sub_metering_3)
datetime <- strptime(paste(sdata$Date, sdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
