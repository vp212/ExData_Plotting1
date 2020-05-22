#Plot4 of Project 1

#Reading data for 1-2-2007 and 2-2-2007
powr <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#Converting variables to date and time classes

powr$Date <- as.Date(powr$Date, format = "%d/%m/%Y") 
powr$DateTime <- as.POSIXct(paste(as.Date(powr$Date), powr$Time))

# Creating Plot
png(file = "plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

plot(powr$DateTime, powr$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(powr$DateTime, powr$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")

lines(powr$DateTime, powr$Sub_metering_2, type="l", col="red")
lines(powr$DateTime, powr$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(powr$DateTime,powr$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(powr$DateTime,powr$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()

