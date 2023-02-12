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
    lwd = c(1, 1, 1)
)

dev.copy(png, "./output/plot3.png", width = 480, height = 480)
dev.off()
