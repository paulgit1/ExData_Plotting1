plot2 <- function(){
  data <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?")
  data_limited <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  dim(data_limited)
  activepower <- as.numeric(data_limited$Global_active_power)
  #dateasDay <- weekdays(as.Date(data_limited$Date,"'%d/%m/%Y'"))
  datetime <- strptime(paste(data_limited$Date, data_limited$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  #datetime
  png("plot2.png",width = 480,height = 480)
  plot(datetime,activepower,xlab="",ylab="Global Active Power (kilowatts)",type="l")
  dev.off()
}