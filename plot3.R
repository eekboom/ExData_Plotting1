plot3 <- function() {
    data <- read.table("subset.txt", header=TRUE, sep=";", na.strings="?")
    
    plot(sub$datetime, sub$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
    lines(sub$datetime, sub$Sub_metering_1, type="l")
    lines(sub$datetime, sub$Sub_metering_2, type="l", col="red")
    lines(sub$datetime, sub$Sub_metering_3, type="l", col="blue")
    legend("topright", lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
}

plot3Png <- function() {
    png("plot3.png")
    plot3()
    dev.off()
}

plot3Png();
