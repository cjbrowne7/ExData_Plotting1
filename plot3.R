data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[grep("^(1|2)/2/2007", data$Date),]
data$DateTime <- strptime(
  paste(as.character(data$Date), as.character(data$Time)),
  "%d/%m/%Y %T")
png("plot3.png", width = 480, height = 480)

plot(
  data$DateTime,
  as.numeric(as.character(data$Sub_metering_1)),
  type = "l", 
  xlab = "", 
  ylab="Energy sub metering")
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
  col=c("black", "blue", "red"),
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lwd=1)

dev.off()