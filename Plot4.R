library(lubridate)

#read in data
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")

#subset data for correct dates
datafeb2007 <- subset(data, data$Date =="1/2/2007" | data$Date =="2/2/2007")

#get data in numeric form
datafeb2007$Global_active_power <- as.numeric(datafeb2007$Global_active_power)

#add new column with time date merged. change class of new column using lubridate function
datafeb2007$datetime <- dmy_hms(apply(datafeb2007[,1:2], 1, paste, collapse=" "))

png("plot4.png")
par(mfcol = c(2,2))
with(datafeb2007, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

plot(datafeb2007$datetime, datafeb2007$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
with(datafeb2007, points(datetime, Sub_metering_1, type = "l", col = "black"))
with(datafeb2007, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(datafeb2007, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = .7)

with(datafeb2007, plot(datetime, Voltage, type = "l"))

with(datafeb2007, plot(datetime, Global_reactive_power, type = "l"))
dev.off()
