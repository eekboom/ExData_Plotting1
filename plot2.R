plot2 <- function() {
    data <- read.table("subset.txt", header=TRUE, sep=";", na.strings="?")
    
    plot(sub$datetime, sub$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
    lines(sub$datetime, sub$Global_active_power, type="l")
}

plot2Png <- function() {
    png("plot2.png")
    plot2()
    dev.off()
}

plot2Png();
