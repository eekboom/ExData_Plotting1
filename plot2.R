# Set current dir to directory of this script
setWorkingDir <- function () {
    dir <- dirname(sys.frame(1)$ofile)
    setwd(dir)
}
setWorkingDir()

source("subset.R")

# Create Plot 2 one the current graphics device
plot2 <- function() {
    data <- read.table("subset.txt", header=TRUE, sep=";", na.strings="?")
    
    plot(sub$datetime, sub$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
    lines(sub$datetime, sub$Global_active_power, type="l")
}

# Create png file for Plot 2
plot2Png <- function() {
    png("plot2.png")
    plot2()
    dev.off()
}

plot2Png();
