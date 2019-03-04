library(lubridate)

#read in data
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")

#subset data for correct dates
datafeb2007 <- subset(data, data$Date =="1/2/2007" | data$Date =="2/2/2007")

#get data in numeric form
datafeb2007$Global_active_power <- as.numeric(datafeb2007$Global_active_power)

#add new column with time date merged. change class of new column using lubridate function
datafeb2007$datetime <- dmy_hms(apply(datafeb2007[,1:2], 1, paste, collapse=" "))

png("plot2.png")
with(datafeb2007, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
