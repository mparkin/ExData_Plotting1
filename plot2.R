library(dplyr)
data <-read.csv("household_power_consumption.txt", sep = ";",stringsAsFactor=FALSE)
datadf <- tbl_dt(data)
rm(data)
filtereddata<-filter(datadf,Date == "1/2/2007" | Date == "2/2/2007")
filtereddata$Global_active_power <- as.numeric(filtereddata$Global_active_power)
filtereddata$Global_reactive_power <- as.numeric(filtereddata$Global_reactive_power)
filtereddata$Date <- as.character(filtereddata$Date)
filtereddata$Time <- as.character(filtereddata$Time)
date <- vector()
time <- vector()
datetime <-vector()
date <- as.character(filtereddata$Date)
time <- as.character(filtereddata$Time)
datentime<-paste(date,time)
datetime <-strptime(datentime,"%d/%m/%Y %H:%M:%S")
plot(datetime,filtereddata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)",xlab = " ")
dev.copy(png,"plot2.png",width=480 , height = 480)
dev.off()


