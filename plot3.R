## read file
AllDataFile <- read.csv("C:/Users/Bmastrandrea/Documents/EA_Quiz1/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
AllDataFile$Date <- as.Date(AllDataFile$Date, format="%d/%m/%Y")

## Extract a data subset
month_data <- subset(AllDataFile, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(AllDataFile)

## Convert the Date and Time variables to Date/Time classes in R
datetime <- paste(as.Date(month_data$Date), month_data$Time)
month_data$Datetime <- as.POSIXct(datetime)

## Create Plot_3
with(month_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

