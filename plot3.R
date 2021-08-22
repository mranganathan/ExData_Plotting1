# Creating plot 3

## Load dataset
hpc <- read.table(gzfile("household_power_consumption.dat.gz"), row.names=1)

## Filter dataset to 01/02/2007 and 02/02/2007
hpc <- dplyr::filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))

## Convert Date variable
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

## Create date-time vector
t <- paste(hpc$Date, hpc$Time)
t <- strptime(t, "%Y-%m-%d %H:%M:%S")

## Convert sub metering variables to numeric
s1 <- as.numeric(hpc$Sub_metering_1)
s2 <- as.numeric(hpc$Sub_metering_2)
s3 <- as.numeric(hpc$Sub_metering_3)

## Create PNG
png("plot3.png", width = 480, height = 480, units = "px")


# Create a first line
plot(t, s1, type = "l", 
     col = "black", xlab = NA, ylab = "Energy sub metering")

# Add a second line
lines(t, s2, col = "red", type = "l")

# Add a third line
lines(t, s3, col = "blue", type = "l")

# Add a legend to the plot
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty = 1)

dev.off()