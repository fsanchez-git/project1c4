  ##plot2 
  ## ==========================
  ## 1. read the household_power_consumption.txt file
  ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  ## 3. generate a plot of global active power vs. time
  
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
  
  
  ## plot global active power vs date&time
  ## Plot 2
  with(data1, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
  })
