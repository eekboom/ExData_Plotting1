# * Downloads the raw data,
# * extracts relevant rows,
# * converts "Date" & "Time" string variables to a new variable "datetime",
# * removes Date and Time variables
# * writes the clean data to a new file "subset.txt"
# * Avoids doing all that again and again by checking for the file first


rawDataFile <- "household_power_consumption.txt"
cleanDataFile <- "subset.txt"

# to make Weekdays on x-axis show in English, even though my locale is German
Sys.setlocale("LC_ALL","English")

if(!file.exists(cleanDataFile)) {

    # Download and unzip raw data
    if(!file.exists(rawDataFile)) {
        print("Downloading")
        localZipFile <- "power_consumption.zip"
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, localZipFile)
    
        print("Unzipping")
        unzip(localZipFile)
        unlink(localZipFile)
    }

    library(lubridate)
    
    print("Extracting relevant data")
    # read csv
    data <- read.table(rawDataFile, sep=";", header=TRUE, na.strings="?")
    
    # extract rows with relevant days
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
    
    # parse "Date" and "Time" string columns
    datetime <- dmy_hms(paste(data$Date, data$Time))
    # remove string based "Date" and "Time" columns
    data$Date <- NULL
    data$Time <- NULL
    # Add "datetime" column
    data <- cbind(datetime, data)
    
    # Save the clean data for use by all 4 plot.R files
    write.table(data, cleanDataFile, sep=";", quote=FALSE, row.names=FALSE, na="?")
}    
