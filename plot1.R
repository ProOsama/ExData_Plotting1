
housePC_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
Datesubset <- housePC_data[housePC_data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(Datesubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)" ,  ylab="Frequency", col="Red")
dev.off()



