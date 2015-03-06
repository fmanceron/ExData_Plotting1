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
## plot 3
###########

## set drawing area
par(mfrow = c(1, 1))

## set days to english 
Sys.setlocale("LC_TIME", "English")

## concatenate day & time in a single object
day.time <- paste(EPCr$Date,EPCr$Time)
## convert characters to actual date
day.time <- strptime(day.time, '%d/%m/%Y %H:%M:%S')

## Open PNG  device; create 'plot3.png' in my working directory
png(file = "plot3.png") 


## draw step by step
with(EPCr,plot(day.time, Sub_metering_1,ylab='Energy sub metering', xlab ='',type = 'n'))
with(EPCr,points(day.time, Sub_metering_1, type='l'))
with(EPCr,points(day.time, Sub_metering_2, type='l',col = 'red'))
with(EPCr,points(day.time, Sub_metering_3, type='l',col = 'blue'))
## add legend
legend( 'topright',
        legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
        col = c('black','red','blue'), lty = 1)



## close device
dev.off()                               ## Don't forget to close the PNG device!

