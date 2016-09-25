##read the data
a<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

##convert the date and subset the data
a$Date<-as.Date(a$Date,format = "%d/%m/%Y")
data<-a[a$Date=="2007-02-01"|a$Date=="2007-02-02",]

datatime<-strptime(paste(data$Date,data$Time, sep=" "), "%Y-%m-%d %H:%M:%S",tz = "GMT") 

##construct the plot
png(file = "plot2.png",width = 480, height = 480, units = "px")
plot(datatime,data$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")
dev.off()
