## This program assumes that you have downloaded the data from 
## <'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'>
## and have unzipped the file and placed the file <household_power_consumption.txt> 
## in the working directory."

## read data (EPC stands for Electric Power Consumption)
EPC <-read.table("household_power_consumption.txt", 
                 header = T, sep=";", na.strings="?", stringsAsFactors=FALSE) 

##subsetting data to ensure that we use only data required for February 1 and 2
EPCr <- subset(EPC, EPC$Date=="1/2/2007"|EPC$Date=="2/2/2007")
## checking the outpout structure
str(EPCr)

###########
## plot 1
###########

## set drawing area
par(mfrow = c(1, 1))

## checking the outpout structure
summary(EPCr$Global_active_power)

## Open PNG  device; create 'plot1.png' in my working directory
png(file = "plot1.png") 

hist(EPCr$'Global_active_power', 
     col ='red',main ='Global Active Power',xlab='Global Active Power (kilowatts)')

## close device
dev.off()                               ## Don't forget to close the PNG device!