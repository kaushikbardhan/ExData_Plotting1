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

pd$dtm <- strptime(paste(pd$Date, pd$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot3.png", width=480, height=480)
with(pd, plot(dtm,Sub_metering_1, col="black",xlab="", ylab = "Energy sub metering",type="l")) 
with(pd, lines(dtm,Sub_metering_2, col="red")) 
with(pd, lines(dtm,Sub_metering_3, col="blue"))
legend("topright", lwd=1, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


