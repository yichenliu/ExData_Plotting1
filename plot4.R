setwd("C:/Project 1")
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dt[,1]<-as.Date(dt[,1],"%d/%m/%Y")
dt<-rbind(dt[as.Date(dt[,1])=="2007-02-01",],dt[as.Date(dt[,1])=="2007-02-02",])
Date_Time<-strptime(paste(dt[,1],dt[,2]), "%Y-%m-%d %H:%M:%S")
dt<-cbind(Date_Time,dt[,c(3:9)]) 


png(file="plot4.png")
par(bg="transparent",mfcol=c(2,2),cex=0.8)

plot(dt$Date_Time,dt$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(dt$Date_Time,dt$Global_active_power)

plot(dt$Date_Time,dt$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(dt$Date_Time,dt$Sub_metering_1,col="black")
lines(dt$Date_Time,dt$Sub_metering_2,col="red")
lines(dt$Date_Time,dt$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),bty="n",lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(dt$Date_Time,dt$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(dt$Date_Time,dt$Voltage)

plot(dt$Date_Time,dt$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(dt$Date_Time,dt$Global_reactive_power)
dev.off()