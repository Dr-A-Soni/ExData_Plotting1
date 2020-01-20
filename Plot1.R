
## Exploratory Data Analysis- Project 1

## set the correct working directory.

getwd()
setwd("C://Users/chinks/Downloads/coursera/exdata_data_household_power_consumption/")
getwd()

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

## Now generating the Plot  with help of following step:

# 1) creating a Png with 480*480 dimension where the plot will be saved.

png( filename = "plot1.png", width = 480, height = 480)

# 2) generating the Plot1 

hist(sub_Power$Global_active_power,
     col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

#3) closing off the Png 

dev.off()









