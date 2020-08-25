  ## plot3 
  ## =============================
  ## 1. read the household_power_consumption.txt file
  ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  ## 3. generate a plot of different submetering vs time
  
  ## Parameters: none
  ## Assumes household_power_consumption.txt file located in working dir
  
  ## 1. read the household_power_consumption.txt file
  data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  
  ## 2. change class y subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
  data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
 
  ## Create column in table with date and time merged together
  datetime <- paste(as.Date(data1$Date), data1$Time)
  data1$Datetime <- as.POSIXct(datetime)
  
  ## 3. generate a plot of different submetering vs time
  with(data1, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
  })
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))