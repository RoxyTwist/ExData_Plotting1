

### Read the data and take a look
Data <- read.delim("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

### Filter the data
EPC <- Data %>% 
    filter(Date=="1/2/2007" | Date== "2/2/2007")


### Remove the original data file to reduce memory consumption
rm(Data)


### trasform as Date the Date column and in time format the Time column
EPC$Date <- as.Date(EPC$Date, "%d/%m/%Y")

EPC$Time <- paste(EPC$Date, EPC$Time)
EPC$Time <- as.POSIXct(strptime(EPC$Time, '%Y-%m-%d %H:%M:%S'))


Sys.setlocale("LC_TIME", "English")
### Plot3

# par(mfrow=c(1,1))

png("plot3.png")

with(EPC, plot(Time,Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering"))
with(EPC, lines(Time, Sub_metering_1))
with(EPC, lines(Time, Sub_metering_2, col="red"))
with(EPC, lines(Time, Sub_metering_3, col="blue"))
legend("topright",lwd=1,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()

