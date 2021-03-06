data<-read.table('household_power_consumption.txt', header=TRUE, sep=";")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data<-subset(data, Date>="2007-02-01" & Date<="2007-02-02")
data$Global_active_power<-as.numeric(data$Global_active_power)
dateTime<-paste(data$Date, data$Time)
data<-cbind(data, dateTime)
data$dateTime<-as.POSIXct(data$dateTime)
plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
