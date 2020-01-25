#Data Setup
setwd("C:/Users/Victor/OneDrive/Desktop/Coursera/ProgrammingAssignment5")
data <- read.csv("C:/Users/Victor/OneDrive/Desktop/Coursera/ProgrammingAssignment5/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
str(data)
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- as.POSIXct(strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S"))
data$Date <- as.Date(strptime(data$Date, format = "%d/%m/%Y"))
data <- subset(data,Date>="2007-02-01"&Date<="2007-02-02")

#Plot 1
png("plot1.png", width=480, height=480)
with(data,hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowats)",
               ylim = c(0,1200)))
dev.off()

#Plot 2
png("plot2.png", width=480, height=480)
with(data,plot(Global_active_power~DateTime, ylab = "Global Active Power (killowats)", xlab = "", type="l"))
dev.off()

#Plot 3
png("plot3.png", width=480, height=480)
with(data,{
  plot(Sub_metering_1~DateTime, col = "black", type = "l", ylab = "Energy sub metering")
  lines(Sub_metering_2~DateTime, col = "red", type = "l")
  lines(Sub_metering_3~DateTime, col = "blue", type = "l")
  })
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

#Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data,{
  plot(Global_active_power~DateTime, ylab = "Global Active Power (killowats)", xlab = "", type="l")
  plot(Voltage~DateTime, type = "l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, col = "black", type = "l", ylab = "Energy sub metering")
  lines(Sub_metering_2~DateTime, col = "red", type = "l")
  lines(Sub_metering_3~DateTime, col = "blue", type = "l")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type = 'l',ylab="Global Rective Power (kilowatts)",xlab="")
  })
dev.off()












