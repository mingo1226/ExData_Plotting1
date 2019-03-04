#read in data
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")

#subset data for correct dates
datafeb2007 <- subset(data, data$Date =="1/2/2007" | data$Date =="2/2/2007")

#get data in numeric form
datafeb2007$Global_active_power <- as.numeric(datafeb2007$Global_active_power)

#create histogram of Global Active Power
par(mfcol = c(1,1))
png("plot1.png")
hist(datafeb2007$Global_active_power, col = "red", breaks = 16, xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()