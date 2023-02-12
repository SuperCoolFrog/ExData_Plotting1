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
    hhpc_data$Global_active_power,
    type = "l", lty = 1,
    xlab = "",
    ylab = "Global Active Power (kilowatts)",
)

dev.copy(png, "./output/plot2.png", width = 480, height = 480)
dev.off()
