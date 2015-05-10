# Set current dir to directory of this script
setWorkingDir <- function () {
    dir <- dirname(sys.frame(1)$ofile)
    setwd(dir)
}
setWorkingDir()

source("subset.R")

# Create Plot 4 one the current graphics device
plot4 <- function() {
    data <- read.table("subset.txt", header=TRUE, sep=";", na.strings="?")
    
    # Arrange plots in 2 x 2 raster
    par(mfrow=c(2, 2))
    
    # Global Active Power
    plot(sub$datetime, sub$Global_active_power, type="n", ylab="Global Active Power", xlab="")
    lines(sub$datetime, sub$Global_active_power, type="l")
    
    # Voltage plot
    plot(sub$datetime, sub$Voltage, type="n", ylab="Voltage", xlab="datetime")
    lines(sub$datetime, sub$Voltage, type="l")
    
    # Energy sub metering
    colors <- c("black", "red", "blue")
    plot(sub$datetime, sub$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
    lines(sub$datetime, sub$Sub_metering_1, type="l", col=colors[1])
    lines(sub$datetime, sub$Sub_metering_2, type="l", col=colors[2])
    lines(sub$datetime, sub$Sub_metering_3, type="l", col=colors[3])
    legend("topright", bty="n", lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=colors)
    
    # Global reactive power
    plot(sub$datetime, sub$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
    lines(sub$datetime, sub$Global_reactive_power, type="l")
}

# Create png file for Plot 4
plot4Png <- function() {
    png("plot4.png")
    plot4()
    dev.off()
}

plot4Png();
