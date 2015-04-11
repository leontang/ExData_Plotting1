plot3 <- function(name) {
    ## read data file
    data <- read.csv(file="household_power_consumption.txt", sep=";")
    
    ## subset data to just 01 and 02 Feb 2007
    data_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
    
    ## convert sub metering column to numeric
    data_subset$Sub_metering_1 <- as.numeric(as.character(data_subset$Sub_metering_1))
    data_subset$Sub_metering_2 <- as.numeric(as.character(data_subset$Sub_metering_2))
    
    ## open png file device with width and height as 480
    png(file="plot3.png",width=480,height=480)
    
    ## plot line graph for sub metering 1
    plot(strptime(paste(data_subset$Date, data_subset$Time), format = "%d/%m/%Y %T"), data_subset$Sub_metering_1, typ="l", xlab = "", ylab = "Energy sub metering")
    
    ## plot line graph for sub metering 2
    lines(strptime(paste(data_subset$Date, data_subset$Time), format = "%d/%m/%Y %T"), data_subset$Sub_metering_2, col = "red", typ="l")
    
    ## plot line graph for sub metering 3
    lines(strptime(paste(data_subset$Date, data_subset$Time), format = "%d/%m/%Y %T"), data_subset$Sub_metering_3, col = "blue", typ="l")
    
    ## add legend to graph
    legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## close png device
    dev.off()
}