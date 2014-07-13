plot2 <- function()
{
  #Read data
  data<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",header=T)
  data<-data.frame(data)
  
  #Convert and filter dates  and times variables
  data$Date<-as.Date(as.character(data$Date),format="%d/%m/%Y")
  data$Time<-strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S")
  data<-subset(data,Date==as.Date('2007-02-01') | Date==as.Date('2007-02-02'))
  
  #Convert other variables
  data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
  data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
  data$Voltage<-as.numeric(as.character(data$Voltage))
  data$Global_intensity<-as.numeric(as.character(data$Global_intensity))
  data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
  
  #Create and save plot
  png("plot2.png", width=480, height=480)
  plot(data$Time,data$Global_active_power,pch=".",xlab="",ylab="Global Active Power (kilowatts)")
  lines(data$Time,data$Global_active_power)
  dev.off()
}