## Exploratory Data Analysis- Project 1

## Now  Reading the data into the vector Power:

Power <- read.csv("household_power_consumption.txt", sep=";", colClasses="character", header = TRUE)

#subset out desired dates which are first two days of feburary 2007.

sub_Power <- subset(Power, Date == "1/2/2007" | Date == "2/2/2007")

## checking out the dimensions of the data. 
dim(Power)

dim(sub_Power)

#format data into correct format

sub_Power$Global_active_power <- as.numeric(sub_Power$Global_active_power)

Date_sub <- as.Date(sub_Power$Date,'%d/%m/%Y')

## correcting the format of date and time and combining the date and time into one vector

sub_Power_datetime <- strptime(paste(sub_Power$Date, sub_Power$Time), "%d/%m/%Y %H:%M:%S")

## coverting to the correct format

sub_Power$Global_active_power <- as.numeric(sub_Power$Global_active_power)
Date_sub <- as.Date(sub_Power$Date,'%d/%m/%Y')


sub_Power_datetime <- strptime(paste(sub_Power$Date, sub_Power$Time), "%d/%m/%Y %H:%M:%S")

## coverting as numeric

sub_Power$Global_active_power <- as.numeric(sub_Power$Global_active_power)
sub_Power$Global_active_power <- as.numeric(as.character(sub_Power$Global_active_power))

sub_Power$Sub_metering_1 <- as.numeric(sub_Power$Sub_metering_1)
sub_Power$Sub_metering_1 <- as.character(sub_Power$Sub_metering_1)
sub_Power$Sub_metering_2 <- as.numeric(sub_Power$Sub_metering_2)
sub_Power$Sub_metering_2 <- as.character(sub_Power$Sub_metering_2)
sub_Power$Sub_metering_3 <- as.numeric(sub_Power$Sub_metering_3)
sub_Power$Sub_metering_3 <- as.character(sub_Power$Sub_metering_3)
Power_datetime <- subset(sub_Power, sub_Power$date)


## Now generating the Plot  with help of following step:

# 1) creating a Png with 480*480 dimension where the plot will be saved.

png(filename ="plot4.png", width = 480, height = 480)

# 2) Setting up the layout for the Plot4 

par(mfcol=c(2,2))


# 3) generating the PLot4 
with (sub_Power, {
  # plot the first plot
  plot(sub_Power_datetime,sub_Power$Global_active_power, type="n",ylab="Global Active Power", xlab="" )
  lines(sub_Power_datetime,sub_Power$Global_active_power, type="l")
  
  # plot the second plot
  plot(sub_Power_datetime,sub_Power$Sub_metering_1, type="n",ylab="Energy sub metering", xlab="" )
  lines(sub_Power_datetime,sub_Power$Sub_metering_1, type="l", col="black")
  lines(sub_Power_datetime,sub_Power$Sub_metering_2, type="l", col="red")
  lines(sub_Power_datetime,sub_Power$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=c(1,1,1), col = c("black","red", "blue" ),bty = "n", cex=0.9, 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # plot the third plot
  plot(sub_Power_datetime,sub_Power$Voltage, type="n",ylab="Voltage", xlab="" )
  lines(sub_Power_datetime,sub_Power$Voltage, type="l")
  
  # plot the fourth plot
  plot(sub_Power_datetime,sub_Power$Global_reactive_power, type="n",ylab="Global_reactive_power", xlab="" )
  lines(sub_Power_datetime,sub_Power$Global_reactive_power, type="l")
})
dev.off()

