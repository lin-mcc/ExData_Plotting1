data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259, comment.char= "")
dates <- data$Date
times <- data$Time
DatesTimes <- paste(dates, times)
DatesTimes2 <- strptime(DatesTimes, format = "%d/%m/%Y %H:%M:%S")
data$datestimes <- DatesTimes2
subset <- subset(data, data$datestimes =="2007-02-01 00:01:00 AEST")

subdata <- data[data$datestimes >= "2007-02-01 00:01:00 AEST" & data$datestimes <= "2007-02-03 00:00:00 AEST", ]

hist(subdata$Global_active_power)

