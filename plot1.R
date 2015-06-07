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

#Plot
# Use width/height 504 to match provided plots, spec. explicitly says to use 480px (standard)
#png("plot1.png", width=504, height=504, bg=NA)
png("plot1.png", bg=NA)
hist(hh$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()