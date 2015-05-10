setwd("d:/stephen/coursera/DataScience/exploratory_data_analysis/week1/project1/ExData_Plotting1");

# to make Weekdays on x-axis show in English, even though my locale is German
Sys.setlocale("LC_ALL","English")

library(dplyr)
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
sub <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
sub <- mutate(sub, datetime = dmy_hms(paste(sub$Date, sub$Time)))
write.table(sub, "subset.txt", sep=";", quote=FALSE, row.names=FALSE, na="?")
rm(data)

