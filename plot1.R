dataset <- "../household_power_consumption.txt"
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
hh$Time <- strptime(hh$Time, format ="hh:mm:ss")
hh$Global_active_power <- as.numeric(hh$Global_active_power)
png("plot1.png", width=504, height=504, bg=NA)
hist(hh$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()