data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[grep("^(1|2)/2/2007", data$Date),]
data$DateTime <- strptime(
  paste(as.character(data$Date), as.character(data$Time)),
  "%d/%m/%Y %T")
png("plot2.png", width = 480, height = 480)

plot(
  data$DateTime, 
  as.numeric(as.character(data$Global_active_power)), 
  type = "l", 
  xlab = "", 
  ylab="Global Active Power (kilowatts)")

dev.off()