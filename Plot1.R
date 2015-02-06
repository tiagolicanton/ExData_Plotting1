draw_plot1 <- function(){
  require(data.table)
  d <- fread('./household_power_consumption.txt', header=TRUE, sep=";", colClasses='character')
  d <- subset(d, d$Date=="1/2/2007"| d$Date=="2/2/2007")
  d <- as.data.frame(d)
  d$datetime <- paste(d$Date,d$Time)
  d$Date <- as.Date(d$Date,"%d/%m/%Y")
  d$datetime <- strptime(d$datetime,"%d/%m/%Y %H:%M:%S",tz="")
  
  d$Global_active_power <- as.numeric(d$Global_active_power)
  
  png(filename="plot1.png")
  hist(d$Global_active_power,col="red",xlab="Global Active Power (killowatts)",main="Global Active Power")
  dev.off()
  
  d

}