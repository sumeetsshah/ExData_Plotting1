##Author: Sumeet Shah
##Date Last Modified: May 10, 2015

##Read in the data from the text file
electricData <- read.table('household_power_consumption.txt',
                           sep = ';',                           ##Separation is indicated by semicolons
                           na.strings = '?',                    ##Missing values are indicated by question marks
                           header = TRUE)                       ##Use the first row to name variables

##Subset the data to only be from the two specified dates
electricDataSubset<-subset(electricData, 
                           electricData$Date == '1/2/2007' | electricData$Date == '2/2/2007')

##Plot and save the data into a histogram in a PNG image file named plot1.png
png("plot1.png", width = 480, height = 480)
hist(electricDataSubset$Global_active_power,
     main = "Global Active Power",
     xlim = c(0,6), ylim = c(0, 1200), 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
