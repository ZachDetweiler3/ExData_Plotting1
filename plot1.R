#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
library(dplyr)
dfhpc<-tbl_df(hpc)
smallhpc<-subset(dfhpc,Date=="1/2/2007"|Date=="2/2/2007")
library(lubridate)
datehpc<-mutate(smallhpc,asDate=dmy(smallhpc$Date))
dthpc<-mutate(datehpc,asTime=hms(datehpc$Time))

png('plot1.png')
par(mfrow=c(1,1))
hist(
        as.numeric(dthpc$Global_active_power,na.rm=TRUE),
        col="red",
        xlab="Global Active Power (kilowatts)",
        main="Global Active Power",
        breaks=15
)
dev.off()
