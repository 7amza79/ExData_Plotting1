#download data file & unzip it in workspace

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

#read data 

power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# transform date field
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

# get the required time interval

power <- power[power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"),]


# create new variable for date : join day and time

dt <- as.POSIXct(strptime(paste(power$Date, power$Time, sep = " "),
                          format = "%Y-%m-%d %H:%M:%S"))

# create the png file for the plot

png(file = "plot4.png", width = 480, height = 480, units = "px")



# create the plot

#prepare the disposition
par(mfrow = c(2, 2))


# create the plots
with(power,
     plot(dt,
          Global_active_power,
          type = "l",
          xlab = "",
          ylab = "Global Active Power"))


with(power,
     plot(dt,
          Voltage,
          type = "l",
          xlab = "datetime",
          ylab = "Voltage"))


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
with(power,
     plot(dt,
          Global_reactive_power,
          type = "l",
          xlab = "datetime",
          ylab = "Global_reactive_power"))
dev.off()
