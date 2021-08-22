# Creating plot 2

## Load dataset
hpc <- read.table(gzfile("household_power_consumption.dat.gz"), row.names=1)

## Filter dataset to 01/02/2007 and 02/02/2007
hpc <- dplyr::filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))

## Convert Date variable
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

## Create date-time vector
t <- paste(hpc$Date, hpc$Time)
t <- strptime(t, "%Y-%m-%d %H:%M:%S")

## Convert Global_active_power to a numeric variable
a <- as.numeric(hpc$Global_active_power)

## Create PNG
png("plot2.png", width = 480, height = 480, units = "px")

## Create line graph
plot(t, a, type="l", col="black", 
     xlab = NA, ylab="Global Active Power (kilowatts)", main=NULL)

dev.off()
