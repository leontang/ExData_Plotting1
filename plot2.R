plot2 <- function(name) {
    ## read data file
    data <- read.csv(file="household_power_consumption.txt", sep=";")
    
    ## subset data to just 01 and 02 Feb 2007
    data_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
    
    ## convert global active power column to numeric
    data_subset$Global_active_power <- as.numeric(as.character(data_subset$Global_active_power))
    
    ## open png file device with width and height as 480
    png(file="plot2.png",width=480,height=480)
    
    ## plot line graph
    plot(strptime(paste(data_subset$Date, data_subset$Time), format = "%d/%m/%Y %T"), data_subset$Global_active_power, typ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
    ## close png device
    dev.off()
}