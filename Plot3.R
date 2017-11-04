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

png(file = "plot3.png", width = 480, height = 480, units = "px")

# create the plot

with(power,
     plot(dt,
          Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metering"))
with(power,
     points(dt,
            type = "l",
            Sub_metering_2,
            col = "red")
)
with(power,
     points(dt,
            type = "l",
            Sub_metering_3,
            col = "blue")
)
legend("topright", col = c("black", "blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)
dev.off() # Close the png file device