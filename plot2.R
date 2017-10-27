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

# Create plot
plot(df1$Global_active_power~df1$datetime, type="l",
          ylab="Global Active Power (kilowatts)", xlab="")

# Save the plot to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()