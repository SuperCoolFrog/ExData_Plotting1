# Environment
setwd("C:/r-projects/exploratory-data-analysis/ExData_Plotting1")
cls <- function() { shell("cls") }

# libs
library(lubridate)

# get data helper
source("./get_data.R")

hhpc_data <- get_data()

hhpc_data$date_time <- dmy_hms(paste(hhpc_data$Date, hhpc_data$Time, sep = " "))

x11(width = 480, height = 480)
par(mfrow = c(2, 2))

# Global Active Power
plot(
    hhpc_data$date_time,
    hhpc_data$Global_active_power,
    type = "l", lty = 1,
    xlab = "",
    ylab = "Global Active Power (kilowatts)",
)

# Voltage
plot(
    hhpc_data$date_time,
    hhpc_data$Voltage,
    type = "l", lty = 1,
    xlab = "datetime",
    ylab = "Voltage",
)

# Energy Sub metering
plot(
    hhpc_data$date_time,
    hhpc_data$Sub_metering_1,
    type = "l",
    lty = 1,
    xlab = "",
    ylab = "Energy sub metering",
)
lines(
    hhpc_data$date_time,
    hhpc_data$Sub_metering_2,
    col = "red"
)
lines(
    hhpc_data$date_time,
    hhpc_data$Sub_metering_3,
    col = "blue"
)
legend(
    x = "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col = c("black", "red", "blue"),
    lty = c(1, 1, 1),
    lwd = c(1, 1, 1),
    box.col = "00000000" 
)

# Global Reactive power
plot(
    hhpc_data$date_time,
    hhpc_data$Global_reactive_power,
    type = "l", lty = 1,
    xlab = "datetime",
    ylab = "Global_reactive_power",
)

dev.copy(png, "./output/plot4.png", width = 480, height = 480)
dev.off()
