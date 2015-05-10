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

##Plot and save the data into a PNG image file named plot3.png
png("plot3.png", width = 480, height = 480)

##This initial call of the plot function creates an empty plot in which the three lines
##will be drawn.
plot(electricDataSubset$DateTime, 
     electricDataSubset$Sub_metering_1,     ##Which variable used here is pretty much irrelevant, so long as it is the right length
     type = "n",                            ##Type "n" prevents anything from actually being drawn, making this just an empty plot of the right size
     xlab = "",                             ##Necessary, else the x axis will be labeled "electricDataSubset$DateTime"
     ylab = "Energy sub metering")

##Creates a legend for the plot in the top right corner of the plot
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),   ##Character vector indicating contents of legend
       lty = c(1, 1, 1),                                          ##Specifies all line types as "1" which is a solid line
       col = c("black", "red", "blue"))                           ##Sets the colors of the three lines in the legend

##Put the three actual lines for sub-metering against the DateTime variable on the plot 
##using the lines function.  Each line is specified to be the correct color as set in the legend
lines(electricDataSubset$DateTime, electricDataSubset$Sub_metering_1, col = "black")
lines(electricDataSubset$DateTime, electricDataSubset$Sub_metering_2, col = "red")
lines(electricDataSubset$DateTime, electricDataSubset$Sub_metering_3, col = "blue")

dev.off()