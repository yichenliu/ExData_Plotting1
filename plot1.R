# Set working directory to the folder where data is located.
setwd("C:/Project 1")

# Read the data and set the class of date as date.
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dt[,1]<-as.Date(dt[,1],"%d/%m/%Y")

# Create a new data table where dates are only 2007-02-01 and 2007-02-02,
# and combine date and time together.
dt<-rbind(dt[as.Date(dt[,1])=="2007-02-01",],dt[as.Date(dt[,1])=="2007-02-02",])
Date_Time<-strptime(paste(dt[,1],dt[,2]), "%Y-%m-%d %H:%M:%S")

# Create a new data table for plotting.
dt<-cbind(Date_Time,dt[,c(3:9)]) 

# Call "png" graphic device and save the plot as "plot1.png".
png(file="plot1.png")

# Set plot global background colour as "transparent".
par(bg="transparent")

# Plot the histogram.
hist(dt$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Turn off the graphic device.
dev.off()