
#Plot1 for power consumption Project 1

library(data.table)

#Reading data for 1-2-2007 and 2-2-2007
powr <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#Converting variables to date and time classes
powr$Date <- as.Date(powr$Date, format = "%d/%m/%Y") 
powr$DateTime <- as.POSIXct(paste(as.Date(powr$Date), powr$Time))

#Creating plot
png("plot1.png", width = 480, height = 480)

hist(powr$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
