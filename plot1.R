# load dplyr library
library(dplyr)

# load household data
household <- read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

# subset to the data we are concerned about 1-2-2007, 2-2-2007
sampleData <- filter(household, Date =="1/2/2007" | Date == "2/2/2007")

#open png graphics device
png(file="plot1.png", width=480, height=480, units="px")

# generate plot
hist(sampleData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# save generated plot to file
dev.off()


