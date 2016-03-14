data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",
                   stringsAsFactors=FALSE)

data$Date <- as.Date(as.character(data$Date),format="%d/%m/%Y")

DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

pd <- subset(data, Date >= DATE1 & Date <= DATE2)

pd$Global_active_power <- as.numeric(pd$Global_active_power)
pd$Voltage <- as.numeric(pd$Voltage)
pd$Global_reactive_power <- as.numeric(pd$Global_reactive_power)
pd$Sub_metering_1 <- as.numeric(pd$Sub_metering_1)
pd$Sub_metering_2 <-as.numeric(pd$Sub_metering_2)
pd$Global_intensity <- as.numeric(pd$Global_intensity)

pd$datetime <- as.POSIXct(paste(pd$Date, pd$Time), format="%Y-%m-%d %H:%M:%S")

plot.new()
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0)) 

with(pd, {
 plot(datetime,Global_active_power, xlab="", ylab="Global Active Power (kilowatts)")
 plot(datetime,Voltage)  
  plot(datetime,Sub_metering_1, xlab="", ylab = "Energy sub metering",col="black")
        lines(datetime,Sub_metering_2, col="red")
        lines(datetime,Sub_metering_3, col="blue")
        legend("topright",lty=1 , lwd=1, col = c("black","red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(datetime,Global_reactive_power)
        })


dev.copy(png,file="plot4.png", width=480, height=480, units = "px")

dev.off()


