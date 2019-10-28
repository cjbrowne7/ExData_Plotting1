data <- read.csv(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";")
data <- data[grep("^(1|2)/2/2007", data$Date),]
data$DateTime <- strptime(
  paste(as.character(data$Date), as.character(data$Time)),
  "%d/%m/%Y %T")
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), cex = 0.6)

## Top-left: Global Active Power by Datetime
plot(
  data$DateTime, 
  as.numeric(as.character(data$Global_active_power)), 
  type = "l", 
  xlab = "", 
  ylab="Global Active Power (kilowatts)")

## Top-right: Voltage by Datetime
plot(
  data$DateTime, 
  as.numeric(as.character(data$Voltage)), 
  type = "l", 
  xlab = "datetime", 
  ylab = "Voltage")


## Bottom-left: Energy sub metering by Datetime

plot(
  data$DateTime,
  as.numeric(as.character(data$Sub_metering_1)),
  type = "l", 
  xlab = "", 
  ylab = "Energy sub metering")
lines(
  data$DateTime,
  as.numeric(as.character(data$Sub_metering_2)),
  col = "red")
lines(
  data$DateTime,
  as.numeric(as.character(data$Sub_metering_3)),
  col = "blue")
legend(
  "topright",
  col = c("black", "blue", "red"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  bty = "n",
  lwd = 1)

## Bottom-right: Global Reactive Power by datetime
plot(
  data$DateTime, 
  as.numeric(as.character(data$Global_reactive_power)), 
  type = "l", 
  xlab = "datetime", 
  ylab = "Global_reactive_power")

dev.off()
