#dataset <- "../household_power_consumption.txt"
dataset <- "subset.txt"
hh <- read.table(file = dataset, 
                 header = TRUE, 
                 sep = ";", 
                 dec = ".",
                 na.strings=c("?"),
                 comment.char = "")
hh <- na.omit(hh)
hh$Date <- as.Date(hh$Date, format ="%d/%m/%Y")
hh <- subset(hh, Date >= "2007-02-01" & Date <= "2007-02-02" )

# Couldn't work with only time, adding Date to Time
# Converting Date back to character, concatenating with Time-character and converting both to Date-type.
hh$Time <- strptime(paste(as.character(hh$Date, format = "%d/%m/%Y"), hh$Time, sep=" "), format ="%d/%m/%Y %H:%M:%S")

hh$Global_active_power <- as.numeric(hh$Global_active_power)
hh$Global_reactive_power <- as.numeric(hh$Global_reactive_power)
hh$Voltage <- as.numeric(hh$Voltage)
hh$Sub_metering_1 <- as.numeric(hh$Sub_metering_1)
hh$Sub_metering_2 <- as.numeric(hh$Sub_metering_2)
hh$Sub_metering_3 <- as.numeric(hh$Sub_metering_3)

png("plot4.png", width=504, height=504, bg=NA)
par(mfcol = c(2,2))

plot(hh$Time ,hh$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(hh$Time, hh$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hh$Time, hh$Sub_metering_2, type = "l", col="red")
lines(hh$Time, hh$Sub_metering_3, type = "l", col="blue")
#Line-type 1, line-width 1
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(hh$Time ,hh$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(hh$Time ,hh$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()