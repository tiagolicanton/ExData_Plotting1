draw_plot4 <- function(){
  require(data.table)
  d <- fread('./household_power_consumption.txt', header=TRUE, sep=";", colClasses='character')
  d <- subset(d, d$Date=="1/2/2007"| d$Date=="2/2/2007")
  d <- as.data.frame(d)
  d$datetime <- paste(d$Date,d$Time)
  d$Date=as.Date(d$Date,"%d/%m/%Y")
  d$datetime <- strptime(d$datetime,"%d/%m/%Y %H:%M:%S",tz="")
  
  d$Global_active_power <- as.numeric(d$Global_active_power)
  d$Global_reactive_power <- as.numeric(d$Global_reactive_power)
  d$Voltage <- as.numeric(d$Voltage)
  
  d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
  d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
  d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)
  
  png(filename="plot4.png")
  
  par(mfrow=c(2,2))
  
  with(d, {
    plot(datetime, Global_active_power, type="l", xlab="",ylab="Global Active Power")
    
    plot(datetime, Voltage, type="l")
    
    plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
    points(datetime,Sub_metering_1, type='l',col='black',xlab="datetime",ylab="Energy Sub Metering")
    points(datetime,Sub_metering_2, type='l',col='red')
    points(datetime,Sub_metering_3, type='l',col='blue')
    legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
    plot(datetime, Global_reactive_power, type="l")
    })
  
  dev.off()
  
  d
  
}