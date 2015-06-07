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
hh$Time <- strptime(paste(as.character(hh$Date, format = "%d/%m/%Y"), hh$Time, sep=" "), format ="%d/%m/%Y %H:%M:%S")
hh$Global_active_power <- as.numeric(hh$Global_active_power)
png("plot2.png", width=504, height=504, bg=NA)
plot(hh$Time ,hh$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()