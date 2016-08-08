# load dplyr library
library(dplyr)

# load household data
household <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)


# setup png graphics device
png(file="plot3.png", width=480, height=480, units="px")

# subset to the data we are concerned about 1-2-2007, 2-2-2007
sampleData <- filter(household, Date =="1/2/2007" | Date == "2/2/2007")

# create new date-time column
nData <- mutate(sampleData, nTimeDate = paste(Date, Time))

# generate plot
lines1 <- nData$Sub_metering_1
lines2 <- nData$Sub_metering_2
lines3 <- nData$Sub_metering_3
linesx <- strptime(nData$nTimeDate, format="%d/%m/%Y %H:%M:%S")
plot(linesx, lines1, type="l", ylab="Energy sub metering", xlab="")
lines(linesx, lines2, col="red")
lines(linesx, lines3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, horiz=FALSE )




# save generated plot to file
dev.off()


