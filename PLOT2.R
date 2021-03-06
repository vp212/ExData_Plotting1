
#Plot2 of Project 1

#Reading data for 1-2-2007 and 2-2-2007
powr <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#Converting variables to date and time classes

powr$Date <- as.Date(powr$Date, format = "%d/%m/%Y") 
powr$DateTime <- as.POSIXct(paste(as.Date(powr$Date), powr$Time))

# Creating Plot
png(file = "plot2.png", width = 480, height = 480)
plot(powr$Global_active_power ~ powr$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()