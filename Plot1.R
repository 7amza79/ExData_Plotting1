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

png(file = "plot1.png", width = 480, height = 480, units = "px")

# create the histogram 
hist(power$Global_active_power, col="red", main= "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# turn off the graphic device

dev.off()