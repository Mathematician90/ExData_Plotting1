library(graphics)
library(grDevices)
household_power_consumption <- read.csv('household_power_consumption.txt', header=TRUE, sep=";",na.strings="?")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption<-household_power_consumption[which(household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02"),]
hist(household_power_consumption$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
