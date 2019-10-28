data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[grep("^(1|2)/2/2007", data$Date),]
png("plot1.png", width = 480, height = 480)

hist(
  as.numeric(as.character(data$Global_active_power)),
  col = "red",
  freq = TRUE,
  breaks = seq(0, 8, by=0.5),
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency",
  main = "Global Active Power")

dev.off()
