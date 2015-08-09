## Reading Data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259, comment.char= "")
dates <- data$Date
times <- data$Time
DatesTimes <- paste(dates, times)
DatesTimes2 <- strptime(DatesTimes, format = "%d/%m/%Y %H:%M:%S")
data$datestimes <- DatesTimes2
subset <- subset(data, data$datestimes =="2007-02-01 00:01:00 AEST")

subdata <- data[data$datestimes >= "2007-02-01 00:01:00 AEST" & data$datestimes <= "2007-02-03 00:00:00 AEST", ]

## Plot 

plot(subdata$datestimes, subdata$Sub_metering_1, type="l", 
     ylab = "Energy sub metering", xlab = "", axes = TRUE, 
     ylim = range(c(subdata$Sub_metering_1, subdata$Sub_metering_2, subdata$Sub_metering_3)))
par(new=TRUE)
plot(subdata$datestimes, subdata$Sub_metering_2, type="l", col="red", 
     ylim = range(c(subdata$Sub_metering_1, subdata$Sub_metering_2, subdata$Sub_metering_3)),
    ylab = "", xlab = "", axes = FALSE)
par(new=TRUE)
plot(subdata$datestimes, subdata$Sub_metering_3, type="l", col ="blue",
     ylim = range(c(subdata$Sub_metering_1, subdata$Sub_metering_2, subdata$Sub_metering_3)),
     ylab = "", xlab = "", axes = FALSE)


legend("topright", lty = 1, col = c("black", "red", "blue"), xjust =0, cex = .70, y.intersp = .8, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))