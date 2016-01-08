library(graphics)
library(grDevices)
household_power_consumption <- read.csv('household_power_consumption.txt', header=TRUE, sep=";",na.strings="?")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption<-household_power_consumption[which(household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02"),]
household_power_consumption$Dateandtime <- as.POSIXct(paste(as.Date(household_power_consumption$Date), household_power_consumption$Time))
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(household_power_consumption$Dateandtime,household_power_consumption$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(household_power_consumption$Dateandtime,household_power_consumption$Voltage,xlab="datetime",ylab="Voltage",type="l")

plot(household_power_consumption$Dateandtime, household_power_consumption$Sub_metering_1, type ="n", xlab="", ylab="Energy sub metering")
lines(household_power_consumption$Dateandtime, household_power_consumption$Sub_metering_1)
lines(household_power_consumption$Dateandtime, household_power_consumption$Sub_metering_2, col="red")
lines(household_power_consumption$Dateandtime, household_power_consumption$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black", "red","blue"),lty=1, lwd=1,bty="n")

plot(household_power_consumption$Dateandtime,household_power_consumption$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()