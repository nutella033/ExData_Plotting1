### Plot 3 ###

# script to generate plot3.png

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
png("plot3.png",width=480,height=480)

# create line plot
with(data,({
    plot(x=Datetime,y=Sub_metering_1,type="n",xlab=NA,ylab="Energy sub metering")
    lines(x=Datetime,y=Sub_metering_1,col="black")
    lines(x=Datetime,y=Sub_metering_2,col="red")
    lines(x=Datetime,y=Sub_metering_3,col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}))

# close graphics devie
dev.off()

