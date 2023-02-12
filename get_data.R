library(lubridate)

get_data <- function() {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    data_file_zip <- "./data/household_power_consumption.zip"
    zip_file <- "household_power_consumption.txt"
    data_dir <- "./data"
    data_file_txt <- file.path(data_dir, zip_file)

    parsed_data <- file.path(data_dir, "parsed_data.txt")

    if (!dir.exists(data_dir)) {
        dir.create(data_dir)
    }

    if (!file.exists(data_file_zip)) {
        download.file(url, data_file_zip)
    }

    if (!file.exists(data_file_txt)) {
        unzip(data_file_zip, exdir = data_dir, files = zip_file)
    }

    if (!file.exists(parsed_data)) {

        data_t <- read.table(data_file_txt, sep = ";", header = TRUE)
        # Subset for required days only
        required_days <- dmy(data_t$Date) %in% ymd(c("2007-02-01", "2007-02-02"))
        data_t <- data_t[required_days, ]


        data_t[, 3:8] <- lapply(3:8, function(x) {
            sapply(data_t[[x]], function(n) {
                if (n != "?") {
                    as.numeric(n)
                } else {
                    NA
                }
            })
        })

        write.table(data_t, parsed_data, sep = ",")
    }

    read.table(parsed_data, header = TRUE, sep = ",")
}