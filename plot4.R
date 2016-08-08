# load dplyr library
library(dplyr)

# load household data
household <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

# subset to the data we are concerned about 1-2-2007, 2-2-2007
sampleData <- filter(household, Date =="1/2/2007" | Date == "2/2/2007")

# setup png graphics device
png(file="plot4.png", width=480, height=480, units="px")

# setup device to show 4 plots in 2 rows of 2 columns each
par(mfrow=c(2,2))

# create new time-date column
nData <- mutate(sampleData, nTimeDate = paste(Date, Time))

linesx <- strptime(nData$nTimeDate, format="%d/%m/%Y %H:%M:%S")

# generate plot #1
plot(strptime(nData$nTimeDate, format="%d/%m/%Y %H:%M:%S", tz=""), nData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# generate plot #2
plot(linesx, nData$Voltage, type="l", ylab="Voltage", xlab="")

# generate plot #3
lines1 <- nData$Sub_metering_1
lines2 <- nData$Sub_metering_2
lines3 <- nData$Sub_metering_3

plot(linesx, lines1, type="l", ylab="Energy sub metering", xlab="")
lines(linesx, lines2, col="red")
lines(linesx, lines3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), horiz=FALSE, col=c("black", "red", "blue"), lwd=2)


# generate plot #4
plot(linesx, nData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="")

# save generated plot to file
dev.off()


