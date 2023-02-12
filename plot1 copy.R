# Environment
setwd("C:/r-projects/exploratory-data-analysis/ExData_Plotting1")
cls <- function() { shell("cls") }

# get data helper
source("./get_data.R")

x11(width = 480, height = 480)
hhpc_data <- get_data()

hist(
    hhpc_data$Global_active_power,
    col = "red",
    xlab = "Global Active Power (kilowatts)",
    main = "Global Active Power"
)

dev.copy(png, "./output/plot1.png", width = 480, height = 480)
dev.off()
