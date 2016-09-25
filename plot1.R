##read the data
a<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

##convert the date and subset the data
a$Date<-as.Date(a$Date,format = "%d/%m/%Y")
data<-a[a$Date=="2007-02-01"|a$Date=="2007-02-02",]

##construct the plot
png(file = "plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
