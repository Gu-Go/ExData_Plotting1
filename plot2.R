# Read data from household_power_consumption.txt file
# Extract rows that has the dates from 2007-02-01 to 2007-02-02
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
sdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# plot2 to save the Global Active Power by day and time in plot2.png file
globalActivePower <- as.numeric(sdata$Global_active_power)
datetime <- strptime(paste(sdata$Date, sdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
