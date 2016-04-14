#1. Download a file to working directory.
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = paste(getwd(),"exdata_data_household_power_consumption.zip",sep = "/"))

#2. Unzip downloaded file in working directory.
zippedFile <- paste(getwd(),"exdata_data_household_power_consumption.zip", sep = "/")
unzip(zippedFile,overwrite = TRUE)

#3. Read unzipped file from working directory.
fileDirectory <- paste(getwd(),"household_power_consumption.txt", sep = "/")
data_set <- read.table(fileDirectory, sep = ";", dec = ".", stringsAsFactors = FALSE, header = TRUE)

#4. Data filtering on date.
filteredData <- subset(data_set, Date %in% c("1/2/2007", "2/2/2007"))

#5. Convert column from character to numeric.

filteredData$Global_active_power <- as.numeric(filteredData$Global_active_power)

#6. Create a plot.
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(datetime,filteredData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
