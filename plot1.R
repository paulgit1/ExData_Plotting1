plot1 <- function(){
  data <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?")
  data_limited <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  dim(data_limited)
  activepower <- as.numeric(data_limited$Global_active_power)
  png("plot1.png",height=480,width=480)
  hist(activepower,xlab="Global Active Power (kilowatts)",main="Global Active Power",col='red')
  dev.off()
}