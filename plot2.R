### Plot 2 ###

# script to generate plot2.png

# indicates the first row of data to read
firstrow <- 66637

# indicates the last row of data to read
lastrow <- 69516

# read data
data <- read.table("household_power_consumption.txt",sep=";",skip=firstrow,nrows=lastrow-firstrow+1,header=FALSE,stringsAsFactors=FALSE)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# create a new data/time column
data$Datetime <- as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S",tz="GMT")

# open png graphics device
png("plot2.png",width=480,height=480)

# create line plot
with(data,plot(x=Datetime,
               y=Global_active_power,
               type="l",
               xlab=NA,
               ylab="Global Active Power (kilowatts)")
)

# close graphics devie
dev.off()


