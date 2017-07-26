housePC_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Datesubset <- housePC_data[housePC_data$Date %in% c("1/2/2007","2/2/2007") ,]

DT <- strptime(paste(Datesubset$Date, Datesubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Datesubset$Global_active_power)
globalReactivePower <- as.numeric(Datesubset$Global_reactive_power)
voltage <- as.numeric(Datesubset$Voltage)
subMetering1 <- as.numeric(Datesubset$Sub_metering_1)
subMetering2 <- as.numeric(Datesubset$Sub_metering_2)
subMetering3 <- as.numeric(Datesubset$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(DT, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(DT, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DT, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(DT, subMetering2, type="l", col="red")
lines(DT, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(DT, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

