##read the data
a<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

##convert the date and subset the data
a$Date<-as.Date(a$Date,format = "%d/%m/%Y")
data<-a[a$Date=="2007-02-01"|a$Date=="2007-02-02",]

datatime<-strptime(paste(data$Date,data$Time, sep=" "), "%Y-%m-%d %H:%M:%S",tz = "GMT") 

##construct the plot
png(file = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(datatime,data$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")
plot(datatime,data$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
plot(datatime,data$Sub_metering_1,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")
lines(datatime,data$Sub_metering_2,col = "red")
lines(datatime,data$Sub_metering_3,col = "blue")
legend("topright",lty = 1,bty = "n",col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(datatime,data$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "l")
dev.off()

