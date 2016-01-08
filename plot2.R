library(graphics)
library(grDevices)
household_power_consumption <- read.csv('household_power_consumption.txt', header=TRUE, sep=";",na.strings="?")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption<-household_power_consumption[which(household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02"),]
household_power_consumption$Dateandtime <- as.POSIXct(paste(as.Date(household_power_consumption$Date), household_power_consumption$Time))
plot(household_power_consumption$Global_active_power,household_power_consumption$Dateandtime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()