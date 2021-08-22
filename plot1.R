# Creating plot 1

## Load dataset
hpc <- read.table(gzfile("household_power_consumption.dat.gz"), row.names=1)

## Filter dataset to 01/02/2007 and 02/02/2007
hpc <- dplyr::filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))

## Convert Global_active_power to a numeric variable
a <- as.numeric(hpc$Global_active_power)

## Create PNG
png(file = "plot1.png", width = 480, height = 480, units = "px")

## Create histogram
hist(a, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     xaxt = "n",  yaxt = "n")

## Label x-axis
axis(side = 1, at = c(0, 2, 4, 6))

## Label y-axis
axis(2, at= axTicks(2), 
     labels= axTicks(2))

dev.off()