#download data file & unzip it in workspace

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

#read data 

power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# transform date field
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# get the required time interval

power <- power[power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"),]

# create the png file for the plot

png(file = "plot2.png", width = 480, height = 480, units = "px")

# create new variable for date : join day and time

dt <- as.POSIXct(strptime(paste(power$Date, power$Time, sep = " "),
                                format = "%Y-%m-%d %H:%M:%S"))

# create the plot

with(power,plot(dt, Global_active_power,type = "l",xlab = "", 
                ylab = "Global Active Power (kilowatts)"))

dev.off()
