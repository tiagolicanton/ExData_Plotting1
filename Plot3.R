draw_plot3 <- function(){
  require(data.table)
  d <- fread('./household_power_consumption.txt', header=TRUE, sep=";", colClasses='character')
  d <- subset(d, d$Date=="1/2/2007"| d$Date=="2/2/2007")
  d <- as.data.frame(d)
  d$datetime <- paste(d$Date,d$Time)
  d$Date=as.Date(d$Date,"%d/%m/%Y")
  d$datetime <- strptime(d$datetime,"%d/%m/%Y %H:%M:%S",tz="")
  
  d$Global_active_power <- as.numeric(d$Global_active_power)
  
  d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
  d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
  d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)
  
  png(filename="plot3.png")
  
  with(d,plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering"))
  with(d, points(datetime,Sub_metering_1, type='l',col='black',xlab="",ylab="Energy Sub Metering"))
  with(d, points(datetime,Sub_metering_2, type='l',col='red'))
  with(d, points(datetime,Sub_metering_3, type='l',col='blue'))
  legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  dev.off()
  
  d
  
}