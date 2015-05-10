# Set current dir to directory of this script
setWorkingDir <- function () {
    dir <- dirname(sys.frame(1)$ofile)
    setwd(dir)
}
setWorkingDir()

source("subset.R")

# Create Plot 3 one the current graphics device
plot3 <- function() {
    data <- read.table("subset.txt", header=TRUE, sep=";", na.strings="?")
    
    colors <- c("black", "red", "blue")
    
    plot(sub$datetime, sub$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
    lines(sub$datetime, sub$Sub_metering_1, type="l", col=colors[1])
    lines(sub$datetime, sub$Sub_metering_2, type="l", col=colors[2])
    lines(sub$datetime, sub$Sub_metering_3, type="l", col=colors[3])
    legend("topright", lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=colors)
}

# Create png file for Plot 3
plot3Png <- function() {
    png("plot3.png")
    plot3()
    dev.off()
}

plot3Png();
