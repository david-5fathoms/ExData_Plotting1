# load dplyr library
library(dplyr)

# load household data
household <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)


# setup png graphics device
png(file="plot2.png", width=480, height=480, units="px")


# subset to the data we are concerned about 1-2-2007, 2-2-2007
sampleData <- filter(household, Date =="1/2/2007" | Date == "2/2/2007")

# create new time-date column
nData <- mutate(sampleData, nTimeDate = paste(Date, Time))

# generate plot
plot(strptime(nData$nTimeDate, format="%d/%m/%Y %H:%M:%S", tz=""), nData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# save generated plot to file
dev.off()

