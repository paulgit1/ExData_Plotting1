plot3<-function(){

  data <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?")
  data_limited <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  dim(data_limited)
  activepower <- as.numeric(data_limited$Global_active_power)
  #dateasDay <- weekdays(as.Date(data_limited$Date,"'%d/%m/%Y'"))
  datetime <- strptime(paste(data_limited$Date, data_limited$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  data_limited$datetime <- as.POSIXct(datetime)
  data_limited$datetime
  png("plot3.png",width = 480,height = 480)
  with(data_limited,{
       plot(Sub_metering_1~datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
       lines(Sub_metering_2~datetime,col="Red")
       lines(Sub_metering_3~datetime,col="Blue")
       })
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}