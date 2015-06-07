#dataset <- "../household_power_consumption.txt"
dataset <- "subset.txt" # Using manual subset due to slow computer.
hh <- read.table(file = dataset, 
                 header = TRUE, 
                 sep = ";", 
                 dec = ".",
                 na.strings=c("?"),
                 comment.char = "")
hh <- na.omit(hh)
# Subset by date
hh$Date <- as.Date(hh$Date, format ="%d/%m/%Y")
hh <- subset(hh, Date >= "2007-02-01" & Date <= "2007-02-02" )

# Concatenating date and time for x-axis. 
hh$Time <- strptime(paste(as.character(hh$Date, format = "%d/%m/%Y"), hh$Time, sep=" "), format ="%d/%m/%Y %H:%M:%S")

#Plot
# Use width/height 504 to match provided plots, spec. explicitly says to use 480px (standard)
#png("plot3.png", width=504, height=504, bg=NA)
png("plot3.png", bg=NA)
plot(hh$Time, hh$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hh$Time, hh$Sub_metering_2, type = "l", col="red")
lines(hh$Time, hh$Sub_metering_3, type = "l", col="blue")
#Line-type 1, line-width 1
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()