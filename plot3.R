# Read table, remove missing values "?"
df <- read.table("~/R/household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = "?")

# Convert the Date variables to Dateclasses 
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Subset data from the dates 2007-02-01 and 2007-02-02
df1 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

# Merge Date and Time column
datetime <- paste(as.Date(df1$Date), df1$Time)
df1$datetime <- as.POSIXct(datetime)

# Plot to png file
png(filename = "plot3.png", height=480, width=480)

# Create plot Sub_metering_1
plot(df1$Sub_metering_1~df1$datetime, type="l",
          ylab="Energy sub metering", xlab="")

# Add plot Sub_metering_2
lines(df1$Sub_metering_2~df1$datetime, col="red")

# Add plot Sub_metering_2
lines(df1$Sub_metering_3~df1$datetime, col="blue")

# Add legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save the plot to PNG file
dev.off()