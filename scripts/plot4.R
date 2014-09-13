
#Look at the data, data types, table format
first5rows <- read.table("household_power_consumption.txt", sep=";", nrows = 5)

#Load the needed data
hpc=subset(read.table("household_power_consumption.txt", sep=";", header=TRUE), Date =="1/2/2007" |Date=="2/2/2007", nrows=4000)

#Format data
hpc$Date=as.Date(hpc$Date ,format="%d/%m/%Y")
hpc$Time=as.character(hpc$Time)
hpc$Global_active_power=as.numeric(as.character(hpc$Global_active_power))
hpc$Global_reactive_power=as.numeric(as.character(hpc$Global_reactive_power))
hpc$Voltage=as.numeric(as.character(hpc$Voltage))
hpc$Global_intensity=as.numeric(as.character(hpc$Global_intensity))
hpc$Sub_metering_1=as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2=as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3=as.numeric(as.character(hpc$Sub_metering_3))

#Merging date and time + add it to the table
DateTime=strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S" )
hpc$DateTime=DateTime

#plot4
png("plot4.png")
par(bg="#F2F2F2")
par(mfrow=c(2,2))
plot(hpc$DateTime, hpc$Global_active_power, ylab="Global Active Power", xlab=NA, type="l")

plot(hpc$DateTime,hpc$Voltage, ylab="Voltage", xlab="datatime", type="l")

plot(hpc$DateTime, hpc$Sub_metering_1, ylab="Energy sub metering", xlab=NA, type="l")
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c('black', 'red', 'blue'), lty='solid', bty='n')

plot(hpc$DateTime, hpc$Global_reactive_power, xlab="datatime", ylab="Global_reactive_power", type="l")
dev.off()