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

##Use the strptime function to combine the separate Date and Time variables into one Date/Time 
##value formatted as day/month/year hour/minute/second
electricDataSubset$DateTime <- strptime(paste(electricDataSubset$Date, 
                                             electricDataSubset$Time, sep =""), 
                                             "%d/%m/%Y %H:%M:%S")

##Plot and save the data into a PNG image file named plot2.png
png("plot2.png", width = 480, height = 480)
plot(electricDataSubset$DateTime, 
     electricDataSubset$Global_active_power, 
     type = "l",                                  ##Type "l" indicates line plot
     xlab = "",                                   ##This is necessary, else the x axis is labeled "electricDataSubset$DateTime"          
     ylab = "Global Active Power (kilowatts)")
dev.off()