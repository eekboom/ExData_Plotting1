plot1 <- function() {
    data <- read.table("subset.txt", header=TRUE, sep=";", na.strings="?")
    
    hist(data$Global_active_power, 
         col="red",
         xlab="Global Active Power (kilowatts)",
         main="Global Active Power")
}

plot1Png <- function() {
    png("plot1.png")
    plot1()
    dev.off()
}

plot1Png();
