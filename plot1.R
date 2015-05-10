# Set current dir to directory of this script
setWorkingDir <- function () {
    dir <- dirname(sys.frame(1)$ofile)
    setwd(dir)
}
setWorkingDir()

source("subset.R")

# Create Plot 1 one the current graphics device
plot1 <- function() {
    data <- read.table("subset.txt", header=TRUE, sep=";", na.strings="?")
    
    hist(data$Global_active_power, 
         col="red",
         xlab="Global Active Power (kilowatts)",
         main="Global Active Power")
}

# Create png file for Plot 1
plot1Png <- function() {
    png("plot1.png")
    plot1()
    dev.off()
}

plot1Png();
