power<- read.delim("household_power_consumption.txt", sep= ";")
power$Date<- as.Date(power$Date, "%d/%m/%Y")
power$Time<- strptime(power$Time, format="%H:%M:%S")
subpower<- subset(power, power$Date=="2007/02/01"| power$Date=="2007/02/02")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subpower$Time,as.numeric(subpower$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)") 


dev.copy(png, file= "plot2.png", width = 480, height = 480, units = "px"); dev.off()

