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
## plot 2
###########

## set drawing area
par(mfrow = c(1, 1))

## set days to english 
Sys.setlocale("LC_TIME", "English")

## concatenate day & time in a single object
day.time <- paste(EPCr$Date,EPCr$Time)
## convert characters to actual date
day.time <- strptime(day.time, '%d/%m/%Y %H:%M:%S')

## Open PNG  device; create 'plot2.png' in my working directory
png(file = "plot2.png") 

with(EPCr, plot(day.time, Global_active_power,
                ylab='Global Active Power (kilowatts)', xlab ='', type = 'l'))


## close device
dev.off()                               ## Don't forget to close the PNG device!



