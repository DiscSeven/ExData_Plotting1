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

hh$Sub_metering_1 <- as.numeric(hh$Sub_metering_1)
hh$Sub_metering_2 <- as.numeric(hh$Sub_metering_2)
hh$Sub_metering_3 <- as.numeric(hh$Sub_metering_3)

#png("plot3.png", width=504, height=504, bg=NA)
plot(hh$Time ,hh$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Submetering")
#dev.off()