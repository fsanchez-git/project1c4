  ##plot1 
  ##===========================
  ## 1. read the household_power_consumption.txt file
  ## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  ## 3. generate a histogram of global active power(kilowatts)
  ##============================
  ## Parameters: none
  ## Assumes household_power_consumption.txt file located in working dir
  
  ## 1. read the household_power_consumption.txt file
  data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  ## 2. change class y subset for data taken from 2 days: 2007-02-01 and 2007-02-02
  data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
  data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
  
  
  ## plot histogram of global active power for those 2 days
  ##png("plot1.png", width=480, height=480)
  hist(data1$Global_active_power, main="Global Active Power", 
       xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

