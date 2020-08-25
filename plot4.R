  ##plot4 
  ## Aim of this function is to 
  ## 1. read the household_power_consumption.txt file
  ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  ## 3. generate 4 plots in 1 space (GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time)
  
  ## Parameters: none
  ## Assumes household_power_consumption.txt file located in working dir
  
  ## 1. read the household_power_consumption.txt file
  data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
  data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
 
  ## Create column in table with date and time merged together
  datetime <- paste(as.Date(data1$Date), data1$Time)
  data1$Datetime <- as.POSIXct(datetime)
  
  ## 3. generate 4 plots in 1 space (GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time)
  
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(data1, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
  })