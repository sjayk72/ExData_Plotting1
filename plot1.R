# Read table, remove missing values "?"
df <- read.table("~/R/household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = "?")

# Convert the Date variables to Dateclasses 
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Subset data from the dates 2007-02-01 and 2007-02-02
df1 <- subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

# Create plot
hist(df1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save the plot to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()