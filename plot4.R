# Creating plot 4

## Load dataset
hpc <- read.table(gzfile("household_power_consumption.dat.gz"), row.names=1)

## Filter dataset to 01/02/2007 and 02/02/2007
hpc <- dplyr::filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))

## Convert Global_active_power to a numeric variable
a <- as.numeric(hpc$Global_active_power)

## Convert Date variable
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

## Create date-time vector
t <- paste(hpc$Date, hpc$Time)
t <- strptime(t, "%Y-%m-%d %H:%M:%S")


## Convert sub metering variables to numeric
s1 <- as.numeric(hpc$Sub_metering_1)
s2 <- as.numeric(hpc$Sub_metering_2)
s3 <- as.numeric(hpc$Sub_metering_3)

## Convert Voltage to a numeric variable
v <- as.numeric(hpc$Voltage)

## Convert Global_reactive_power to a numeric variable
r <- as.numeric(hpc$Global_reactive_power)

## Create PNG
png("plot4.png", width = 480, height = 480, units = "px")

## Set number of plots
par(mfcol = c(2, 2))

## Plot 1
plot(t, a, type="l", col="black", 
     xlab = NA, ylab="Global Active Power", main=NULL)


## Plot 2
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

## Plot 3
plot(t, v, type="l", col="black", 
     xlab = "datetime", ylab= "Voltage", main=NULL)

## Plot 4
plot(t, r, type="l", col="black", 
     xlab = "datetime", ylab= "Global_reactive_power", main=NULL)

dev.off()