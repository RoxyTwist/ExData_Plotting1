

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


### Plot2
png("plot2.png")

plot(EPC$Time, EPC$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

